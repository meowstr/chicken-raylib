(module rlgl *
  (import scheme.base)
  (import chicken.foreign)
  (import chicken.base)
  (import srfi-4)
  (foreign-declare "#define BUILD_LIBTYPE_SHARED")
  (foreign-declare "#include <rlgl.h>")

  (define rl-vertex-buffer-vbo-id
    (foreign-lambda* (c-pointer unsigned-int)
      (((c-pointer (struct "rlVertexBuffer")) s))
      "return(s->vboId);"))

  (include "rlgl-bindings1.scm")
  (include "rlgl-bindings2.scm")
  )
