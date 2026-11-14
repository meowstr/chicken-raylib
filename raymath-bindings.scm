(begin
  (define clamp
    (foreign-lambda*
      float
      ((float a0) (float a1) (float a2))
      "return(Clamp(a0 , a1 , a2));")))
(begin
  (define lerp
    (foreign-lambda*
      float
      ((float a0) (float a1) (float a2))
      "return(Lerp(a0 , a1 , a2));")))
(begin
  (define normalize
    (foreign-lambda*
      float
      ((float a0) (float a1) (float a2))
      "return(Normalize(a0 , a1 , a2));")))
(begin
  (define remap
    (foreign-lambda*
      float
      ((float a0) (float a1) (float a2) (float a3) (float a4))
      "return(Remap(a0 , a1 , a2 , a3 , a4));")))
(begin
  (define wrap
    (foreign-lambda*
      float
      ((float a0) (float a1) (float a2))
      "return(Wrap(a0 , a1 , a2));")))
(begin
  (define float-equals
    (foreign-lambda*
      integer
      ((float a0) (float a1))
      "return(FloatEquals(a0 , a1));")))
(begin
  (define vector2-zero
    (lambda ()
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out))
           "*((Vector2*)out) = Vector2Zero();\n")
         out)
        out))))
(begin
  (define vector2-one
    (lambda ()
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out))
           "*((Vector2*)out) = Vector2One();\n")
         out)
        out))))
(begin
  (define vector2-add
    (lambda (a0 a1)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector2*)out) = Vector2Add(*((Vector2*)a0) , *((Vector2*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector2-add-value
    (lambda (a0 a1)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (float a1))
           "*((Vector2*)out) = Vector2AddValue(*((Vector2*)a0) , a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector2-subtract
    (lambda (a0 a1)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector2*)out) = Vector2Subtract(*((Vector2*)a0) , *((Vector2*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector2-subtract-value
    (lambda (a0 a1)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (float a1))
           "*((Vector2*)out) = Vector2SubtractValue(*((Vector2*)a0) , a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector2-length
    (foreign-lambda*
      float
      ((f32vector a0))
      "return(Vector2Length(*((Vector2*)a0)));")))
(begin
  (define vector2-length-sqr
    (foreign-lambda*
      float
      ((f32vector a0))
      "return(Vector2LengthSqr(*((Vector2*)a0)));")))
(begin
  (define vector2-dot-product
    (foreign-lambda*
      float
      ((f32vector a0) (f32vector a1))
      "return(Vector2DotProduct(*((Vector2*)a0) , *((Vector2*)a1)));")))
(begin
  (define vector2-cross-product
    (foreign-lambda*
      float
      ((f32vector a0) (f32vector a1))
      "return(Vector2CrossProduct(*((Vector2*)a0) , *((Vector2*)a1)));")))
(begin
  (define vector2-distance
    (foreign-lambda*
      float
      ((f32vector a0) (f32vector a1))
      "return(Vector2Distance(*((Vector2*)a0) , *((Vector2*)a1)));")))
(begin
  (define vector2-distance-sqr
    (foreign-lambda*
      float
      ((f32vector a0) (f32vector a1))
      "return(Vector2DistanceSqr(*((Vector2*)a0) , *((Vector2*)a1)));")))
(begin
  (define vector2-angle
    (foreign-lambda*
      float
      ((f32vector a0) (f32vector a1))
      "return(Vector2Angle(*((Vector2*)a0) , *((Vector2*)a1)));")))
(begin
  (define vector2-line-angle
    (foreign-lambda*
      float
      ((f32vector a0) (f32vector a1))
      "return(Vector2LineAngle(*((Vector2*)a0) , *((Vector2*)a1)));")))
(begin
  (define vector2-scale
    (lambda (a0 a1)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (float a1))
           "*((Vector2*)out) = Vector2Scale(*((Vector2*)a0) , a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector2-multiply
    (lambda (a0 a1)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector2*)out) = Vector2Multiply(*((Vector2*)a0) , *((Vector2*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector2-negate
    (lambda (a0)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0))
           "*((Vector2*)out) = Vector2Negate(*((Vector2*)a0));\n")
         out
         a0)
        out))))
(begin
  (define vector2-divide
    (lambda (a0 a1)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector2*)out) = Vector2Divide(*((Vector2*)a0) , *((Vector2*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector2-normalize
    (lambda (a0)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0))
           "*((Vector2*)out) = Vector2Normalize(*((Vector2*)a0));\n")
         out
         a0)
        out))))
