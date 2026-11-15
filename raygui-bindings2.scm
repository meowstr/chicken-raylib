(define gui-style-prop-control-id
  (getter-with-setter
    (foreign-lambda*
      unsigned-short
      (((c-pointer (struct "GuiStyleProp")) s))
      "return(s->controlId);")
    (foreign-lambda*
      void
      (((c-pointer (struct "GuiStyleProp")) s) (unsigned-short x))
      "s->controlId = x;")))
(define gui-style-prop-property-id
  (getter-with-setter
    (foreign-lambda*
      unsigned-short
      (((c-pointer (struct "GuiStyleProp")) s))
      "return(s->propertyId);")
    (foreign-lambda*
      void
      (((c-pointer (struct "GuiStyleProp")) s) (unsigned-short x))
      "s->propertyId = x;")))
(define gui-style-prop-property-value
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "GuiStyleProp")) s))
      "return(s->propertyValue);")
    (foreign-lambda*
      void
      (((c-pointer (struct "GuiStyleProp")) s) (integer x))
      "s->propertyValue = x;")))
(define make-gui-style-prop
  (foreign-lambda*
    (c-pointer (struct "GuiStyleProp"))
    ((unsigned-short controlId)
     (unsigned-short propertyId)
     (integer propertyValue))
    "struct GuiStyleProp *tmp_ =  (struct GuiStyleProp *)C_malloc(sizeof(struct GuiStyleProp));\ntmp_->controlId = controlId;\ntmp_->propertyId = propertyId;\ntmp_->propertyValue = propertyValue;\nreturn(tmp_);;\n"))
(begin (define gui-enable (foreign-lambda* void () "GuiEnable();")))
(begin (define gui-disable (foreign-lambda* void () "GuiDisable();")))
(begin (define gui-lock (foreign-lambda* void () "GuiLock();")))
(begin (define gui-unlock (foreign-lambda* void () "GuiUnlock();")))
(begin
  (define gui-is-locked (foreign-lambda* bool () "return(GuiIsLocked());")))
(begin
  (define gui-set-alpha
    (foreign-lambda* void ((float a0)) "GuiSetAlpha(a0);")))
(begin
  (define gui-set-state
    (foreign-lambda* void ((integer a0)) "GuiSetState(a0);")))
(begin
  (define gui-get-state (foreign-lambda* integer () "return(GuiGetState());")))
(begin
  (define gui-set-font
    (foreign-lambda*
      void
      (((c-pointer (struct "Font")) a0))
      "GuiSetFont(*a0);")))
(begin
  (define gui-get-font
    (foreign-lambda*
      (c-pointer (struct "Font"))
      ()
      "struct Font * tmp = (struct Font *) C_malloc(sizeof(struct Font));\n*tmp = GuiGetFont();\nreturn(tmp);;\n")))
(begin
  (define gui-set-style
    (foreign-lambda*
      void
      ((integer a0) (integer a1) (integer a2))
      "GuiSetStyle(a0 , a1 , a2);")))
(begin
  (define gui-get-style
    (foreign-lambda*
      integer
      ((integer a0) (integer a1))
      "return(GuiGetStyle(a0 , a1));")))
(begin
  (define gui-load-style
    (foreign-lambda* void ((c-string a0)) "GuiLoadStyle(a0);")))
(begin
  (define gui-load-style-from-memory
    (foreign-lambda*
      void
      ((u8vector a0) (integer a1))
      "GuiLoadStyleFromMemory(a0 , a1);")))
(begin
  (define gui-load-style-default
    (foreign-lambda* void () "GuiLoadStyleDefault();")))
(begin
  (define gui-enable-tooltip (foreign-lambda* void () "GuiEnableTooltip();")))
(begin
  (define gui-disable-tooltip
    (foreign-lambda* void () "GuiDisableTooltip();")))
(begin
  (define gui-set-tooltip
    (foreign-lambda* void ((c-string a0)) "GuiSetTooltip(a0);")))
(begin
  (define gui-icon-text
    (foreign-lambda*
      c-string
      ((integer a0) (c-string a1))
      "return(GuiIconText(a0 , a1));")))
(begin
  (define gui-set-icon-scale
    (foreign-lambda* void ((integer a0)) "GuiSetIconScale(a0);")))
(begin
  (define gui-get-icons
    (foreign-lambda*
      (c-pointer unsigned-integer)
      ()
      "return(GuiGetIcons());")))
