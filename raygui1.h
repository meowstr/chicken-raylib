// Gui control result
typedef enum {
    RESULT_NONE        = 0,
    RESULT_PRESSED     = 1,
    RESULT_CHANGED     = 2,

    RESULT_TAB_CLOSE   = 4     // GuiTabBar(), tab close request
} GuiResult;

// Gui control state
typedef enum {
    STATE_NORMAL = 0,
    STATE_FOCUSED,
    STATE_PRESSED,
    STATE_DISABLED
} GuiState;

// Gui control text alignment
typedef enum {
    TEXT_ALIGN_LEFT = 0,
    TEXT_ALIGN_CENTER,
    TEXT_ALIGN_RIGHT
} GuiTextAlignment;

// Gui control text alignment vertical
// NOTE: Text vertical position inside the text bounds
typedef enum {
    TEXT_ALIGN_TOP = 0,
    TEXT_ALIGN_MIDDLE,
    TEXT_ALIGN_BOTTOM
} GuiTextAlignmentVertical;

// Gui control text wrap mode
// NOTE: Useful for multiline text
typedef enum {
    TEXT_WRAP_NONE = 0,
    TEXT_WRAP_CHAR,
    TEXT_WRAP_WORD
} GuiTextWrapMode;

// Gui controls
// NOTE: Up to 16 controls supported or 32 controls (v500)
typedef enum {
    // Default -> populates to all controls when set
    DEFAULT         = 0,

    // Basic controls
    LABEL           = 1,        // Used also for: LABELBUTTON
    BUTTON          = 2,
    TOGGLE          = 3,        // Used also for: TOGGLEGROUP
    SLIDER          = 4,        // Used also for: SLIDERBAR, TOGGLESLIDER
    PROGRESSBAR     = 5,
    CHECKBOX        = 6,
    COMBOBOX        = 7,
    DROPDOWNBOX     = 8,
    TEXTBOX         = 9,        // Used also for: TEXTBOXMULTI
    VALUEBOX        = 10,
    TABBAR          = 11,
    LISTVIEW        = 12,
    COLORPICKER     = 13,
    SCROLLBAR       = 14,
    STATUSBAR       = 15
    // NOTE: More controls can be added if required
} GuiControl;

// Controls BASE properties for every control (RAYGUI_MAX_PROPS_BASE = 16)
// NOTE: Properties required for all controls, DEFAULT control sets
// default values for them but they can be overriden per control
typedef enum {
    BORDER_COLOR_NORMAL   = 0,      // Control border color in STATE_NORMAL
    BASE_COLOR_NORMAL     = 1,      // Control base color in STATE_NORMAL
    TEXT_COLOR_NORMAL     = 2,      // Control text color in STATE_NORMAL
    BORDER_COLOR_FOCUSED  = 3,      // Control border color in STATE_FOCUSED
    BASE_COLOR_FOCUSED    = 4,      // Control base color in STATE_FOCUSED
    TEXT_COLOR_FOCUSED    = 5,      // Control text color in STATE_FOCUSED
    BORDER_COLOR_PRESSED  = 6,      // Control border color in STATE_PRESSED
    BASE_COLOR_PRESSED    = 7,      // Control base color in STATE_PRESSED
    TEXT_COLOR_PRESSED    = 8,      // Control text color in STATE_PRESSED
    BORDER_COLOR_DISABLED = 9,      // Control border color in STATE_DISABLED
    BASE_COLOR_DISABLED   = 10,     // Control base color in STATE_DISABLED
    TEXT_COLOR_DISABLED   = 11,     // Control text color in STATE_DISABLED
    BORDER_WIDTH          = 12,     // Control border size, 0 for no border
    TEXT_PADDING          = 13,     // Control text padding, not considering border
    TEXT_ALIGNMENT        = 14,     // Control text horizontal alignment inside control text bound (after border and padding): 0-Left, 1-Center, 2-Right
    BASEPROP16            = 15      // Not used yet...
} GuiControlProperty;


// WARNING: Some properties have been chosen to be global with DEFAULT - EXTENDED properties:
//    - TEXT_SIZE,                  // Control text size (glyphs max height)
//    - TEXT_SPACING,               // Control text spacing between glyphs
//    - TEXT_LINE_SPACING,          // Control text spacing between lines
//    - TEXT_WRAP_MODE              // Control text wrap-mode inside text bounds
//
// While other properties can be setup per globally (DEFAULT) or per control:
//    - TEXT_PADDING                // Control text padding, not considering border
//    - TEXT_ALIGNMENT              // Control text horizontal alignment inside control text bound