(begin
  (define vector2-transform
    (lambda (a0 a1)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector2*)out) = Vector2Transform(*((Vector2*)a0) , *((Matrix*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector2-lerp
    (lambda (a0 a1 a2)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1) (float a2))
           "*((Vector2*)out) = Vector2Lerp(*((Vector2*)a0) , *((Vector2*)a1) , a2);\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define vector2-reflect
    (lambda (a0 a1)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector2*)out) = Vector2Reflect(*((Vector2*)a0) , *((Vector2*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector2-min
    (lambda (a0 a1)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector2*)out) = Vector2Min(*((Vector2*)a0) , *((Vector2*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector2-max
    (lambda (a0 a1)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector2*)out) = Vector2Max(*((Vector2*)a0) , *((Vector2*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector2-rotate
    (lambda (a0 a1)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (float a1))
           "*((Vector2*)out) = Vector2Rotate(*((Vector2*)a0) , a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector2-move-towards
    (lambda (a0 a1 a2)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1) (float a2))
           "*((Vector2*)out) = Vector2MoveTowards(*((Vector2*)a0) , *((Vector2*)a1) , a2);\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define vector2-invert
    (lambda (a0)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0))
           "*((Vector2*)out) = Vector2Invert(*((Vector2*)a0));\n")
         out
         a0)
        out))))
(begin
  (define vector2-clamp
    (lambda (a0 a1 a2)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1) (f32vector a2))
           "*((Vector2*)out) = Vector2Clamp(*((Vector2*)a0) , *((Vector2*)a1) , *((Vector2*)a2));\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define vector2-clamp-value
    (lambda (a0 a1 a2)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (float a1) (float a2))
           "*((Vector2*)out) = Vector2ClampValue(*((Vector2*)a0) , a1 , a2);\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define vector2-equals
    (foreign-lambda*
      integer
      ((f32vector a0) (f32vector a1))
      "return(Vector2Equals(*((Vector2*)a0) , *((Vector2*)a1)));")))
(begin
  (define vector2-refract
    (lambda (a0 a1 a2)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1) (float a2))
           "*((Vector2*)out) = Vector2Refract(*((Vector2*)a0) , *((Vector2*)a1) , a2);\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define vector3-zero
    (lambda ()
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out))
           "*((Vector3*)out) = Vector3Zero();\n")
         out)
        out))))
(begin
  (define vector3-one
    (lambda ()
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out))
           "*((Vector3*)out) = Vector3One();\n")
         out)
        out))))
