(module raymath *
  (import scheme)
  (import chicken.foreign)
  (import chicken.base)
  (import srfi-4)
  (foreign-declare "#define BUILD_LIBTYPE_SHARED")
  (foreign-declare "#include <raymath.h>")

  (include "raymath-bindings.scm")
  )
