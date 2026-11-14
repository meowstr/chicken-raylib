(define rl-vertex-buffer-element-count
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "rlVertexBuffer")) s))
      "return(s->elementCount);")
    (foreign-lambda*
      void
      (((c-pointer (struct "rlVertexBuffer")) s) (integer x))
      "s->elementCount = x;")))
(define rl-vertex-buffer-vertices
  (getter-with-setter
    (foreign-lambda*
      (c-pointer float)
      (((c-pointer (struct "rlVertexBuffer")) s))
      "return(s->vertices);")
    (foreign-lambda*
      void
      (((c-pointer (struct "rlVertexBuffer")) s) ((c-pointer float) x))
      "s->vertices = x;")))
(define rl-vertex-buffer-texcoords
  (getter-with-setter
    (foreign-lambda*
      (c-pointer float)
      (((c-pointer (struct "rlVertexBuffer")) s))
      "return(s->texcoords);")
    (foreign-lambda*
      void
      (((c-pointer (struct "rlVertexBuffer")) s) ((c-pointer float) x))
      "s->texcoords = x;")))
(define rl-vertex-buffer-normals
  (getter-with-setter
    (foreign-lambda*
      (c-pointer float)
      (((c-pointer (struct "rlVertexBuffer")) s))
      "return(s->normals);")
    (foreign-lambda*
      void
      (((c-pointer (struct "rlVertexBuffer")) s) ((c-pointer float) x))
      "s->normals = x;")))
(define rl-vertex-buffer-colors
  (getter-with-setter
    (foreign-lambda*
      (c-pointer unsigned-char)
      (((c-pointer (struct "rlVertexBuffer")) s))
      "return(s->colors);")
    (foreign-lambda*
      void
      (((c-pointer (struct "rlVertexBuffer")) s) ((c-pointer unsigned-char) x))
      "s->colors = x;")))
(define rl-vertex-buffer-indices
  (getter-with-setter
    (foreign-lambda*
      (c-pointer unsigned-integer)
      (((c-pointer (struct "rlVertexBuffer")) s))
      "return(s->indices);")
    (foreign-lambda*
      void
      (((c-pointer (struct "rlVertexBuffer")) s)
       ((c-pointer unsigned-integer) x))
      "s->indices = x;")))
(define rl-vertex-buffer-vao-id
  (getter-with-setter
    (foreign-lambda*
      unsigned-integer
      (((c-pointer (struct "rlVertexBuffer")) s))
      "return(s->vaoId);")
    (foreign-lambda*
      void
      (((c-pointer (struct "rlVertexBuffer")) s) (unsigned-integer x))
      "s->vaoId = x;")))
(define make-rl-vertex-buffer
  (foreign-lambda*
    (c-pointer (struct "rlVertexBuffer"))
    ((integer elementCount)
     ((c-pointer float) vertices)
     ((c-pointer float) texcoords)
     ((c-pointer float) normals)
     ((c-pointer unsigned-char) colors)
     ((c-pointer unsigned-integer) indices)
     (unsigned-integer vaoId))
    "struct rlVertexBuffer *tmp_ =  (struct rlVertexBuffer *)C_malloc(sizeof(struct rlVertexBuffer));\ntmp_->elementCount = elementCount;\ntmp_->vertices = vertices;\ntmp_->texcoords = texcoords;\ntmp_->normals = normals;\ntmp_->colors = colors;\ntmp_->indices = indices;\ntmp_->vaoId = vaoId;\nreturn(tmp_);;\n"))
(define rl-draw-call-mode
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "rlDrawCall")) s))
      "return(s->mode);")
    (foreign-lambda*
      void
      (((c-pointer (struct "rlDrawCall")) s) (integer x))
      "s->mode = x;")))
(define rl-draw-call-vertex-count
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "rlDrawCall")) s))
      "return(s->vertexCount);")
    (foreign-lambda*
      void
      (((c-pointer (struct "rlDrawCall")) s) (integer x))
      "s->vertexCount = x;")))
(define rl-draw-call-vertex-alignment
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "rlDrawCall")) s))
      "return(s->vertexAlignment);")
    (foreign-lambda*
      void
      (((c-pointer (struct "rlDrawCall")) s) (integer x))
      "s->vertexAlignment = x;")))
(define rl-draw-call-texture-id
  (getter-with-setter
    (foreign-lambda*
      unsigned-integer
      (((c-pointer (struct "rlDrawCall")) s))
      "return(s->textureId);")
    (foreign-lambda*
      void
      (((c-pointer (struct "rlDrawCall")) s) (unsigned-integer x))
      "s->textureId = x;")))