(begin
  (define vector3-add
    (lambda (a0 a1)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector3*)out) = Vector3Add(*((Vector3*)a0) , *((Vector3*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector3-add-value
    (lambda (a0 a1)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (float a1))
           "*((Vector3*)out) = Vector3AddValue(*((Vector3*)a0) , a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector3-subtract
    (lambda (a0 a1)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector3*)out) = Vector3Subtract(*((Vector3*)a0) , *((Vector3*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector3-subtract-value
    (lambda (a0 a1)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (float a1))
           "*((Vector3*)out) = Vector3SubtractValue(*((Vector3*)a0) , a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector3-scale
    (lambda (a0 a1)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (float a1))
           "*((Vector3*)out) = Vector3Scale(*((Vector3*)a0) , a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector3-multiply
    (lambda (a0 a1)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector3*)out) = Vector3Multiply(*((Vector3*)a0) , *((Vector3*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector3-cross-product
    (lambda (a0 a1)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector3*)out) = Vector3CrossProduct(*((Vector3*)a0) , *((Vector3*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector3-perpendicular
    (lambda (a0)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0))
           "*((Vector3*)out) = Vector3Perpendicular(*((Vector3*)a0));\n")
         out
         a0)
        out))))
(begin
  (define vector3-length
    (foreign-lambda*
      float
      (((const (struct "Vector3")) a0))
      "return(Vector3Length(a0));")))
(begin
  (define vector3-length-sqr
    (foreign-lambda*
      float
      (((const (struct "Vector3")) a0))
      "return(Vector3LengthSqr(a0));")))
(begin
  (define vector3-dot-product
    (foreign-lambda*
      float
      ((f32vector a0) (f32vector a1))
      "return(Vector3DotProduct(*((Vector3*)a0) , *((Vector3*)a1)));")))
(begin
  (define vector3-distance
    (foreign-lambda*
      float
      ((f32vector a0) (f32vector a1))
      "return(Vector3Distance(*((Vector3*)a0) , *((Vector3*)a1)));")))
(begin
  (define vector3-distance-sqr
    (foreign-lambda*
      float
      ((f32vector a0) (f32vector a1))
      "return(Vector3DistanceSqr(*((Vector3*)a0) , *((Vector3*)a1)));")))
(begin
  (define vector3-angle
    (foreign-lambda*
      float
      ((f32vector a0) (f32vector a1))
      "return(Vector3Angle(*((Vector3*)a0) , *((Vector3*)a1)));")))
(begin
  (define vector3-negate
    (lambda (a0)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0))
           "*((Vector3*)out) = Vector3Negate(*((Vector3*)a0));\n")
         out
         a0)
        out))))
(begin
  (define vector3-divide
    (lambda (a0 a1)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector3*)out) = Vector3Divide(*((Vector3*)a0) , *((Vector3*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector3-normalize
    (lambda (a0)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0))
           "*((Vector3*)out) = Vector3Normalize(*((Vector3*)a0));\n")
         out
         a0)
        out))))
(begin
  (define vector3-project
    (lambda (a0 a1)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector3*)out) = Vector3Project(*((Vector3*)a0) , *((Vector3*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector3-reject
    (lambda (a0 a1)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector3*)out) = Vector3Reject(*((Vector3*)a0) , *((Vector3*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector3-ortho-normalize
    (foreign-lambda*
      void
      (((c-pointer (struct "Vector3")) a0) ((c-pointer (struct "Vector3")) a1))
      "Vector3OrthoNormalize(a0 , a1);")))
(begin
  (define vector3-transform
    (lambda (a0 a1)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector3*)out) = Vector3Transform(*((Vector3*)a0) , *((Matrix*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector3-rotate-by-quaternion
    (lambda (a0 a1)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector3*)out) = Vector3RotateByQuaternion(*((Vector3*)a0) , *((Vector4*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector3-rotate-by-axis-angle
    (lambda (a0 a1 a2)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1) (float a2))
           "*((Vector3*)out) = Vector3RotateByAxisAngle(*((Vector3*)a0) , *((Vector3*)a1) , a2);\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define vector3-move-towards
    (lambda (a0 a1 a2)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1) (float a2))
           "*((Vector3*)out) = Vector3MoveTowards(*((Vector3*)a0) , *((Vector3*)a1) , a2);\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define vector3-lerp
    (lambda (a0 a1 a2)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1) (float a2))
           "*((Vector3*)out) = Vector3Lerp(*((Vector3*)a0) , *((Vector3*)a1) , a2);\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define vector3-cubic-hermite
    (lambda (a0 a1 a2 a3 a4)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out)
            (f32vector a0)
            (f32vector a1)
            (f32vector a2)
            (f32vector a3)
            (float a4))
           "*((Vector3*)out) = Vector3CubicHermite(*((Vector3*)a0) , *((Vector3*)a1) , *((Vector3*)a2) , *((Vector3*)a3) , a4);\n")
         out
         a0
         a1
         a2
         a3
         a4)
        out))))
