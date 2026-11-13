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
## THE Example
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

## Another helpful example
```scheme
;; examples/scheme-stuff.scm

(import raylib)
(import scheme.base)
(import chicken.memory)
(import srfi-4)

;;;;; using functions with parameters of type (the srfi-4 types):
;;;;; Vector2 Vector3 Vector4 Quaternion Matrix Rectangle Color

;; in raylib.h:
;; bool CheckCollisionCircleRec(Vector2 center, float radius, Rectangle rec);

(check-collision-circle-rec
  #f32(0 0)        ;; Vector2
  4
  #f32(1 1 10 10)) ;; Rectangle

;; or for non-constants:

(check-collision-circle-rec
  (f32vector (- 1 1) 0)              ;; Vector2
  4
  (f32vector (+ 1 0) (+ 1 0) 10 10)) ;; Rectangle

;; in raylib.h:
;; Color ColorAlpha(Color color, float alpha);

;; Color is a u8vector:

(color-lerp #u8(0 0 0 255) #u8(5 5 5 255) 0.7) ;; returns a u8vector (don't free it!)

;;;;; variadic functions trace-log and text-format:

(trace-log LOG_INFO "let me log this!") ;; not binded variadic, only 2 args (use chicken.format)

(text-format "~S ~S!" "hi" "guys") ;; actually binded to chicken.format

;;;;; handling structs with array fields
;;;;; NOTE: array fields aren't included in the struct constructor because of their nature

;; allocates a foreign pointer to the struct (remember to free)
(define config (make-vr-stereo-config)) 

;; in raylib.h:
;; typedef struct VrStereoConfig {
;;     Matrix projection[2];
;;     Matrix viewOffset[2];
;;     float leftLensCenter[2];
;;     float rightLensCenter[2];
;;     float leftScreenCenter[2];
;;     float rightScreenCenter[2];
;;     float scale[2];
;;     float scaleIn[2];
;; } VrStereoConfig;

;; get the leftLensCenter
(define ptr (vr-stereo-config-left-lens-center config))

;; use move-memory! to set the data there (copies 8 bytes of f32vector to struct)
(move-memory! #f32(123 123) ptr)

;; copy 8 bytes from struct to f32vector (move-memory! requires size in this case idk why)
(define x (make-f32vector 2))
(move-memory! ptr x 8)

;; projection field is a float array
(move-memory!
  (list->f32vector 
    (append (make-list 16 1)   ;; projection[0] (4x4 matrix of all 1's)
            (make-list 16 2))) ;; projection[1] (4x4 matrix of all 2's)
  (vr-stereo-config-projection config))

;; remember to free foreign memory (don't do this for the srfi-4 types tho like Vector2 and friends!)
(free config)
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
