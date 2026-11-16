typedef struct Font {} Font;
typedef struct Rectangle {} Rectangle;
typedef struct Color {} Color;
typedef struct Vector2 {} Vector2;
typedef struct Vector3 {} Vector3;

// Style property
// NOTE: Used when exporting style as code for convenience
typedef struct GuiStyleProp {
    unsigned short controlId;   // Control identifier
    unsigned short propertyId;  // Property identifier
    int propertyValue;          // Property value
} GuiStyleProp;

// Global gui state control functions
void GuiEnable(void);                                 // Enable gui controls (global state)
void GuiDisable(void);                                // Disable gui controls (global state)
void GuiLock(void);                                   // Lock gui controls (global state)
void GuiUnlock(void);                                 // Unlock gui controls (global state)
bool GuiIsLocked(void);                               // Check if gui is locked (global state)
void GuiSetAlpha(float alpha);                        // Set gui controls alpha (global state), alpha goes from 0.0f to 1.0f
void GuiSetState(int state);                          // Set gui state (global state)
int GuiGetState(void);                                // Get gui state (global state)

// Font set/get functions
void GuiSetFont(Font font);                           // Set gui custom font (global state)
Font GuiGetFont(void);                                // Get gui custom font (global state)

// Style set/get functions
void GuiSetStyle(int control, int property, int value); // Set one style property
int GuiGetStyle(int control, int property);           // Get one style property

// Styles loading functions
void GuiLoadStyle(const char *fileName);              // Load style file over global style variable (.rgs)
void GuiLoadStyleFromMemory(const unsigned char *fileData, int dataSize); // Load style from memory (binary only)
void GuiLoadStyleDefault(void);                       // Load style default over global style

// Tooltips management functions
void GuiEnableTooltip(void);                          // Enable gui tooltips (global state)
void GuiDisableTooltip(void);                         // Disable gui tooltips (global state)
void GuiSetTooltip(const char *tooltip);              // Set tooltip string

// Icons functionality
const char *GuiIconText(int iconId, const char *text); // Get text with icon id prepended (if supported)
void GuiSetIconScale(int scale);                      // Set default icon drawing size
unsigned int *GuiGetIcons(void);                      // Get raygui icons data pointer
char **GuiLoadIcons(const char *fileName, bool loadIconsName); // Load raygui icons file (.rgi) into internal icons data
char **GuiLoadIconsFromMemory(const unsigned char *fileData, int dataSize, bool loadIconsName); // Load raygui icons file (.rgi) from memory into internal icons data
void GuiDrawIcon(int iconId, int posX, int posY, int pixelSize, Color color); // Draw icon using pixel size at specified position

// Utility functions
int GuiGetTextWidth(const char *text);                // Get text width considering gui style and icon size (if required)

// Controls
//----------------------------------------------------------------------------------------------------------
// Container/separator controls, useful for controls organization
int GuiWindowBox(Rectangle bounds, const char *title);                                       // Window Box control, shows a window that can be closed
int GuiGroupBox(Rectangle bounds, const char *text);                                         // Group Box control with text name
int GuiLine(Rectangle bounds, const char *text);                                             // Line separator control, could contain text
int GuiPanel(Rectangle bounds, const char *text);                                            // Panel control, useful to group controls
int GuiScrollPanel(Rectangle bounds, const char *text, Rectangle content, Vector2 *scroll, Rectangle *view); // Scroll Panel control

// Basic controls set
int GuiLabel(Rectangle bounds, const char *text);                                            // Label control
int GuiButton(Rectangle bounds, const char *text);                                           // Button control, returns true when clicked
int GuiLabelButton(Rectangle bounds, const char *text);                                      // Label button control, returns true when clicked
int GuiToggle(Rectangle bounds, const char *text, bool *active);                             // Toggle Button control
int GuiToggleGroup(Rectangle bounds, const char *text, int *active);                         // Toggle Group control
int GuiToggleSlider(Rectangle bounds, const char *text, int *active);                        // Toggle Slider control
int GuiCheckBox(Rectangle bounds, const char *text, bool *checked);                          // Check Box control, returns true when active
int GuiComboBox(Rectangle bounds, const char *text, int *active);                            // Combo Box control

int GuiDropdownBox(Rectangle bounds, const char *text, int *active, bool editMode);          // Dropdown Box control
int GuiSpinner(Rectangle bounds, const char *text, int *value, int minValue, int maxValue, bool editMode); // Spinner control
int GuiValueBox(Rectangle bounds, const char *text, int *value, int minValue, int maxValue, bool editMode); // Value Box control, updates input text with numbers
int GuiValueBoxFloat(Rectangle bounds, const char *text, char *textValue, float *value, bool editMode); // Value box control for float values
int GuiTextBox(Rectangle bounds, char *text, int textSize, bool editMode);                   // Text Box control, updates input text

int GuiSlider(Rectangle bounds, const char *textLeft, const char *textRight, float *value, float minValue, float maxValue); // Slider control
int GuiSliderBar(Rectangle bounds, const char *textLeft, const char *textRight, float *value, float minValue, float maxValue); // Slider Bar control
int GuiProgressBar(Rectangle bounds, const char *textLeft, const char *textRight, float *value, float minValue, float maxValue); // Progress Bar control
int GuiStatusBar(Rectangle bounds, const char *text);                                        // Status Bar control, shows info text
int GuiDummyRec(Rectangle bounds, const char *text);                                         // Dummy control for placeholders
int GuiGrid(Rectangle bounds, const char *text, float spacing, int subdivs, Vector2 *mouseCell); // Grid control

// Advance controls set
int GuiListView(Rectangle bounds, const char *text, int *scrollIndex, int *active);          // List View control
int GuiListViewEx(Rectangle bounds, char **text, int count, int *scrollIndex, int *active, int *focus); // List View control, using text entries list and returning focus entry
int GuiTabBar(Rectangle bounds, const char *text, int *hscroll, int *active);                // Tab Bar control
int GuiTabBarEx(Rectangle bounds, char **text, int count, int *hscroll, int *active, int *focus); // Tab Bar control, using text entries list and returning focus entry
int GuiMessageBox(Rectangle bounds, const char *title, const char *message, const char *btnText, int *btnActive); // Message Box control, displays a message
int GuiTextInputBox(Rectangle bounds, const char *title, const char *message, char *text, int textSize, const char *btnText, int *btnActive, bool *secretViewActive); // Text Input Box control, ask for text, supports secret
int GuiColorPicker(Rectangle bounds, const char *text, Color *color);                        // Color Picker control, includes Color bar controls
int GuiColorPanel(Rectangle bounds, const char *text, Color *color);                         // Color Panel control
int GuiColorBarAlpha(Rectangle bounds, const char *text, float *alpha);                      // Color Bar Alpha control
int GuiColorBarHue(Rectangle bounds, const char *text, float *value);                        // Color Bar Hue control
int GuiColorPickerHSV(Rectangle bounds, const char *text, Vector3 *colorHsv);                // Color Picker control, using Hue-Saturation-Value color data, includes Color bar controls
int GuiColorPanelHSV(Rectangle bounds, const char *text, Vector3 *colorHsv);                 // Color Panel control, using Hue-Saturation-Value color data