(begin
  (define vector3-reflect
    (lambda (a0 a1)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector3*)out) = Vector3Reflect(*((Vector3*)a0) , *((Vector3*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector3-min
    (lambda (a0 a1)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector3*)out) = Vector3Min(*((Vector3*)a0) , *((Vector3*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector3-max
    (lambda (a0 a1)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector3*)out) = Vector3Max(*((Vector3*)a0) , *((Vector3*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector3-barycenter
    (lambda (a0 a1 a2 a3)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out)
            (f32vector a0)
            (f32vector a1)
            (f32vector a2)
            (f32vector a3))
           "*((Vector3*)out) = Vector3Barycenter(*((Vector3*)a0) , *((Vector3*)a1) , *((Vector3*)a2) , *((Vector3*)a3));\n")
         out
         a0
         a1
         a2
         a3)
        out))))
(begin
  (define vector3-unproject
    (lambda (a0 a1 a2)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1) (f32vector a2))
           "*((Vector3*)out) = Vector3Unproject(*((Vector3*)a0) , *((Matrix*)a1) , *((Matrix*)a2));\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define vector3-invert
    (lambda (a0)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0))
           "*((Vector3*)out) = Vector3Invert(*((Vector3*)a0));\n")
         out
         a0)
        out))))
(begin
  (define vector3-clamp
    (lambda (a0 a1 a2)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1) (f32vector a2))
           "*((Vector3*)out) = Vector3Clamp(*((Vector3*)a0) , *((Vector3*)a1) , *((Vector3*)a2));\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define vector3-clamp-value
    (lambda (a0 a1 a2)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (float a1) (float a2))
           "*((Vector3*)out) = Vector3ClampValue(*((Vector3*)a0) , a1 , a2);\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define vector3-equals
    (foreign-lambda*
      integer
      ((f32vector a0) (f32vector a1))
      "return(Vector3Equals(*((Vector3*)a0) , *((Vector3*)a1)));")))
(begin
  (define vector3-refract
    (lambda (a0 a1 a2)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1) (float a2))
           "*((Vector3*)out) = Vector3Refract(*((Vector3*)a0) , *((Vector3*)a1) , a2);\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define vector4-zero
    (lambda ()
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out))
           "*((Vector4*)out) = Vector4Zero();\n")
         out)
        out))))
(begin
  (define vector4-one
    (lambda ()
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out))
           "*((Vector4*)out) = Vector4One();\n")
         out)
        out))))
(begin
  (define vector4-add
    (lambda (a0 a1)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector4*)out) = Vector4Add(*((Vector4*)a0) , *((Vector4*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector4-add-value
    (lambda (a0 a1)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (float a1))
           "*((Vector4*)out) = Vector4AddValue(*((Vector4*)a0) , a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector4-subtract
    (lambda (a0 a1)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector4*)out) = Vector4Subtract(*((Vector4*)a0) , *((Vector4*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector4-subtract-value
    (lambda (a0 a1)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (float a1))
           "*((Vector4*)out) = Vector4SubtractValue(*((Vector4*)a0) , a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector4-length
    (foreign-lambda*
      float
      ((f32vector a0))
      "return(Vector4Length(*((Vector4*)a0)));")))
(begin
  (define vector4-length-sqr
    (foreign-lambda*
      float
      ((f32vector a0))
      "return(Vector4LengthSqr(*((Vector4*)a0)));")))
(begin
  (define vector4-dot-product
    (foreign-lambda*
      float
      ((f32vector a0) (f32vector a1))
      "return(Vector4DotProduct(*((Vector4*)a0) , *((Vector4*)a1)));")))
(begin
  (define vector4-distance
    (foreign-lambda*
      float
      ((f32vector a0) (f32vector a1))
      "return(Vector4Distance(*((Vector4*)a0) , *((Vector4*)a1)));")))
(begin
  (define vector4-distance-sqr
    (foreign-lambda*
      float
      ((f32vector a0) (f32vector a1))
      "return(Vector4DistanceSqr(*((Vector4*)a0) , *((Vector4*)a1)));")))
(begin
  (define vector4-scale
    (lambda (a0 a1)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (float a1))
           "*((Vector4*)out) = Vector4Scale(*((Vector4*)a0) , a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector4-multiply
    (lambda (a0 a1)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector4*)out) = Vector4Multiply(*((Vector4*)a0) , *((Vector4*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector4-negate
    (lambda (a0)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0))
           "*((Vector4*)out) = Vector4Negate(*((Vector4*)a0));\n")
         out
         a0)
        out))))
(begin
  (define vector4-divide
    (lambda (a0 a1)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector4*)out) = Vector4Divide(*((Vector4*)a0) , *((Vector4*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector4-normalize
    (lambda (a0)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0))
           "*((Vector4*)out) = Vector4Normalize(*((Vector4*)a0));\n")
         out
         a0)
        out))))
