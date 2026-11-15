(import raylib)
(import raygui)

(import chicken.bitwise)
(import srfi-4)

(define (int->uint n)
  (bitwise-and n #xffffffff))

(init-window 400 200 "raygui - controls test suite")
(set-target-fps 60)

(define show-message-box #f)

(let loop ()

  (begin-drawing)

  ;; get-color expects a uint but gui-get-style returns an int
  (clear-background (get-color (int->uint (gui-get-style DEFAULT BACKGROUND_COLOR))))

  (when (> (gui-button #f32(24 24 120 30) "#191#Show Message") 0)
    (set! show-message-box #t))

  (when show-message-box
    ;; btn-active is an int that needs to be passed as a pointer, so wrap in a s32vector
    (let ([btn-active (s32vector -1)])
      (gui-message-box #f32(85 70 250 100) "#191#Message Box" "Hi! This is a message!" "Nice;Cool" btn-active)

      (when (>= (s32vector-ref btn-active 0) 0)
        (set! show-message-box #f))))

  (end-drawing)

  (unless (window-should-close)
    (loop)))