(define make-rl-draw-call
  (foreign-lambda*
    (c-pointer (struct "rlDrawCall"))
    ((integer mode)
     (integer vertexCount)
     (integer vertexAlignment)
     (unsigned-integer textureId))
    "struct rlDrawCall *tmp_ =  (struct rlDrawCall *)C_malloc(sizeof(struct rlDrawCall));\ntmp_->mode = mode;\ntmp_->vertexCount = vertexCount;\ntmp_->vertexAlignment = vertexAlignment;\ntmp_->textureId = textureId;\nreturn(tmp_);;\n"))
(define rl-render-batch-buffer-count
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "rlRenderBatch")) s))
      "return(s->bufferCount);")
    (foreign-lambda*
      void
      (((c-pointer (struct "rlRenderBatch")) s) (integer x))
      "s->bufferCount = x;")))
(define rl-render-batch-current-buffer
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "rlRenderBatch")) s))
      "return(s->currentBuffer);")
    (foreign-lambda*
      void
      (((c-pointer (struct "rlRenderBatch")) s) (integer x))
      "s->currentBuffer = x;")))
(define rl-render-batch-vertex-buffer
  (getter-with-setter
    (foreign-lambda*
      (c-pointer (struct "rlVertexBuffer"))
      (((c-pointer (struct "rlRenderBatch")) s))
      "return(s->vertexBuffer);")
    (foreign-lambda*
      void
      (((c-pointer (struct "rlRenderBatch")) s)
       ((c-pointer (struct "rlVertexBuffer")) x))
      "s->vertexBuffer = x;")))
(define rl-render-batch-draws
  (getter-with-setter
    (foreign-lambda*
      (c-pointer (struct "rlDrawCall"))
      (((c-pointer (struct "rlRenderBatch")) s))
      "return(s->draws);")
    (foreign-lambda*
      void
      (((c-pointer (struct "rlRenderBatch")) s)
       ((c-pointer (struct "rlDrawCall")) x))
      "s->draws = x;")))
(define rl-render-batch-draw-counter
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "rlRenderBatch")) s))
      "return(s->drawCounter);")
    (foreign-lambda*
      void
      (((c-pointer (struct "rlRenderBatch")) s) (integer x))
      "s->drawCounter = x;")))
(define rl-render-batch-current-depth
  (getter-with-setter
    (foreign-lambda*
      float
      (((c-pointer (struct "rlRenderBatch")) s))
      "return(s->currentDepth);")
    (foreign-lambda*
      void
      (((c-pointer (struct "rlRenderBatch")) s) (float x))
      "s->currentDepth = x;")))
(define make-rl-render-batch
  (foreign-lambda*
    (c-pointer (struct "rlRenderBatch"))
    ((integer bufferCount)
     (integer currentBuffer)
     ((c-pointer (struct "rlVertexBuffer")) vertexBuffer)
     ((c-pointer (struct "rlDrawCall")) draws)
     (integer drawCounter)
     (float currentDepth))
    "struct rlRenderBatch *tmp_ =  (struct rlRenderBatch *)C_malloc(sizeof(struct rlRenderBatch));\ntmp_->bufferCount = bufferCount;\ntmp_->currentBuffer = currentBuffer;\ntmp_->vertexBuffer = vertexBuffer;\ntmp_->draws = draws;\ntmp_->drawCounter = drawCounter;\ntmp_->currentDepth = currentDepth;\nreturn(tmp_);;\n"))
(begin
  (define rl-matrix-mode
    (foreign-lambda* void ((integer a0)) "rlMatrixMode(a0);")))
(begin (define rl-push-matrix (foreign-lambda* void () "rlPushMatrix();")))
(begin (define rl-pop-matrix (foreign-lambda* void () "rlPopMatrix();")))
(begin (define rl-load-identity (foreign-lambda* void () "rlLoadIdentity();")))
(begin
  (define rl-translatef
    (foreign-lambda*
      void
      ((float a0) (float a1) (float a2))
      "rlTranslatef(a0 , a1 , a2);")))
(begin
  (define rl-rotatef
    (foreign-lambda*
      void
      ((float a0) (float a1) (float a2) (float a3))
      "rlRotatef(a0 , a1 , a2 , a3);")))
(begin
  (define rl-scalef
    (foreign-lambda*
      void
      ((float a0) (float a1) (float a2))
      "rlScalef(a0 , a1 , a2);")))
(begin
  (define rl-mult-matrixf
    (foreign-lambda* void ((f32vector a0)) "rlMultMatrixf(a0);")))
(begin
  (define rl-frustum
    (foreign-lambda*
      void
      ((double a0) (double a1) (double a2) (double a3) (double a4) (double a5))
      "rlFrustum(a0 , a1 , a2 , a3 , a4 , a5);")))