(begin
  (define vector4-min
    (lambda (a0 a1)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector4*)out) = Vector4Min(*((Vector4*)a0) , *((Vector4*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector4-max
    (lambda (a0 a1)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector4*)out) = Vector4Max(*((Vector4*)a0) , *((Vector4*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define vector4-lerp
    (lambda (a0 a1 a2)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1) (float a2))
           "*((Vector4*)out) = Vector4Lerp(*((Vector4*)a0) , *((Vector4*)a1) , a2);\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define vector4-move-towards
    (lambda (a0 a1 a2)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1) (float a2))
           "*((Vector4*)out) = Vector4MoveTowards(*((Vector4*)a0) , *((Vector4*)a1) , a2);\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define vector4-invert
    (lambda (a0)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0))
           "*((Vector4*)out) = Vector4Invert(*((Vector4*)a0));\n")
         out
         a0)
        out))))
(begin
  (define vector4-equals
    (foreign-lambda*
      integer
      ((f32vector a0) (f32vector a1))
      "return(Vector4Equals(*((Vector4*)a0) , *((Vector4*)a1)));")))
(begin
  (define matrix-determinant
    (foreign-lambda*
      float
      ((f32vector a0))
      "return(MatrixDeterminant(*((Matrix*)a0)));")))
(begin
  (define matrix-trace
    (foreign-lambda*
      float
      ((f32vector a0))
      "return(MatrixTrace(*((Matrix*)a0)));")))
(begin
  (define matrix-transpose
    (lambda (a0)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0))
           "*((Matrix*)out) = MatrixTranspose(*((Matrix*)a0));\n")
         out
         a0)
        out))))
(begin
  (define matrix-invert
    (lambda (a0)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0))
           "*((Matrix*)out) = MatrixInvert(*((Matrix*)a0));\n")
         out
         a0)
        out))))
(begin
  (define matrix-identity
    (lambda ()
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out))
           "*((Matrix*)out) = MatrixIdentity();\n")
         out)
        out))))
(begin
  (define matrix-add
    (lambda (a0 a1)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Matrix*)out) = MatrixAdd(*((Matrix*)a0) , *((Matrix*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define matrix-subtract
    (lambda (a0 a1)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Matrix*)out) = MatrixSubtract(*((Matrix*)a0) , *((Matrix*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define matrix-multiply
    (lambda (a0 a1)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Matrix*)out) = MatrixMultiply(*((Matrix*)a0) , *((Matrix*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define matrix-multiply-value
    (lambda (a0 a1)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (float a1))
           "*((Matrix*)out) = MatrixMultiplyValue(*((Matrix*)a0) , a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define matrix-translate
    (lambda (a0 a1 a2)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out) (float a0) (float a1) (float a2))
           "*((Matrix*)out) = MatrixTranslate(a0 , a1 , a2);\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define matrix-rotate
    (lambda (a0 a1)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (float a1))
           "*((Matrix*)out) = MatrixRotate(*((Vector3*)a0) , a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define matrix-rotate-x
    (lambda (a0)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out) (float a0))
           "*((Matrix*)out) = MatrixRotateX(a0);\n")
         out
         a0)
        out))))
