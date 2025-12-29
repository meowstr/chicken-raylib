# raylib 5.5 in CHICKEN Scheme!

This is the official repository for the `raylib` egg! Refer to the egg's wiki for documentation:
https://wiki.call-cc.org/eggref/5/raylib

## Install
Step 1: Install [raylib](https://github.com/raysan5/raylib) as a shared library on your system. See [install-raylib.sh](install-raylib.sh) for guidance. 

Step 2:
```chicken-install -sudo raylib```

_NOTE: the egg searches for raylib using `pkg-config --libs raylib`, so be sure the raylib library (in its .so/.dll form) is available on your system._

## Example
```scheme
;; examples/basic-window.scm

(import raylib)

(init-window 800 450 "raylib [core] example - basic window")

(let loop ()
  (with-drawing
   (lambda ()
     (clear-background RAYWHITE)
     (draw-text "Congrats! You created your first window!"
                190
                200
                20
                LIGHTGRAY)))
  (unless (window-should-close?)
    (loop)))

(close-window)
```

## TODO
- [ ] Bind all the declarations in raylib.h
- [ ] Add more idiomatic wrappers
- [x] Improve installation process (search for raylib properly and perhaps install raylib locally for the user)
- [ ] Add more examples
- [ ] Benchmark and investigate performance bottlenecks

## Contribute
Pull requests are welcome!