(begin
  (define rl-ortho
    (foreign-lambda*
      void
      ((double a0) (double a1) (double a2) (double a3) (double a4) (double a5))
      "rlOrtho(a0 , a1 , a2 , a3 , a4 , a5);")))
(begin
  (define rl-viewport
    (foreign-lambda*
      void
      ((integer a0) (integer a1) (integer a2) (integer a3))
      "rlViewport(a0 , a1 , a2 , a3);")))
(begin
  (define rl-set-clip-planes
    (foreign-lambda*
      void
      ((double a0) (double a1))
      "rlSetClipPlanes(a0 , a1);")))
(begin
  (define rl-get-cull-distance-near
    (foreign-lambda* double () "return(rlGetCullDistanceNear());")))
(begin
  (define rl-get-cull-distance-far
    (foreign-lambda* double () "return(rlGetCullDistanceFar());")))
(begin (define rl-begin (foreign-lambda* void ((integer a0)) "rlBegin(a0);")))
(begin (define rl-end (foreign-lambda* void () "rlEnd();")))
(begin
  (define rl-vertex2i
    (foreign-lambda* void ((integer a0) (integer a1)) "rlVertex2i(a0 , a1);")))
(begin
  (define rl-vertex2f
    (foreign-lambda* void ((float a0) (float a1)) "rlVertex2f(a0 , a1);")))
(begin
  (define rl-vertex3f
    (foreign-lambda*
      void
      ((float a0) (float a1) (float a2))
      "rlVertex3f(a0 , a1 , a2);")))
(begin
  (define rl-tex-coord2f
    (foreign-lambda* void ((float a0) (float a1)) "rlTexCoord2f(a0 , a1);")))
(begin
  (define rl-normal3f
    (foreign-lambda*
      void
      ((float a0) (float a1) (float a2))
      "rlNormal3f(a0 , a1 , a2);")))
(begin
  (define rl-color4ub
    (foreign-lambda*
      void
      ((unsigned-char a0)
       (unsigned-char a1)
       (unsigned-char a2)
       (unsigned-char a3))
      "rlColor4ub(a0 , a1 , a2 , a3);")))
(begin
  (define rl-color3f
    (foreign-lambda*
      void
      ((float a0) (float a1) (float a2))
      "rlColor3f(a0 , a1 , a2);")))
(begin
  (define rl-color4f
    (foreign-lambda*
      void
      ((float a0) (float a1) (float a2) (float a3))
      "rlColor4f(a0 , a1 , a2 , a3);")))
(begin
  (define rl-enable-vertex-array
    (foreign-lambda*
      bool
      ((unsigned-integer a0))
      "return(rlEnableVertexArray(a0));")))
(begin
  (define rl-disable-vertex-array
    (foreign-lambda* void () "rlDisableVertexArray();")))
(begin
  (define rl-enable-vertex-buffer
    (foreign-lambda*
      void
      ((unsigned-integer a0))
      "rlEnableVertexBuffer(a0);")))
(begin
  (define rl-disable-vertex-buffer
    (foreign-lambda* void () "rlDisableVertexBuffer();")))
(begin
  (define rl-enable-vertex-buffer-element
    (foreign-lambda*
      void
      ((unsigned-integer a0))
      "rlEnableVertexBufferElement(a0);")))
(begin
  (define rl-disable-vertex-buffer-element
    (foreign-lambda* void () "rlDisableVertexBufferElement();")))
(begin
  (define rl-enable-vertex-attribute
    (foreign-lambda*
      void
      ((unsigned-integer a0))
      "rlEnableVertexAttribute(a0);")))
(begin
  (define rl-disable-vertex-attribute
    (foreign-lambda*
      void
      ((unsigned-integer a0))
      "rlDisableVertexAttribute(a0);")))
(begin
  (define rl-enable-state-pointer
    (foreign-lambda*
      void
      ((integer a0) ((c-pointer void) a1))
      "rlEnableStatePointer(a0 , a1);")))
(begin
  (define rl-disable-state-pointer
    (foreign-lambda* void ((integer a0)) "rlDisableStatePointer(a0);")))
(begin
  (define rl-active-texture-slot
    (foreign-lambda* void ((integer a0)) "rlActiveTextureSlot(a0);")))
(begin
  (define rl-enable-texture
    (foreign-lambda* void ((unsigned-integer a0)) "rlEnableTexture(a0);")))
(begin
  (define rl-disable-texture (foreign-lambda* void () "rlDisableTexture();")))
(begin
  (define rl-enable-texture-cubemap
    (foreign-lambda*
      void
      ((unsigned-integer a0))
      "rlEnableTextureCubemap(a0);")))
