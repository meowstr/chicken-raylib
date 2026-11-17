(import raylib)
(import raygui)

(import srfi-1)
(import srfi-4)
(import chicken.bitwise)
(import chicken.locative)
(import miscmacros)

;;; An example of doing the bloom described in "Next Generation Post Processing in 
;;; Call of Duty: Advanced Warfare" by Jorge Jimenez

;;; (this is my favorite example so far ^_^)

(define emission-shader-fs
  #<<END
  #version 330
  
  in vec2 fragTexCoord;
  in vec4 fragColor;
  
  uniform sampler2D texture0;
  uniform vec4 colDiffuse;
  uniform float emission;
  
  out vec4 finalColor;
  
  void main()
  {
      vec4 oldColor = texture(texture0, fragTexCoord) * fragColor * colDiffuse;
      finalColor = vec4(oldColor.rgb * emission, oldColor.a);
  }
END
  )

(define downsample-shader-fs
  #<<END
  #version 330

  in vec2 fragTexCoord;
  in vec4 fragColor;
  
  uniform sampler2D texture0;
  uniform vec2 srcResolution;
  
  out vec4 downsample4;
  
  void main()
  {
      vec2 srcTexelSize = 1.0 / srcResolution;
      float x = srcTexelSize.x;
      float y = srcTexelSize.y;
  
      // Take 13 samples around current texel:
      // a - b - c
      // - j - k -
      // d - e - f
      // - l - m -
      // g - h - i
      // === ('e' is the current texel) ===
      vec3 a = texture(texture0, vec2(fragTexCoord.x - 2*x, fragTexCoord.y + 2*y)).rgb;
      vec3 b = texture(texture0, vec2(fragTexCoord.x,       fragTexCoord.y + 2*y)).rgb;
      vec3 c = texture(texture0, vec2(fragTexCoord.x + 2*x, fragTexCoord.y + 2*y)).rgb;
  
      vec3 d = texture(texture0, vec2(fragTexCoord.x - 2*x, fragTexCoord.y)).rgb;
      vec3 e = texture(texture0, vec2(fragTexCoord.x,       fragTexCoord.y)).rgb;
      vec3 f = texture(texture0, vec2(fragTexCoord.x + 2*x, fragTexCoord.y)).rgb;
  
      vec3 g = texture(texture0, vec2(fragTexCoord.x - 2*x, fragTexCoord.y - 2*y)).rgb;
      vec3 h = texture(texture0, vec2(fragTexCoord.x,       fragTexCoord.y - 2*y)).rgb;
      vec3 i = texture(texture0, vec2(fragTexCoord.x + 2*x, fragTexCoord.y - 2*y)).rgb;
  
      vec3 j = texture(texture0, vec2(fragTexCoord.x - x, fragTexCoord.y + y)).rgb;
      vec3 k = texture(texture0, vec2(fragTexCoord.x + x, fragTexCoord.y + y)).rgb;
      vec3 l = texture(texture0, vec2(fragTexCoord.x - x, fragTexCoord.y - y)).rgb;
      vec3 m = texture(texture0, vec2(fragTexCoord.x + x, fragTexCoord.y - y)).rgb;
  
      // Apply weighted distribution:
      // 0.5 + 0.125 + 0.125 + 0.125 + 0.125 = 1
      // a,b,d,e * 0.125
      // b,c,e,f * 0.125
      // d,e,g,h * 0.125
      // e,f,h,i * 0.125
      // j,k,l,m * 0.5
      // This shows 5 square areas that are being sampled. But some of them overlap,
      // so to have an energy preserving downsample we need to make some adjustments.
      // The weights are the distributed, so that the sum of j,k,l,m (e.g.)
      // contribute 0.5 to the final color output. The code below is written
      // to effectively yield this sum. We get:
      // 0.125*5 + 0.03125*4 + 0.0625*4 = 1
      vec3 downsample;
      downsample = e*0.125;
      downsample += (a+c+g+i)*0.03125;
      downsample += (b+d+f+h)*0.0625;
      downsample += (j+k+l+m)*0.125;
      downsample4 = vec4(downsample, 1.0);
  }
END
)