(begin
  (define matrix-rotate-y
    (lambda (a0)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out) (float a0))
           "*((Matrix*)out) = MatrixRotateY(a0);\n")
         out
         a0)
        out))))
(begin
  (define matrix-rotate-z
    (lambda (a0)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out) (float a0))
           "*((Matrix*)out) = MatrixRotateZ(a0);\n")
         out
         a0)
        out))))
(begin
  (define matrix-rotate-xyz
    (lambda (a0)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0))
           "*((Matrix*)out) = MatrixRotateXYZ(*((Vector3*)a0));\n")
         out
         a0)
        out))))
(begin
  (define matrix-rotate-zyx
    (lambda (a0)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0))
           "*((Matrix*)out) = MatrixRotateZYX(*((Vector3*)a0));\n")
         out
         a0)
        out))))
(begin
  (define matrix-scale
    (lambda (a0 a1 a2)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out) (float a0) (float a1) (float a2))
           "*((Matrix*)out) = MatrixScale(a0 , a1 , a2);\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define matrix-frustum
    (lambda (a0 a1 a2 a3 a4 a5)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out)
            (double a0)
            (double a1)
            (double a2)
            (double a3)
            (double a4)
            (double a5))
           "*((Matrix*)out) = MatrixFrustum(a0 , a1 , a2 , a3 , a4 , a5);\n")
         out
         a0
         a1
         a2
         a3
         a4
         a5)
        out))))
(begin
  (define matrix-perspective
    (lambda (a0 a1 a2 a3)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out) (double a0) (double a1) (double a2) (double a3))
           "*((Matrix*)out) = MatrixPerspective(a0 , a1 , a2 , a3);\n")
         out
         a0
         a1
         a2
         a3)
        out))))
(begin
  (define matrix-ortho
    (lambda (a0 a1 a2 a3 a4 a5)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out)
            (double a0)
            (double a1)
            (double a2)
            (double a3)
            (double a4)
            (double a5))
           "*((Matrix*)out) = MatrixOrtho(a0 , a1 , a2 , a3 , a4 , a5);\n")
         out
         a0
         a1
         a2
         a3
         a4
         a5)
        out))))
(begin
  (define matrix-look-at
    (lambda (a0 a1 a2)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1) (f32vector a2))
           "*((Matrix*)out) = MatrixLookAt(*((Vector3*)a0) , *((Vector3*)a1) , *((Vector3*)a2));\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define quaternion-add
    (lambda (a0 a1)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector4*)out) = QuaternionAdd(*((Vector4*)a0) , *((Vector4*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define quaternion-add-value
    (lambda (a0 a1)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (float a1))
           "*((Vector4*)out) = QuaternionAddValue(*((Vector4*)a0) , a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define quaternion-subtract
    (lambda (a0 a1)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector4*)out) = QuaternionSubtract(*((Vector4*)a0) , *((Vector4*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define quaternion-subtract-value
    (lambda (a0 a1)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (float a1))
           "*((Vector4*)out) = QuaternionSubtractValue(*((Vector4*)a0) , a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define quaternion-identity
    (lambda ()
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out))
           "*((Vector4*)out) = QuaternionIdentity();\n")
         out)
        out))))
(begin
  (define quaternion-length
    (foreign-lambda*
      float
      ((f32vector a0))
      "return(QuaternionLength(*((Vector4*)a0)));")))
(begin
  (define quaternion-normalize
    (lambda (a0)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0))
           "*((Vector4*)out) = QuaternionNormalize(*((Vector4*)a0));\n")
         out
         a0)
        out))))
(begin
  (define quaternion-invert
    (lambda (a0)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0))
           "*((Vector4*)out) = QuaternionInvert(*((Vector4*)a0));\n")
         out
         a0)
        out))))