(begin
  (define rl-disable-texture-cubemap
    (foreign-lambda* void () "rlDisableTextureCubemap();")))
(begin
  (define rl-texture-parameters
    (foreign-lambda*
      void
      ((unsigned-integer a0) (integer a1) (integer a2))
      "rlTextureParameters(a0 , a1 , a2);")))
(begin
  (define rl-cubemap-parameters
    (foreign-lambda*
      void
      ((unsigned-integer a0) (integer a1) (integer a2))
      "rlCubemapParameters(a0 , a1 , a2);")))
(begin
  (define rl-enable-shader
    (foreign-lambda* void ((unsigned-integer a0)) "rlEnableShader(a0);")))
(begin
  (define rl-disable-shader (foreign-lambda* void () "rlDisableShader();")))
(begin
  (define rl-enable-framebuffer
    (foreign-lambda* void ((unsigned-integer a0)) "rlEnableFramebuffer(a0);")))
(begin
  (define rl-disable-framebuffer
    (foreign-lambda* void () "rlDisableFramebuffer();")))
(begin
  (define rl-get-active-framebuffer
    (foreign-lambda* unsigned-integer () "return(rlGetActiveFramebuffer());")))
(begin
  (define rl-active-draw-buffers
    (foreign-lambda* void ((integer a0)) "rlActiveDrawBuffers(a0);")))
(begin
  (define rl-blit-framebuffer
    (foreign-lambda*
      void
      ((integer a0)
       (integer a1)
       (integer a2)
       (integer a3)
       (integer a4)
       (integer a5)
       (integer a6)
       (integer a7)
       (integer a8))
      "rlBlitFramebuffer(a0 , a1 , a2 , a3 , a4 , a5 , a6 , a7 , a8);")))
(begin
  (define rl-bind-framebuffer
    (foreign-lambda*
      void
      ((unsigned-integer a0) (unsigned-integer a1))
      "rlBindFramebuffer(a0 , a1);")))
(begin
  (define rl-enable-color-blend
    (foreign-lambda* void () "rlEnableColorBlend();")))
(begin
  (define rl-disable-color-blend
    (foreign-lambda* void () "rlDisableColorBlend();")))
(begin
  (define rl-enable-depth-test
    (foreign-lambda* void () "rlEnableDepthTest();")))
(begin
  (define rl-disable-depth-test
    (foreign-lambda* void () "rlDisableDepthTest();")))
(begin
  (define rl-enable-depth-mask
    (foreign-lambda* void () "rlEnableDepthMask();")))
(begin
  (define rl-disable-depth-mask
    (foreign-lambda* void () "rlDisableDepthMask();")))
(begin
  (define rl-enable-backface-culling
    (foreign-lambda* void () "rlEnableBackfaceCulling();")))
(begin
  (define rl-disable-backface-culling
    (foreign-lambda* void () "rlDisableBackfaceCulling();")))
(begin
  (define rl-color-mask
    (foreign-lambda*
      void
      ((bool a0) (bool a1) (bool a2) (bool a3))
      "rlColorMask(a0 , a1 , a2 , a3);")))
(begin
  (define rl-set-cull-face
    (foreign-lambda* void ((integer a0)) "rlSetCullFace(a0);")))
(begin
  (define rl-enable-scissor-test
    (foreign-lambda* void () "rlEnableScissorTest();")))
(begin
  (define rl-disable-scissor-test
    (foreign-lambda* void () "rlDisableScissorTest();")))
(begin
  (define rl-scissor
    (foreign-lambda*
      void
      ((integer a0) (integer a1) (integer a2) (integer a3))
      "rlScissor(a0 , a1 , a2 , a3);")))
(begin
  (define rl-enable-point-mode
    (foreign-lambda* void () "rlEnablePointMode();")))
(begin
  (define rl-disable-point-mode
    (foreign-lambda* void () "rlDisablePointMode();")))
(begin
  (define rl-set-point-size
    (foreign-lambda* void ((float a0)) "rlSetPointSize(a0);")))
(begin
  (define rl-get-point-size
    (foreign-lambda* float () "return(rlGetPointSize());")))
(begin
  (define rl-enable-wire-mode (foreign-lambda* void () "rlEnableWireMode();")))
(begin
  (define rl-disable-wire-mode
    (foreign-lambda* void () "rlDisableWireMode();")))
(begin
  (define rl-set-line-width
    (foreign-lambda* void ((float a0)) "rlSetLineWidth(a0);")))
(begin
  (define rl-get-line-width
    (foreign-lambda* float () "return(rlGetLineWidth());")))
(begin
  (define rl-enable-smooth-lines
    (foreign-lambda* void () "rlEnableSmoothLines();")))
