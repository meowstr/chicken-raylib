(import raylib)

(define screen-width 800)
(define screen-height 450)

(init-window screen-width screen-height "raylib [core] example - 3d camera mode")

(define camera 
  (make-camera3d
    #f32(0 10 10)
    #f32(0 0 0)
    #f32(0 1 0)
    45
    CAMERA_PERSPECTIVE
    ))

(define cube-position #f32(0 0 0))

(set-target-fps 60)

(define (draw-scene)
  (draw-cube cube-position 2 2 2 RED)
  (draw-cube-wires cube-position 2 2 2 MAROON)
  (draw-grid 10 1))

(let loop ()
  (clear-background RAYWHITE)
  (begin-drawing)
  (draw-text "Welcome to the third dimension!" 10 40 20 DARKGRAY)
  (draw-fps 10 10)
  (begin-mode3d camera)
  (draw-scene)
  (end-mode3d)
  (end-drawing)
    
  (unless (window-should-close) (loop)))

(close-window)