(define upsample-shader-fs
  #<<END
  #version 330

  in vec2 fragTexCoord;
  in vec4 fragColor;

  uniform sampler2D texture0;
  uniform float filterRadius;
  
  out vec4 upsample4;
  
  void main()
  {
      // The filter kernel is applied with a radius, specified in texture
      // coordinates, so that the radius will vary across mip resolutions.
      float x = filterRadius;
      float y = filterRadius;
  
      // Take 9 samples around current texel:
      // a - b - c
      // d - e - f
      // g - h - i
      // === ('e' is the current texel) ===
      vec3 a = texture(texture0, vec2(fragTexCoord.x - x, fragTexCoord.y + y)).rgb;
      vec3 b = texture(texture0, vec2(fragTexCoord.x,     fragTexCoord.y + y)).rgb;
      vec3 c = texture(texture0, vec2(fragTexCoord.x + x, fragTexCoord.y + y)).rgb;
  
      vec3 d = texture(texture0, vec2(fragTexCoord.x - x, fragTexCoord.y)).rgb;
      vec3 e = texture(texture0, vec2(fragTexCoord.x,     fragTexCoord.y)).rgb;
      vec3 f = texture(texture0, vec2(fragTexCoord.x + x, fragTexCoord.y)).rgb;
  
      vec3 g = texture(texture0, vec2(fragTexCoord.x - x, fragTexCoord.y - y)).rgb;
      vec3 h = texture(texture0, vec2(fragTexCoord.x,     fragTexCoord.y - y)).rgb;
      vec3 i = texture(texture0, vec2(fragTexCoord.x + x, fragTexCoord.y - y)).rgb;
  
      // Apply weighted distribution, by using a 3x3 tent filter:
      //  1   | 1 2 1 |
      // -- * | 2 4 2 |
      // 16   | 1 2 1 |
      vec3 upsample;
      upsample = e*4.0;
      upsample += (b+d+f+h)*2.0;
      upsample += (a+c+g+i);
      upsample *= 1.0 / 16.0;
      upsample4 = vec4(upsample, 1.0);
  }
END
)

(define exposure-shader-fs
  #<<END
  #version 330
  
  in vec2 fragTexCoord;
  in vec4 fragColor;
  
  uniform sampler2D texture0;
  uniform vec4 colDiffuse;
  uniform float exposure;
  
  out vec4 finalColor;
  
  void main()
  {
      float gamma = 2.2;
      vec3 hdrColor = texture(texture0, fragTexCoord).rgb;
      vec3 mapped = vec3(1.0) - exp(-hdrColor * exposure);
      mapped = pow(mapped, vec3(1.0/gamma));
  
      finalColor = vec4(mapped, 1.0);
  }
END
)

(define width 800)
(define height 800)
(define mip-count 8)

(init-window width height "bloom")

(set-target-fps 60)

