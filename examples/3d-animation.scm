(import raylib)
(import chicken.memory)
(import srfi-1)
(import srfi-4)
(import miscmacros)
(import chicken.string)

(define sizeof-model-animation 48) ;; ehhh i just know

(define (anim-ref anim-ptr i)
  (pointer+ anim-ptr (* i sizeof-model-animation)))

(define (get-anim-name anim)
  (define name (make-string 32))
  (define ptr (model-animation-name anim))
  (move-memory! ptr name 32)
  (string-translate name #\null))

(define screen-width 800)
(define screen-height 450)

(init-window screen-width screen-height "raylib [models] example - loading m3d")

(define camera 
  (make-camera3d
    #f32(6.0 6.0 6.0)
    #f32(0.0 2.0 0.0)
    #f32(0.0 1.0 0.0)
    45
    CAMERA_PERSPECTIVE))

(define model (load-model "resources/robot.glb"))
(define position #f32(0 0 0))

(define anim-count 0)
(define anims #f)
(let ([out (make-s32vector 1)]) ;; need a non-immediate to pass to C
  (set! anims (load-model-animations "resources/robot.glb" out))
  (set! anim-count (s32vector-ref out 0)))

(define anim-index 0)
(define anim-current-frame 0)
(define animation-name "")

(set-target-fps 60)

(until (window-should-close)
  (update-camera camera CAMERA_ORBITAL)
  (when (is-key-pressed KEY_RIGHT)
    (modify! anim-index (lambda (x) (modulo (add1 x) anim-count))))
  (when (is-key-pressed KEY_LEFT)
    (modify! anim-index (lambda (x) (modulo (+ x anim-count -1) anim-count))))

  (modify! anim-current-frame add1)

  (when (>= anim-current-frame (model-animation-keyframe-count (anim-ref anims anim-index)))
    (set! anim-current-frame 0))

  (update-model-animation model (anim-ref anims anim-index) anim-current-frame)

  (begin-drawing) 
  (clear-background RAYWHITE)
  (begin-mode3d camera)
  (draw-model model position 1 WHITE)
  (draw-grid 10 1)
  (end-mode3d)

  (draw-text (get-anim-name (anim-ref anims anim-index))
             0 0 20 RED)

  (end-drawing))

(unload-model-animations anims anim-count)
(unload-model model)

(free model)

(close-window)
