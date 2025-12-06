(module raylib *

(import scheme)
(import (chicken base))
(import (chicken foreign))
(import foreigners)
(import (srfi-4))

(foreign-declare "#include <raylib.h>")

(foreign-declare
 "Color ToColor (unsigned char *x) { return (Color) {x[0], x[1], x[2], x[3]}; }
  Rectangle ToRectangle (float *x) { return (Rectangle) {x[0], x[1], x[2], x[3]}; }
  Vector2 ToVector2 (float *x) { return (Vector2) {x[0], x[1]}; }
  void FromVector2 (float *x, Vector2 v) { x[0]=v.x; x[1]=v.y; }")

(define-foreign-type Color u8vector)
(define (make-color r g b a)
  (u8vector r g b a))

(define-foreign-type Rectangle f32vector)
(define (make-rect x y w h)
  (f32vector x y w h))
(define (rect-x r) (f32vector-ref r 0))
(define (rect-y r) (f32vector-ref r 1))
(define (rect-w r) (f32vector-ref r 2))
(define (rect-h r) (f32vector-ref r 3))

(define-foreign-type Vector2 f32vector)
(define (make-vec2 x y)
  (f32vector x y))
(define (vec2-x v) (f32vector-ref v 0))
(define (vec2-y v) (f32vector-ref v 1))

(define-foreign-type Vector3 f32vector)
(define (make-vec3 x y z)
  (f32vector x y z))
(define (vec3-x v) (f32vector-ref v 0))
(define (vec3-y v) (f32vector-ref v 1))
(define (vec3-z v) (f32vector-ref v 2))

(define-foreign-record-type (Texture* "struct Texture")
  (constructor: make-texture)
  (destructor: free-texture) 
  (unsigned-int id texture-id)
  (int width texture-width)
  (int height texture-height)
  (int mipmaps texture-mipmaps)
  (int format texture-format))

(define-foreign-record-type (Camera2D* "struct Camera2D")
  (constructor: make-camera2d)
  (destructor: free-camera2d)
  (float rotation camera2d-rotation camera2d-rotation-set!)
  (float zoom camera2d-zoom camera2d-zoom-set!))
(define camera2d-offset-helper
  (foreign-lambda* void ((Vector2 out) (Camera2D* camera)) "FromVector2(out, camera->offset);"))
(define camera2d-target-helper
  (foreign-lambda* void ((Vector2 out) (Camera2D* camera)) "FromVector2(out, camera->target);"))
(define camera2d-offset-set!
  (foreign-lambda* void ((Camera2D* camera) (Vector2 v)) "camera->offset = ToVector2(v);"))
(define camera2d-target-set!
  (foreign-lambda* void ((Camera2D* camera) (Vector2 v)) "camera->target = ToVector2(v);"))
(define (camera2d-offset camera)
  (let ([out (make-vec2 0 0)])
    (camera2d-offset-helper out camera)
    out))
(define (camera2d-target camera)
  (let ([out (make-vec2 0 0)])
    (camera2d-target-helper out camera)
    out))

(define LIGHTGRAY  (make-color 200 200 200 255))
(define GRAY       (make-color 130 130 130 255))
(define DARKGRAY   (make-color 80  80  80  255))
(define YELLOW     (make-color 253 249 0   255))
(define GOLD       (make-color 255 203 0   255))
(define ORANGE     (make-color 255 161 0   255))
(define PINK       (make-color 255 109 194 255))
(define RED        (make-color 230 41  55  255))
(define MAROON     (make-color 190 33  55  255))
(define GREEN      (make-color 0   228 48  255))
(define LIME       (make-color 0   158 47  255))
(define DARKGREEN  (make-color 0   117 44  255))
(define SKYBLUE    (make-color 102 191 255 255))
(define BLUE       (make-color 0   121 241 255))
(define DARKBLUE   (make-color 0   82  172 255))
(define PURPLE     (make-color 200 122 255 255))
(define VIOLET     (make-color 135 60  190 255))
(define DARKPURPLE (make-color 112 31  126 255))
(define BEIGE      (make-color 211 176 131 255))
(define BROWN      (make-color 127 106 79  255))
(define DARKBROWN  (make-color 76  63  47  255))
(define WHITE      (make-color 255 255 255 255))
(define BLACK      (make-color 0   0   0   255))
(define BLANK      (make-color 0   0   0   0  ))
(define MAGENTA    (make-color 255 0   255 255))
(define RAYWHITE   (make-color 245 245 245 255))

(define LOG_ALL     0)
(define LOG_TRACE   1)
(define LOG_DEBUG   2)
(define LOG_INFO    3)
(define LOG_WARNING 4)
(define LOG_ERROR   5)
(define LOG_FATAL   6)
(define LOG_NONE    7)

(define KEY_NULL             0   )      ; Key: NULL, used for no key pressed
(define KEY_APOSTROPHE       39  )      ; Key: '
(define KEY_COMMA            44  )      ; Key: ,
(define KEY_MINUS            45  )      ; Key: -
(define KEY_PERIOD           46  )      ; Key: .
(define KEY_SLASH            47  )      ; Key: /
(define KEY_ZERO             48  )      ; Key: 0
(define KEY_ONE              49  )      ; Key: 1
(define KEY_TWO              50  )      ; Key: 2
(define KEY_THREE            51  )      ; Key: 3
(define KEY_FOUR             52  )      ; Key: 4
(define KEY_FIVE             53  )      ; Key: 5
(define KEY_SIX              54  )      ; Key: 6
(define KEY_SEVEN            55  )      ; Key: 7
(define KEY_EIGHT            56  )      ; Key: 8
(define KEY_NINE             57  )      ; Key: 9
(define KEY_SEMICOLON        59  )      ; Key: ;
(define KEY_EQUAL            61  )      ; Key: =
(define KEY_A                65  )      ; Key: A | a
(define KEY_B                66  )      ; Key: B | b
(define KEY_C                67  )      ; Key: C | c
(define KEY_D                68  )      ; Key: D | d
(define KEY_E                69  )      ; Key: E | e
(define KEY_F                70  )      ; Key: F | f
(define KEY_G                71  )      ; Key: G | g
(define KEY_H                72  )      ; Key: H | h
(define KEY_I                73  )      ; Key: I | i
(define KEY_J                74  )      ; Key: J | j
(define KEY_K                75  )      ; Key: K | k
(define KEY_L                76  )      ; Key: L | l
(define KEY_M                77  )      ; Key: M | m
(define KEY_N                78  )      ; Key: N | n
(define KEY_O                79  )      ; Key: O | o
(define KEY_P                80  )      ; Key: P | p
(define KEY_Q                81  )      ; Key: Q | q
(define KEY_R                82  )      ; Key: R | r
(define KEY_S                83  )      ; Key: S | s
(define KEY_T                84  )      ; Key: T | t
(define KEY_U                85  )      ; Key: U | u
(define KEY_V                86  )      ; Key: V | v
(define KEY_W                87  )      ; Key: W | w
(define KEY_X                88  )      ; Key: X | x
(define KEY_Y                89  )      ; Key: Y | y
(define KEY_Z                90  )      ; Key: Z | z
(define KEY_LEFT_BRACKET     91  )      ; Key: [
(define KEY_BACKSLASH        92  )      ; Key: '\'
(define KEY_RIGHT_BRACKET    93  )      ; Key: ]
(define KEY_GRAVE            96  )      ; Key: `
(define KEY_SPACE            32  )      ; Key: Space
(define KEY_ESCAPE           256 )      ; Key: Esc
(define KEY_ENTER            257 )      ; Key: Enter
(define KEY_TAB              258 )      ; Key: Tab
(define KEY_BACKSPACE        259 )      ; Key: Backspace
(define KEY_INSERT           260 )      ; Key: Ins
(define KEY_DELETE           261 )      ; Key: Del
(define KEY_RIGHT            262 )      ; Key: Cursor right
(define KEY_LEFT             263 )      ; Key: Cursor left
(define KEY_DOWN             264 )      ; Key: Cursor down
(define KEY_UP               265 )      ; Key: Cursor up
(define KEY_PAGE_UP          266 )      ; Key: Page up
(define KEY_PAGE_DOWN        267 )      ; Key: Page down
(define KEY_HOME             268 )      ; Key: Home
(define KEY_END              269 )      ; Key: End
(define KEY_CAPS_LOCK        280 )      ; Key: Caps lock
(define KEY_SCROLL_LOCK      281 )      ; Key: Scroll down
(define KEY_NUM_LOCK         282 )      ; Key: Num lock
(define KEY_PRINT_SCREEN     283 )      ; Key: Print screen
(define KEY_PAUSE            284 )      ; Key: Pause
(define KEY_F1               290 )      ; Key: F1
(define KEY_F2               291 )      ; Key: F2
(define KEY_F3               292 )      ; Key: F3
(define KEY_F4               293 )      ; Key: F4
(define KEY_F5               294 )      ; Key: F5
(define KEY_F6               295 )      ; Key: F6
(define KEY_F7               296 )      ; Key: F7
(define KEY_F8               297 )      ; Key: F8
(define KEY_F9               298 )      ; Key: F9
(define KEY_F10              299 )      ; Key: F10
(define KEY_F11              300 )      ; Key: F11
(define KEY_F12              301 )      ; Key: F12
(define KEY_LEFT_SHIFT       340 )      ; Key: Shift left
(define KEY_LEFT_CONTROL     341 )      ; Key: Control left
(define KEY_LEFT_ALT         342 )      ; Key: Alt left
(define KEY_LEFT_SUPER       343 )      ; Key: Super left
(define KEY_RIGHT_SHIFT      344 )      ; Key: Shift right
(define KEY_RIGHT_CONTROL    345 )      ; Key: Control right
(define KEY_RIGHT_ALT        346 )      ; Key: Alt right
(define KEY_RIGHT_SUPER      347 )      ; Key: Super right
(define KEY_KB_MENU          348 )      ; Key: KB menu
(define KEY_KP_0             320 )      ; Key: Keypad 0
(define KEY_KP_1             321 )      ; Key: Keypad 1
(define KEY_KP_2             322 )      ; Key: Keypad 2
(define KEY_KP_3             323 )      ; Key: Keypad 3
(define KEY_KP_4             324 )      ; Key: Keypad 4
(define KEY_KP_5             325 )      ; Key: Keypad 5
(define KEY_KP_6             326 )      ; Key: Keypad 6
(define KEY_KP_7             327 )      ; Key: Keypad 7
(define KEY_KP_8             328 )      ; Key: Keypad 8
(define KEY_KP_9             329 )      ; Key: Keypad 9
(define KEY_KP_DECIMAL       330 )      ; Key: Keypad .
(define KEY_KP_DIVIDE        331 )      ; Key: Keypad /
(define KEY_KP_MULTIPLY      332 )      ; Key: Keypad *
(define KEY_KP_SUBTRACT      333 )      ; Key: Keypad -
(define KEY_KP_ADD           334 )      ; Key: Keypad +
(define KEY_KP_ENTER         335 )      ; Key: Keypad Enter
(define KEY_KP_EQUAL         336 )      ; Key: Keypad =
(define KEY_BACK             4   )      ; Key: Android back button
(define KEY_MENU             5   )      ; Key: Android menu button
(define KEY_VOLUME_UP        24  )      ; Key: Android volume up button
(define KEY_VOLUME_DOWN      25  )      ; Key: Android volume down button

(define MOUSE_BUTTON_LEFT    0) 
(define MOUSE_BUTTON_RIGHT   1) 
(define MOUSE_BUTTON_MIDDLE  2) 
(define MOUSE_BUTTON_SIDE    3) 
(define MOUSE_BUTTON_EXTRA   4) 
(define MOUSE_BUTTON_FORWARD 5) 
(define MOUSE_BUTTON_BACK    6) 

;; Window-related functions
(define init-window (foreign-lambda void "InitWindow" int int c-string))
(define close-window (foreign-lambda void "CloseWindow"))
(define get-screen-width (foreign-lambda int "GetScreenWidth"))
(define get-screen-height (foreign-lambda int "GetScreenHeight"))
(define window-should-close? (foreign-lambda bool "WindowShouldClose"))

;; Drawing-related functions
(define begin-drawing (foreign-lambda void "BeginDrawing"))
(define end-drawing (foreign-lambda void "EndDrawing"))
(define begin-mode-2d 
  (foreign-lambda* void ((Camera2D* camera)) "BeginMode2D(*camera);"))
(define end-mode-2d (foreign-lambda void "EndMode2D"))
(define clear-background 
  (foreign-lambda* void ((Color c)) "ClearBackground(ToColor(c));"))

;; Timing-related functions
(define set-target-fps (foreign-lambda void "SetTargetFPS" int))
(define get-frame-time (foreign-lambda float "GetFrameTime"))
(define get-time (foreign-lambda double "GetTime"))
(define get-fps (foreign-lambda int "GetFPS"))

;; Input-related functions: keyboard
(define key-pressed? (foreign-lambda bool "IsKeyPressed" int))
(define key-pressed-repeat? (foreign-lambda bool "IsKeyPressedRepeat" int))
(define key-down? (foreign-lambda bool "IsKeyDown" int))
(define key-released? (foreign-lambda bool "IsKeyReleased" int))
(define key-up? (foreign-lambda bool "IsKeyUp" int))
(define get-key-pressed (foreign-lambda int "GetKeyPressed"))
(define get-char-pressed (foreign-lambda int "GetCharPressed"))

;; Input-related functions:  mouse
(define mouse-button-pressed? (foreign-lambda bool "IsMouseButtonPressed" int))
(define mouse-button-down? (foreign-lambda bool "IsMouseButtonDown" int))
(define mouse-button-released? (foreign-lambda bool "IsMouseButtonReleased" int))
(define mouse-button-up? (foreign-lambda bool "IsMouseButtonUp" int))
(define get-mouse-x (foreign-lambda int "GetMouseX"))
(define get-mouse-y (foreign-lambda int "GetMouseY"))
(define (get-mouse-position)
  (make-vec2 (get-mouse-x) (get-mouse-y)))

;; Misc. functions
(define trace-log 
  (foreign-lambda* void ((int logLevel) (c-string text)) "TraceLog(logLevel, text);"))

;; File system functions
(define change-directory (foreign-lambda bool "ChangeDirectory" c-string))

;; Texture loading functions
(define load-texture-helper
  (foreign-lambda* void ((Texture* out) (c-string filename)) "*out = LoadTexture(filename);"))
(define (load-texture filename)
  (let ([texture (make-texture)])
    (load-texture-helper texture filename)
    texture))

;; Basic shapes drawing functions
(define draw-pixel 
  (foreign-lambda* void ((int posX) (int posY) (Color color)) "DrawPixel(posX, posY, ToColor(color));"))
(define draw-pixel-v
  (foreign-lambda* void ((Vector2 position) (Color color)) "DrawPixelV(ToVector2(position), ToColor(color));"))

(define draw-line 
  (foreign-lambda* void ((int startPosX) (int startPosY) (int endPosX) (int endPosY) (Color color)) 
                   "DrawLine(startPosX, startPosY, endPosX, endPosY, ToColor(color));"))
(define draw-line-v
  (foreign-lambda* void ((Vector2 startPos) (Vector2 endPos) (Color color)) 
                   "DrawLineV(ToVector2(startPos), ToVector2(endPos), ToColor(color));"))
(define draw-line-ex
  (foreign-lambda* void ((Vector2 startPos) (Vector2 endPos) (float thick) (Color color)) 
                   "DrawLineEx(ToVector2(startPos), ToVector2(endPos), thick, ToColor(color));"))

(define draw-circle
  (foreign-lambda* void ((int centerX) (int centerY) (float radius) (Color color)) 
                   "DrawCircle(centerX, centerY, radius, ToColor(color));"))
(define draw-circle-v
  (foreign-lambda* void ((Vector2 center) (float radius) (Color color)) 
                   "DrawCircleV(ToVector2(center), radius, ToColor(color));"))
(define draw-circle-lines
  (foreign-lambda* void ((int centerX) (int centerY) (float radius) (Color color)) 
                   "DrawCircleLines(centerX, centerY, radius, ToColor(color));"))
(define draw-circle-lines-v
  (foreign-lambda* void ((Vector2 center) (float radius) (Color color)) 
                   "DrawCircleLinesV(ToVector2(center), radius, ToColor(color));"))


(define draw-rectangle
  (foreign-lambda* void ((int posX) (int posY) (int width) (int height) (Color color)) 
                   "DrawRectangle(posX, posY, width, height, ToColor(color));"))
(define draw-rectangle-v
  (foreign-lambda* void ((Vector2 position) (Vector2 size) (Color color)) 
                   "DrawRectangleV(ToVector2(position), ToVector2(size), ToColor(color));"))
(define draw-rectangle-rec
  (foreign-lambda* void ((Rectangle rec) (Color color)) 
                   "DrawRectangleRec(ToRectangle(rec), ToColor(color));"))
(define draw-rectangle-pro
  (foreign-lambda* void ((Rectangle rec) (Vector2 origin) (float rotation) (Color color)) 
                   "DrawRectanglePro(ToRectangle(rec), ToVector2(origin), rotation, ToColor(color));"))
(define draw-rectangle-lines
  (foreign-lambda* void ((int posX) (int posY) (int width) (int height) (Color color)) 
                   "DrawRectangleLines(posX, posY, width, height, ToColor(color));"))
(define draw-rectangle-lines-ex
  (foreign-lambda* void ((Rectangle rec) (float lineThick) (Color color)) 
                   "DrawRectangleLinesEx(ToRectangle(rec), lineThick, ToColor(color));"))

(define draw-triangle
  (foreign-lambda* void ((Vector2 v1) (Vector2 v2) (Vector2 v3) (Color color)) 
                   "DrawTriangle(ToVector2(v1), ToVector2(v2), ToVector2(v3), ToColor(color));"))
(define draw-triangle-lines
  (foreign-lambda* void ((Vector2 v1) (Vector2 v2) (Vector2 v3) (Color color)) 
                   "DrawTriangleLines(ToVector2(v1), ToVector2(v2), ToVector2(v3), ToColor(color));"))

;; Texture drawing functions
(define draw-texture 
  (foreign-lambda* void ((Texture* texture) (int posX) (int posY) (Color tint)) 
                   "DrawTexture(*texture, posX, posY, ToColor(tint));"))
(define draw-texture-v
  (foreign-lambda* void ((Texture* texture) (Vector2 position) (Color tint)) 
                   "DrawTextureV(*texture, ToVector2(position), ToColor(tint));"))
(define draw-texture-ex
  (foreign-lambda* void ((Texture* texture) (Vector2 position) (float rotation) (float scale) (Color tint)) 
                   "DrawTextureEx(*texture, ToVector2(position), rotation, scale, ToColor(tint));"))
(define draw-texture-rec
  (foreign-lambda* void ((Texture* texture) (Rectangle source) (Vector2 position) (Color tint)) 
                   "DrawTextureRec(*texture, ToRectangle(source), ToVector2(position), ToColor(tint));"))
(define draw-texture-pro
  (foreign-lambda* void ((Texture* texture) (Rectangle source) (Rectangle dest) (Vector2 origin) (float rotation) (Color tint)) 
                   "DrawTexturePro(*texture, ToRectangle(source), ToRectangle(dest), ToVector2(origin), rotation, ToColor(tint));"))

;; Text drawing functions
(define draw-text 
  (foreign-lambda* 
    void ((c-string text) (int posX) (int posY) (int fontSize) (Color c)) 
    "DrawText(text, posX, posY, fontSize, ToColor(c));"))

(define measure-text (foreign-lambda int "MeasureText" c-string int))

) ;; end of module