(begin
  (define gui-load-icons
    (foreign-lambda*
      (c-pointer (c-pointer char))
      ((c-string a0) (bool a1))
      "return(GuiLoadIcons(a0 , a1));")))
(begin
  (define gui-load-icons-from-memory
    (foreign-lambda*
      (c-pointer (c-pointer char))
      ((u8vector a0) (integer a1) (bool a2))
      "return(GuiLoadIconsFromMemory(a0 , a1 , a2));")))
(begin
  (define gui-draw-icon
    (foreign-lambda*
      void
      ((integer a0) (integer a1) (integer a2) (integer a3) (u8vector a4))
      "GuiDrawIcon(a0 , a1 , a2 , a3 , *((Color*)a4));")))
(begin
  (define gui-get-text-width
    (foreign-lambda* integer ((c-string a0)) "return(GuiGetTextWidth(a0));")))
(begin
  (define gui-window-box
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1))
      "return(GuiWindowBox(*((Rectangle*)a0) , a1));")))
(begin
  (define gui-group-box
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1))
      "return(GuiGroupBox(*((Rectangle*)a0) , a1));")))
(begin
  (define gui-line
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1))
      "return(GuiLine(*((Rectangle*)a0) , a1));")))
(begin
  (define gui-panel
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1))
      "return(GuiPanel(*((Rectangle*)a0) , a1));")))
(begin
  (define gui-scroll-panel
    (foreign-lambda*
      integer
      ((f32vector a0)
       (c-string a1)
       (f32vector a2)
       ((c-pointer (struct "Vector2")) a3)
       ((c-pointer (struct "Rectangle")) a4))
      "return(GuiScrollPanel(*((Rectangle*)a0) , a1 , *((Rectangle*)a2) , a3 , a4));")))
(begin
  (define gui-label
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1))
      "return(GuiLabel(*((Rectangle*)a0) , a1));")))
(begin
  (define gui-button
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1))
      "return(GuiButton(*((Rectangle*)a0) , a1));")))
(begin
  (define gui-label-button
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1))
      "return(GuiLabelButton(*((Rectangle*)a0) , a1));")))
(begin
  (define gui-toggle
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1) ((c-pointer bool) a2))
      "return(GuiToggle(*((Rectangle*)a0) , a1 , a2));")))
(begin
  (define gui-toggle-group
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1) (s32vector a2))
      "return(GuiToggleGroup(*((Rectangle*)a0) , a1 , a2));")))
(begin
  (define gui-toggle-slider
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1) (s32vector a2))
      "return(GuiToggleSlider(*((Rectangle*)a0) , a1 , a2));")))
(begin
  (define gui-check-box
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1) ((c-pointer bool) a2))
      "return(GuiCheckBox(*((Rectangle*)a0) , a1 , a2));")))
(begin
  (define gui-combo-box
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1) (s32vector a2))
      "return(GuiComboBox(*((Rectangle*)a0) , a1 , a2));")))
(begin
  (define gui-dropdown-box
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1) (s32vector a2) (bool a3))
      "return(GuiDropdownBox(*((Rectangle*)a0) , a1 , a2 , a3));")))
(begin
  (define gui-spinner
    (foreign-lambda*
      integer
      ((f32vector a0)
       (c-string a1)
       (s32vector a2)
       (integer a3)
       (integer a4)
       (bool a5))
      "return(GuiSpinner(*((Rectangle*)a0) , a1 , a2 , a3 , a4 , a5));")))
(begin
  (define gui-value-box
    (foreign-lambda*
      integer
      ((f32vector a0)
       (c-string a1)
       (s32vector a2)
       (integer a3)
       (integer a4)
       (bool a5))
      "return(GuiValueBox(*((Rectangle*)a0) , a1 , a2 , a3 , a4 , a5));")))
(begin
  (define gui-value-box-float
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1) (c-string a2) (f32vector a3) (bool a4))
      "return(GuiValueBoxFloat(*((Rectangle*)a0) , a1 , a2 , a3 , a4));")))
(begin
  (define gui-text-box
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1) (integer a2) (bool a3))
      "return(GuiTextBox(*((Rectangle*)a0) , a1 , a2 , a3));")))
