(import raylib)

(init-window 800 450 "raylib [core] example - basic window")

(let loop ()
  (begin-drawing)
  (clear-background RAYWHITE)
  (draw-rectangle-rec #f32(10 10 780 430) BLUE) ; pass srfi-4 vector as a Rectangle!
  (draw-text "Congrats! You created your first window!" 190 200 20 LIGHTGRAY)
  (end-drawing)
  (unless (window-should-close)
    (loop)))

(close-window)
