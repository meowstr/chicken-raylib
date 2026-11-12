(import raylib)

(init-window 800 450 "raylib [core] example - basic window")

(let loop ()
  (begin-drawing)
  (clear-background RAYWHITE)
  (draw-text "Congrats! You created your first window!" 190 200 20 GRAY)
  (end-drawing)
  (unless (window-should-close)
    (loop)))

(close-window)