(begin
  (define gui-slider
    (foreign-lambda*
      integer
      ((f32vector a0)
       (c-string a1)
       (c-string a2)
       (f32vector a3)
       (float a4)
       (float a5))
      "return(GuiSlider(*((Rectangle*)a0) , a1 , a2 , a3 , a4 , a5));")))
(begin
  (define gui-slider-bar
    (foreign-lambda*
      integer
      ((f32vector a0)
       (c-string a1)
       (c-string a2)
       (f32vector a3)
       (float a4)
       (float a5))
      "return(GuiSliderBar(*((Rectangle*)a0) , a1 , a2 , a3 , a4 , a5));")))
(begin
  (define gui-progress-bar
    (foreign-lambda*
      integer
      ((f32vector a0)
       (c-string a1)
       (c-string a2)
       (f32vector a3)
       (float a4)
       (float a5))
      "return(GuiProgressBar(*((Rectangle*)a0) , a1 , a2 , a3 , a4 , a5));")))
(begin
  (define gui-status-bar
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1))
      "return(GuiStatusBar(*((Rectangle*)a0) , a1));")))
(begin
  (define gui-dummy-rec
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1))
      "return(GuiDummyRec(*((Rectangle*)a0) , a1));")))
(begin
  (define gui-grid
    (foreign-lambda*
      integer
      ((f32vector a0)
       (c-string a1)
       (float a2)
       (integer a3)
       ((c-pointer (struct "Vector2")) a4))
      "return(GuiGrid(*((Rectangle*)a0) , a1 , a2 , a3 , a4));")))
(begin
  (define gui-list-view
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1) (s32vector a2) (s32vector a3))
      "return(GuiListView(*((Rectangle*)a0) , a1 , a2 , a3));")))
(begin
  (define gui-list-view-ex
    (foreign-lambda*
      integer
      ((f32vector a0)
       ((c-pointer (c-pointer char)) a1)
       (integer a2)
       (s32vector a3)
       (s32vector a4)
       (s32vector a5))
      "return(GuiListViewEx(*((Rectangle*)a0) , a1 , a2 , a3 , a4 , a5));")))
(begin
  (define gui-tab-bar
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1) (s32vector a2) (s32vector a3))
      "return(GuiTabBar(*((Rectangle*)a0) , a1 , a2 , a3));")))
(begin
  (define gui-tab-bar-ex
    (foreign-lambda*
      integer
      ((f32vector a0)
       ((c-pointer (c-pointer char)) a1)
       (integer a2)
       (s32vector a3)
       (s32vector a4)
       (s32vector a5))
      "return(GuiTabBarEx(*((Rectangle*)a0) , a1 , a2 , a3 , a4 , a5));")))
(begin
  (define gui-message-box
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1) (c-string a2) (c-string a3) (s32vector a4))
      "return(GuiMessageBox(*((Rectangle*)a0) , a1 , a2 , a3 , a4));")))
(begin
  (define gui-text-input-box
    (foreign-lambda*
      integer
      ((f32vector a0)
       (c-string a1)
       (c-string a2)
       (c-string a3)
       (integer a4)
       (c-string a5)
       (s32vector a6)
       ((c-pointer bool) a7))
      "return(GuiTextInputBox(*((Rectangle*)a0) , a1 , a2 , a3 , a4 , a5 , a6 , a7));")))
(begin
  (define gui-color-picker
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1) ((c-pointer (struct "Color")) a2))
      "return(GuiColorPicker(*((Rectangle*)a0) , a1 , a2));")))
(begin
  (define gui-color-panel
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1) ((c-pointer (struct "Color")) a2))
      "return(GuiColorPanel(*((Rectangle*)a0) , a1 , a2));")))
(begin
  (define gui-color-bar-alpha
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1) (f32vector a2))
      "return(GuiColorBarAlpha(*((Rectangle*)a0) , a1 , a2));")))
(begin
  (define gui-color-bar-hue
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1) (f32vector a2))
      "return(GuiColorBarHue(*((Rectangle*)a0) , a1 , a2));")))
(begin
  (define gui-color-picker-hsv
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1) ((c-pointer (struct "Vector3")) a2))
      "return(GuiColorPickerHSV(*((Rectangle*)a0) , a1 , a2));")))
(begin
  (define gui-color-panel-hsv
    (foreign-lambda*
      integer
      ((f32vector a0) (c-string a1) ((c-pointer (struct "Vector3")) a2))
      "return(GuiColorPanelHSV(*((Rectangle*)a0) , a1 , a2));")))
