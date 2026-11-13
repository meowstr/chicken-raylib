(module raylib *
  (import scheme.base)
  (import chicken.foreign)
  (import chicken.base)
  (import chicken.format)
  (import srfi-4)
  (foreign-declare "#include <raylib.h>")


  ;; write fixed-size array fields by hand (not many of them). these have no setters because 
  ;; of their nature and are not included in the constructors.
  ;;
  ;; Example:
  ;;  (define x (make-f32vector 4))
  ;;  (move-memory! (material-params mat) x 16) ;; move 16 bytes (4 floats) from the struct to x
  ;;  (move-memory! x (material-params mat) 16) ;; move 16 bytes (4 floats) from x to the struct

  (define material-params
    (foreign-lambda* (c-pointer float)
      (((c-pointer (struct "Material")) s))
      "return(s->params);"))
  (define bone-info-name
    (foreign-lambda* (c-pointer char)
      (((c-pointer (struct "BoneInfo")) s))
      "return(s->name);"))
  (define model-animation-name
    (foreign-lambda* (c-pointer char)
      (((c-pointer (struct "ModelAnimation")) s))
      "return(s->name);"))
  (define vr-device-info-lens-distortion-values
    (foreign-lambda* (c-pointer float)
      (((c-pointer (struct "VrDeviceInfo")) s))
      "return(s->lensDistortionValues);"))
  (define vr-device-info-chroma-ab-correction
    (foreign-lambda* (c-pointer float)
      (((c-pointer (struct "VrDeviceInfo")) s))
      "return(s->chromaAbCorrection);"))
  (define vr-stereo-config-projection
    (foreign-lambda* (c-pointer float)
      (((c-pointer (struct "VrStereoConfig")) s))
      "return((float*)s->projection);"))
  (define vr-stereo-config-view-offset
    (foreign-lambda* (c-pointer float)
      (((c-pointer (struct "VrStereoConfig")) s))
      "return((float*)s->viewOffset);"))
  (define vr-stereo-config-left-lens-center
    (foreign-lambda* (c-pointer float)
      (((c-pointer (struct "VrStereoConfig")) s))
      "return(s->leftLensCenter);"))
  (define vr-stereo-config-right-lens-center
    (foreign-lambda* (c-pointer float)
      (((c-pointer (struct "VrStereoConfig")) s))
      "return(s->rightLensCenter);"))
  (define vr-stereo-config-left-screen-center
    (foreign-lambda* (c-pointer float)
      (((c-pointer (struct "VrStereoConfig")) s))
      "return(s->leftScreenCenter);"))
  (define vr-stereo-config-right-screen-center
    (foreign-lambda* (c-pointer float)
      (((c-pointer (struct "VrStereoConfig")) s))
      "return(s->rightScreenCenter);"))
  (define vr-stereo-config-scale
    (foreign-lambda* (c-pointer float)
      (((c-pointer (struct "VrStereoConfig")) s))
      "return(s->scale);"))
  (define vr-stereo-config-scale-in
    (foreign-lambda* (c-pointer float)
      (((c-pointer (struct "VrStereoConfig")) s))
      "return(s->scaleIn);"))
  (define automation-event-params
    (foreign-lambda* (c-pointer int)
      (((c-pointer (struct "AutomationEvent")) s))
      "return(s->params);"))

  ;; put colors here because `bind` would have too much trouble doing this

  (define LIGHTGRAY  #u8(200 200 200 255))
  (define GRAY       #u8(130 130 130 255))
  (define DARKGRAY   #u8(80  80  80  255))
  (define YELLOW     #u8(253 249 0   255))
  (define GOLD       #u8(255 203 0   255))
  (define ORANGE     #u8(255 161 0   255))
  (define PINK       #u8(255 109 194 255))
  (define RED        #u8(230 41  55  255))
  (define MAROON     #u8(190 33  55  255))
  (define GREEN      #u8(0   228 48  255))
  (define LIME       #u8(0   158 47  255))
  (define DARKGREEN  #u8(0   117 44  255))
  (define SKYBLUE    #u8(102 191 255 255))
  (define BLUE       #u8(0   121 241 255))
  (define DARKBLUE   #u8(0   82  172 255))
  (define PURPLE     #u8(200 122 255 255))
  (define VIOLET     #u8(135 60  190 255))
  (define DARKPURPLE #u8(112 31  126 255))
  (define BEIGE      #u8(211 176 131 255))
  (define BROWN      #u8(127 106 79  255))
  (define DARKBROWN  #u8(76  63  47  255))
  (define WHITE      #u8(255 255 255 255))
  (define BLACK      #u8(0   0   0   255))
  (define BLANK      #u8(0   0   0   0  ))
  (define MAGENTA    #u8(255 0   255 255))
  (define RAYWHITE   #u8(245 245 245 255))

  ;; bind text-format to chicken.format (we cant bind variadic functions anyway)
  (define text-format format)

  (include "bindings1.scm")
  (include "bindings2.scm")
  )
