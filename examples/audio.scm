(import raylib)

(import srfi-4)
(import chicken.memory)

(init-window 800 800 "test sound")

(init-audio-device)

;; custom wave example

(define my-wave (make-wave))
(define data (s16vector 0 1 2 3 4 5))
(define c-data (allocate 32))

;; use move-memory! to copy between c-pointer and srfi-4 vectors
(move-memory! data c-data)
(wave-data-set! my-wave c-data)

(free-wave my-wave)

;; wave file example

(define file-wave (load-wave "resources/test-sound.wav"))

(define sound (load-sound-from-wave file-wave))


(play-sound sound)

(define timer 0)

(let loop ()

  (begin-drawing)
  (clear-background RAYWHITE)
  (end-drawing)

  (when (> (get-time) timer)
    (play-sound sound)
    (set! timer (+ (get-time) 1)))
  (unless (window-should-close?) 
    (loop)))

(unload-wave file-wave)
(free-wave file-wave)

(close-window)
