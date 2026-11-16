typedef struct Vector3 {} Vector3;
typedef struct Camera3D {} Camera3D;
typedef struct Matrix {} Matrix;
typedef Camera3D Camera;

Vector3 GetCameraForward(Camera *camera);
Vector3 GetCameraUp(Camera *camera);
Vector3 GetCameraRight(Camera *camera);

// Camera movement
void CameraMoveForward(Camera *camera, float distance, bool moveInWorldPlane);
void CameraMoveUp(Camera *camera, float distance);
void CameraMoveRight(Camera *camera, float distance, bool moveInWorldPlane);
void CameraMoveToTarget(Camera *camera, float delta);

// Camera rotation
void CameraYaw(Camera *camera, float angle, bool rotateAroundTarget);
void CameraPitch(Camera *camera, float angle, bool lockView, bool rotateAroundTarget, bool rotateUp);
void CameraRoll(Camera *camera, float angle);

Matrix GetCameraViewMatrix(Camera *camera);
Matrix GetCameraProjectionMatrix(Camera *camera, float aspect);