(begin
  (define rl-disable-smooth-lines
    (foreign-lambda* void () "rlDisableSmoothLines();")))
(begin
  (define rl-enable-stereo-render
    (foreign-lambda* void () "rlEnableStereoRender();")))
(begin
  (define rl-disable-stereo-render
    (foreign-lambda* void () "rlDisableStereoRender();")))
(begin
  (define rl-is-stereo-render-enabled
    (foreign-lambda* bool () "return(rlIsStereoRenderEnabled());")))
(begin
  (define rl-clear-color
    (foreign-lambda*
      void
      ((unsigned-char a0)
       (unsigned-char a1)
       (unsigned-char a2)
       (unsigned-char a3))
      "rlClearColor(a0 , a1 , a2 , a3);")))
(begin
  (define rl-clear-screen-buffers
    (foreign-lambda* void () "rlClearScreenBuffers();")))
(begin (define rl-check-errors (foreign-lambda* void () "rlCheckErrors();")))
(begin
  (define rl-set-blend-mode
    (foreign-lambda* void ((integer a0)) "rlSetBlendMode(a0);")))
(begin
  (define rl-set-blend-factors
    (foreign-lambda*
      void
      ((integer a0) (integer a1) (integer a2))
      "rlSetBlendFactors(a0 , a1 , a2);")))
(begin
  (define rl-set-blend-factors-separate
    (foreign-lambda*
      void
      ((integer a0)
       (integer a1)
       (integer a2)
       (integer a3)
       (integer a4)
       (integer a5))
      "rlSetBlendFactorsSeparate(a0 , a1 , a2 , a3 , a4 , a5);")))
(begin
  (define rlgl-init
    (foreign-lambda* void ((integer a0) (integer a1)) "rlglInit(a0 , a1);")))
(begin (define rlgl-close (foreign-lambda* void () "rlglClose();")))
(begin
  (define rl-load-extensions
    (foreign-lambda* void (((c-pointer void) a0)) "rlLoadExtensions(a0);")))
(begin
  (define rl-get-proc-address
    (foreign-lambda*
      (c-pointer void)
      ((c-string a0))
      "return(rlGetProcAddress(a0));")))
(begin
  (define rl-get-version
    (foreign-lambda* integer () "return(rlGetVersion());")))
(begin
  (define rl-set-framebuffer-width
    (foreign-lambda* void ((integer a0)) "rlSetFramebufferWidth(a0);")))
(begin
  (define rl-get-framebuffer-width
    (foreign-lambda* integer () "return(rlGetFramebufferWidth());")))
(begin
  (define rl-set-framebuffer-height
    (foreign-lambda* void ((integer a0)) "rlSetFramebufferHeight(a0);")))
(begin
  (define rl-get-framebuffer-height
    (foreign-lambda* integer () "return(rlGetFramebufferHeight());")))
(begin
  (define rl-get-texture-id-default
    (foreign-lambda* unsigned-integer () "return(rlGetTextureIdDefault());")))
(begin
  (define rl-get-shader-id-default
    (foreign-lambda* unsigned-integer () "return(rlGetShaderIdDefault());")))
(begin
  (define rl-get-shader-locs-default
    (foreign-lambda*
      (c-pointer integer)
      ()
      "return(rlGetShaderLocsDefault());")))
(begin
  (define rl-load-render-batch
    (foreign-lambda*
      (c-pointer (struct "rlRenderBatch"))
      ((integer a0) (integer a1))
      "struct rlRenderBatch * tmp = (struct rlRenderBatch *) C_malloc(sizeof(struct rlRenderBatch));\n*tmp = rlLoadRenderBatch(a0 , a1);\nreturn(tmp);;\n")))
(begin
  (define rl-unload-render-batch
    (foreign-lambda*
      void
      (((c-pointer (struct "rlRenderBatch")) a0))
      "rlUnloadRenderBatch(*a0);")))
(begin
  (define rl-draw-render-batch
    (foreign-lambda*
      void
      (((c-pointer (struct "rlRenderBatch")) a0))
      "rlDrawRenderBatch(a0);")))
(begin
  (define rl-set-render-batch-active
    (foreign-lambda*
      void
      (((c-pointer (struct "rlRenderBatch")) a0))
      "rlSetRenderBatchActive(a0);")))
(begin
  (define rl-draw-render-batch-active
    (foreign-lambda* void () "rlDrawRenderBatchActive();")))
(begin
  (define rl-check-render-batch-limit
    (foreign-lambda*
      bool
      ((integer a0))
      "return(rlCheckRenderBatchLimit(a0));")))
