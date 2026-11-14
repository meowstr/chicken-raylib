(module raymath *
  (import scheme.base)
  (import chicken.foreign)
  (import chicken.base)
  (import srfi-4)
  (foreign-declare "#define RAYMATH_IMPLEMENTATION")
  (foreign-declare "#define BUILD_LIBTYPE_SHARED")
  (foreign-declare "#include <raymath.h>")

  (include "raymath-bindings.scm")
  )