// Controls EXTENDED properties (RAYGUI_MAX_PROPS_EXTENDED = 8)
// WARNING: Only 8 slots vailable for those properties per control, including DEFAULT
//----------------------------------------------------------------------------------
// DEFAULT control, extended properties
// NOTE: Those properties are global for all controls, they can not be setup per control
typedef enum {
    TEXT_SIZE             = 16,     // Text size (glyphs max height)
    TEXT_SPACING          = 17,     // Text spacing between glyphs
    LINE_COLOR            = 18,     // Line control color
    BACKGROUND_COLOR      = 19,     // Background color
    TEXT_LINE_SPACING     = 20,     // Text spacing between lines
    TEXT_ALIGNMENT_VERTICAL = 21,   // Text vertical alignment inside text bounds (after border and padding): 0-Top, 1-Middle, 2-Bottom
    TEXT_WRAP_MODE        = 22,     // Text wrap-mode inside text bounds
    EXTPROP08             = 23      // Not used yet...
} GuiDefaultProperty;

// Other possible text extended properties:
// TEXT_DECORATION               // Text decoration: 0-None, 1-Underline, 2-Line-through, 3-Overline
// TEXT_DECORATION_THICK         // Text decoration line thickness
// TEXT_FONT_WEIGHT              // Text font weight: 0-Normal, 1-Bold, 2-Italic -> Requires specific font change

// Label
//typedef enum { } GuiLabelProperty;

// Button
//typedef enum { } GuiButtonProperty;

// Toggle/ToggleGroup
typedef enum {
    GROUP_PADDING = 16,         // ToggleGroup separation between toggles
    GROUP_WIDTH_FULL            // ToggleGroup bounds width considers all items: 0-Width per item, 1-Full width
} GuiToggleProperty;

// Slider/SliderBar
typedef enum {
    SLIDER_WIDTH = 16,          // Slider size of internal bar
    SLIDER_PADDING              // Slider/SliderBar internal bar padding
} GuiSliderProperty;

// ProgressBar
typedef enum {
    PROGRESS_PADDING = 16,      // ProgressBar internal padding
    PROGRESS_SIDE              // ProgressBar increment side: 0-Left->Right, 1-Right->Left
} GuiProgressBarProperty;

// ScrollBar
typedef enum {
    ARROWS_SIZE = 16,           // ScrollBar arrows size
    ARROWS_VISIBLE,             // ScrollBar arrows visible
    SCROLL_SLIDER_PADDING,      // ScrollBar slider internal padding
    SCROLL_SLIDER_SIZE,         // ScrollBar slider size
    SCROLL_PADDING,             // ScrollBar scroll padding from arrows
    SCROLL_SPEED               // ScrollBar scrolling speed
} GuiScrollBarProperty;

// CheckBox
typedef enum {
    CHECK_PADDING = 16          // CheckBox internal check padding
} GuiCheckBoxProperty;

// ComboBox
typedef enum {
    COMBO_BUTTON_WIDTH = 16,    // ComboBox right button width
    COMBO_BUTTON_SPACING        // ComboBox button separation
} GuiComboBoxProperty;

// DropdownBox
typedef enum {
    ARROW_PADDING = 16,         // DropdownBox arrow separation from border and items
    DROPDOWN_ITEMS_SPACING,     // DropdownBox items separation
    DROPDOWN_ARROW_HIDDEN,      // DropdownBox arrow hidden
    DROPDOWN_ROLL_UP            // DropdownBox roll up flag: 0-Roll down, 1-Roll up
} GuiDropdownBoxProperty;

// TextBox/TextBoxMulti/ValueBox/Spinner
typedef enum {
    TEXT_READONLY = 16         // TextBox in read-only mode: 0-Text editable, 1-Text read-only
} GuiTextBoxProperty;

// ValueBox/Spinner
typedef enum {
    SPINNER_BUTTON_WIDTH = 16,  // Spinner left/right buttons width
    SPINNER_BUTTON_SPACING     // Spinner buttons separation
} GuiValueBoxProperty;

// TabBar
typedef enum {
    TAB_ITEMS_WIDTH = 16,       // TabBar tab items width
    TAB_CLOSE_BUTTON,           // TabBar tab close button: 0-Not shown, 1-Shown
    TAB_LINE_SIDE              // TabBar tabs side: 0-Bottom, 1-Top
} GuiTabBarProperty;

// ListView
#define SCROLLBAR_LEFT_SIDE     0
#define SCROLLBAR_RIGHT_SIDE    1