(begin
  (define quaternion-multiply
    (lambda (a0 a1)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector4*)out) = QuaternionMultiply(*((Vector4*)a0) , *((Vector4*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define quaternion-scale
    (lambda (a0 a1)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (float a1))
           "*((Vector4*)out) = QuaternionScale(*((Vector4*)a0) , a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define quaternion-divide
    (lambda (a0 a1)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector4*)out) = QuaternionDivide(*((Vector4*)a0) , *((Vector4*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define quaternion-lerp
    (lambda (a0 a1 a2)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1) (float a2))
           "*((Vector4*)out) = QuaternionLerp(*((Vector4*)a0) , *((Vector4*)a1) , a2);\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define quaternion-nlerp
    (lambda (a0 a1 a2)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1) (float a2))
           "*((Vector4*)out) = QuaternionNlerp(*((Vector4*)a0) , *((Vector4*)a1) , a2);\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define quaternion-slerp
    (lambda (a0 a1 a2)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1) (float a2))
           "*((Vector4*)out) = QuaternionSlerp(*((Vector4*)a0) , *((Vector4*)a1) , a2);\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define quaternion-cubic-hermite-spline
    (lambda (a0 a1 a2 a3 a4)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out)
            (f32vector a0)
            (f32vector a1)
            (f32vector a2)
            (f32vector a3)
            (float a4))
           "*((Vector4*)out) = QuaternionCubicHermiteSpline(*((Vector4*)a0) , *((Vector4*)a1) , *((Vector4*)a2) , *((Vector4*)a3) , a4);\n")
         out
         a0
         a1
         a2
         a3
         a4)
        out))))
(begin
  (define quaternion-from-vector3-to-vector3
    (lambda (a0 a1)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector4*)out) = QuaternionFromVector3ToVector3(*((Vector3*)a0) , *((Vector3*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define quaternion-from-matrix
    (lambda (a0)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0))
           "*((Vector4*)out) = QuaternionFromMatrix(*((Matrix*)a0));\n")
         out
         a0)
        out))))
(begin
  (define quaternion-to-matrix
    (lambda (a0)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0))
           "*((Matrix*)out) = QuaternionToMatrix(*((Vector4*)a0));\n")
         out
         a0)
        out))))
(begin
  (define quaternion-from-axis-angle
    (lambda (a0 a1)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (float a1))
           "*((Vector4*)out) = QuaternionFromAxisAngle(*((Vector3*)a0) , a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define quaternion-to-axis-angle
    (foreign-lambda*
      void
      ((f32vector a0) ((c-pointer (struct "Vector3")) a1) (f32vector a2))
      "QuaternionToAxisAngle(*((Vector4*)a0) , a1 , a2);")))
(begin
  (define quaternion-from-euler
    (lambda (a0 a1 a2)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (float a0) (float a1) (float a2))
           "*((Vector4*)out) = QuaternionFromEuler(a0 , a1 , a2);\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define quaternion-to-euler
    (lambda (a0)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0))
           "*((Vector3*)out) = QuaternionToEuler(*((Vector4*)a0));\n")
         out
         a0)
        out))))
(begin
  (define quaternion-transform
    (lambda (a0 a1)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Vector4*)out) = QuaternionTransform(*((Vector4*)a0) , *((Matrix*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define quaternion-equals
    (foreign-lambda*
      integer
      ((f32vector a0) (f32vector a1))
      "return(QuaternionEquals(*((Vector4*)a0) , *((Vector4*)a1)));")))
(begin
  (define matrix-compose
    (lambda (a0 a1 a2)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1) (f32vector a2))
           "*((Matrix*)out) = MatrixCompose(*((Vector3*)a0) , *((Vector4*)a1) , *((Vector3*)a2));\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define matrix-decompose
    (foreign-lambda*
      void
      ((f32vector a0)
       ((c-pointer (struct "Vector3")) a1)
       ((c-pointer (struct "Vector4")) a2)
       ((c-pointer (struct "Vector3")) a3))
      "MatrixDecompose(*((Matrix*)a0) , a1 , a2 , a3);")))
