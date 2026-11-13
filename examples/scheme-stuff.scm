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
