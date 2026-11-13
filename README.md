# raylib 6.2 in CHICKEN Scheme!

This is the official repository for the `raylib` egg! Refer to the egg's wiki for documentation:
https://wiki.call-cc.org/eggref/6/raylib

## Install
Step 1: Install [raylib](https://github.com/raysan5/raylib) v6.2 as a **SHARED** library (.so/.dll) on your system. See [install-raylib.sh](install-raylib.sh) for guidance. 

Step 2:
```chicken-install -sudo raylib```

_NOTE: the egg searches for raylib using `pkg-config --libs raylib`, so be sure the raylib library (in its .so/.dll form) is available on your system._

## Static build
Static building isn't as automatic as the default dynamic build, but you can do it with:

```
csc -static myprogram.scm -L /usr/local/lib/libraylib.a
```

replacing `/usr/local/lib/libraylib.a` with the path to your static raylib binary.
## Example
```scheme
;; examples/basic-window.scm

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
```

## TODO
- [x] Bind all the declarations in raylib.h: everything but callbacks
- [ ] Add more examples
- [ ] Benchmark and investigate performance bottlenecks

## Recent Changes
I've decided to automate binding all these functions with `bind`. To preserve the SRFI-4 vector conversions for Vector/Color/Matrix and friends, a foreign transformer is passed to `bind` that handles all the casting and allocation. It should work exactly as it did before, but of course automated now! Only things missing are the callback related raylib functions because C callbacks are notoriously scary in CHICKEN scheme. See [wiki](https://wiki.call-cc.org/man/6/Module%20(chicken%20foreign)#callbacks) for info.

Constructors for the SRFI-4 raylib primitives (e.g. `make-color`, `make-vector2`) no longer exist. Use the SRFI-4 constructors instead (e.g. `u8vector` `f32vector` or `#f32(...)`).

Helper macros `with-drawing` and friends no longer exist. Have a look at `old-raylib.scm` if you want to copy-paste them into your project.

## Contribute
Pull requests are welcome! Thank you to everyone so far!