(begin
  (define rl-set-texture
    (foreign-lambda* void ((unsigned-integer a0)) "rlSetTexture(a0);")))
(begin
  (define rl-load-vertex-array
    (foreign-lambda* unsigned-integer () "return(rlLoadVertexArray());")))
(begin
  (define rl-load-vertex-buffer
    (foreign-lambda*
      unsigned-integer
      (((c-pointer void) a0) (integer a1) (bool a2))
      "return(rlLoadVertexBuffer(a0 , a1 , a2));")))
(begin
  (define rl-load-vertex-buffer-element
    (foreign-lambda*
      unsigned-integer
      (((c-pointer void) a0) (integer a1) (bool a2))
      "return(rlLoadVertexBufferElement(a0 , a1 , a2));")))
(begin
  (define rl-update-vertex-buffer
    (foreign-lambda*
      void
      ((unsigned-integer a0) ((c-pointer void) a1) (integer a2) (integer a3))
      "rlUpdateVertexBuffer(a0 , a1 , a2 , a3);")))
(begin
  (define rl-update-vertex-buffer-elements
    (foreign-lambda*
      void
      ((unsigned-integer a0) ((c-pointer void) a1) (integer a2) (integer a3))
      "rlUpdateVertexBufferElements(a0 , a1 , a2 , a3);")))
(begin
  (define rl-unload-vertex-array
    (foreign-lambda* void ((unsigned-integer a0)) "rlUnloadVertexArray(a0);")))
(begin
  (define rl-unload-vertex-buffer
    (foreign-lambda*
      void
      ((unsigned-integer a0))
      "rlUnloadVertexBuffer(a0);")))
(begin
  (define rl-set-vertex-attribute
    (foreign-lambda*
      void
      ((unsigned-integer a0)
       (integer a1)
       (integer a2)
       (bool a3)
       (integer a4)
       (integer a5))
      "rlSetVertexAttribute(a0 , a1 , a2 , a3 , a4 , a5);")))
(begin
  (define rl-set-vertex-attribute-divisor
    (foreign-lambda*
      void
      ((unsigned-integer a0) (integer a1))
      "rlSetVertexAttributeDivisor(a0 , a1);")))
(begin
  (define rl-set-vertex-attribute-default
    (foreign-lambda*
      void
      ((integer a0) ((c-pointer void) a1) (integer a2) (integer a3))
      "rlSetVertexAttributeDefault(a0 , a1 , a2 , a3);")))
(begin
  (define rl-draw-vertex-array
    (foreign-lambda*
      void
      ((integer a0) (integer a1))
      "rlDrawVertexArray(a0 , a1);")))
(begin
  (define rl-draw-vertex-array-elements
    (foreign-lambda*
      void
      ((integer a0) (integer a1) ((c-pointer void) a2))
      "rlDrawVertexArrayElements(a0 , a1 , a2);")))
(begin
  (define rl-draw-vertex-array-instanced
    (foreign-lambda*
      void
      ((integer a0) (integer a1) (integer a2))
      "rlDrawVertexArrayInstanced(a0 , a1 , a2);")))
(begin
  (define rl-draw-vertex-array-elements-instanced
    (foreign-lambda*
      void
      ((integer a0) (integer a1) ((c-pointer void) a2) (integer a3))
      "rlDrawVertexArrayElementsInstanced(a0 , a1 , a2 , a3);")))
(begin
  (define rl-load-texture
    (foreign-lambda*
      unsigned-integer
      (((c-pointer void) a0)
       (integer a1)
       (integer a2)
       (integer a3)
       (integer a4))
      "return(rlLoadTexture(a0 , a1 , a2 , a3 , a4));")))
(begin
  (define rl-load-texture-depth
    (foreign-lambda*
      unsigned-integer
      ((integer a0) (integer a1) (bool a2))
      "return(rlLoadTextureDepth(a0 , a1 , a2));")))
(begin
  (define rl-load-texture-cubemap
    (foreign-lambda*
      unsigned-integer
      (((c-pointer void) a0) (integer a1) (integer a2) (integer a3))
      "return(rlLoadTextureCubemap(a0 , a1 , a2 , a3));")))
(begin
  (define rl-update-texture
    (foreign-lambda*
      void
      ((unsigned-integer a0)
       (integer a1)
       (integer a2)
       (integer a3)
       (integer a4)
       (integer a5)
       ((c-pointer void) a6))
      "rlUpdateTexture(a0 , a1 , a2 , a3 , a4 , a5 , a6);")))
(begin
  (define rl-get-gl-texture-formats
    (foreign-lambda*
      void
      ((integer a0) (u32vector a1) (u32vector a2) (u32vector a3))
      "rlGetGlTextureFormats(a0 , a1 , a2 , a3);")))
