(module rcamera *
  (import scheme)
  (import chicken.foreign)
  (import chicken.base)
  (import srfi-4)
  (foreign-declare "#define BUILD_LIBTYPE_SHARED")
  (foreign-declare "#include <raylib.h>")
  (foreign-declare "#include <rcamera.h>")

  (include "rcamera-bindings.scm")
  )
