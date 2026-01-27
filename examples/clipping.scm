(module text-font-loading *

(import scheme chicken.base srfi-1 srfi-4 raylib)

(init-window 800 450 "raylib [core] example - font loading")

(define msg "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHI\nJKLMNOPQRSTUVWXYZ[]^_`abcdefghijklmn\nopqrstuvwxyz{|}~¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓ\nÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷\nøùúûüýþÿ")

(define font-bm  (load-font "resources/pixantiqua.fnt"))
(define font-ttf (load-font-ex "resources/pixantiqua.ttf" 32 (list->s32vector (iota 256)) 256))

(define font-size (measure-text-ex font-ttf msg (font-base-size font-ttf) 1.0))

(print "Font size: "font-size)

(set-text-line-spacing 16)

(set-target-fps 60)

(let loop ()
  (let ((use-ttf (key-down? KEY_SPACE)))
    (with-drawing
     (lambda ()
       (clear-background RAYWHITE)
       (draw-text "Hold SPACE to use TTF generated font" 20 20 20 LIGHTGRAY)
       (with-scissor-mode
        30 30 500 200
        (lambda ()
          ;; (begin-scissor-mode 80 30 500 500)
          (let ((font   (if use-ttf font-bm font-ttf))
                (color  (if use-ttf MAROON LIME)))
            (draw-text-ex font msg (make-vec2 20.0 100.0)(font-base-size font) 2 color)
            (draw-text (if use-ttf
                           "Using BMFfont (Anglecode) imported"
                           "Using TTF font generated")
                       20 (- (get-screen-height) 30) 20 GRAY)))
          ;; (end-scissor-mode)
          )))
    (unless (window-should-close?)
      (loop))))

(unload-font font-bm)
(unload-font font-ttf)
(close-window)
)