(begin
  (define rl-get-pixel-format-name
    (foreign-lambda*
      c-string
      ((unsigned-integer a0))
      "return(rlGetPixelFormatName(a0));")))
(begin
  (define rl-unload-texture
    (foreign-lambda* void ((unsigned-integer a0)) "rlUnloadTexture(a0);")))
(begin
  (define rl-gen-texture-mipmaps
    (foreign-lambda*
      void
      ((unsigned-integer a0)
       (integer a1)
       (integer a2)
       (integer a3)
       (s32vector a4))
      "rlGenTextureMipmaps(a0 , a1 , a2 , a3 , a4);")))
(begin
  (define rl-read-texture-pixels
    (foreign-lambda*
      (c-pointer void)
      ((unsigned-integer a0) (integer a1) (integer a2) (integer a3))
      "return(rlReadTexturePixels(a0 , a1 , a2 , a3));")))
(begin
  (define rl-read-screen-pixels
    (foreign-lambda*
      (c-pointer unsigned-char)
      ((integer a0) (integer a1))
      "return(rlReadScreenPixels(a0 , a1));")))
(begin
  (define rl-load-framebuffer
    (foreign-lambda* unsigned-integer () "return(rlLoadFramebuffer());")))
(begin
  (define rl-framebuffer-attach
    (foreign-lambda*
      void
      ((unsigned-integer a0)
       (unsigned-integer a1)
       (integer a2)
       (integer a3)
       (integer a4))
      "rlFramebufferAttach(a0 , a1 , a2 , a3 , a4);")))
(begin
  (define rl-framebuffer-complete
    (foreign-lambda*
      bool
      ((unsigned-integer a0))
      "return(rlFramebufferComplete(a0));")))
(begin
  (define rl-unload-framebuffer
    (foreign-lambda* void ((unsigned-integer a0)) "rlUnloadFramebuffer(a0);")))
(begin
  (define rl-copy-framebuffer
    (foreign-lambda*
      void
      ((integer a0)
       (integer a1)
       (integer a2)
       (integer a3)
       (integer a4)
       ((c-pointer void) a5))
      "rlCopyFramebuffer(a0 , a1 , a2 , a3 , a4 , a5);")))
(begin
  (define rl-resize-framebuffer
    (foreign-lambda*
      void
      ((integer a0) (integer a1))
      "rlResizeFramebuffer(a0 , a1);")))
(begin
  (define rl-load-shader
    (foreign-lambda*
      unsigned-integer
      ((c-string a0) (integer a1))
      "return(rlLoadShader(a0 , a1));")))
(begin
  (define rl-load-shader-program
    (foreign-lambda*
      unsigned-integer
      ((c-string a0) (c-string a1))
      "return(rlLoadShaderProgram(a0 , a1));")))
(begin
  (define rl-load-shader-program-ex
    (foreign-lambda*
      unsigned-integer
      ((unsigned-integer a0) (unsigned-integer a1))
      "return(rlLoadShaderProgramEx(a0 , a1));")))
(begin
  (define rl-load-shader-program-compute
    (foreign-lambda*
      unsigned-integer
      ((unsigned-integer a0))
      "return(rlLoadShaderProgramCompute(a0));")))
(begin
  (define rl-unload-shader
    (foreign-lambda* void ((unsigned-integer a0)) "rlUnloadShader(a0);")))
(begin
  (define rl-unload-shader-program
    (foreign-lambda*
      void
      ((unsigned-integer a0))
      "rlUnloadShaderProgram(a0);")))
(begin
  (define rl-get-location-uniform
    (foreign-lambda*
      integer
      ((unsigned-integer a0) (c-string a1))
      "return(rlGetLocationUniform(a0 , a1));")))
(begin
  (define rl-get-location-attrib
    (foreign-lambda*
      integer
      ((unsigned-integer a0) (c-string a1))
      "return(rlGetLocationAttrib(a0 , a1));")))
(begin
  (define rl-set-uniform
    (foreign-lambda*
      void
      ((integer a0) ((c-pointer void) a1) (integer a2) (integer a3))
      "rlSetUniform(a0 , a1 , a2 , a3);")))
(begin
  (define rl-set-uniform-matrix
    (foreign-lambda*
      void
      ((integer a0) (f32vector a1))
      "rlSetUniformMatrix(a0 , *((Matrix*)a1));")))
(begin
  (define rl-set-uniform-matrices
    (foreign-lambda*
      void
      ((integer a0) ((c-pointer (struct "Matrix")) a1) (integer a2))
      "rlSetUniformMatrices(a0 , a1 , a2);")))
