(begin
  (define get-camera-forward
    (lambda (a0)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) ((c-pointer (struct "Camera3D")) a0))
           "*((Vector3*)out) = GetCameraForward(a0);\n")
         out
         a0)
        out))))
(begin
  (define get-camera-up
    (lambda (a0)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) ((c-pointer (struct "Camera3D")) a0))
           "*((Vector3*)out) = GetCameraUp(a0);\n")
         out
         a0)
        out))))
(begin
  (define get-camera-right
    (lambda (a0)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) ((c-pointer (struct "Camera3D")) a0))
           "*((Vector3*)out) = GetCameraRight(a0);\n")
         out
         a0)
        out))))
(begin
  (define camera-move-forward
    (foreign-lambda*
      void
      (((c-pointer (struct "Camera3D")) a0) (float a1) (bool a2))
      "CameraMoveForward(a0 , a1 , a2);")))
(begin
  (define camera-move-up
    (foreign-lambda*
      void
      (((c-pointer (struct "Camera3D")) a0) (float a1))
      "CameraMoveUp(a0 , a1);")))
(begin
  (define camera-move-right
    (foreign-lambda*
      void
      (((c-pointer (struct "Camera3D")) a0) (float a1) (bool a2))
      "CameraMoveRight(a0 , a1 , a2);")))
(begin
  (define camera-move-to-target
    (foreign-lambda*
      void
      (((c-pointer (struct "Camera3D")) a0) (float a1))
      "CameraMoveToTarget(a0 , a1);")))
(begin
  (define camera-yaw
    (foreign-lambda*
      void
      (((c-pointer (struct "Camera3D")) a0) (float a1) (bool a2))
      "CameraYaw(a0 , a1 , a2);")))
(begin
  (define camera-pitch
    (foreign-lambda*
      void
      (((c-pointer (struct "Camera3D")) a0)
       (float a1)
       (bool a2)
       (bool a3)
       (bool a4))
      "CameraPitch(a0 , a1 , a2 , a3 , a4);")))
(begin
  (define camera-roll
    (foreign-lambda*
      void
      (((c-pointer (struct "Camera3D")) a0) (float a1))
      "CameraRoll(a0 , a1);")))
(begin
  (define get-camera-view-matrix
    (lambda (a0)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out) ((c-pointer (struct "Camera3D")) a0))
           "*((Matrix*)out) = GetCameraViewMatrix(a0);\n")
         out
         a0)
        out))))
(begin
  (define get-camera-projection-matrix
    (lambda (a0 a1)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out) ((c-pointer (struct "Camera3D")) a0) (float a1))
           "*((Matrix*)out) = GetCameraProjectionMatrix(a0 , a1);\n")
         out
         a0
         a1)
        out))))
