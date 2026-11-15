(module raygui *
  (import scheme.base)
  (import chicken.foreign)
  (import chicken.base)
  (import srfi-4)
  (foreign-declare "#define BUILD_LIBTYPE_SHARED")
  (foreign-declare "#define RAYGUI_IMPLEMENTATION")
  (foreign-declare "#include \"raygui.h\"")

  (include "raygui-bindings1.scm")
  (include "raygui-bindings2.scm")
  )