(begin
  (define rl-set-uniform-sampler
    (foreign-lambda*
      void
      ((integer a0) (unsigned-integer a1))
      "rlSetUniformSampler(a0 , a1);")))
(begin
  (define rl-set-shader
    (foreign-lambda*
      void
      ((unsigned-integer a0) (s32vector a1))
      "rlSetShader(a0 , a1);")))
(begin
  (define rl-compute-shader-dispatch
    (foreign-lambda*
      void
      ((unsigned-integer a0) (unsigned-integer a1) (unsigned-integer a2))
      "rlComputeShaderDispatch(a0 , a1 , a2);")))
(begin
  (define rl-load-shader-buffer
    (foreign-lambda*
      unsigned-integer
      ((unsigned-integer a0) ((c-pointer void) a1) (integer a2))
      "return(rlLoadShaderBuffer(a0 , a1 , a2));")))
(begin
  (define rl-unload-shader-buffer
    (foreign-lambda*
      void
      ((unsigned-integer a0))
      "rlUnloadShaderBuffer(a0);")))
(begin
  (define rl-update-shader-buffer
    (foreign-lambda*
      void
      ((unsigned-integer a0)
       ((c-pointer void) a1)
       (unsigned-integer a2)
       (unsigned-integer a3))
      "rlUpdateShaderBuffer(a0 , a1 , a2 , a3);")))
(begin
  (define rl-bind-shader-buffer
    (foreign-lambda*
      void
      ((unsigned-integer a0) (unsigned-integer a1))
      "rlBindShaderBuffer(a0 , a1);")))
(begin
  (define rl-read-shader-buffer
    (foreign-lambda*
      void
      ((unsigned-integer a0)
       ((c-pointer void) a1)
       (unsigned-integer a2)
       (unsigned-integer a3))
      "rlReadShaderBuffer(a0 , a1 , a2 , a3);")))
(begin
  (define rl-copy-shader-buffer
    (foreign-lambda*
      void
      ((unsigned-integer a0)
       (unsigned-integer a1)
       (unsigned-integer a2)
       (unsigned-integer a3)
       (unsigned-integer a4))
      "rlCopyShaderBuffer(a0 , a1 , a2 , a3 , a4);")))
(begin
  (define rl-get-shader-buffer-size
    (foreign-lambda*
      unsigned-integer
      ((unsigned-integer a0))
      "return(rlGetShaderBufferSize(a0));")))
(begin
  (define rl-bind-image-texture
    (foreign-lambda*
      void
      ((unsigned-integer a0) (unsigned-integer a1) (integer a2) (bool a3))
      "rlBindImageTexture(a0 , a1 , a2 , a3);")))
(begin
  (define rl-get-matrix-modelview
    (lambda ()
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out))
           "*((Matrix*)out) = rlGetMatrixModelview();\n")
         out)
        out))))
(begin
  (define rl-get-matrix-projection
    (lambda ()
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out))
           "*((Matrix*)out) = rlGetMatrixProjection();\n")
         out)
        out))))
(begin
  (define rl-get-matrix-transform
    (lambda ()
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out))
           "*((Matrix*)out) = rlGetMatrixTransform();\n")
         out)
        out))))
(begin
  (define rl-get-matrix-projection-stereo
    (lambda (a0)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out) (integer a0))
           "*((Matrix*)out) = rlGetMatrixProjectionStereo(a0);\n")
         out
         a0)
        out))))
(begin
  (define rl-get-matrix-view-offset-stereo
    (lambda (a0)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out) (integer a0))
           "*((Matrix*)out) = rlGetMatrixViewOffsetStereo(a0);\n")
         out
         a0)
        out))))
(begin
  (define rl-set-matrix-projection
    (foreign-lambda*
      void
      ((f32vector a0))
      "rlSetMatrixProjection(*((Matrix*)a0));")))
(begin
  (define rl-set-matrix-modelview
    (foreign-lambda*
      void
      ((f32vector a0))
      "rlSetMatrixModelview(*((Matrix*)a0));")))
(begin
  (define rl-set-matrix-projection-stereo
    (foreign-lambda*
      void
      ((f32vector a0) (f32vector a1))
      "rlSetMatrixProjectionStereo(*((Matrix*)a0) , *((Matrix*)a1));")))
(begin
  (define rl-set-matrix-view-offset-stereo
    (foreign-lambda*
      void
      ((f32vector a0) (f32vector a1))
      "rlSetMatrixViewOffsetStereo(*((Matrix*)a0) , *((Matrix*)a1));")))
(begin
  (define rl-load-draw-cube (foreign-lambda* void () "rlLoadDrawCube();")))
(begin
  (define rl-load-draw-quad (foreign-lambda* void () "rlLoadDrawQuad();")))
