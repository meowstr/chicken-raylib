(import raylib)

(import (chicken random))
(import srfi-1)
(import srfi-4)
(import miscmacros)

; some helper functions
(define (vec-x v) (f32vector-ref v 0))
(define (vec-y v) (f32vector-ref v 1))

(define (clamp x a b)
  (max a (min b x)))

(define (float->int x)
  (inexact->exact (floor x)))

(define (get-random-float)
  (/ (pseudo-random-integer 4096) 4096.0))

(define (get-random-value a b)
  (+ a (* (get-random-float) 
          (- b a))))

(define (rect-add-vec2 r v)
  (f32vector
    (+ (f32vector-ref r 0) (f32vector-ref v 0))
    (+ (f32vector-ref r 1) (f32vector-ref v 1))
    (f32vector-ref r 2)
    (f32vector-ref r 3)))

(define (fade color opacity)
  (u8vector 
    (u8vector-ref color 0)
    (u8vector-ref color 1)
    (u8vector-ref color 2)
    (float->int (* opacity (u8vector-ref color 3)))))

; ----------------------------------------------------------------------------------------
;  Program main entry point
; ----------------------------------------------------------------------------------------

;  Initialization
; ----------------------------------------------------------------------------------------

(define screen-width 800)
(define screen-height 450)

(init-window screen-width screen-height "raylib [core] example - 2d camera")

(define MAX_BUILDINGS 100)
(define player #f32(400 280 40 40))

(define buildings 
  (let* ([widths (list-tabulate MAX_BUILDINGS (lambda (i) (get-random-value 50 200)))]
         [xs (fold (lambda (x l) (cons (+ x (car l)) l)) (list -6000) widths)]) ;; accumulate widths
    (map 
      (lambda (x w)
        (let ([h (get-random-value 100 800)])
          (f32vector 
            x
            (- (- screen-height 130) h) 
            w h))) 
      (reverse xs) widths)))

(define build-colors
  (list-tabulate 
    MAX_BUILDINGS 
    (lambda (i)
      (u8vector
        (float->int (get-random-value 200 240))
        (float->int (get-random-value 200 240))
        (float->int (get-random-value 200 250))
        255))))

(define camera 
  (make-camera2d
    (f32vector (+ 20 (vec-x player)) (+ 20 (vec-y player)))
    (f32vector (/ screen-width 2) (/ screen-height 2))
    0
    1))

(set-target-fps 60) ;; Set our game to run at 60 frames-per-second
; ----------------------------------------------------------------------------------------

; Main game loop
(let loop ()

  ; Update
  ; --------------------------------------------------------------------------------------
  ; Player movement
  (when (is-key-down KEY_RIGHT)
    (modify! player (cut rect-add-vec2 <> #f32(2 0))))
  (when (is-key-down KEY_LEFT)
    (modify! player (cut rect-add-vec2 <> #f32(-2 0))))

  ; Camera target follows player
  (set! (camera2d-target camera) (f32vector (+ 20 (vec-x player)) (+ 20 (vec-y player))))

  ; Camera rotation controls
  (when (is-key-down KEY_A)
    (modify! (camera2d-rotation camera) sub1))
  (when (is-key-down KEY_S)
    (modify! (camera2d-rotation camera) add1))

  ; Limit camera rotation to 80 degrees (-40 to 40)
  (modify! (camera2d-rotation camera) (cut clamp <> -40 40))

  ; Camera zoom controls
  ; Uses log scaling to provide consistent zoom speed
  (modify! (camera2d-zoom camera) (lambda (z) (exp (+ (log z) (* (get-mouse-wheel-move) 0.1)))))

  ; Camera reset (zoom and rotation)
  (when (is-key-pressed KEY_R) 
    (set! (camera2d-rotation camera) 0) 
    (set! (camera2d-zoom camera) 1))

  ; Draw
  ; --------------------------------------------------------------------------------------
  (clear-background RAYWHITE)

  (begin-drawing)
  (begin-mode2d camera)
  (draw-rectangle -6000 320 13000 8000 DARKGRAY)

  (for-each draw-rectangle-rec buildings build-colors)

  (draw-rectangle-rec player RED)

  (draw-line 
    (float->int (vec-x (camera2d-target camera)))
    (float->int (* screen-height -10))
    (float->int (vec-x (camera2d-target camera)))
    (float->int (* screen-height 10))
    GREEN)
  (draw-line
    (float->int (* screen-width -10))
    (float->int (vec-y (camera2d-target camera)))
    (float->int (* screen-width 10))
    (float->int (vec-y (camera2d-target camera)))
    GREEN)
  (end-mode2d)

  (draw-fps 0 0)
  (draw-text "SCREEN AREA" 640 10 20 RED)

  (draw-rectangle 0 0 screen-width 5 RED)
  (draw-rectangle 0 5 5 (- screen-height 10) RED)
  (draw-rectangle (- screen-width 5) 5 5 (- screen-height 10) RED)
  (draw-rectangle 0 (- screen-height 5) screen-width 5 RED)

  (draw-rectangle 10 10 250 113 (fade SKYBLUE 0.5))
  (draw-rectangle-lines 10 10 250 113 BLUE)

  (draw-text "Free 2D camera controls:" 20 20 10 BLACK)
  (draw-text "- Right/Left to move player" 40 40 10 DARKGRAY)
  (draw-text "- Mouse Wheel to Zoom in-out" 40 60 10 DARKGRAY)
  (draw-text "- A / S to Rotate" 40 80 10 DARKGRAY)
  (draw-text "- R to reset Zoom and Rotation" 40 100 10 DARKGRAY)
  (end-drawing)
  (unless (window-should-close) ;; Detect window close button or ESC key
    (loop)))

; De-Initialization
; ----------------------------------------------------------------------------------------
(close-window) ;; Close window and OpenGL contex
; ----------------------------------------------------------------------------------------