;; load fragment shaders with default vertex shader
(define emission-shader (load-shader-from-memory #f emission-shader-fs))
(define downsample-shader (load-shader-from-memory #f downsample-shader-fs))
(define upsample-shader (load-shader-from-memory #f upsample-shader-fs))
(define exposure-shader (load-shader-from-memory #f exposure-shader-fs))

(define emission-uniform (get-shader-location emission-shader "emission"))
(define src-resolution-uniform (get-shader-location downsample-shader "srcResolution"))
(define filter-radius-uniform (get-shader-location upsample-shader "filterRadius"))
(define exposure-uniform (get-shader-location exposure-shader "exposure"))

(define emission (f32vector 2))
(define exposure (f32vector 1))
(define filter-radius (f32vector 0.003))

(set-shader-value 
  upsample-shader 
  filter-radius-uniform
  (make-locative filter-radius)
  SHADER_UNIFORM_FLOAT)

(define (load-mip-texture width height)
  ;; use an HDR texture :D
  (load-render-texture-ex width height PIXELFORMAT_UNCOMPRESSED_R32G32B32A32))

(define mip-sizes
  (map 
    (lambda (i)
      (list (arithmetic-shift width (- i))
            (arithmetic-shift height (- i))))
    (iota mip-count)))

(define mips 
  (map (cut apply load-mip-texture <>) mip-sizes))

;; NOTE: render-texture-texture returns a struct, meaning its unmanaged. keep the pointers
(define mip-textures
  (map render-texture-texture mips))

(for-each 
  (lambda (t)
      (set-texture-filter t TEXTURE_FILTER_BILINEAR)
      (set-texture-wrap t TEXTURE_WRAP_CLAMP))
  mip-textures)

(define (downsample mips textures sizes)
  (unless (< (length mips) 2)
    (begin-texture-mode (second mips))
    (clear-background BLACK)
    (begin-shader-mode downsample-shader)
    (set-shader-value 
      downsample-shader 
      src-resolution-uniform
      (make-locative (list->f32vector (first sizes)))
      SHADER_UNIFORM_VEC2)
    (draw-texture-pro
      (first textures)
      (f32vector 0 0 (first (first sizes)) (- (second (first sizes))))
      (f32vector 0 0 (first (second sizes)) (second (second sizes)))
      #f32(0 0)
      0
      WHITE)
    (end-shader-mode)
    (end-texture-mode)))

(define (upsample mips textures sizes)
  (unless (< (length mips) 2)
    (begin-texture-mode (second mips))
    (begin-shader-mode upsample-shader)
    (begin-blend-mode BLEND_ADDITIVE)
    (draw-texture-pro
      (first textures)
      (f32vector 0 0 (first (first sizes)) (- (second (first sizes))))
      (f32vector 0 0 (first (second sizes)) (second (second sizes)))
      #f32(0 0)
      0
      WHITE)
    (end-blend-mode)
    (end-shader-mode)
    (end-texture-mode)))

(define (do-bloom) 
  ;; downsample
  (pair-for-each downsample mips mip-textures mip-sizes)
  ;; upsample
  (pair-for-each upsample (reverse mips) (reverse mip-textures) (reverse mip-sizes)))

(define (draw-scene emission?)
  (unless emission? (draw-fps 10 10)) ; no emission for fps
  (draw-text "MEOW!! =^.^=" 300 380 40 WHITE)
  (draw-rectangle 100 100 100 100 GREEN)
  (draw-circle 600 600 100 RED))

(until (window-should-close)

  ;; configure shader values
  (set-shader-value 
    emission-shader 
    emission-uniform 
    (make-locative emission) 
    SHADER_UNIFORM_FLOAT)

  (set-shader-value 
    exposure-shader 
    exposure-uniform 
    (make-locative exposure) 
    SHADER_UNIFORM_FLOAT)

  (begin-drawing)
  (clear-background BLACK)

  ;; render emissions to first mip
  (begin-texture-mode (first mips))
  (begin-shader-mode emission-shader)
  (clear-background BLACK)
  (draw-scene #t)
  (end-shader-mode)
  (end-texture-mode)

  ;; go through bloom pipeline
  (do-bloom)

  ;; add base scene to first mip
  (begin-blend-mode BLEND_ADDITIVE)
  (begin-texture-mode (first mips))
  (draw-scene #f)
  (end-texture-mode)
  (end-blend-mode)

  ;; render first mip with exposure
  (begin-shader-mode exposure-shader)
  (draw-texture-rec
    (first mip-textures)
    (f32vector 0 0 width (- height))
    #f32(0 0)
    WHITE)
  (end-shader-mode)

  (gui-slider
    #f32(250 10 300 40) "0 emission" "10 emission" emission 0 10)

  (gui-slider
    #f32(250 60 300 40) "0 exposure" "10 exposure" exposure 0 10)

  (end-drawing))

(close-window)