typedef enum {
    LIST_ITEMS_HEIGHT = 16,     // ListView items height
    LIST_ITEMS_SPACING,         // ListView items separation
    SCROLLBAR_WIDTH,            // ListView scrollbar size (usually width)
    SCROLLBAR_SIDE,             // ListView scrollbar side: 0-Left side, 1-Right Side
    LIST_ITEMS_BORDER_NORMAL,   // ListView items border enabled in normal state
    LIST_ITEMS_BORDER_WIDTH     // ListView items border width
} GuiListViewProperty;

// ColorPicker
typedef enum {
    COLOR_SELECTOR_SIZE = 16,   // ColorPicker selector square size
    HUEBAR_WIDTH,               // ColorPicker right hue bar width
    HUEBAR_PADDING,             // ColorPicker right hue bar separation from panel
    HUEBAR_SELECTOR_HEIGHT,     // ColorPicker right hue bar selector height
    HUEBAR_SELECTOR_OVERFLOW    // ColorPicker right hue bar selector overflow
} GuiColorPickerProperty;

typedef enum {
    ICON_NONE                     = 0,
    ICON_FOLDER_FILE_OPEN         = 1,
    ICON_FILE_SAVE_CLASSIC        = 2,
    ICON_FOLDER_OPEN              = 3,
    ICON_FOLDER_SAVE              = 4,
    ICON_FILE_OPEN                = 5,
    ICON_FILE_SAVE                = 6,
    ICON_FILE_EXPORT              = 7,
    ICON_FILE_ADD                 = 8,
    ICON_FILE_DELETE              = 9,
    ICON_FILETYPE_TEXT            = 10,
    ICON_FILETYPE_AUDIO           = 11,
    ICON_FILETYPE_IMAGE           = 12,
    ICON_FILETYPE_PLAY            = 13,
    ICON_FILETYPE_VIDEO           = 14,
    ICON_FILETYPE_INFO            = 15,
    ICON_FILE_COPY                = 16,
    ICON_FILE_CUT                 = 17,
    ICON_FILE_PASTE               = 18,
    ICON_CURSOR_HAND              = 19,
    ICON_CURSOR_POINTER           = 20,
    ICON_CURSOR_CLASSIC           = 21,
    ICON_PENCIL                   = 22,
    ICON_PENCIL_BIG               = 23,
    ICON_BRUSH_CLASSIC            = 24,
    ICON_BRUSH_PAINTER            = 25,
    ICON_WATER_DROP               = 26,
    ICON_COLOR_PICKER             = 27,
    ICON_RUBBER                   = 28,
    ICON_COLOR_BUCKET             = 29,
    ICON_TEXT_T                   = 30,
    ICON_TEXT_A                   = 31,
    ICON_SCALE                    = 32,
    ICON_RESIZE                   = 33,
    ICON_FILTER_POINT             = 34,
    ICON_FILTER_BILINEAR          = 35,
    ICON_CROP                     = 36,
    ICON_CROP_ALPHA               = 37,
    ICON_SQUARE_TOGGLE            = 38,
    ICON_SYMMETRY                 = 39,
    ICON_SYMMETRY_HORIZONTAL      = 40,
    ICON_SYMMETRY_VERTICAL        = 41,
    ICON_LENS                     = 42,
    ICON_LENS_BIG                 = 43,
    ICON_EYE_ON                   = 44,
    ICON_EYE_OFF                  = 45,
    ICON_FILTER_TOP               = 46,
    ICON_FILTER                   = 47,
    ICON_TARGET_POINT             = 48,
    ICON_TARGET_SMALL             = 49,
    ICON_TARGET_BIG               = 50,
    ICON_TARGET_MOVE              = 51,
    ICON_CURSOR_MOVE              = 52,
    ICON_CURSOR_SCALE             = 53,
    ICON_CURSOR_SCALE_RIGHT       = 54,
    ICON_CURSOR_SCALE_LEFT        = 55,
    ICON_UNDO                     = 56,
    ICON_REDO                     = 57,
    ICON_REREDO                   = 58,
    ICON_MUTATE                   = 59,
    ICON_ROTATE                   = 60,
    ICON_REPEAT                   = 61,
    ICON_SHUFFLE                  = 62,
    ICON_EMPTYBOX                 = 63,
    ICON_TARGET                   = 64,
    ICON_TARGET_SMALL_FILL        = 65,
    ICON_TARGET_BIG_FILL          = 66,
    ICON_TARGET_MOVE_FILL         = 67,
    ICON_CURSOR_MOVE_FILL         = 68,
    ICON_CURSOR_SCALE_FILL        = 69,
    ICON_CURSOR_SCALE_RIGHT_FILL  = 70,
    ICON_CURSOR_SCALE_LEFT_FILL   = 71,
    ICON_UNDO_FILL                = 72,
    ICON_REDO_FILL                = 73,
    ICON_REREDO_FILL              = 74,
    ICON_MUTATE_FILL              = 75,
    ICON_ROTATE_FILL              = 76,
    ICON_REPEAT_FILL              = 77,
    ICON_SHUFFLE_FILL             = 78,
    ICON_EMPTYBOX_SMALL           = 79,
    ICON_BOX                      = 80,
    ICON_BOX_TOP                  = 81,
    ICON_BOX_TOP_RIGHT            = 82,
    ICON_BOX_RIGHT                = 83,
    ICON_BOX_BOTTOM_RIGHT         = 84,
    ICON_BOX_BOTTOM               = 85,
    ICON_BOX_BOTTOM_LEFT          = 86,
    ICON_BOX_LEFT                 = 87,
    ICON_BOX_TOP_LEFT             = 88,
    ICON_BOX_CENTER               = 89,
    ICON_BOX_CIRCLE_MASK          = 90,
    ICON_POT                      = 91,
    ICON_ALPHA_MULTIPLY           = 92,
    ICON_ALPHA_CLEAR              = 93,
    ICON_DITHERING                = 94,
    ICON_MIPMAPS                  = 95,
    ICON_BOX_GRID                 = 96,
    ICON_GRID                     = 97,
    ICON_BOX_CORNERS_SMALL        = 98,
    ICON_BOX_CORNERS_BIG          = 99,
    ICON_FOUR_BOXES               = 100,
    ICON_GRID_FILL                = 101,
    ICON_BOX_MULTISIZE            = 102,
    ICON_ZOOM_SMALL               = 103,
    ICON_ZOOM_MEDIUM              = 104,
    ICON_ZOOM_BIG                 = 105,
    ICON_ZOOM_ALL                 = 106,
    ICON_ZOOM_CENTER              = 107,
    ICON_BOX_DOTS_SMALL           = 108,
    ICON_BOX_DOTS_BIG             = 109,
    ICON_BOX_CONCENTRIC           = 110,
    ICON_BOX_GRID_BIG             = 111,
    ICON_OK_TICK                  = 112,
    ICON_CROSS                    = 113,
    ICON_ARROW_LEFT               = 114,
    ICON_ARROW_RIGHT              = 115,
    ICON_ARROW_DOWN               = 116,
    ICON_ARROW_UP                 = 117,
    ICON_ARROW_LEFT_FILL          = 118,
    ICON_ARROW_RIGHT_FILL         = 119,
    ICON_ARROW_DOWN_FILL          = 120,
    ICON_ARROW_UP_FILL            = 121,
    ICON_AUDIO                    = 122,
    ICON_FX                       = 123,
    ICON_WAVE                     = 124,
    ICON_WAVE_SINUS               = 125,
    ICON_WAVE_SQUARE              = 126,
    ICON_WAVE_TRIANGULAR          = 127,
    ICON_CROSS_SMALL              = 128,
    ICON_PLAYER_PREVIOUS          = 129,
    ICON_PLAYER_PLAY_BACK         = 130,
    ICON_PLAYER_PLAY              = 131,
    ICON_PLAYER_PAUSE             = 132,
    ICON_PLAYER_STOP              = 133,
    ICON_PLAYER_NEXT              = 134,
    ICON_PLAYER_RECORD            = 135,
    ICON_MAGNET                   = 136,
    ICON_LOCK_CLOSE               = 137,
    ICON_LOCK_OPEN                = 138,
    ICON_CLOCK                    = 139,
    ICON_TOOLS                    = 140,
    ICON_GEAR                     = 141,
    ICON_GEAR_BIG                 = 142,
    ICON_BIN                      = 143,
    ICON_HAND_POINTER             = 144,
    ICON_LASER                    = 145,
    ICON_COIN                     = 146,
    ICON_EXPLOSION                = 147,
    ICON_1UP                      = 148,
    ICON_PLAYER                   = 149,
    ICON_PLAYER_JUMP              = 150,
    ICON_KEY                      = 151,
    ICON_DEMON                    = 152,
    ICON_TEXT_POPUP               = 153,
    ICON_GEAR_EX                  = 154,
    ICON_CRACK                    = 155,
    ICON_CRACK_POINTS             = 156,
    ICON_STAR                     = 157,
    ICON_DOOR                     = 158,
    ICON_EXIT                     = 159,
    ICON_MODE_2D                  = 160,
    ICON_MODE_3D                  = 161,
    ICON_CUBE                     = 162,
    ICON_CUBE_FACE_TOP            = 163,
    ICON_CUBE_FACE_LEFT           = 164,
    ICON_CUBE_FACE_FRONT          = 165,
    ICON_CUBE_FACE_BOTTOM         = 166,
    ICON_CUBE_FACE_RIGHT          = 167,
    ICON_CUBE_FACE_BACK           = 168,
    ICON_CAMERA                   = 169,
    ICON_SPECIAL                  = 170,
    ICON_LINK_NET                 = 171,
    ICON_LINK_BOXES               = 172,
    ICON_LINK_MULTI               = 173,
    ICON_LINK                     = 174,
    ICON_LINK_BROKE               = 175,
    ICON_TEXT_NOTES               = 176,
    ICON_NOTEBOOK                 = 177,
    ICON_SUITCASE                 = 178,
    ICON_SUITCASE_ZIP             = 179,
    ICON_MAILBOX                  = 180,
    ICON_MONITOR                  = 181,
    ICON_PRINTER                  = 182,
    ICON_PHOTO_CAMERA             = 183,
    ICON_PHOTO_CAMERA_FLASH       = 184,
    ICON_HOUSE                    = 185,
    ICON_HEART                    = 186,
    ICON_CORNER                   = 187,
    ICON_VERTICAL_BARS            = 188,
    ICON_VERTICAL_BARS_FILL       = 189,
    ICON_LIFE_BARS                = 190,
    ICON_INFO                     = 191,
    ICON_CROSSLINE                = 192,
    ICON_HELP                     = 193,
    ICON_FILETYPE_ALPHA           = 194,
    ICON_FILETYPE_HOME            = 195,
    ICON_LAYERS_VISIBLE           = 196,
    ICON_LAYERS                   = 197,
    ICON_WINDOW                   = 198,
    ICON_HIDPI                    = 199,
    ICON_FILETYPE_BINARY          = 200,
    ICON_HEX                      = 201,
    ICON_SHIELD                   = 202,
    ICON_FILE_NEW                 = 203,
    ICON_FOLDER_ADD               = 204,
    ICON_ALARM                    = 205,
    ICON_CPU                      = 206,
    ICON_ROM                      = 207,
    ICON_STEP_OVER                = 208,
    ICON_STEP_INTO                = 209,
    ICON_STEP_OUT                 = 210,
    ICON_RESTART                  = 211,
    ICON_BREAKPOINT_ON            = 212,
    ICON_BREAKPOINT_OFF           = 213,
    ICON_BURGER_MENU              = 214,
    ICON_CASE_SENSITIVE           = 215,
    ICON_REG_EXP                  = 216,
    ICON_FOLDER                   = 217,
    ICON_FILE                     = 218,
    ICON_SAND_TIMER               = 219,
    ICON_WARNING                  = 220,
    ICON_HELP_BOX                 = 221,
    ICON_INFO_BOX                 = 222,
    ICON_PRIORITY                 = 223,
    ICON_LAYERS_ISO               = 224,
    ICON_LAYERS2                  = 225,
    ICON_MLAYERS                  = 226,
    ICON_MAPS                     = 227,
    ICON_HOT                      = 228,
    ICON_LABEL                    = 229,
    ICON_NAME_ID                  = 230,
    ICON_SLICING                  = 231,
    ICON_MANUAL_CONTROL           = 232,
    ICON_COLLISION                = 233,
    ICON_CIRCLE_ADD               = 234,
    ICON_CIRCLE_ADD_FILL          = 235,
    ICON_CIRCLE_WARNING           = 236,
    ICON_CIRCLE_WARNING_FILL      = 237,
    ICON_BOX_MORE                 = 238,
    ICON_BOX_MORE_FILL            = 239,
    ICON_BOX_MINUS                = 240,
    ICON_BOX_MINUS_FILL           = 241,
    ICON_UNION                    = 242,
    ICON_INTERSECTION             = 243,
    ICON_DIFFERENCE               = 244,
    ICON_SPHERE                   = 245,
    ICON_CYLINDER                 = 246,
    ICON_CONE                     = 247,
    ICON_ELLIPSOID                = 248,
    ICON_CAPSULE                  = 249,
    ICON_FILETYPE_FONT            = 250,
    ICON_FILETYPE_3D              = 251,
    ICON_FILETYPE_CODE_XML        = 252,
    ICON_FILETYPE_CODE_C          = 253,
    ICON_FILETYPE_CODE_PYTHON     = 254,
    ICON_FILETYPE_CODE_JS         = 255,
    ICON_FILETYPE_ICON            = 256
} GuiIconName;
