(define image-data
  (getter-with-setter
    (foreign-lambda*
      (c-pointer void)
      (((c-pointer (struct "Image")) s))
      "return(s->data);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) s) ((c-pointer void) x))
      "s->data = x;")))
(define image-width
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "Image")) s))
      "return(s->width);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) s) (integer x))
      "s->width = x;")))
(define image-height
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "Image")) s))
      "return(s->height);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) s) (integer x))
      "s->height = x;")))
(define image-mipmaps
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "Image")) s))
      "return(s->mipmaps);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) s) (integer x))
      "s->mipmaps = x;")))
(define image-format
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "Image")) s))
      "return(s->format);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) s) (integer x))
      "s->format = x;")))
(define make-image
  (foreign-lambda*
    (c-pointer (struct "Image"))
    (((c-pointer void) data)
     (integer width)
     (integer height)
     (integer mipmaps)
     (integer format))
    "struct Image *tmp_ =  (struct Image *)C_malloc(sizeof(struct Image));\ntmp_->data = data;\ntmp_->width = width;\ntmp_->height = height;\ntmp_->mipmaps = mipmaps;\ntmp_->format = format;\nreturn(tmp_);;\n"))
(define texture-id
  (getter-with-setter
    (foreign-lambda*
      unsigned-integer
      (((c-pointer (struct "Texture")) s))
      "return(s->id);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Texture")) s) (unsigned-integer x))
      "s->id = x;")))
(define texture-width
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "Texture")) s))
      "return(s->width);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Texture")) s) (integer x))
      "s->width = x;")))
(define texture-height
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "Texture")) s))
      "return(s->height);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Texture")) s) (integer x))
      "s->height = x;")))
(define texture-mipmaps
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "Texture")) s))
      "return(s->mipmaps);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Texture")) s) (integer x))
      "s->mipmaps = x;")))
(define texture-format
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "Texture")) s))
      "return(s->format);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Texture")) s) (integer x))
      "s->format = x;")))
(define make-texture
  (foreign-lambda*
    (c-pointer (struct "Texture"))
    ((unsigned-integer id)
     (integer width)
     (integer height)
     (integer mipmaps)
     (integer format))
    "struct Texture *tmp_ =  (struct Texture *)C_malloc(sizeof(struct Texture));\ntmp_->id = id;\ntmp_->width = width;\ntmp_->height = height;\ntmp_->mipmaps = mipmaps;\ntmp_->format = format;\nreturn(tmp_);;\n"))
(define render-texture-id
  (getter-with-setter
    (foreign-lambda*
      unsigned-integer
      (((c-pointer (struct "RenderTexture")) s))
      "return(s->id);")
    (foreign-lambda*
      void
      (((c-pointer (struct "RenderTexture")) s) (unsigned-integer x))
      "s->id = x;")))
(define render-texture-texture
  (getter-with-setter
    (foreign-lambda*
      (c-pointer (struct "Texture"))
      (((c-pointer (struct "RenderTexture")) s))
      "struct Texture * tmp = (struct Texture *) C_malloc(sizeof(struct Texture));\n*tmp = s->texture;\nreturn(tmp);;\n")
    (foreign-lambda*
      void
      (((c-pointer (struct "RenderTexture")) s)
       ((c-pointer (struct "Texture")) x))
      "s->texture = *x;")))
(define render-texture-depth
  (getter-with-setter
    (foreign-lambda*
      (c-pointer (struct "Texture"))
      (((c-pointer (struct "RenderTexture")) s))
      "struct Texture * tmp = (struct Texture *) C_malloc(sizeof(struct Texture));\n*tmp = s->depth;\nreturn(tmp);;\n")
    (foreign-lambda*
      void
      (((c-pointer (struct "RenderTexture")) s)
       ((c-pointer (struct "Texture")) x))
      "s->depth = *x;")))
(define make-render-texture
  (foreign-lambda*
    (c-pointer (struct "RenderTexture"))
    ((unsigned-integer id)
     ((c-pointer (struct "Texture")) texture)
     ((c-pointer (struct "Texture")) depth))
    "struct RenderTexture *tmp_ =  (struct RenderTexture *)C_malloc(sizeof(struct RenderTexture));\ntmp_->id = id;\ntmp_->texture = *texture;\ntmp_->depth = *depth;\nreturn(tmp_);;\n"))
(define npatch-info-source
  (getter-with-setter
    (lambda (s)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) ((c-pointer (struct "NPatchInfo")) s))
           "*((Rectangle*)out) = s->source;\n")
         out
         s)
        out))
    (foreign-lambda*
      void
      (((c-pointer (struct "NPatchInfo")) s) (f32vector x))
      "s->source = *((Rectangle*)x);")))
(define npatch-info-left
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "NPatchInfo")) s))
      "return(s->left);")
    (foreign-lambda*
      void
      (((c-pointer (struct "NPatchInfo")) s) (integer x))
      "s->left = x;")))
(define npatch-info-top
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "NPatchInfo")) s))
      "return(s->top);")
    (foreign-lambda*
      void
      (((c-pointer (struct "NPatchInfo")) s) (integer x))
      "s->top = x;")))
(define npatch-info-right
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "NPatchInfo")) s))
      "return(s->right);")
    (foreign-lambda*
      void
      (((c-pointer (struct "NPatchInfo")) s) (integer x))
      "s->right = x;")))
(define npatch-info-bottom
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "NPatchInfo")) s))
      "return(s->bottom);")
    (foreign-lambda*
      void
      (((c-pointer (struct "NPatchInfo")) s) (integer x))
      "s->bottom = x;")))
(define npatch-info-layout
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "NPatchInfo")) s))
      "return(s->layout);")
    (foreign-lambda*
      void
      (((c-pointer (struct "NPatchInfo")) s) (integer x))
      "s->layout = x;")))
(define make-npatch-info
  (foreign-lambda*
    (c-pointer (struct "NPatchInfo"))
    ((f32vector source)
     (integer left)
     (integer top)
     (integer right)
     (integer bottom)
     (integer layout))
    "struct NPatchInfo *tmp_ =  (struct NPatchInfo *)C_malloc(sizeof(struct NPatchInfo));\ntmp_->source = *((Rectangle*)source);\ntmp_->left = left;\ntmp_->top = top;\ntmp_->right = right;\ntmp_->bottom = bottom;\ntmp_->layout = layout;\nreturn(tmp_);;\n"))
(define glyph-info-value
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "GlyphInfo")) s))
      "return(s->value);")
    (foreign-lambda*
      void
      (((c-pointer (struct "GlyphInfo")) s) (integer x))
      "s->value = x;")))
(define glyph-info-offset-x
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "GlyphInfo")) s))
      "return(s->offsetX);")
    (foreign-lambda*
      void
      (((c-pointer (struct "GlyphInfo")) s) (integer x))
      "s->offsetX = x;")))
(define glyph-info-offset-y
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "GlyphInfo")) s))
      "return(s->offsetY);")
    (foreign-lambda*
      void
      (((c-pointer (struct "GlyphInfo")) s) (integer x))
      "s->offsetY = x;")))
(define glyph-info-advance-x
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "GlyphInfo")) s))
      "return(s->advanceX);")
    (foreign-lambda*
      void
      (((c-pointer (struct "GlyphInfo")) s) (integer x))
      "s->advanceX = x;")))
(define glyph-info-image
  (getter-with-setter
    (foreign-lambda*
      (c-pointer (struct "Image"))
      (((c-pointer (struct "GlyphInfo")) s))
      "struct Image * tmp = (struct Image *) C_malloc(sizeof(struct Image));\n*tmp = s->image;\nreturn(tmp);;\n")
    (foreign-lambda*
      void
      (((c-pointer (struct "GlyphInfo")) s) ((c-pointer (struct "Image")) x))
      "s->image = *x;")))
(define make-glyph-info
  (foreign-lambda*
    (c-pointer (struct "GlyphInfo"))
    ((integer value)
     (integer offsetX)
     (integer offsetY)
     (integer advanceX)
     ((c-pointer (struct "Image")) image))
    "struct GlyphInfo *tmp_ =  (struct GlyphInfo *)C_malloc(sizeof(struct GlyphInfo));\ntmp_->value = value;\ntmp_->offsetX = offsetX;\ntmp_->offsetY = offsetY;\ntmp_->advanceX = advanceX;\ntmp_->image = *image;\nreturn(tmp_);;\n"))
(define font-base-size
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "Font")) s))
      "return(s->baseSize);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Font")) s) (integer x))
      "s->baseSize = x;")))
(define font-glyph-count
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "Font")) s))
      "return(s->glyphCount);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Font")) s) (integer x))
      "s->glyphCount = x;")))
(define font-glyph-padding
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "Font")) s))
      "return(s->glyphPadding);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Font")) s) (integer x))
      "s->glyphPadding = x;")))
(define font-texture
  (getter-with-setter
    (foreign-lambda*
      (c-pointer (struct "Texture"))
      (((c-pointer (struct "Font")) s))
      "struct Texture * tmp = (struct Texture *) C_malloc(sizeof(struct Texture));\n*tmp = s->texture;\nreturn(tmp);;\n")
    (foreign-lambda*
      void
      (((c-pointer (struct "Font")) s) ((c-pointer (struct "Texture")) x))
      "s->texture = *x;")))
(define font-recs
  (getter-with-setter
    (foreign-lambda*
      (c-pointer (struct "Rectangle"))
      (((c-pointer (struct "Font")) s))
      "return(s->recs);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Font")) s) ((c-pointer (struct "Rectangle")) x))
      "s->recs = x;")))
(define font-glyphs
  (getter-with-setter
    (foreign-lambda*
      (c-pointer (struct "GlyphInfo"))
      (((c-pointer (struct "Font")) s))
      "return(s->glyphs);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Font")) s) ((c-pointer (struct "GlyphInfo")) x))
      "s->glyphs = x;")))
(define make-font
  (foreign-lambda*
    (c-pointer (struct "Font"))
    ((integer baseSize)
     (integer glyphCount)
     (integer glyphPadding)
     ((c-pointer (struct "Texture")) texture)
     ((c-pointer (struct "Rectangle")) recs)
     ((c-pointer (struct "GlyphInfo")) glyphs))
    "struct Font *tmp_ =  (struct Font *)C_malloc(sizeof(struct Font));\ntmp_->baseSize = baseSize;\ntmp_->glyphCount = glyphCount;\ntmp_->glyphPadding = glyphPadding;\ntmp_->texture = *texture;\ntmp_->recs = recs;\ntmp_->glyphs = glyphs;\nreturn(tmp_);;\n"))
(define camera3d-position
  (getter-with-setter
    (lambda (s)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) ((c-pointer (struct "Camera3D")) s))
           "*((Vector3*)out) = s->position;\n")
         out
         s)
        out))
    (foreign-lambda*
      void
      (((c-pointer (struct "Camera3D")) s) (f32vector x))
      "s->position = *((Vector3*)x);")))
(define camera3d-target
  (getter-with-setter
    (lambda (s)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) ((c-pointer (struct "Camera3D")) s))
           "*((Vector3*)out) = s->target;\n")
         out
         s)
        out))
    (foreign-lambda*
      void
      (((c-pointer (struct "Camera3D")) s) (f32vector x))
      "s->target = *((Vector3*)x);")))
(define camera3d-up
  (getter-with-setter
    (lambda (s)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) ((c-pointer (struct "Camera3D")) s))
           "*((Vector3*)out) = s->up;\n")
         out
         s)
        out))
    (foreign-lambda*
      void
      (((c-pointer (struct "Camera3D")) s) (f32vector x))
      "s->up = *((Vector3*)x);")))
(define camera3d-fovy
  (getter-with-setter
    (foreign-lambda*
      float
      (((c-pointer (struct "Camera3D")) s))
      "return(s->fovy);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Camera3D")) s) (float x))
      "s->fovy = x;")))
(define camera3d-projection
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "Camera3D")) s))
      "return(s->projection);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Camera3D")) s) (integer x))
      "s->projection = x;")))
(define make-camera3d
  (foreign-lambda*
    (c-pointer (struct "Camera3D"))
    ((f32vector position)
     (f32vector target)
     (f32vector up)
     (float fovy)
     (integer projection))
    "struct Camera3D *tmp_ =  (struct Camera3D *)C_malloc(sizeof(struct Camera3D));\ntmp_->position = *((Vector3*)position);\ntmp_->target = *((Vector3*)target);\ntmp_->up = *((Vector3*)up);\ntmp_->fovy = fovy;\ntmp_->projection = projection;\nreturn(tmp_);;\n"))
(define camera2d-offset
  (getter-with-setter
    (lambda (s)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out) ((c-pointer (struct "Camera2D")) s))
           "*((Vector2*)out) = s->offset;\n")
         out
         s)
        out))
    (foreign-lambda*
      void
      (((c-pointer (struct "Camera2D")) s) (f32vector x))
      "s->offset = *((Vector2*)x);")))
(define camera2d-target
  (getter-with-setter
    (lambda (s)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out) ((c-pointer (struct "Camera2D")) s))
           "*((Vector2*)out) = s->target;\n")
         out
         s)
        out))
    (foreign-lambda*
      void
      (((c-pointer (struct "Camera2D")) s) (f32vector x))
      "s->target = *((Vector2*)x);")))
(define camera2d-rotation
  (getter-with-setter
    (foreign-lambda*
      float
      (((c-pointer (struct "Camera2D")) s))
      "return(s->rotation);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Camera2D")) s) (float x))
      "s->rotation = x;")))
(define camera2d-zoom
  (getter-with-setter
    (foreign-lambda*
      float
      (((c-pointer (struct "Camera2D")) s))
      "return(s->zoom);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Camera2D")) s) (float x))
      "s->zoom = x;")))
(define make-camera2d
  (foreign-lambda*
    (c-pointer (struct "Camera2D"))
    ((f32vector offset) (f32vector target) (float rotation) (float zoom))
    "struct Camera2D *tmp_ =  (struct Camera2D *)C_malloc(sizeof(struct Camera2D));\ntmp_->offset = *((Vector2*)offset);\ntmp_->target = *((Vector2*)target);\ntmp_->rotation = rotation;\ntmp_->zoom = zoom;\nreturn(tmp_);;\n"))
(define mesh-vertex-count
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "Mesh")) s))
      "return(s->vertexCount);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Mesh")) s) (integer x))
      "s->vertexCount = x;")))
(define mesh-triangle-count
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "Mesh")) s))
      "return(s->triangleCount);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Mesh")) s) (integer x))
      "s->triangleCount = x;")))
(define mesh-vertices
  (getter-with-setter
    (foreign-lambda*
      (c-pointer float)
      (((c-pointer (struct "Mesh")) s))
      "return(s->vertices);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Mesh")) s) ((c-pointer float) x))
      "s->vertices = x;")))
(define mesh-texcoords
  (getter-with-setter
    (foreign-lambda*
      (c-pointer float)
      (((c-pointer (struct "Mesh")) s))
      "return(s->texcoords);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Mesh")) s) ((c-pointer float) x))
      "s->texcoords = x;")))
(define mesh-texcoords2
  (getter-with-setter
    (foreign-lambda*
      (c-pointer float)
      (((c-pointer (struct "Mesh")) s))
      "return(s->texcoords2);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Mesh")) s) ((c-pointer float) x))
      "s->texcoords2 = x;")))
(define mesh-normals
  (getter-with-setter
    (foreign-lambda*
      (c-pointer float)
      (((c-pointer (struct "Mesh")) s))
      "return(s->normals);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Mesh")) s) ((c-pointer float) x))
      "s->normals = x;")))
(define mesh-tangents
  (getter-with-setter
    (foreign-lambda*
      (c-pointer float)
      (((c-pointer (struct "Mesh")) s))
      "return(s->tangents);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Mesh")) s) ((c-pointer float) x))
      "s->tangents = x;")))
(define mesh-colors
  (getter-with-setter
    (foreign-lambda*
      (c-pointer unsigned-char)
      (((c-pointer (struct "Mesh")) s))
      "return(s->colors);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Mesh")) s) ((c-pointer unsigned-char) x))
      "s->colors = x;")))
(define mesh-indices
  (getter-with-setter
    (foreign-lambda*
      (c-pointer unsigned-short)
      (((c-pointer (struct "Mesh")) s))
      "return(s->indices);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Mesh")) s) ((c-pointer unsigned-short) x))
      "s->indices = x;")))
(define mesh-bone-count
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "Mesh")) s))
      "return(s->boneCount);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Mesh")) s) (integer x))
      "s->boneCount = x;")))
(define mesh-bone-indices
  (getter-with-setter
    (foreign-lambda*
      (c-pointer unsigned-char)
      (((c-pointer (struct "Mesh")) s))
      "return(s->boneIndices);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Mesh")) s) ((c-pointer unsigned-char) x))
      "s->boneIndices = x;")))
(define mesh-bone-weights
  (getter-with-setter
    (foreign-lambda*
      (c-pointer float)
      (((c-pointer (struct "Mesh")) s))
      "return(s->boneWeights);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Mesh")) s) ((c-pointer float) x))
      "s->boneWeights = x;")))
(define mesh-anim-vertices
  (getter-with-setter
    (foreign-lambda*
      (c-pointer float)
      (((c-pointer (struct "Mesh")) s))
      "return(s->animVertices);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Mesh")) s) ((c-pointer float) x))
      "s->animVertices = x;")))
(define mesh-anim-normals
  (getter-with-setter
    (foreign-lambda*
      (c-pointer float)
      (((c-pointer (struct "Mesh")) s))
      "return(s->animNormals);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Mesh")) s) ((c-pointer float) x))
      "s->animNormals = x;")))
(define mesh-vao-id
  (getter-with-setter
    (foreign-lambda*
      unsigned-integer
      (((c-pointer (struct "Mesh")) s))
      "return(s->vaoId);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Mesh")) s) (unsigned-integer x))
      "s->vaoId = x;")))
(define mesh-vbo-id
  (getter-with-setter
    (foreign-lambda*
      (c-pointer unsigned-integer)
      (((c-pointer (struct "Mesh")) s))
      "return(s->vboId);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Mesh")) s) ((c-pointer unsigned-integer) x))
      "s->vboId = x;")))
(define make-mesh
  (foreign-lambda*
    (c-pointer (struct "Mesh"))
    ((integer vertexCount)
     (integer triangleCount)
     ((c-pointer float) vertices)
     ((c-pointer float) texcoords)
     ((c-pointer float) texcoords2)
     ((c-pointer float) normals)
     ((c-pointer float) tangents)
     ((c-pointer unsigned-char) colors)
     ((c-pointer unsigned-short) indices)
     (integer boneCount)
     ((c-pointer unsigned-char) boneIndices)
     ((c-pointer float) boneWeights)
     ((c-pointer float) animVertices)
     ((c-pointer float) animNormals)
     (unsigned-integer vaoId)
     ((c-pointer unsigned-integer) vboId))
    "struct Mesh *tmp_ =  (struct Mesh *)C_malloc(sizeof(struct Mesh));\ntmp_->vertexCount = vertexCount;\ntmp_->triangleCount = triangleCount;\ntmp_->vertices = vertices;\ntmp_->texcoords = texcoords;\ntmp_->texcoords2 = texcoords2;\ntmp_->normals = normals;\ntmp_->tangents = tangents;\ntmp_->colors = colors;\ntmp_->indices = indices;\ntmp_->boneCount = boneCount;\ntmp_->boneIndices = boneIndices;\ntmp_->boneWeights = boneWeights;\ntmp_->animVertices = animVertices;\ntmp_->animNormals = animNormals;\ntmp_->vaoId = vaoId;\ntmp_->vboId = vboId;\nreturn(tmp_);;\n"))
(define shader-id
  (getter-with-setter
    (foreign-lambda*
      unsigned-integer
      (((c-pointer (struct "Shader")) s))
      "return(s->id);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Shader")) s) (unsigned-integer x))
      "s->id = x;")))
(define shader-locs
  (getter-with-setter
    (foreign-lambda*
      (c-pointer integer)
      (((c-pointer (struct "Shader")) s))
      "return(s->locs);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Shader")) s) ((c-pointer integer) x))
      "s->locs = x;")))
(define make-shader
  (foreign-lambda*
    (c-pointer (struct "Shader"))
    ((unsigned-integer id) ((c-pointer integer) locs))
    "struct Shader *tmp_ =  (struct Shader *)C_malloc(sizeof(struct Shader));\ntmp_->id = id;\ntmp_->locs = locs;\nreturn(tmp_);;\n"))
(define material-map-texture
  (getter-with-setter
    (foreign-lambda*
      (c-pointer (struct "Texture"))
      (((c-pointer (struct "MaterialMap")) s))
      "struct Texture * tmp = (struct Texture *) C_malloc(sizeof(struct Texture));\n*tmp = s->texture;\nreturn(tmp);;\n")
    (foreign-lambda*
      void
      (((c-pointer (struct "MaterialMap")) s)
       ((c-pointer (struct "Texture")) x))
      "s->texture = *x;")))
(define material-map-color
  (getter-with-setter
    (lambda (s)
      (let ((out (make-u8vector 4)))
        ((foreign-lambda*
           void
           ((u8vector out) ((c-pointer (struct "MaterialMap")) s))
           "*((Color*)out) = s->color;\n")
         out
         s)
        out))
    (foreign-lambda*
      void
      (((c-pointer (struct "MaterialMap")) s) (u8vector x))
      "s->color = *((Color*)x);")))
(define material-map-value
  (getter-with-setter
    (foreign-lambda*
      float
      (((c-pointer (struct "MaterialMap")) s))
      "return(s->value);")
    (foreign-lambda*
      void
      (((c-pointer (struct "MaterialMap")) s) (float x))
      "s->value = x;")))
(define make-material-map
  (foreign-lambda*
    (c-pointer (struct "MaterialMap"))
    (((c-pointer (struct "Texture")) texture) (u8vector color) (float value))
    "struct MaterialMap *tmp_ =  (struct MaterialMap *)C_malloc(sizeof(struct MaterialMap));\ntmp_->texture = *texture;\ntmp_->color = *((Color*)color);\ntmp_->value = value;\nreturn(tmp_);;\n"))
(define material-shader
  (getter-with-setter
    (foreign-lambda*
      (c-pointer (struct "Shader"))
      (((c-pointer (struct "Material")) s))
      "struct Shader * tmp = (struct Shader *) C_malloc(sizeof(struct Shader));\n*tmp = s->shader;\nreturn(tmp);;\n")
    (foreign-lambda*
      void
      (((c-pointer (struct "Material")) s) ((c-pointer (struct "Shader")) x))
      "s->shader = *x;")))
(define material-maps
  (getter-with-setter
    (foreign-lambda*
      (c-pointer (struct "MaterialMap"))
      (((c-pointer (struct "Material")) s))
      "return(s->maps);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Material")) s)
       ((c-pointer (struct "MaterialMap")) x))
      "s->maps = x;")))
(define make-material
  (foreign-lambda*
    (c-pointer (struct "Material"))
    (((c-pointer (struct "Shader")) shader)
     ((c-pointer (struct "MaterialMap")) maps))
    "struct Material *tmp_ =  (struct Material *)C_malloc(sizeof(struct Material));\ntmp_->shader = *shader;\ntmp_->maps = maps;\nreturn(tmp_);;\n"))
(define transform-translation
  (getter-with-setter
    (lambda (s)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) ((c-pointer (struct "Transform")) s))
           "*((Vector3*)out) = s->translation;\n")
         out
         s)
        out))
    (foreign-lambda*
      void
      (((c-pointer (struct "Transform")) s) (f32vector x))
      "s->translation = *((Vector3*)x);")))
(define transform-rotation
  (getter-with-setter
    (lambda (s)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) ((c-pointer (struct "Transform")) s))
           "*((Vector4*)out) = s->rotation;\n")
         out
         s)
        out))
    (foreign-lambda*
      void
      (((c-pointer (struct "Transform")) s) (f32vector x))
      "s->rotation = *((Vector4*)x);")))
(define transform-scale
  (getter-with-setter
    (lambda (s)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) ((c-pointer (struct "Transform")) s))
           "*((Vector3*)out) = s->scale;\n")
         out
         s)
        out))
    (foreign-lambda*
      void
      (((c-pointer (struct "Transform")) s) (f32vector x))
      "s->scale = *((Vector3*)x);")))
(define make-transform
  (foreign-lambda*
    (c-pointer (struct "Transform"))
    ((f32vector translation) (f32vector rotation) (f32vector scale))
    "struct Transform *tmp_ =  (struct Transform *)C_malloc(sizeof(struct Transform));\ntmp_->translation = *((Vector3*)translation);\ntmp_->rotation = *((Vector4*)rotation);\ntmp_->scale = *((Vector3*)scale);\nreturn(tmp_);;\n"))
(define bone-info-parent
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "BoneInfo")) s))
      "return(s->parent);")
    (foreign-lambda*
      void
      (((c-pointer (struct "BoneInfo")) s) (integer x))
      "s->parent = x;")))
(define make-bone-info
  (foreign-lambda*
    (c-pointer (struct "BoneInfo"))
    ((integer parent))
    "struct BoneInfo *tmp_ =  (struct BoneInfo *)C_malloc(sizeof(struct BoneInfo));\ntmp_->parent = parent;\nreturn(tmp_);;\n"))
(define model-skeleton-bone-count
  (getter-with-setter
    (foreign-lambda*
      unsigned-integer
      (((c-pointer (struct "ModelSkeleton")) s))
      "return(s->boneCount);")
    (foreign-lambda*
      void
      (((c-pointer (struct "ModelSkeleton")) s) (unsigned-integer x))
      "s->boneCount = x;")))
(define model-skeleton-bones
  (getter-with-setter
    (foreign-lambda*
      (c-pointer (struct "BoneInfo"))
      (((c-pointer (struct "ModelSkeleton")) s))
      "return(s->bones);")
    (foreign-lambda*
      void
      (((c-pointer (struct "ModelSkeleton")) s)
       ((c-pointer (struct "BoneInfo")) x))
      "s->bones = x;")))
(define model-skeleton-bind-pose
  (getter-with-setter
    (foreign-lambda*
      (c-pointer (struct "Transform"))
      (((c-pointer (struct "ModelSkeleton")) s))
      "return(s->bindPose);")
    (foreign-lambda*
      void
      (((c-pointer (struct "ModelSkeleton")) s)
       ((c-pointer (struct "Transform")) x))
      "s->bindPose = x;")))
(define make-model-skeleton
  (foreign-lambda*
    (c-pointer (struct "ModelSkeleton"))
    ((unsigned-integer boneCount)
     ((c-pointer (struct "BoneInfo")) bones)
     ((c-pointer (struct "Transform")) bindPose))
    "struct ModelSkeleton *tmp_ =  (struct ModelSkeleton *)C_malloc(sizeof(struct ModelSkeleton));\ntmp_->boneCount = boneCount;\ntmp_->bones = bones;\ntmp_->bindPose = bindPose;\nreturn(tmp_);;\n"))
(define model-transform
  (getter-with-setter
    (lambda (s)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out) ((c-pointer (struct "Model")) s))
           "*((Matrix*)out) = s->transform;\n")
         out
         s)
        out))
    (foreign-lambda*
      void
      (((c-pointer (struct "Model")) s) (f32vector x))
      "s->transform = *((Matrix*)x);")))
(define model-mesh-count
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "Model")) s))
      "return(s->meshCount);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Model")) s) (integer x))
      "s->meshCount = x;")))
(define model-material-count
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "Model")) s))
      "return(s->materialCount);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Model")) s) (integer x))
      "s->materialCount = x;")))
(define model-meshes
  (getter-with-setter
    (foreign-lambda*
      (c-pointer (struct "Mesh"))
      (((c-pointer (struct "Model")) s))
      "return(s->meshes);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Model")) s) ((c-pointer (struct "Mesh")) x))
      "s->meshes = x;")))
(define model-materials
  (getter-with-setter
    (foreign-lambda*
      (c-pointer (struct "Material"))
      (((c-pointer (struct "Model")) s))
      "return(s->materials);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Model")) s) ((c-pointer (struct "Material")) x))
      "s->materials = x;")))
(define model-mesh-material
  (getter-with-setter
    (foreign-lambda*
      (c-pointer integer)
      (((c-pointer (struct "Model")) s))
      "return(s->meshMaterial);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Model")) s) ((c-pointer integer) x))
      "s->meshMaterial = x;")))
(define model-skeleton
  (getter-with-setter
    (foreign-lambda*
      (c-pointer (struct "ModelSkeleton"))
      (((c-pointer (struct "Model")) s))
      "struct ModelSkeleton * tmp = (struct ModelSkeleton *) C_malloc(sizeof(struct ModelSkeleton));\n*tmp = s->skeleton;\nreturn(tmp);;\n")
    (foreign-lambda*
      void
      (((c-pointer (struct "Model")) s)
       ((c-pointer (struct "ModelSkeleton")) x))
      "s->skeleton = *x;")))
(define model-current-pose
  (getter-with-setter
    (foreign-lambda*
      (c-pointer (struct "Transform"))
      (((c-pointer (struct "Model")) s))
      "return(s->currentPose);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Model")) s) ((c-pointer (struct "Transform")) x))
      "s->currentPose = x;")))
(define model-bone-matrices
  (getter-with-setter
    (foreign-lambda*
      (c-pointer (struct "Matrix"))
      (((c-pointer (struct "Model")) s))
      "return(s->boneMatrices);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Model")) s) ((c-pointer (struct "Matrix")) x))
      "s->boneMatrices = x;")))
(define make-model
  (foreign-lambda*
    (c-pointer (struct "Model"))
    ((f32vector transform)
     (integer meshCount)
     (integer materialCount)
     ((c-pointer (struct "Mesh")) meshes)
     ((c-pointer (struct "Material")) materials)
     ((c-pointer integer) meshMaterial)
     ((c-pointer (struct "ModelSkeleton")) skeleton)
     ((c-pointer (struct "Transform")) currentPose)
     ((c-pointer (struct "Matrix")) boneMatrices))
    "struct Model *tmp_ =  (struct Model *)C_malloc(sizeof(struct Model));\ntmp_->transform = *((Matrix*)transform);\ntmp_->meshCount = meshCount;\ntmp_->materialCount = materialCount;\ntmp_->meshes = meshes;\ntmp_->materials = materials;\ntmp_->meshMaterial = meshMaterial;\ntmp_->skeleton = *skeleton;\ntmp_->currentPose = currentPose;\ntmp_->boneMatrices = boneMatrices;\nreturn(tmp_);;\n"))
(define model-animation-bone-count
  (getter-with-setter
    (foreign-lambda*
      unsigned-integer
      (((c-pointer (struct "ModelAnimation")) s))
      "return(s->boneCount);")
    (foreign-lambda*
      void
      (((c-pointer (struct "ModelAnimation")) s) (unsigned-integer x))
      "s->boneCount = x;")))
(define model-animation-keyframe-count
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "ModelAnimation")) s))
      "return(s->keyframeCount);")
    (foreign-lambda*
      void
      (((c-pointer (struct "ModelAnimation")) s) (integer x))
      "s->keyframeCount = x;")))
(define model-animation-keyframe-poses
  (getter-with-setter
    (foreign-lambda*
      (c-pointer (c-pointer (struct "Transform")))
      (((c-pointer (struct "ModelAnimation")) s))
      "return(s->keyframePoses);")
    (foreign-lambda*
      void
      (((c-pointer (struct "ModelAnimation")) s)
       ((c-pointer (c-pointer (struct "Transform"))) x))
      "s->keyframePoses = x;")))
(define make-model-animation
  (foreign-lambda*
    (c-pointer (struct "ModelAnimation"))
    ((unsigned-integer boneCount)
     (integer keyframeCount)
     ((c-pointer (c-pointer (struct "Transform"))) keyframePoses))
    "struct ModelAnimation *tmp_ =  (struct ModelAnimation *)C_malloc(sizeof(struct ModelAnimation));\ntmp_->boneCount = boneCount;\ntmp_->keyframeCount = keyframeCount;\ntmp_->keyframePoses = keyframePoses;\nreturn(tmp_);;\n"))
(define ray-position
  (getter-with-setter
    (lambda (s)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) ((c-pointer (struct "Ray")) s))
           "*((Vector3*)out) = s->position;\n")
         out
         s)
        out))
    (foreign-lambda*
      void
      (((c-pointer (struct "Ray")) s) (f32vector x))
      "s->position = *((Vector3*)x);")))
(define ray-direction
  (getter-with-setter
    (lambda (s)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) ((c-pointer (struct "Ray")) s))
           "*((Vector3*)out) = s->direction;\n")
         out
         s)
        out))
    (foreign-lambda*
      void
      (((c-pointer (struct "Ray")) s) (f32vector x))
      "s->direction = *((Vector3*)x);")))
(define make-ray
  (foreign-lambda*
    (c-pointer (struct "Ray"))
    ((f32vector position) (f32vector direction))
    "struct Ray *tmp_ =  (struct Ray *)C_malloc(sizeof(struct Ray));\ntmp_->position = *((Vector3*)position);\ntmp_->direction = *((Vector3*)direction);\nreturn(tmp_);;\n"))
(define ray-collision-hit
  (getter-with-setter
    (foreign-lambda*
      bool
      (((c-pointer (struct "RayCollision")) s))
      "return(s->hit);")
    (foreign-lambda*
      void
      (((c-pointer (struct "RayCollision")) s) (bool x))
      "s->hit = x;")))
(define ray-collision-distance
  (getter-with-setter
    (foreign-lambda*
      float
      (((c-pointer (struct "RayCollision")) s))
      "return(s->distance);")
    (foreign-lambda*
      void
      (((c-pointer (struct "RayCollision")) s) (float x))
      "s->distance = x;")))
(define ray-collision-point
  (getter-with-setter
    (lambda (s)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) ((c-pointer (struct "RayCollision")) s))
           "*((Vector3*)out) = s->point;\n")
         out
         s)
        out))
    (foreign-lambda*
      void
      (((c-pointer (struct "RayCollision")) s) (f32vector x))
      "s->point = *((Vector3*)x);")))
(define ray-collision-normal
  (getter-with-setter
    (lambda (s)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) ((c-pointer (struct "RayCollision")) s))
           "*((Vector3*)out) = s->normal;\n")
         out
         s)
        out))
    (foreign-lambda*
      void
      (((c-pointer (struct "RayCollision")) s) (f32vector x))
      "s->normal = *((Vector3*)x);")))
(define make-ray-collision
  (foreign-lambda*
    (c-pointer (struct "RayCollision"))
    ((bool hit) (float distance) (f32vector point) (f32vector normal))
    "struct RayCollision *tmp_ =  (struct RayCollision *)C_malloc(sizeof(struct RayCollision));\ntmp_->hit = hit;\ntmp_->distance = distance;\ntmp_->point = *((Vector3*)point);\ntmp_->normal = *((Vector3*)normal);\nreturn(tmp_);;\n"))
(define bounding-box-min
  (getter-with-setter
    (lambda (s)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) ((c-pointer (struct "BoundingBox")) s))
           "*((Vector3*)out) = s->min;\n")
         out
         s)
        out))
    (foreign-lambda*
      void
      (((c-pointer (struct "BoundingBox")) s) (f32vector x))
      "s->min = *((Vector3*)x);")))
(define bounding-box-max
  (getter-with-setter
    (lambda (s)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) ((c-pointer (struct "BoundingBox")) s))
           "*((Vector3*)out) = s->max;\n")
         out
         s)
        out))
    (foreign-lambda*
      void
      (((c-pointer (struct "BoundingBox")) s) (f32vector x))
      "s->max = *((Vector3*)x);")))
(define make-bounding-box
  (foreign-lambda*
    (c-pointer (struct "BoundingBox"))
    ((f32vector min) (f32vector max))
    "struct BoundingBox *tmp_ =  (struct BoundingBox *)C_malloc(sizeof(struct BoundingBox));\ntmp_->min = *((Vector3*)min);\ntmp_->max = *((Vector3*)max);\nreturn(tmp_);;\n"))
(define wave-frame-count
  (getter-with-setter
    (foreign-lambda*
      unsigned-integer
      (((c-pointer (struct "Wave")) s))
      "return(s->frameCount);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Wave")) s) (unsigned-integer x))
      "s->frameCount = x;")))
(define wave-sample-rate
  (getter-with-setter
    (foreign-lambda*
      unsigned-integer
      (((c-pointer (struct "Wave")) s))
      "return(s->sampleRate);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Wave")) s) (unsigned-integer x))
      "s->sampleRate = x;")))
(define wave-sample-size
  (getter-with-setter
    (foreign-lambda*
      unsigned-integer
      (((c-pointer (struct "Wave")) s))
      "return(s->sampleSize);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Wave")) s) (unsigned-integer x))
      "s->sampleSize = x;")))
(define wave-channels
  (getter-with-setter
    (foreign-lambda*
      unsigned-integer
      (((c-pointer (struct "Wave")) s))
      "return(s->channels);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Wave")) s) (unsigned-integer x))
      "s->channels = x;")))
(define wave-data
  (getter-with-setter
    (foreign-lambda*
      (c-pointer void)
      (((c-pointer (struct "Wave")) s))
      "return(s->data);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Wave")) s) ((c-pointer void) x))
      "s->data = x;")))
(define make-wave
  (foreign-lambda*
    (c-pointer (struct "Wave"))
    ((unsigned-integer frameCount)
     (unsigned-integer sampleRate)
     (unsigned-integer sampleSize)
     (unsigned-integer channels)
     ((c-pointer void) data))
    "struct Wave *tmp_ =  (struct Wave *)C_malloc(sizeof(struct Wave));\ntmp_->frameCount = frameCount;\ntmp_->sampleRate = sampleRate;\ntmp_->sampleSize = sampleSize;\ntmp_->channels = channels;\ntmp_->data = data;\nreturn(tmp_);;\n"))
(define audio-stream-buffer
  (getter-with-setter
    (foreign-lambda*
      (c-pointer (struct "rAudioBuffer"))
      (((c-pointer (struct "AudioStream")) s))
      "return(s->buffer);")
    (foreign-lambda*
      void
      (((c-pointer (struct "AudioStream")) s)
       ((c-pointer (struct "rAudioBuffer")) x))
      "s->buffer = x;")))
(define audio-stream-processor
  (getter-with-setter
    (foreign-lambda*
      (c-pointer (struct "rAudioProcessor"))
      (((c-pointer (struct "AudioStream")) s))
      "return(s->processor);")
    (foreign-lambda*
      void
      (((c-pointer (struct "AudioStream")) s)
       ((c-pointer (struct "rAudioProcessor")) x))
      "s->processor = x;")))
(define audio-stream-sample-rate
  (getter-with-setter
    (foreign-lambda*
      unsigned-integer
      (((c-pointer (struct "AudioStream")) s))
      "return(s->sampleRate);")
    (foreign-lambda*
      void
      (((c-pointer (struct "AudioStream")) s) (unsigned-integer x))
      "s->sampleRate = x;")))
(define audio-stream-sample-size
  (getter-with-setter
    (foreign-lambda*
      unsigned-integer
      (((c-pointer (struct "AudioStream")) s))
      "return(s->sampleSize);")
    (foreign-lambda*
      void
      (((c-pointer (struct "AudioStream")) s) (unsigned-integer x))
      "s->sampleSize = x;")))
(define audio-stream-channels
  (getter-with-setter
    (foreign-lambda*
      unsigned-integer
      (((c-pointer (struct "AudioStream")) s))
      "return(s->channels);")
    (foreign-lambda*
      void
      (((c-pointer (struct "AudioStream")) s) (unsigned-integer x))
      "s->channels = x;")))
(define make-audio-stream
  (foreign-lambda*
    (c-pointer (struct "AudioStream"))
    (((c-pointer (struct "rAudioBuffer")) buffer)
     ((c-pointer (struct "rAudioProcessor")) processor)
     (unsigned-integer sampleRate)
     (unsigned-integer sampleSize)
     (unsigned-integer channels))
    "struct AudioStream *tmp_ =  (struct AudioStream *)C_malloc(sizeof(struct AudioStream));\ntmp_->buffer = buffer;\ntmp_->processor = processor;\ntmp_->sampleRate = sampleRate;\ntmp_->sampleSize = sampleSize;\ntmp_->channels = channels;\nreturn(tmp_);;\n"))
(define sound-stream
  (getter-with-setter
    (foreign-lambda*
      (c-pointer (struct "AudioStream"))
      (((c-pointer (struct "Sound")) s))
      "struct AudioStream * tmp = (struct AudioStream *) C_malloc(sizeof(struct AudioStream));\n*tmp = s->stream;\nreturn(tmp);;\n")
    (foreign-lambda*
      void
      (((c-pointer (struct "Sound")) s) ((c-pointer (struct "AudioStream")) x))
      "s->stream = *x;")))
(define sound-frame-count
  (getter-with-setter
    (foreign-lambda*
      unsigned-integer
      (((c-pointer (struct "Sound")) s))
      "return(s->frameCount);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Sound")) s) (unsigned-integer x))
      "s->frameCount = x;")))
(define make-sound
  (foreign-lambda*
    (c-pointer (struct "Sound"))
    (((c-pointer (struct "AudioStream")) stream) (unsigned-integer frameCount))
    "struct Sound *tmp_ =  (struct Sound *)C_malloc(sizeof(struct Sound));\ntmp_->stream = *stream;\ntmp_->frameCount = frameCount;\nreturn(tmp_);;\n"))
(define music-stream
  (getter-with-setter
    (foreign-lambda*
      (c-pointer (struct "AudioStream"))
      (((c-pointer (struct "Music")) s))
      "struct AudioStream * tmp = (struct AudioStream *) C_malloc(sizeof(struct AudioStream));\n*tmp = s->stream;\nreturn(tmp);;\n")
    (foreign-lambda*
      void
      (((c-pointer (struct "Music")) s) ((c-pointer (struct "AudioStream")) x))
      "s->stream = *x;")))
(define music-frame-count
  (getter-with-setter
    (foreign-lambda*
      unsigned-integer
      (((c-pointer (struct "Music")) s))
      "return(s->frameCount);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Music")) s) (unsigned-integer x))
      "s->frameCount = x;")))
(define music-looping
  (getter-with-setter
    (foreign-lambda*
      bool
      (((c-pointer (struct "Music")) s))
      "return(s->looping);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Music")) s) (bool x))
      "s->looping = x;")))
(define music-ctx-type
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "Music")) s))
      "return(s->ctxType);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Music")) s) (integer x))
      "s->ctxType = x;")))
(define music-ctx-data
  (getter-with-setter
    (foreign-lambda*
      (c-pointer void)
      (((c-pointer (struct "Music")) s))
      "return(s->ctxData);")
    (foreign-lambda*
      void
      (((c-pointer (struct "Music")) s) ((c-pointer void) x))
      "s->ctxData = x;")))
(define make-music
  (foreign-lambda*
    (c-pointer (struct "Music"))
    (((c-pointer (struct "AudioStream")) stream)
     (unsigned-integer frameCount)
     (bool looping)
     (integer ctxType)
     ((c-pointer void) ctxData))
    "struct Music *tmp_ =  (struct Music *)C_malloc(sizeof(struct Music));\ntmp_->stream = *stream;\ntmp_->frameCount = frameCount;\ntmp_->looping = looping;\ntmp_->ctxType = ctxType;\ntmp_->ctxData = ctxData;\nreturn(tmp_);;\n"))
(define vr-device-info-h-resolution
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "VrDeviceInfo")) s))
      "return(s->hResolution);")
    (foreign-lambda*
      void
      (((c-pointer (struct "VrDeviceInfo")) s) (integer x))
      "s->hResolution = x;")))
(define vr-device-info-v-resolution
  (getter-with-setter
    (foreign-lambda*
      integer
      (((c-pointer (struct "VrDeviceInfo")) s))
      "return(s->vResolution);")
    (foreign-lambda*
      void
      (((c-pointer (struct "VrDeviceInfo")) s) (integer x))
      "s->vResolution = x;")))
(define vr-device-info-h-screen-size
  (getter-with-setter
    (foreign-lambda*
      float
      (((c-pointer (struct "VrDeviceInfo")) s))
      "return(s->hScreenSize);")
    (foreign-lambda*
      void
      (((c-pointer (struct "VrDeviceInfo")) s) (float x))
      "s->hScreenSize = x;")))
(define vr-device-info-v-screen-size
  (getter-with-setter
    (foreign-lambda*
      float
      (((c-pointer (struct "VrDeviceInfo")) s))
      "return(s->vScreenSize);")
    (foreign-lambda*
      void
      (((c-pointer (struct "VrDeviceInfo")) s) (float x))
      "s->vScreenSize = x;")))
(define vr-device-info-eye-to-screen-distance
  (getter-with-setter
    (foreign-lambda*
      float
      (((c-pointer (struct "VrDeviceInfo")) s))
      "return(s->eyeToScreenDistance);")
    (foreign-lambda*
      void
      (((c-pointer (struct "VrDeviceInfo")) s) (float x))
      "s->eyeToScreenDistance = x;")))
(define vr-device-info-lens-separation-distance
  (getter-with-setter
    (foreign-lambda*
      float
      (((c-pointer (struct "VrDeviceInfo")) s))
      "return(s->lensSeparationDistance);")
    (foreign-lambda*
      void
      (((c-pointer (struct "VrDeviceInfo")) s) (float x))
      "s->lensSeparationDistance = x;")))
(define vr-device-info-interpupillary-distance
  (getter-with-setter
    (foreign-lambda*
      float
      (((c-pointer (struct "VrDeviceInfo")) s))
      "return(s->interpupillaryDistance);")
    (foreign-lambda*
      void
      (((c-pointer (struct "VrDeviceInfo")) s) (float x))
      "s->interpupillaryDistance = x;")))
(define make-vr-device-info
  (foreign-lambda*
    (c-pointer (struct "VrDeviceInfo"))
    ((integer hResolution)
     (integer vResolution)
     (float hScreenSize)
     (float vScreenSize)
     (float eyeToScreenDistance)
     (float lensSeparationDistance)
     (float interpupillaryDistance))
    "struct VrDeviceInfo *tmp_ =  (struct VrDeviceInfo *)C_malloc(sizeof(struct VrDeviceInfo));\ntmp_->hResolution = hResolution;\ntmp_->vResolution = vResolution;\ntmp_->hScreenSize = hScreenSize;\ntmp_->vScreenSize = vScreenSize;\ntmp_->eyeToScreenDistance = eyeToScreenDistance;\ntmp_->lensSeparationDistance = lensSeparationDistance;\ntmp_->interpupillaryDistance = interpupillaryDistance;\nreturn(tmp_);;\n"))
(define make-vr-stereo-config
  (foreign-lambda*
    (c-pointer (struct "VrStereoConfig"))
    ()
    "struct VrStereoConfig *tmp_ =  (struct VrStereoConfig *)C_malloc(sizeof(struct VrStereoConfig));\nreturn(tmp_);;\n"))
(define file-path-list-count
  (getter-with-setter
    (foreign-lambda*
      unsigned-integer
      (((c-pointer (struct "FilePathList")) s))
      "return(s->count);")
    (foreign-lambda*
      void
      (((c-pointer (struct "FilePathList")) s) (unsigned-integer x))
      "s->count = x;")))
(define file-path-list-paths
  (getter-with-setter
    (foreign-lambda*
      (c-pointer (c-pointer char))
      (((c-pointer (struct "FilePathList")) s))
      "return(s->paths);")
    (foreign-lambda*
      void
      (((c-pointer (struct "FilePathList")) s)
       ((c-pointer (c-pointer char)) x))
      "s->paths = x;")))
(define make-file-path-list
  (foreign-lambda*
    (c-pointer (struct "FilePathList"))
    ((unsigned-integer count) ((c-pointer (c-pointer char)) paths))
    "struct FilePathList *tmp_ =  (struct FilePathList *)C_malloc(sizeof(struct FilePathList));\ntmp_->count = count;\ntmp_->paths = paths;\nreturn(tmp_);;\n"))
(define automation-event-frame
  (getter-with-setter
    (foreign-lambda*
      unsigned-integer
      (((c-pointer (struct "AutomationEvent")) s))
      "return(s->frame);")
    (foreign-lambda*
      void
      (((c-pointer (struct "AutomationEvent")) s) (unsigned-integer x))
      "s->frame = x;")))
(define automation-event-type
  (getter-with-setter
    (foreign-lambda*
      unsigned-integer
      (((c-pointer (struct "AutomationEvent")) s))
      "return(s->type);")
    (foreign-lambda*
      void
      (((c-pointer (struct "AutomationEvent")) s) (unsigned-integer x))
      "s->type = x;")))
(define make-automation-event
  (foreign-lambda*
    (c-pointer (struct "AutomationEvent"))
    ((unsigned-integer frame) (unsigned-integer type))
    "struct AutomationEvent *tmp_ =  (struct AutomationEvent *)C_malloc(sizeof(struct AutomationEvent));\ntmp_->frame = frame;\ntmp_->type = type;\nreturn(tmp_);;\n"))
(define automation-event-list-capacity
  (getter-with-setter
    (foreign-lambda*
      unsigned-integer
      (((c-pointer (struct "AutomationEventList")) s))
      "return(s->capacity);")
    (foreign-lambda*
      void
      (((c-pointer (struct "AutomationEventList")) s) (unsigned-integer x))
      "s->capacity = x;")))
(define automation-event-list-count
  (getter-with-setter
    (foreign-lambda*
      unsigned-integer
      (((c-pointer (struct "AutomationEventList")) s))
      "return(s->count);")
    (foreign-lambda*
      void
      (((c-pointer (struct "AutomationEventList")) s) (unsigned-integer x))
      "s->count = x;")))
(define automation-event-list-events
  (getter-with-setter
    (foreign-lambda*
      (c-pointer (struct "AutomationEvent"))
      (((c-pointer (struct "AutomationEventList")) s))
      "return(s->events);")
    (foreign-lambda*
      void
      (((c-pointer (struct "AutomationEventList")) s)
       ((c-pointer (struct "AutomationEvent")) x))
      "s->events = x;")))
(define make-automation-event-list
  (foreign-lambda*
    (c-pointer (struct "AutomationEventList"))
    ((unsigned-integer capacity)
     (unsigned-integer count)
     ((c-pointer (struct "AutomationEvent")) events))
    "struct AutomationEventList *tmp_ =  (struct AutomationEventList *)C_malloc(sizeof(struct AutomationEventList));\ntmp_->capacity = capacity;\ntmp_->count = count;\ntmp_->events = events;\nreturn(tmp_);;\n"))
(begin
  (define init-window
    (foreign-lambda*
      void
      ((integer a0) (integer a1) (c-string a2))
      "InitWindow(a0 , a1 , a2);")))
(begin (define close-window (foreign-lambda* void () "CloseWindow();")))
(begin
  (define window-should-close
    (foreign-lambda* bool () "return(WindowShouldClose());")))
(begin
  (define is-window-ready
    (foreign-lambda* bool () "return(IsWindowReady());")))
(begin
  (define is-window-fullscreen
    (foreign-lambda* bool () "return(IsWindowFullscreen());")))
(begin
  (define is-window-hidden
    (foreign-lambda* bool () "return(IsWindowHidden());")))
(begin
  (define is-window-minimized
    (foreign-lambda* bool () "return(IsWindowMinimized());")))
(begin
  (define is-window-maximized
    (foreign-lambda* bool () "return(IsWindowMaximized());")))
(begin
  (define is-window-focused
    (foreign-lambda* bool () "return(IsWindowFocused());")))
(begin
  (define is-window-resized
    (foreign-lambda* bool () "return(IsWindowResized());")))
(begin
  (define is-window-state
    (foreign-lambda*
      bool
      ((unsigned-integer a0))
      "return(IsWindowState(a0));")))
(begin
  (define set-window-state
    (foreign-lambda* void ((unsigned-integer a0)) "SetWindowState(a0);")))
(begin
  (define clear-window-state
    (foreign-lambda* void ((unsigned-integer a0)) "ClearWindowState(a0);")))
(begin
  (define toggle-fullscreen (foreign-lambda* void () "ToggleFullscreen();")))
(begin
  (define toggle-borderless-windowed
    (foreign-lambda* void () "ToggleBorderlessWindowed();")))
(begin (define maximize-window (foreign-lambda* void () "MaximizeWindow();")))
(begin (define minimize-window (foreign-lambda* void () "MinimizeWindow();")))
(begin (define restore-window (foreign-lambda* void () "RestoreWindow();")))
(begin
  (define set-window-icon
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0))
      "SetWindowIcon(*a0);")))
(begin
  (define set-window-icons
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0) (integer a1))
      "SetWindowIcons(a0 , a1);")))
(begin
  (define set-window-title
    (foreign-lambda* void ((c-string a0)) "SetWindowTitle(a0);")))
(begin
  (define set-window-position
    (foreign-lambda*
      void
      ((integer a0) (integer a1))
      "SetWindowPosition(a0 , a1);")))
(begin
  (define set-window-monitor
    (foreign-lambda* void ((integer a0)) "SetWindowMonitor(a0);")))
(begin
  (define set-window-min-size
    (foreign-lambda*
      void
      ((integer a0) (integer a1))
      "SetWindowMinSize(a0 , a1);")))
(begin
  (define set-window-max-size
    (foreign-lambda*
      void
      ((integer a0) (integer a1))
      "SetWindowMaxSize(a0 , a1);")))
(begin
  (define set-window-size
    (foreign-lambda*
      void
      ((integer a0) (integer a1))
      "SetWindowSize(a0 , a1);")))
(begin
  (define set-window-opacity
    (foreign-lambda* void ((float a0)) "SetWindowOpacity(a0);")))
(begin
  (define set-window-focused (foreign-lambda* void () "SetWindowFocused();")))
(begin
  (define get-window-handle
    (foreign-lambda* (c-pointer void) () "return(GetWindowHandle());")))
(begin
  (define get-screen-width
    (foreign-lambda* integer () "return(GetScreenWidth());")))
(begin
  (define get-screen-height
    (foreign-lambda* integer () "return(GetScreenHeight());")))
(begin
  (define get-render-width
    (foreign-lambda* integer () "return(GetRenderWidth());")))
(begin
  (define get-render-height
    (foreign-lambda* integer () "return(GetRenderHeight());")))
(begin
  (define get-monitor-count
    (foreign-lambda* integer () "return(GetMonitorCount());")))
(begin
  (define get-current-monitor
    (foreign-lambda* integer () "return(GetCurrentMonitor());")))
(begin
  (define get-monitor-position
    (lambda (a0)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out) (integer a0))
           "*((Vector2*)out) = GetMonitorPosition(a0);\n")
         out
         a0)
        out))))
(begin
  (define get-monitor-width
    (foreign-lambda* integer ((integer a0)) "return(GetMonitorWidth(a0));")))
(begin
  (define get-monitor-height
    (foreign-lambda* integer ((integer a0)) "return(GetMonitorHeight(a0));")))
(begin
  (define get-monitor-physical-width
    (foreign-lambda*
      integer
      ((integer a0))
      "return(GetMonitorPhysicalWidth(a0));")))
(begin
  (define get-monitor-physical-height
    (foreign-lambda*
      integer
      ((integer a0))
      "return(GetMonitorPhysicalHeight(a0));")))
(begin
  (define get-monitor-refresh-rate
    (foreign-lambda*
      integer
      ((integer a0))
      "return(GetMonitorRefreshRate(a0));")))
(begin
  (define get-window-position
    (lambda ()
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out))
           "*((Vector2*)out) = GetWindowPosition();\n")
         out)
        out))))
(begin
  (define get-window-scale-dpi
    (lambda ()
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out))
           "*((Vector2*)out) = GetWindowScaleDPI();\n")
         out)
        out))))
(begin
  (define get-monitor-name
    (foreign-lambda* c-string ((integer a0)) "return(GetMonitorName(a0));")))
(begin
  (define set-clipboard-text
    (foreign-lambda* void ((c-string a0)) "SetClipboardText(a0);")))
(begin
  (define get-clipboard-text
    (foreign-lambda* c-string () "return(GetClipboardText());")))
(begin
  (define get-clipboard-image
    (foreign-lambda*
      (c-pointer (struct "Image"))
      ()
      "struct Image * tmp = (struct Image *) C_malloc(sizeof(struct Image));\n*tmp = GetClipboardImage();\nreturn(tmp);;\n")))
(begin
  (define enable-event-waiting
    (foreign-lambda* void () "EnableEventWaiting();")))
(begin
  (define disable-event-waiting
    (foreign-lambda* void () "DisableEventWaiting();")))
(begin (define show-cursor (foreign-lambda* void () "ShowCursor();")))
(begin (define hide-cursor (foreign-lambda* void () "HideCursor();")))
(begin
  (define is-cursor-hidden
    (foreign-lambda* bool () "return(IsCursorHidden());")))
(begin (define enable-cursor (foreign-lambda* void () "EnableCursor();")))
(begin (define disable-cursor (foreign-lambda* void () "DisableCursor();")))
(begin
  (define is-cursor-on-screen
    (foreign-lambda* bool () "return(IsCursorOnScreen());")))
(begin
  (define clear-background
    (foreign-lambda* void ((u8vector a0)) "ClearBackground(*((Color*)a0));")))
(begin (define begin-drawing (foreign-lambda* void () "BeginDrawing();")))
(begin (define end-drawing (foreign-lambda* void () "EndDrawing();")))
(begin
  (define begin-mode2d
    (foreign-lambda*
      void
      (((c-pointer (struct "Camera2D")) a0))
      "BeginMode2D(*a0);")))
(begin (define end-mode2d (foreign-lambda* void () "EndMode2D();")))
(begin
  (define begin-mode3d
    (foreign-lambda*
      void
      (((c-pointer (struct "Camera3D")) a0))
      "BeginMode3D(*a0);")))
(begin (define end-mode3d (foreign-lambda* void () "EndMode3D();")))
(begin
  (define begin-texture-mode
    (foreign-lambda*
      void
      (((c-pointer (struct "RenderTexture")) a0))
      "BeginTextureMode(*a0);")))
(begin (define end-texture-mode (foreign-lambda* void () "EndTextureMode();")))
(begin
  (define begin-shader-mode
    (foreign-lambda*
      void
      (((c-pointer (struct "Shader")) a0))
      "BeginShaderMode(*a0);")))
(begin (define end-shader-mode (foreign-lambda* void () "EndShaderMode();")))
(begin
  (define begin-blend-mode
    (foreign-lambda* void ((integer a0)) "BeginBlendMode(a0);")))
(begin (define end-blend-mode (foreign-lambda* void () "EndBlendMode();")))
(begin
  (define begin-scissor-mode
    (foreign-lambda*
      void
      ((integer a0) (integer a1) (integer a2) (integer a3))
      "BeginScissorMode(a0 , a1 , a2 , a3);")))
(begin (define end-scissor-mode (foreign-lambda* void () "EndScissorMode();")))
(begin
  (define begin-vr-stereo-mode
    (foreign-lambda*
      void
      (((c-pointer (struct "VrStereoConfig")) a0))
      "BeginVrStereoMode(*a0);")))
(begin
  (define end-vr-stereo-mode (foreign-lambda* void () "EndVrStereoMode();")))
(begin
  (define load-vr-stereo-config
    (foreign-lambda*
      (c-pointer (struct "VrStereoConfig"))
      (((c-pointer (struct "VrDeviceInfo")) a0))
      "struct VrStereoConfig * tmp = (struct VrStereoConfig *) C_malloc(sizeof(struct VrStereoConfig));\n*tmp = LoadVrStereoConfig(*a0);\nreturn(tmp);;\n")))
(begin
  (define unload-vr-stereo-config
    (foreign-lambda*
      void
      (((c-pointer (struct "VrStereoConfig")) a0))
      "UnloadVrStereoConfig(*a0);")))
(begin
  (define load-shader
    (foreign-lambda*
      (c-pointer (struct "Shader"))
      ((c-string a0) (c-string a1))
      "struct Shader * tmp = (struct Shader *) C_malloc(sizeof(struct Shader));\n*tmp = LoadShader(a0 , a1);\nreturn(tmp);;\n")))
(begin
  (define load-shader-from-memory
    (foreign-lambda*
      (c-pointer (struct "Shader"))
      ((c-string a0) (c-string a1))
      "struct Shader * tmp = (struct Shader *) C_malloc(sizeof(struct Shader));\n*tmp = LoadShaderFromMemory(a0 , a1);\nreturn(tmp);;\n")))
(begin
  (define is-shader-valid
    (foreign-lambda*
      bool
      (((c-pointer (struct "Shader")) a0))
      "return(IsShaderValid(*a0));")))
(begin
  (define get-shader-location
    (foreign-lambda*
      integer
      (((c-pointer (struct "Shader")) a0) (c-string a1))
      "return(GetShaderLocation(*a0 , a1));")))
(begin
  (define get-shader-location-attrib
    (foreign-lambda*
      integer
      (((c-pointer (struct "Shader")) a0) (c-string a1))
      "return(GetShaderLocationAttrib(*a0 , a1));")))
(begin
  (define set-shader-value
    (foreign-lambda*
      void
      (((c-pointer (struct "Shader")) a0)
       (integer a1)
       ((c-pointer void) a2)
       (integer a3))
      "SetShaderValue(*a0 , a1 , a2 , a3);")))
(begin
  (define set-shader-value-v
    (foreign-lambda*
      void
      (((c-pointer (struct "Shader")) a0)
       (integer a1)
       ((c-pointer void) a2)
       (integer a3)
       (integer a4))
      "SetShaderValueV(*a0 , a1 , a2 , a3 , a4);")))
(begin
  (define set-shader-value-matrix
    (foreign-lambda*
      void
      (((c-pointer (struct "Shader")) a0) (integer a1) (f32vector a2))
      "SetShaderValueMatrix(*a0 , a1 , *((Matrix*)a2));")))
(begin
  (define set-shader-value-texture
    (foreign-lambda*
      void
      (((c-pointer (struct "Shader")) a0)
       (integer a1)
       ((c-pointer (struct "Texture")) a2))
      "SetShaderValueTexture(*a0 , a1 , *a2);")))
(begin
  (define unload-shader
    (foreign-lambda*
      void
      (((c-pointer (struct "Shader")) a0))
      "UnloadShader(*a0);")))
(begin
  (define get-screen-to-world-ray
    (foreign-lambda*
      (c-pointer (struct "Ray"))
      ((f32vector a0) ((c-pointer (struct "Camera3D")) a1))
      "struct Ray * tmp = (struct Ray *) C_malloc(sizeof(struct Ray));\n*tmp = GetScreenToWorldRay(*((Vector2*)a0) , *a1);\nreturn(tmp);;\n")))
(begin
  (define get-screen-to-world-ray-ex
    (foreign-lambda*
      (c-pointer (struct "Ray"))
      ((f32vector a0)
       ((c-pointer (struct "Camera3D")) a1)
       (integer a2)
       (integer a3))
      "struct Ray * tmp = (struct Ray *) C_malloc(sizeof(struct Ray));\n*tmp = GetScreenToWorldRayEx(*((Vector2*)a0) , *a1 , a2 , a3);\nreturn(tmp);;\n")))
(begin
  (define get-world-to-screen
    (lambda (a0 a1)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out)
            (f32vector a0)
            ((c-pointer (struct "Camera3D")) a1))
           "*((Vector2*)out) = GetWorldToScreen(*((Vector3*)a0) , *a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define get-world-to-screen-ex
    (lambda (a0 a1 a2 a3)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out)
            (f32vector a0)
            ((c-pointer (struct "Camera3D")) a1)
            (integer a2)
            (integer a3))
           "*((Vector2*)out) = GetWorldToScreenEx(*((Vector3*)a0) , *a1 , a2 , a3);\n")
         out
         a0
         a1
         a2
         a3)
        out))))
(begin
  (define get-world-to-screen2d
    (lambda (a0 a1)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out)
            (f32vector a0)
            ((c-pointer (struct "Camera2D")) a1))
           "*((Vector2*)out) = GetWorldToScreen2D(*((Vector2*)a0) , *a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define get-screen-to-world2d
    (lambda (a0 a1)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out)
            (f32vector a0)
            ((c-pointer (struct "Camera2D")) a1))
           "*((Vector2*)out) = GetScreenToWorld2D(*((Vector2*)a0) , *a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define get-camera-matrix
    (lambda (a0)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out) ((c-pointer (struct "Camera3D")) a0))
           "*((Matrix*)out) = GetCameraMatrix(*a0);\n")
         out
         a0)
        out))))
(begin
  (define get-camera-matrix2d
    (lambda (a0)
      (let ((out (make-f32vector 16)))
        ((foreign-lambda*
           void
           ((f32vector out) ((c-pointer (struct "Camera2D")) a0))
           "*((Matrix*)out) = GetCameraMatrix2D(*a0);\n")
         out
         a0)
        out))))
(begin
  (define set-target-fps
    (foreign-lambda* void ((integer a0)) "SetTargetFPS(a0);")))
(begin
  (define get-frame-time (foreign-lambda* float () "return(GetFrameTime());")))
(begin (define get-time (foreign-lambda* double () "return(GetTime());")))
(begin (define get-fps (foreign-lambda* integer () "return(GetFPS());")))
(begin
  (define swap-screen-buffer (foreign-lambda* void () "SwapScreenBuffer();")))
(begin
  (define poll-input-events (foreign-lambda* void () "PollInputEvents();")))
(begin (define wait-time (foreign-lambda* void ((double a0)) "WaitTime(a0);")))
(begin
  (define set-random-seed
    (foreign-lambda* void ((unsigned-integer a0)) "SetRandomSeed(a0);")))
(begin
  (define get-random-value
    (foreign-lambda*
      integer
      ((integer a0) (integer a1))
      "return(GetRandomValue(a0 , a1));")))
(begin
  (define load-random-sequence
    (foreign-lambda*
      (c-pointer integer)
      ((unsigned-integer a0) (integer a1) (integer a2))
      "return(LoadRandomSequence(a0 , a1 , a2));")))
(begin
  (define unload-random-sequence
    (foreign-lambda* void ((s32vector a0)) "UnloadRandomSequence(a0);")))
(begin
  (define take-screenshot
    (foreign-lambda* void ((c-string a0)) "TakeScreenshot(a0);")))
(begin
  (define set-config-flags
    (foreign-lambda* void ((unsigned-integer a0)) "SetConfigFlags(a0);")))
(begin (define open-url (foreign-lambda* void ((c-string a0)) "OpenURL(a0);")))
(begin
  (define set-trace-log-level
    (foreign-lambda* void ((integer a0)) "SetTraceLogLevel(a0);")))
(begin
  (define trace-log
    (foreign-lambda* void ((integer a0) (c-string a1)) "TraceLog(a0 , a1);")))
(begin
  (define mem-alloc
    (foreign-lambda*
      (c-pointer void)
      ((unsigned-integer a0))
      "return(MemAlloc(a0));")))
(begin
  (define mem-realloc
    (foreign-lambda*
      (c-pointer void)
      (((c-pointer void) a0) (unsigned-integer a1))
      "return(MemRealloc(a0 , a1));")))
(begin
  (define mem-free
    (foreign-lambda* void (((c-pointer void) a0)) "MemFree(a0);")))
(begin
  (define load-file-data
    (foreign-lambda*
      (c-pointer unsigned-char)
      ((c-string a0) (s32vector a1))
      "return(LoadFileData(a0 , a1));")))
(begin
  (define unload-file-data
    (foreign-lambda* void ((u8vector a0)) "UnloadFileData(a0);")))
(begin
  (define save-file-data
    (foreign-lambda*
      bool
      ((c-string a0) ((c-pointer void) a1) (integer a2))
      "return(SaveFileData(a0 , a1 , a2));")))
(begin
  (define export-data-as-code
    (foreign-lambda*
      bool
      ((u8vector a0) (integer a1) (c-string a2))
      "return(ExportDataAsCode(a0 , a1 , a2));")))
(begin
  (define load-file-text
    (foreign-lambda* c-string ((c-string a0)) "return(LoadFileText(a0));")))
(begin
  (define unload-file-text
    (foreign-lambda* void ((c-string a0)) "UnloadFileText(a0);")))
(begin
  (define save-file-text
    (foreign-lambda*
      bool
      ((c-string a0) (c-string a1))
      "return(SaveFileText(a0 , a1));")))
(begin
  (define file-rename
    (foreign-lambda*
      integer
      ((c-string a0) (c-string a1))
      "return(FileRename(a0 , a1));")))
(begin
  (define file-remove
    (foreign-lambda* integer ((c-string a0)) "return(FileRemove(a0));")))
(begin
  (define file-copy
    (foreign-lambda*
      integer
      ((c-string a0) (c-string a1))
      "return(FileCopy(a0 , a1));")))
(begin
  (define file-move
    (foreign-lambda*
      integer
      ((c-string a0) (c-string a1))
      "return(FileMove(a0 , a1));")))
(begin
  (define file-text-replace
    (foreign-lambda*
      integer
      ((c-string a0) (c-string a1) (c-string a2))
      "return(FileTextReplace(a0 , a1 , a2));")))
(begin
  (define file-text-find-index
    (foreign-lambda*
      integer
      ((c-string a0) (c-string a1))
      "return(FileTextFindIndex(a0 , a1));")))
(begin
  (define file-exists
    (foreign-lambda* bool ((c-string a0)) "return(FileExists(a0));")))
(begin
  (define directory-exists
    (foreign-lambda* bool ((c-string a0)) "return(DirectoryExists(a0));")))
(begin
  (define is-file-extension
    (foreign-lambda*
      bool
      ((c-string a0) (c-string a1))
      "return(IsFileExtension(a0 , a1));")))
(begin
  (define is-file-hidden
    (foreign-lambda* bool ((c-string a0)) "return(IsFileHidden(a0));")))
(begin
  (define get-file-length
    (foreign-lambda* integer ((c-string a0)) "return(GetFileLength(a0));")))
(begin
  (define get-file-mod-time
    (foreign-lambda* long ((c-string a0)) "return(GetFileModTime(a0));")))
(begin
  (define get-file-extension
    (foreign-lambda*
      c-string
      ((c-string a0))
      "return(GetFileExtension(a0));")))
(begin
  (define get-file-name
    (foreign-lambda* c-string ((c-string a0)) "return(GetFileName(a0));")))
(begin
  (define get-file-name-without-ext
    (foreign-lambda*
      c-string
      ((c-string a0))
      "return(GetFileNameWithoutExt(a0));")))
(begin
  (define get-directory-path
    (foreign-lambda*
      c-string
      ((c-string a0))
      "return(GetDirectoryPath(a0));")))
(begin
  (define get-prev-directory-path
    (foreign-lambda*
      c-string
      ((c-string a0))
      "return(GetPrevDirectoryPath(a0));")))
(begin
  (define get-working-directory
    (foreign-lambda* c-string () "return(GetWorkingDirectory());")))
(begin
  (define get-application-directory
    (foreign-lambda* c-string () "return(GetApplicationDirectory());")))
(begin
  (define make-directory
    (foreign-lambda* integer ((c-string a0)) "return(MakeDirectory(a0));")))
(begin
  (define change-directory
    (foreign-lambda* integer ((c-string a0)) "return(ChangeDirectory(a0));")))
(begin
  (define is-path-file
    (foreign-lambda* bool ((c-string a0)) "return(IsPathFile(a0));")))
(begin
  (define is-path-directory
    (foreign-lambda* bool ((c-string a0)) "return(IsPathDirectory(a0));")))
(begin
  (define is-path-absolute
    (foreign-lambda* bool ((c-string a0)) "return(IsPathAbsolute(a0));")))
(begin
  (define is-file-name-valid
    (foreign-lambda* bool ((c-string a0)) "return(IsFileNameValid(a0));")))
(begin
  (define load-directory-files
    (foreign-lambda*
      (c-pointer (struct "FilePathList"))
      ((c-string a0))
      "struct FilePathList * tmp = (struct FilePathList *) C_malloc(sizeof(struct FilePathList));\n*tmp = LoadDirectoryFiles(a0);\nreturn(tmp);;\n")))
(begin
  (define load-directory-files-ex
    (foreign-lambda*
      (c-pointer (struct "FilePathList"))
      ((c-string a0) (c-string a1) (bool a2))
      "struct FilePathList * tmp = (struct FilePathList *) C_malloc(sizeof(struct FilePathList));\n*tmp = LoadDirectoryFilesEx(a0 , a1 , a2);\nreturn(tmp);;\n")))
(begin
  (define unload-directory-files
    (foreign-lambda*
      void
      (((c-pointer (struct "FilePathList")) a0))
      "UnloadDirectoryFiles(*a0);")))
(begin
  (define is-file-dropped
    (foreign-lambda* bool () "return(IsFileDropped());")))
(begin
  (define load-dropped-files
    (foreign-lambda*
      (c-pointer (struct "FilePathList"))
      ()
      "struct FilePathList * tmp = (struct FilePathList *) C_malloc(sizeof(struct FilePathList));\n*tmp = LoadDroppedFiles();\nreturn(tmp);;\n")))
(begin
  (define unload-dropped-files
    (foreign-lambda*
      void
      (((c-pointer (struct "FilePathList")) a0))
      "UnloadDroppedFiles(*a0);")))
(begin
  (define get-directory-file-count
    (foreign-lambda*
      unsigned-integer
      ((c-string a0))
      "return(GetDirectoryFileCount(a0));")))
(begin
  (define get-directory-file-count-ex
    (foreign-lambda*
      unsigned-integer
      ((c-string a0) (c-string a1) (bool a2))
      "return(GetDirectoryFileCountEx(a0 , a1 , a2));")))
(begin
  (define compress-data
    (foreign-lambda*
      (c-pointer unsigned-char)
      ((u8vector a0) (integer a1) (s32vector a2))
      "return(CompressData(a0 , a1 , a2));")))
(begin
  (define decompress-data
    (foreign-lambda*
      (c-pointer unsigned-char)
      ((u8vector a0) (integer a1) (s32vector a2))
      "return(DecompressData(a0 , a1 , a2));")))
(begin
  (define encode-data-base64
    (foreign-lambda*
      c-string
      ((u8vector a0) (integer a1) (s32vector a2))
      "return(EncodeDataBase64(a0 , a1 , a2));")))
(begin
  (define decode-data-base64
    (foreign-lambda*
      (c-pointer unsigned-char)
      ((c-string a0) (s32vector a1))
      "return(DecodeDataBase64(a0 , a1));")))
(begin
  (define compute-crc32
    (foreign-lambda*
      unsigned-integer
      ((u8vector a0) (integer a1))
      "return(ComputeCRC32(a0 , a1));")))
(begin
  (define compute-md5
    (foreign-lambda*
      (c-pointer unsigned-integer)
      ((u8vector a0) (integer a1))
      "return(ComputeMD5(a0 , a1));")))
(begin
  (define compute-sha1
    (foreign-lambda*
      (c-pointer unsigned-integer)
      ((u8vector a0) (integer a1))
      "return(ComputeSHA1(a0 , a1));")))
(begin
  (define compute-sha256
    (foreign-lambda*
      (c-pointer unsigned-integer)
      ((u8vector a0) (integer a1))
      "return(ComputeSHA256(a0 , a1));")))
(begin
  (define load-automation-event-list
    (foreign-lambda*
      (c-pointer (struct "AutomationEventList"))
      ((c-string a0))
      "struct AutomationEventList * tmp = (struct AutomationEventList *) C_malloc(sizeof(struct AutomationEventList));\n*tmp = LoadAutomationEventList(a0);\nreturn(tmp);;\n")))
(begin
  (define unload-automation-event-list
    (foreign-lambda*
      void
      (((c-pointer (struct "AutomationEventList")) a0))
      "UnloadAutomationEventList(*a0);")))
(begin
  (define export-automation-event-list
    (foreign-lambda*
      bool
      (((c-pointer (struct "AutomationEventList")) a0) (c-string a1))
      "return(ExportAutomationEventList(*a0 , a1));")))
(begin
  (define set-automation-event-list
    (foreign-lambda*
      void
      (((c-pointer (struct "AutomationEventList")) a0))
      "SetAutomationEventList(a0);")))
(begin
  (define set-automation-event-base-frame
    (foreign-lambda* void ((integer a0)) "SetAutomationEventBaseFrame(a0);")))
(begin
  (define start-automation-event-recording
    (foreign-lambda* void () "StartAutomationEventRecording();")))
(begin
  (define stop-automation-event-recording
    (foreign-lambda* void () "StopAutomationEventRecording();")))
(begin
  (define play-automation-event
    (foreign-lambda*
      void
      (((c-pointer (struct "AutomationEvent")) a0))
      "PlayAutomationEvent(*a0);")))
(begin
  (define is-key-pressed
    (foreign-lambda* bool ((integer a0)) "return(IsKeyPressed(a0));")))
(begin
  (define is-key-pressed-repeat
    (foreign-lambda* bool ((integer a0)) "return(IsKeyPressedRepeat(a0));")))
(begin
  (define is-key-down
    (foreign-lambda* bool ((integer a0)) "return(IsKeyDown(a0));")))
(begin
  (define is-key-released
    (foreign-lambda* bool ((integer a0)) "return(IsKeyReleased(a0));")))
(begin
  (define is-key-up
    (foreign-lambda* bool ((integer a0)) "return(IsKeyUp(a0));")))
(begin
  (define get-key-pressed
    (foreign-lambda* integer () "return(GetKeyPressed());")))
(begin
  (define get-char-pressed
    (foreign-lambda* integer () "return(GetCharPressed());")))
(begin
  (define get-key-name
    (foreign-lambda* c-string ((integer a0)) "return(GetKeyName(a0));")))
(begin
  (define set-exit-key
    (foreign-lambda* void ((integer a0)) "SetExitKey(a0);")))
(begin
  (define is-gamepad-available
    (foreign-lambda* bool ((integer a0)) "return(IsGamepadAvailable(a0));")))
(begin
  (define get-gamepad-name
    (foreign-lambda* c-string ((integer a0)) "return(GetGamepadName(a0));")))
(begin
  (define is-gamepad-button-pressed
    (foreign-lambda*
      bool
      ((integer a0) (integer a1))
      "return(IsGamepadButtonPressed(a0 , a1));")))
(begin
  (define is-gamepad-button-down
    (foreign-lambda*
      bool
      ((integer a0) (integer a1))
      "return(IsGamepadButtonDown(a0 , a1));")))
(begin
  (define is-gamepad-button-released
    (foreign-lambda*
      bool
      ((integer a0) (integer a1))
      "return(IsGamepadButtonReleased(a0 , a1));")))
(begin
  (define is-gamepad-button-up
    (foreign-lambda*
      bool
      ((integer a0) (integer a1))
      "return(IsGamepadButtonUp(a0 , a1));")))
(begin
  (define get-gamepad-button-pressed
    (foreign-lambda* integer () "return(GetGamepadButtonPressed());")))
(begin
  (define get-gamepad-axis-count
    (foreign-lambda*
      integer
      ((integer a0))
      "return(GetGamepadAxisCount(a0));")))
(begin
  (define get-gamepad-axis-movement
    (foreign-lambda*
      float
      ((integer a0) (integer a1))
      "return(GetGamepadAxisMovement(a0 , a1));")))
(begin
  (define set-gamepad-mappings
    (foreign-lambda*
      integer
      ((c-string a0))
      "return(SetGamepadMappings(a0));")))
(begin
  (define set-gamepad-vibration
    (foreign-lambda*
      void
      ((integer a0) (float a1) (float a2) (float a3))
      "SetGamepadVibration(a0 , a1 , a2 , a3);")))
(begin
  (define is-mouse-button-pressed
    (foreign-lambda* bool ((integer a0)) "return(IsMouseButtonPressed(a0));")))
(begin
  (define is-mouse-button-down
    (foreign-lambda* bool ((integer a0)) "return(IsMouseButtonDown(a0));")))
(begin
  (define is-mouse-button-released
    (foreign-lambda*
      bool
      ((integer a0))
      "return(IsMouseButtonReleased(a0));")))
(begin
  (define is-mouse-button-up
    (foreign-lambda* bool ((integer a0)) "return(IsMouseButtonUp(a0));")))
(begin
  (define get-mouse-x (foreign-lambda* integer () "return(GetMouseX());")))
(begin
  (define get-mouse-y (foreign-lambda* integer () "return(GetMouseY());")))
(begin
  (define get-mouse-position
    (lambda ()
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out))
           "*((Vector2*)out) = GetMousePosition();\n")
         out)
        out))))
(begin
  (define get-mouse-delta
    (lambda ()
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out))
           "*((Vector2*)out) = GetMouseDelta();\n")
         out)
        out))))
(begin
  (define set-mouse-position
    (foreign-lambda*
      void
      ((integer a0) (integer a1))
      "SetMousePosition(a0 , a1);")))
(begin
  (define set-mouse-offset
    (foreign-lambda*
      void
      ((integer a0) (integer a1))
      "SetMouseOffset(a0 , a1);")))
(begin
  (define set-mouse-scale
    (foreign-lambda* void ((float a0) (float a1)) "SetMouseScale(a0 , a1);")))
(begin
  (define get-mouse-wheel-move
    (foreign-lambda* float () "return(GetMouseWheelMove());")))
(begin
  (define get-mouse-wheel-move-v
    (lambda ()
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out))
           "*((Vector2*)out) = GetMouseWheelMoveV();\n")
         out)
        out))))
(begin
  (define set-mouse-cursor
    (foreign-lambda* void ((integer a0)) "SetMouseCursor(a0);")))
(begin
  (define get-touch-x (foreign-lambda* integer () "return(GetTouchX());")))
(begin
  (define get-touch-y (foreign-lambda* integer () "return(GetTouchY());")))
(begin
  (define get-touch-position
    (lambda (a0)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out) (integer a0))
           "*((Vector2*)out) = GetTouchPosition(a0);\n")
         out
         a0)
        out))))
(begin
  (define get-touch-point-id
    (foreign-lambda* integer ((integer a0)) "return(GetTouchPointId(a0));")))
(begin
  (define get-touch-point-count
    (foreign-lambda* integer () "return(GetTouchPointCount());")))
(begin
  (define set-gestures-enabled
    (foreign-lambda* void ((unsigned-integer a0)) "SetGesturesEnabled(a0);")))
(begin
  (define is-gesture-detected
    (foreign-lambda*
      bool
      ((unsigned-integer a0))
      "return(IsGestureDetected(a0));")))
(begin
  (define get-gesture-detected
    (foreign-lambda* integer () "return(GetGestureDetected());")))
(begin
  (define get-gesture-hold-duration
    (foreign-lambda* float () "return(GetGestureHoldDuration());")))
(begin
  (define get-gesture-drag-vector
    (lambda ()
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out))
           "*((Vector2*)out) = GetGestureDragVector();\n")
         out)
        out))))
(begin
  (define get-gesture-drag-angle
    (foreign-lambda* float () "return(GetGestureDragAngle());")))
(begin
  (define get-gesture-pinch-vector
    (lambda ()
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out))
           "*((Vector2*)out) = GetGesturePinchVector();\n")
         out)
        out))))
(begin
  (define get-gesture-pinch-angle
    (foreign-lambda* float () "return(GetGesturePinchAngle());")))
(begin
  (define update-camera
    (foreign-lambda*
      void
      (((c-pointer (struct "Camera3D")) a0) (integer a1))
      "UpdateCamera(a0 , a1);")))
(begin
  (define update-camera-pro
    (foreign-lambda*
      void
      (((c-pointer (struct "Camera3D")) a0)
       (f32vector a1)
       (f32vector a2)
       (float a3))
      "UpdateCameraPro(a0 , *((Vector3*)a1) , *((Vector3*)a2) , a3);")))
(begin
  (define set-shapes-texture
    (foreign-lambda*
      void
      (((c-pointer (struct "Texture")) a0) (f32vector a1))
      "SetShapesTexture(*a0 , *((Rectangle*)a1));")))
(begin
  (define get-shapes-texture
    (foreign-lambda*
      (c-pointer (struct "Texture"))
      ()
      "struct Texture * tmp = (struct Texture *) C_malloc(sizeof(struct Texture));\n*tmp = GetShapesTexture();\nreturn(tmp);;\n")))
(begin
  (define get-shapes-texture-rectangle
    (lambda ()
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out))
           "*((Rectangle*)out) = GetShapesTextureRectangle();\n")
         out)
        out))))
(begin
  (define draw-pixel
    (foreign-lambda*
      void
      ((integer a0) (integer a1) (u8vector a2))
      "DrawPixel(a0 , a1 , *((Color*)a2));")))
(begin
  (define draw-pixel-v
    (foreign-lambda*
      void
      ((f32vector a0) (u8vector a1))
      "DrawPixelV(*((Vector2*)a0) , *((Color*)a1));")))
(begin
  (define draw-line
    (foreign-lambda*
      void
      ((integer a0) (integer a1) (integer a2) (integer a3) (u8vector a4))
      "DrawLine(a0 , a1 , a2 , a3 , *((Color*)a4));")))
(begin
  (define draw-line-v
    (foreign-lambda*
      void
      ((f32vector a0) (f32vector a1) (u8vector a2))
      "DrawLineV(*((Vector2*)a0) , *((Vector2*)a1) , *((Color*)a2));")))
(begin
  (define draw-line-ex
    (foreign-lambda*
      void
      ((f32vector a0) (f32vector a1) (float a2) (u8vector a3))
      "DrawLineEx(*((Vector2*)a0) , *((Vector2*)a1) , a2 , *((Color*)a3));")))
(begin
  (define draw-line-strip
    (foreign-lambda*
      void
      (((c-pointer (struct "Vector2")) a0) (integer a1) (u8vector a2))
      "DrawLineStrip(a0 , a1 , *((Color*)a2));")))
(begin
  (define draw-line-bezier
    (foreign-lambda*
      void
      ((f32vector a0) (f32vector a1) (float a2) (u8vector a3))
      "DrawLineBezier(*((Vector2*)a0) , *((Vector2*)a1) , a2 , *((Color*)a3));")))
(begin
  (define draw-line-dashed
    (foreign-lambda*
      void
      ((f32vector a0) (f32vector a1) (integer a2) (integer a3) (u8vector a4))
      "DrawLineDashed(*((Vector2*)a0) , *((Vector2*)a1) , a2 , a3 , *((Color*)a4));")))
(begin
  (define draw-triangle
    (foreign-lambda*
      void
      ((f32vector a0) (f32vector a1) (f32vector a2) (u8vector a3))
      "DrawTriangle(*((Vector2*)a0) , *((Vector2*)a1) , *((Vector2*)a2) , *((Color*)a3));")))
(begin
  (define draw-triangle-gradient
    (foreign-lambda*
      void
      ((f32vector a0)
       (f32vector a1)
       (f32vector a2)
       (u8vector a3)
       (u8vector a4)
       (u8vector a5))
      "DrawTriangleGradient(*((Vector2*)a0) , *((Vector2*)a1) , *((Vector2*)a2) , *((Color*)a3) , *((Color*)a4) , *((Color*)a5));")))
(begin
  (define draw-triangle-lines
    (foreign-lambda*
      void
      ((f32vector a0) (f32vector a1) (f32vector a2) (u8vector a3))
      "DrawTriangleLines(*((Vector2*)a0) , *((Vector2*)a1) , *((Vector2*)a2) , *((Color*)a3));")))
(begin
  (define draw-triangle-lines-ex
    (foreign-lambda*
      void
      ((f32vector a0) (f32vector a1) (f32vector a2) (float a3) (u8vector a4))
      "DrawTriangleLinesEx(*((Vector2*)a0) , *((Vector2*)a1) , *((Vector2*)a2) , a3 , *((Color*)a4));")))
(begin
  (define draw-triangle-fan
    (foreign-lambda*
      void
      (((c-pointer (struct "Vector2")) a0) (integer a1) (u8vector a2))
      "DrawTriangleFan(a0 , a1 , *((Color*)a2));")))
(begin
  (define draw-triangle-strip
    (foreign-lambda*
      void
      (((c-pointer (struct "Vector2")) a0) (integer a1) (u8vector a2))
      "DrawTriangleStrip(a0 , a1 , *((Color*)a2));")))
(begin
  (define draw-rectangle
    (foreign-lambda*
      void
      ((integer a0) (integer a1) (integer a2) (integer a3) (u8vector a4))
      "DrawRectangle(a0 , a1 , a2 , a3 , *((Color*)a4));")))
(begin
  (define draw-rectangle-v
    (foreign-lambda*
      void
      ((f32vector a0) (f32vector a1) (u8vector a2))
      "DrawRectangleV(*((Vector2*)a0) , *((Vector2*)a1) , *((Color*)a2));")))
(begin
  (define draw-rectangle-rec
    (foreign-lambda*
      void
      ((f32vector a0) (u8vector a1))
      "DrawRectangleRec(*((Rectangle*)a0) , *((Color*)a1));")))
(begin
  (define draw-rectangle-pro
    (foreign-lambda*
      void
      ((f32vector a0) (f32vector a1) (float a2) (u8vector a3))
      "DrawRectanglePro(*((Rectangle*)a0) , *((Vector2*)a1) , a2 , *((Color*)a3));")))
(begin
  (define draw-rectangle-gradient-v
    (foreign-lambda*
      void
      ((integer a0)
       (integer a1)
       (integer a2)
       (integer a3)
       (u8vector a4)
       (u8vector a5))
      "DrawRectangleGradientV(a0 , a1 , a2 , a3 , *((Color*)a4) , *((Color*)a5));")))
(begin
  (define draw-rectangle-gradient-h
    (foreign-lambda*
      void
      ((integer a0)
       (integer a1)
       (integer a2)
       (integer a3)
       (u8vector a4)
       (u8vector a5))
      "DrawRectangleGradientH(a0 , a1 , a2 , a3 , *((Color*)a4) , *((Color*)a5));")))
(begin
  (define draw-rectangle-gradient-ex
    (foreign-lambda*
      void
      ((f32vector a0) (u8vector a1) (u8vector a2) (u8vector a3) (u8vector a4))
      "DrawRectangleGradientEx(*((Rectangle*)a0) , *((Color*)a1) , *((Color*)a2) , *((Color*)a3) , *((Color*)a4));")))
(begin
  (define draw-rectangle-lines
    (foreign-lambda*
      void
      ((integer a0) (integer a1) (integer a2) (integer a3) (u8vector a4))
      "DrawRectangleLines(a0 , a1 , a2 , a3 , *((Color*)a4));")))
(begin
  (define draw-rectangle-lines-ex
    (foreign-lambda*
      void
      ((f32vector a0) (float a1) (u8vector a2))
      "DrawRectangleLinesEx(*((Rectangle*)a0) , a1 , *((Color*)a2));")))
(begin
  (define draw-rectangle-rounded
    (foreign-lambda*
      void
      ((f32vector a0) (float a1) (integer a2) (u8vector a3))
      "DrawRectangleRounded(*((Rectangle*)a0) , a1 , a2 , *((Color*)a3));")))
(begin
  (define draw-rectangle-rounded-lines
    (foreign-lambda*
      void
      ((f32vector a0) (float a1) (integer a2) (u8vector a3))
      "DrawRectangleRoundedLines(*((Rectangle*)a0) , a1 , a2 , *((Color*)a3));")))
(begin
  (define draw-rectangle-rounded-lines-ex
    (foreign-lambda*
      void
      ((f32vector a0) (float a1) (integer a2) (float a3) (u8vector a4))
      "DrawRectangleRoundedLinesEx(*((Rectangle*)a0) , a1 , a2 , a3 , *((Color*)a4));")))
(begin
  (define draw-poly
    (foreign-lambda*
      void
      ((f32vector a0) (integer a1) (float a2) (float a3) (u8vector a4))
      "DrawPoly(*((Vector2*)a0) , a1 , a2 , a3 , *((Color*)a4));")))
(begin
  (define draw-poly-lines
    (foreign-lambda*
      void
      ((f32vector a0) (integer a1) (float a2) (float a3) (u8vector a4))
      "DrawPolyLines(*((Vector2*)a0) , a1 , a2 , a3 , *((Color*)a4));")))
(begin
  (define draw-poly-lines-ex
    (foreign-lambda*
      void
      ((f32vector a0)
       (integer a1)
       (float a2)
       (float a3)
       (float a4)
       (u8vector a5))
      "DrawPolyLinesEx(*((Vector2*)a0) , a1 , a2 , a3 , a4 , *((Color*)a5));")))
(begin
  (define draw-circle
    (foreign-lambda*
      void
      ((integer a0) (integer a1) (float a2) (u8vector a3))
      "DrawCircle(a0 , a1 , a2 , *((Color*)a3));")))
(begin
  (define draw-circle-v
    (foreign-lambda*
      void
      ((f32vector a0) (float a1) (u8vector a2))
      "DrawCircleV(*((Vector2*)a0) , a1 , *((Color*)a2));")))
(begin
  (define draw-circle-gradient
    (foreign-lambda*
      void
      ((f32vector a0) (float a1) (u8vector a2) (u8vector a3))
      "DrawCircleGradient(*((Vector2*)a0) , a1 , *((Color*)a2) , *((Color*)a3));")))
(begin
  (define draw-circle-sector
    (foreign-lambda*
      void
      ((f32vector a0)
       (float a1)
       (float a2)
       (float a3)
       (integer a4)
       (u8vector a5))
      "DrawCircleSector(*((Vector2*)a0) , a1 , a2 , a3 , a4 , *((Color*)a5));")))
(begin
  (define draw-circle-sector-lines
    (foreign-lambda*
      void
      ((f32vector a0)
       (float a1)
       (float a2)
       (float a3)
       (integer a4)
       (u8vector a5))
      "DrawCircleSectorLines(*((Vector2*)a0) , a1 , a2 , a3 , a4 , *((Color*)a5));")))
(begin
  (define draw-circle-sector-lines-ex
    (foreign-lambda*
      void
      ((f32vector a0)
       (float a1)
       (float a2)
       (float a3)
       (integer a4)
       (float a5)
       (u8vector a6))
      "DrawCircleSectorLinesEx(*((Vector2*)a0) , a1 , a2 , a3 , a4 , a5 , *((Color*)a6));")))
(begin
  (define draw-circle-lines
    (foreign-lambda*
      void
      ((integer a0) (integer a1) (float a2) (u8vector a3))
      "DrawCircleLines(a0 , a1 , a2 , *((Color*)a3));")))
(begin
  (define draw-circle-lines-v
    (foreign-lambda*
      void
      ((f32vector a0) (float a1) (u8vector a2))
      "DrawCircleLinesV(*((Vector2*)a0) , a1 , *((Color*)a2));")))
(begin
  (define draw-circle-lines-ex
    (foreign-lambda*
      void
      ((f32vector a0) (float a1) (float a2) (u8vector a3))
      "DrawCircleLinesEx(*((Vector2*)a0) , a1 , a2 , *((Color*)a3));")))
(begin
  (define draw-ellipse
    (foreign-lambda*
      void
      ((integer a0) (integer a1) (float a2) (float a3) (u8vector a4))
      "DrawEllipse(a0 , a1 , a2 , a3 , *((Color*)a4));")))
(begin
  (define draw-ellipse-v
    (foreign-lambda*
      void
      ((f32vector a0) (float a1) (float a2) (u8vector a3))
      "DrawEllipseV(*((Vector2*)a0) , a1 , a2 , *((Color*)a3));")))
(begin
  (define draw-ellipse-lines
    (foreign-lambda*
      void
      ((integer a0) (integer a1) (float a2) (float a3) (u8vector a4))
      "DrawEllipseLines(a0 , a1 , a2 , a3 , *((Color*)a4));")))
(begin
  (define draw-ellipse-lines-v
    (foreign-lambda*
      void
      ((f32vector a0) (float a1) (float a2) (u8vector a3))
      "DrawEllipseLinesV(*((Vector2*)a0) , a1 , a2 , *((Color*)a3));")))
(begin
  (define draw-ellipse-lines-ex
    (foreign-lambda*
      void
      ((f32vector a0) (float a1) (float a2) (float a3) (u8vector a4))
      "DrawEllipseLinesEx(*((Vector2*)a0) , a1 , a2 , a3 , *((Color*)a4));")))
(begin
  (define draw-ring
    (foreign-lambda*
      void
      ((f32vector a0)
       (float a1)
       (float a2)
       (float a3)
       (float a4)
       (integer a5)
       (u8vector a6))
      "DrawRing(*((Vector2*)a0) , a1 , a2 , a3 , a4 , a5 , *((Color*)a6));")))
(begin
  (define draw-ring-lines
    (foreign-lambda*
      void
      ((f32vector a0)
       (float a1)
       (float a2)
       (float a3)
       (float a4)
       (integer a5)
       (u8vector a6))
      "DrawRingLines(*((Vector2*)a0) , a1 , a2 , a3 , a4 , a5 , *((Color*)a6));")))
(begin
  (define draw-ring-lines-ex
    (foreign-lambda*
      void
      ((f32vector a0)
       (float a1)
       (float a2)
       (float a3)
       (float a4)
       (integer a5)
       (float a6)
       (u8vector a7))
      "DrawRingLinesEx(*((Vector2*)a0) , a1 , a2 , a3 , a4 , a5 , a6 , *((Color*)a7));")))
(begin
  (define draw-spline-linear
    (foreign-lambda*
      void
      (((c-pointer (struct "Vector2")) a0)
       (integer a1)
       (float a2)
       (u8vector a3))
      "DrawSplineLinear(a0 , a1 , a2 , *((Color*)a3));")))
(begin
  (define draw-spline-basis
    (foreign-lambda*
      void
      (((c-pointer (struct "Vector2")) a0)
       (integer a1)
       (float a2)
       (u8vector a3))
      "DrawSplineBasis(a0 , a1 , a2 , *((Color*)a3));")))
(begin
  (define draw-spline-catmull-rom
    (foreign-lambda*
      void
      (((c-pointer (struct "Vector2")) a0)
       (integer a1)
       (float a2)
       (u8vector a3))
      "DrawSplineCatmullRom(a0 , a1 , a2 , *((Color*)a3));")))
(begin
  (define draw-spline-bezier-quadratic
    (foreign-lambda*
      void
      (((c-pointer (struct "Vector2")) a0)
       (integer a1)
       (float a2)
       (u8vector a3))
      "DrawSplineBezierQuadratic(a0 , a1 , a2 , *((Color*)a3));")))
(begin
  (define draw-spline-bezier-cubic
    (foreign-lambda*
      void
      (((c-pointer (struct "Vector2")) a0)
       (integer a1)
       (float a2)
       (u8vector a3))
      "DrawSplineBezierCubic(a0 , a1 , a2 , *((Color*)a3));")))
(begin
  (define draw-spline-segment-linear
    (foreign-lambda*
      void
      ((f32vector a0) (f32vector a1) (float a2) (u8vector a3))
      "DrawSplineSegmentLinear(*((Vector2*)a0) , *((Vector2*)a1) , a2 , *((Color*)a3));")))
(begin
  (define draw-spline-segment-basis
    (foreign-lambda*
      void
      ((f32vector a0)
       (f32vector a1)
       (f32vector a2)
       (f32vector a3)
       (float a4)
       (u8vector a5))
      "DrawSplineSegmentBasis(*((Vector2*)a0) , *((Vector2*)a1) , *((Vector2*)a2) , *((Vector2*)a3) , a4 , *((Color*)a5));")))
(begin
  (define draw-spline-segment-catmull-rom
    (foreign-lambda*
      void
      ((f32vector a0)
       (f32vector a1)
       (f32vector a2)
       (f32vector a3)
       (float a4)
       (u8vector a5))
      "DrawSplineSegmentCatmullRom(*((Vector2*)a0) , *((Vector2*)a1) , *((Vector2*)a2) , *((Vector2*)a3) , a4 , *((Color*)a5));")))
(begin
  (define draw-spline-segment-bezier-quadratic
    (foreign-lambda*
      void
      ((f32vector a0) (f32vector a1) (f32vector a2) (float a3) (u8vector a4))
      "DrawSplineSegmentBezierQuadratic(*((Vector2*)a0) , *((Vector2*)a1) , *((Vector2*)a2) , a3 , *((Color*)a4));")))
(begin
  (define draw-spline-segment-bezier-cubic
    (foreign-lambda*
      void
      ((f32vector a0)
       (f32vector a1)
       (f32vector a2)
       (f32vector a3)
       (float a4)
       (u8vector a5))
      "DrawSplineSegmentBezierCubic(*((Vector2*)a0) , *((Vector2*)a1) , *((Vector2*)a2) , *((Vector2*)a3) , a4 , *((Color*)a5));")))
(begin
  (define get-spline-point-linear
    (lambda (a0 a1 a2)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1) (float a2))
           "*((Vector2*)out) = GetSplinePointLinear(*((Vector2*)a0) , *((Vector2*)a1) , a2);\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define get-spline-point-basis
    (lambda (a0 a1 a2 a3 a4)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out)
            (f32vector a0)
            (f32vector a1)
            (f32vector a2)
            (f32vector a3)
            (float a4))
           "*((Vector2*)out) = GetSplinePointBasis(*((Vector2*)a0) , *((Vector2*)a1) , *((Vector2*)a2) , *((Vector2*)a3) , a4);\n")
         out
         a0
         a1
         a2
         a3
         a4)
        out))))
(begin
  (define get-spline-point-catmull-rom
    (lambda (a0 a1 a2 a3 a4)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out)
            (f32vector a0)
            (f32vector a1)
            (f32vector a2)
            (f32vector a3)
            (float a4))
           "*((Vector2*)out) = GetSplinePointCatmullRom(*((Vector2*)a0) , *((Vector2*)a1) , *((Vector2*)a2) , *((Vector2*)a3) , a4);\n")
         out
         a0
         a1
         a2
         a3
         a4)
        out))))
(begin
  (define get-spline-point-bezier-quadratic
    (lambda (a0 a1 a2 a3)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out)
            (f32vector a0)
            (f32vector a1)
            (f32vector a2)
            (float a3))
           "*((Vector2*)out) = GetSplinePointBezierQuadratic(*((Vector2*)a0) , *((Vector2*)a1) , *((Vector2*)a2) , a3);\n")
         out
         a0
         a1
         a2
         a3)
        out))))
(begin
  (define get-spline-point-bezier-cubic
    (lambda (a0 a1 a2 a3 a4)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out)
            (f32vector a0)
            (f32vector a1)
            (f32vector a2)
            (f32vector a3)
            (float a4))
           "*((Vector2*)out) = GetSplinePointBezierCubic(*((Vector2*)a0) , *((Vector2*)a1) , *((Vector2*)a2) , *((Vector2*)a3) , a4);\n")
         out
         a0
         a1
         a2
         a3
         a4)
        out))))
(begin
  (define check-collision-recs
    (foreign-lambda*
      bool
      ((f32vector a0) (f32vector a1))
      "return(CheckCollisionRecs(*((Rectangle*)a0) , *((Rectangle*)a1)));")))
(begin
  (define check-collision-circles
    (foreign-lambda*
      bool
      ((f32vector a0) (float a1) (f32vector a2) (float a3))
      "return(CheckCollisionCircles(*((Vector2*)a0) , a1 , *((Vector2*)a2) , a3));")))
(begin
  (define check-collision-circle-rec
    (foreign-lambda*
      bool
      ((f32vector a0) (float a1) (f32vector a2))
      "return(CheckCollisionCircleRec(*((Vector2*)a0) , a1 , *((Rectangle*)a2)));")))
(begin
  (define check-collision-circle-line
    (foreign-lambda*
      bool
      ((f32vector a0) (float a1) (f32vector a2) (f32vector a3))
      "return(CheckCollisionCircleLine(*((Vector2*)a0) , a1 , *((Vector2*)a2) , *((Vector2*)a3)));")))
(begin
  (define check-collision-point-rec
    (foreign-lambda*
      bool
      ((f32vector a0) (f32vector a1))
      "return(CheckCollisionPointRec(*((Vector2*)a0) , *((Rectangle*)a1)));")))
(begin
  (define check-collision-point-circle
    (foreign-lambda*
      bool
      ((f32vector a0) (f32vector a1) (float a2))
      "return(CheckCollisionPointCircle(*((Vector2*)a0) , *((Vector2*)a1) , a2));")))
(begin
  (define check-collision-point-triangle
    (foreign-lambda*
      bool
      ((f32vector a0) (f32vector a1) (f32vector a2) (f32vector a3))
      "return(CheckCollisionPointTriangle(*((Vector2*)a0) , *((Vector2*)a1) , *((Vector2*)a2) , *((Vector2*)a3)));")))
(begin
  (define check-collision-point-line
    (foreign-lambda*
      bool
      ((f32vector a0) (f32vector a1) (f32vector a2) (integer a3))
      "return(CheckCollisionPointLine(*((Vector2*)a0) , *((Vector2*)a1) , *((Vector2*)a2) , a3));")))
(begin
  (define check-collision-point-poly
    (foreign-lambda*
      bool
      ((f32vector a0) ((c-pointer (struct "Vector2")) a1) (integer a2))
      "return(CheckCollisionPointPoly(*((Vector2*)a0) , a1 , a2));")))
(begin
  (define check-collision-lines
    (foreign-lambda*
      bool
      ((f32vector a0)
       (f32vector a1)
       (f32vector a2)
       (f32vector a3)
       ((c-pointer (struct "Vector2")) a4))
      "return(CheckCollisionLines(*((Vector2*)a0) , *((Vector2*)a1) , *((Vector2*)a2) , *((Vector2*)a3) , a4));")))
(begin
  (define get-collision-rec
    (lambda (a0 a1)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (f32vector a0) (f32vector a1))
           "*((Rectangle*)out) = GetCollisionRec(*((Rectangle*)a0) , *((Rectangle*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define load-image
    (foreign-lambda*
      (c-pointer (struct "Image"))
      ((c-string a0))
      "struct Image * tmp = (struct Image *) C_malloc(sizeof(struct Image));\n*tmp = LoadImage(a0);\nreturn(tmp);;\n")))
(begin
  (define load-image-raw
    (foreign-lambda*
      (c-pointer (struct "Image"))
      ((c-string a0) (integer a1) (integer a2) (integer a3) (integer a4))
      "struct Image * tmp = (struct Image *) C_malloc(sizeof(struct Image));\n*tmp = LoadImageRaw(a0 , a1 , a2 , a3 , a4);\nreturn(tmp);;\n")))
(begin
  (define load-image-anim
    (foreign-lambda*
      (c-pointer (struct "Image"))
      ((c-string a0) (s32vector a1))
      "struct Image * tmp = (struct Image *) C_malloc(sizeof(struct Image));\n*tmp = LoadImageAnim(a0 , a1);\nreturn(tmp);;\n")))
(begin
  (define load-image-anim-from-memory
    (foreign-lambda*
      (c-pointer (struct "Image"))
      ((c-string a0) (u8vector a1) (integer a2) (s32vector a3))
      "struct Image * tmp = (struct Image *) C_malloc(sizeof(struct Image));\n*tmp = LoadImageAnimFromMemory(a0 , a1 , a2 , a3);\nreturn(tmp);;\n")))
(begin
  (define load-image-from-memory
    (foreign-lambda*
      (c-pointer (struct "Image"))
      ((c-string a0) (u8vector a1) (integer a2))
      "struct Image * tmp = (struct Image *) C_malloc(sizeof(struct Image));\n*tmp = LoadImageFromMemory(a0 , a1 , a2);\nreturn(tmp);;\n")))
(begin
  (define load-image-from-texture
    (foreign-lambda*
      (c-pointer (struct "Image"))
      (((c-pointer (struct "Texture")) a0))
      "struct Image * tmp = (struct Image *) C_malloc(sizeof(struct Image));\n*tmp = LoadImageFromTexture(*a0);\nreturn(tmp);;\n")))
(begin
  (define load-image-from-screen
    (foreign-lambda*
      (c-pointer (struct "Image"))
      ()
      "struct Image * tmp = (struct Image *) C_malloc(sizeof(struct Image));\n*tmp = LoadImageFromScreen();\nreturn(tmp);;\n")))
(begin
  (define is-image-valid
    (foreign-lambda*
      bool
      (((c-pointer (struct "Image")) a0))
      "return(IsImageValid(*a0));")))
(begin
  (define unload-image
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0))
      "UnloadImage(*a0);")))
(begin
  (define export-image
    (foreign-lambda*
      bool
      (((c-pointer (struct "Image")) a0) (c-string a1))
      "return(ExportImage(*a0 , a1));")))
(begin
  (define export-image-to-memory
    (foreign-lambda*
      (c-pointer unsigned-char)
      (((c-pointer (struct "Image")) a0) (c-string a1) (s32vector a2))
      "return(ExportImageToMemory(*a0 , a1 , a2));")))
(begin
  (define export-image-as-code
    (foreign-lambda*
      bool
      (((c-pointer (struct "Image")) a0) (c-string a1))
      "return(ExportImageAsCode(*a0 , a1));")))
(begin
  (define gen-image-color
    (foreign-lambda*
      (c-pointer (struct "Image"))
      ((integer a0) (integer a1) (u8vector a2))
      "struct Image * tmp = (struct Image *) C_malloc(sizeof(struct Image));\n*tmp = GenImageColor(a0 , a1 , *((Color*)a2));\nreturn(tmp);;\n")))
(begin
  (define gen-image-gradient-linear
    (foreign-lambda*
      (c-pointer (struct "Image"))
      ((integer a0) (integer a1) (integer a2) (u8vector a3) (u8vector a4))
      "struct Image * tmp = (struct Image *) C_malloc(sizeof(struct Image));\n*tmp = GenImageGradientLinear(a0 , a1 , a2 , *((Color*)a3) , *((Color*)a4));\nreturn(tmp);;\n")))
(begin
  (define gen-image-gradient-radial
    (foreign-lambda*
      (c-pointer (struct "Image"))
      ((integer a0) (integer a1) (float a2) (u8vector a3) (u8vector a4))
      "struct Image * tmp = (struct Image *) C_malloc(sizeof(struct Image));\n*tmp = GenImageGradientRadial(a0 , a1 , a2 , *((Color*)a3) , *((Color*)a4));\nreturn(tmp);;\n")))
(begin
  (define gen-image-gradient-square
    (foreign-lambda*
      (c-pointer (struct "Image"))
      ((integer a0) (integer a1) (float a2) (u8vector a3) (u8vector a4))
      "struct Image * tmp = (struct Image *) C_malloc(sizeof(struct Image));\n*tmp = GenImageGradientSquare(a0 , a1 , a2 , *((Color*)a3) , *((Color*)a4));\nreturn(tmp);;\n")))
(begin
  (define gen-image-checked
    (foreign-lambda*
      (c-pointer (struct "Image"))
      ((integer a0)
       (integer a1)
       (integer a2)
       (integer a3)
       (u8vector a4)
       (u8vector a5))
      "struct Image * tmp = (struct Image *) C_malloc(sizeof(struct Image));\n*tmp = GenImageChecked(a0 , a1 , a2 , a3 , *((Color*)a4) , *((Color*)a5));\nreturn(tmp);;\n")))
(begin
  (define gen-image-white-noise
    (foreign-lambda*
      (c-pointer (struct "Image"))
      ((integer a0) (integer a1) (float a2))
      "struct Image * tmp = (struct Image *) C_malloc(sizeof(struct Image));\n*tmp = GenImageWhiteNoise(a0 , a1 , a2);\nreturn(tmp);;\n")))
(begin
  (define gen-image-perlin-noise
    (foreign-lambda*
      (c-pointer (struct "Image"))
      ((integer a0) (integer a1) (integer a2) (integer a3) (float a4))
      "struct Image * tmp = (struct Image *) C_malloc(sizeof(struct Image));\n*tmp = GenImagePerlinNoise(a0 , a1 , a2 , a3 , a4);\nreturn(tmp);;\n")))
(begin
  (define gen-image-cellular
    (foreign-lambda*
      (c-pointer (struct "Image"))
      ((integer a0) (integer a1) (integer a2))
      "struct Image * tmp = (struct Image *) C_malloc(sizeof(struct Image));\n*tmp = GenImageCellular(a0 , a1 , a2);\nreturn(tmp);;\n")))
(begin
  (define gen-image-text
    (foreign-lambda*
      (c-pointer (struct "Image"))
      ((integer a0) (integer a1) (c-string a2))
      "struct Image * tmp = (struct Image *) C_malloc(sizeof(struct Image));\n*tmp = GenImageText(a0 , a1 , a2);\nreturn(tmp);;\n")))
(begin
  (define image-copy
    (foreign-lambda*
      (c-pointer (struct "Image"))
      (((c-pointer (struct "Image")) a0))
      "struct Image * tmp = (struct Image *) C_malloc(sizeof(struct Image));\n*tmp = ImageCopy(*a0);\nreturn(tmp);;\n")))
(begin
  (define image-from-image
    (foreign-lambda*
      (c-pointer (struct "Image"))
      (((c-pointer (struct "Image")) a0) (f32vector a1))
      "struct Image * tmp = (struct Image *) C_malloc(sizeof(struct Image));\n*tmp = ImageFromImage(*a0 , *((Rectangle*)a1));\nreturn(tmp);;\n")))
(begin
  (define image-from-channel
    (foreign-lambda*
      (c-pointer (struct "Image"))
      (((c-pointer (struct "Image")) a0) (integer a1))
      "struct Image * tmp = (struct Image *) C_malloc(sizeof(struct Image));\n*tmp = ImageFromChannel(*a0 , a1);\nreturn(tmp);;\n")))
(begin
  (define image-text
    (foreign-lambda*
      (c-pointer (struct "Image"))
      ((c-string a0) (integer a1) (u8vector a2))
      "struct Image * tmp = (struct Image *) C_malloc(sizeof(struct Image));\n*tmp = ImageText(a0 , a1 , *((Color*)a2));\nreturn(tmp);;\n")))
(begin
  (define image-text-ex
    (foreign-lambda*
      (c-pointer (struct "Image"))
      (((c-pointer (struct "Font")) a0)
       (c-string a1)
       (float a2)
       (float a3)
       (u8vector a4))
      "struct Image * tmp = (struct Image *) C_malloc(sizeof(struct Image));\n*tmp = ImageTextEx(*a0 , a1 , a2 , a3 , *((Color*)a4));\nreturn(tmp);;\n")))
(begin
  (define image-format
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0) (integer a1))
      "ImageFormat(a0 , a1);")))
(begin
  (define image-to-pot
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0) (u8vector a1))
      "ImageToPOT(a0 , *((Color*)a1));")))
(begin
  (define image-crop
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0) (f32vector a1))
      "ImageCrop(a0 , *((Rectangle*)a1));")))
(begin
  (define image-alpha-crop
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0) (float a1))
      "ImageAlphaCrop(a0 , a1);")))
(begin
  (define image-alpha-clear
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0) (u8vector a1) (float a2))
      "ImageAlphaClear(a0 , *((Color*)a1) , a2);")))
(begin
  (define image-alpha-mask
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0) ((c-pointer (struct "Image")) a1))
      "ImageAlphaMask(a0 , *a1);")))
(begin
  (define image-alpha-premultiply
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0))
      "ImageAlphaPremultiply(a0);")))
(begin
  (define image-blur-gaussian
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0) (integer a1))
      "ImageBlurGaussian(a0 , a1);")))
(begin
  (define image-kernel-convolution
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0) (f32vector a1) (integer a2))
      "ImageKernelConvolution(a0 , a1 , a2);")))
(begin
  (define image-resize
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0) (integer a1) (integer a2))
      "ImageResize(a0 , a1 , a2);")))
(begin
  (define image-resize-nn
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0) (integer a1) (integer a2))
      "ImageResizeNN(a0 , a1 , a2);")))
(begin
  (define image-resize-canvas
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       (integer a1)
       (integer a2)
       (integer a3)
       (integer a4)
       (u8vector a5))
      "ImageResizeCanvas(a0 , a1 , a2 , a3 , a4 , *((Color*)a5));")))
(begin
  (define image-mipmaps
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0))
      "ImageMipmaps(a0);")))
(begin
  (define image-dither
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       (integer a1)
       (integer a2)
       (integer a3)
       (integer a4))
      "ImageDither(a0 , a1 , a2 , a3 , a4);")))
(begin
  (define image-flip-vertical
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0))
      "ImageFlipVertical(a0);")))
(begin
  (define image-flip-horizontal
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0))
      "ImageFlipHorizontal(a0);")))
(begin
  (define image-rotate
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0) (integer a1))
      "ImageRotate(a0 , a1);")))
(begin
  (define image-rotate-cw
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0))
      "ImageRotateCW(a0);")))
(begin
  (define image-rotate-ccw
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0))
      "ImageRotateCCW(a0);")))
(begin
  (define image-color-tint
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0) (u8vector a1))
      "ImageColorTint(a0 , *((Color*)a1));")))
(begin
  (define image-color-invert
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0))
      "ImageColorInvert(a0);")))
(begin
  (define image-color-grayscale
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0))
      "ImageColorGrayscale(a0);")))
(begin
  (define image-color-contrast
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0) (integer a1))
      "ImageColorContrast(a0 , a1);")))
(begin
  (define image-color-brightness
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0) (integer a1))
      "ImageColorBrightness(a0 , a1);")))
(begin
  (define image-color-replace
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0) (u8vector a1) (u8vector a2))
      "ImageColorReplace(a0 , *((Color*)a1) , *((Color*)a2));")))
(begin
  (define load-image-colors
    (foreign-lambda*
      (c-pointer (struct "Color"))
      (((c-pointer (struct "Image")) a0))
      "return(LoadImageColors(*a0));")))
(begin
  (define load-image-palette
    (foreign-lambda*
      (c-pointer (struct "Color"))
      (((c-pointer (struct "Image")) a0) (integer a1) (s32vector a2))
      "return(LoadImagePalette(*a0 , a1 , a2));")))
(begin
  (define unload-image-colors
    (foreign-lambda*
      void
      (((c-pointer (struct "Color")) a0))
      "UnloadImageColors(a0);")))
(begin
  (define unload-image-palette
    (foreign-lambda*
      void
      (((c-pointer (struct "Color")) a0))
      "UnloadImagePalette(a0);")))
(begin
  (define get-image-alpha-border
    (lambda (a0 a1)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) ((c-pointer (struct "Image")) a0) (float a1))
           "*((Rectangle*)out) = GetImageAlphaBorder(*a0 , a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define get-image-color
    (lambda (a0 a1 a2)
      (let ((out (make-u8vector 4)))
        ((foreign-lambda*
           void
           ((u8vector out)
            ((c-pointer (struct "Image")) a0)
            (integer a1)
            (integer a2))
           "*((Color*)out) = GetImageColor(*a0 , a1 , a2);\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define image-clear-background
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0) (u8vector a1))
      "ImageClearBackground(a0 , *((Color*)a1));")))
(begin
  (define image-draw-pixel
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       (integer a1)
       (integer a2)
       (u8vector a3))
      "ImageDrawPixel(a0 , a1 , a2 , *((Color*)a3));")))
(begin
  (define image-draw-pixel-v
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0) (f32vector a1) (u8vector a2))
      "ImageDrawPixelV(a0 , *((Vector2*)a1) , *((Color*)a2));")))
(begin
  (define image-draw-line
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       (integer a1)
       (integer a2)
       (integer a3)
       (integer a4)
       (u8vector a5))
      "ImageDrawLine(a0 , a1 , a2 , a3 , a4 , *((Color*)a5));")))
(begin
  (define image-draw-line-v
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       (f32vector a1)
       (f32vector a2)
       (u8vector a3))
      "ImageDrawLineV(a0 , *((Vector2*)a1) , *((Vector2*)a2) , *((Color*)a3));")))
(begin
  (define image-draw-line-ex
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       (f32vector a1)
       (f32vector a2)
       (integer a3)
       (u8vector a4))
      "ImageDrawLineEx(a0 , *((Vector2*)a1) , *((Vector2*)a2) , a3 , *((Color*)a4));")))
(begin
  (define image-draw-line-strip
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       ((c-pointer (struct "Vector2")) a1)
       (integer a2)
       (u8vector a3))
      "ImageDrawLineStrip(a0 , a1 , a2 , *((Color*)a3));")))
(begin
  (define image-draw-triangle
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       (f32vector a1)
       (f32vector a2)
       (f32vector a3)
       (u8vector a4))
      "ImageDrawTriangle(a0 , *((Vector2*)a1) , *((Vector2*)a2) , *((Vector2*)a3) , *((Color*)a4));")))
(begin
  (define image-draw-triangle-gradient
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       (f32vector a1)
       (f32vector a2)
       (f32vector a3)
       (u8vector a4)
       (u8vector a5)
       (u8vector a6))
      "ImageDrawTriangleGradient(a0 , *((Vector2*)a1) , *((Vector2*)a2) , *((Vector2*)a3) , *((Color*)a4) , *((Color*)a5) , *((Color*)a6));")))
(begin
  (define image-draw-triangle-lines
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       (f32vector a1)
       (f32vector a2)
       (f32vector a3)
       (u8vector a4))
      "ImageDrawTriangleLines(a0 , *((Vector2*)a1) , *((Vector2*)a2) , *((Vector2*)a3) , *((Color*)a4));")))
(begin
  (define image-draw-triangle-fan
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       ((c-pointer (struct "Vector2")) a1)
       (integer a2)
       (u8vector a3))
      "ImageDrawTriangleFan(a0 , a1 , a2 , *((Color*)a3));")))
(begin
  (define image-draw-triangle-strip
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       ((c-pointer (struct "Vector2")) a1)
       (integer a2)
       (u8vector a3))
      "ImageDrawTriangleStrip(a0 , a1 , a2 , *((Color*)a3));")))
(begin
  (define image-draw-rectangle
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       (integer a1)
       (integer a2)
       (integer a3)
       (integer a4)
       (u8vector a5))
      "ImageDrawRectangle(a0 , a1 , a2 , a3 , a4 , *((Color*)a5));")))
(begin
  (define image-draw-rectangle-v
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       (f32vector a1)
       (f32vector a2)
       (u8vector a3))
      "ImageDrawRectangleV(a0 , *((Vector2*)a1) , *((Vector2*)a2) , *((Color*)a3));")))
(begin
  (define image-draw-rectangle-rec
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0) (f32vector a1) (u8vector a2))
      "ImageDrawRectangleRec(a0 , *((Rectangle*)a1) , *((Color*)a2));")))
(begin
  (define image-draw-rectangle-pro
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       (f32vector a1)
       (f32vector a2)
       (float a3)
       (u8vector a4))
      "ImageDrawRectanglePro(a0 , *((Rectangle*)a1) , *((Vector2*)a2) , a3 , *((Color*)a4));")))
(begin
  (define image-draw-rectangle-lines
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       (integer a1)
       (integer a2)
       (integer a3)
       (integer a4)
       (u8vector a5))
      "ImageDrawRectangleLines(a0 , a1 , a2 , a3 , a4 , *((Color*)a5));")))
(begin
  (define image-draw-rectangle-lines-ex
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       (f32vector a1)
       (integer a2)
       (u8vector a3))
      "ImageDrawRectangleLinesEx(a0 , *((Rectangle*)a1) , a2 , *((Color*)a3));")))
(begin
  (define image-draw-rectangle-gradient-ex
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       (f32vector a1)
       (u8vector a2)
       (u8vector a3)
       (u8vector a4)
       (u8vector a5))
      "ImageDrawRectangleGradientEx(a0 , *((Rectangle*)a1) , *((Color*)a2) , *((Color*)a3) , *((Color*)a4) , *((Color*)a5));")))
(begin
  (define image-draw-circle
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       (integer a1)
       (integer a2)
       (integer a3)
       (u8vector a4))
      "ImageDrawCircle(a0 , a1 , a2 , a3 , *((Color*)a4));")))
(begin
  (define image-draw-circle-v
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       (f32vector a1)
       (integer a2)
       (u8vector a3))
      "ImageDrawCircleV(a0 , *((Vector2*)a1) , a2 , *((Color*)a3));")))
(begin
  (define image-draw-circle-lines
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       (integer a1)
       (integer a2)
       (integer a3)
       (u8vector a4))
      "ImageDrawCircleLines(a0 , a1 , a2 , a3 , *((Color*)a4));")))
(begin
  (define image-draw-circle-lines-v
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       (f32vector a1)
       (integer a2)
       (u8vector a3))
      "ImageDrawCircleLinesV(a0 , *((Vector2*)a1) , a2 , *((Color*)a3));")))
(begin
  (define image-draw-circle-gradient
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       (f32vector a1)
       (float a2)
       (u8vector a3)
       (u8vector a4))
      "ImageDrawCircleGradient(a0 , *((Vector2*)a1) , a2 , *((Color*)a3) , *((Color*)a4));")))
(begin
  (define image-draw-image
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       ((c-pointer (struct "Image")) a1)
       (integer a2)
       (integer a3)
       (u8vector a4))
      "ImageDrawImage(a0 , *a1 , a2 , a3 , *((Color*)a4));")))
(begin
  (define image-draw-image-ex
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       ((c-pointer (struct "Image")) a1)
       (f32vector a2)
       (float a3)
       (float a4)
       (u8vector a5))
      "ImageDrawImageEx(a0 , *a1 , *((Vector2*)a2) , a3 , a4 , *((Color*)a5));")))
(begin
  (define image-draw-image-rec
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       ((c-pointer (struct "Image")) a1)
       (f32vector a2)
       (f32vector a3)
       (u8vector a4))
      "ImageDrawImageRec(a0 , *a1 , *((Rectangle*)a2) , *((Vector2*)a3) , *((Color*)a4));")))
(begin
  (define image-draw-image-pro
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       ((c-pointer (struct "Image")) a1)
       (f32vector a2)
       (f32vector a3)
       (f32vector a4)
       (float a5)
       (u8vector a6))
      "ImageDrawImagePro(a0 , *a1 , *((Rectangle*)a2) , *((Rectangle*)a3) , *((Vector2*)a4) , a5 , *((Color*)a6));")))
(begin
  (define image-draw-text
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       (c-string a1)
       (integer a2)
       (integer a3)
       (integer a4)
       (u8vector a5))
      "ImageDrawText(a0 , a1 , a2 , a3 , a4 , *((Color*)a5));")))
(begin
  (define image-draw-text-ex
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       ((c-pointer (struct "Font")) a1)
       (c-string a2)
       (f32vector a3)
       (float a4)
       (float a5)
       (u8vector a6))
      "ImageDrawTextEx(a0 , *a1 , a2 , *((Vector2*)a3) , a4 , a5 , *((Color*)a6));")))
(begin
  (define image-draw-text-pro
    (foreign-lambda*
      void
      (((c-pointer (struct "Image")) a0)
       ((c-pointer (struct "Font")) a1)
       (c-string a2)
       (f32vector a3)
       (f32vector a4)
       (float a5)
       (float a6)
       (float a7)
       (u8vector a8))
      "ImageDrawTextPro(a0 , *a1 , a2 , *((Vector2*)a3) , *((Vector2*)a4) , a5 , a6 , a7 , *((Color*)a8));")))
(begin
  (define load-texture
    (foreign-lambda*
      (c-pointer (struct "Texture"))
      ((c-string a0))
      "struct Texture * tmp = (struct Texture *) C_malloc(sizeof(struct Texture));\n*tmp = LoadTexture(a0);\nreturn(tmp);;\n")))
(begin
  (define load-texture-from-image
    (foreign-lambda*
      (c-pointer (struct "Texture"))
      (((c-pointer (struct "Image")) a0))
      "struct Texture * tmp = (struct Texture *) C_malloc(sizeof(struct Texture));\n*tmp = LoadTextureFromImage(*a0);\nreturn(tmp);;\n")))
(begin
  (define load-texture-cubemap
    (foreign-lambda*
      (c-pointer (struct "Texture"))
      (((c-pointer (struct "Image")) a0) (integer a1))
      "struct Texture * tmp = (struct Texture *) C_malloc(sizeof(struct Texture));\n*tmp = LoadTextureCubemap(*a0 , a1);\nreturn(tmp);;\n")))
(begin
  (define load-render-texture
    (foreign-lambda*
      (c-pointer (struct "RenderTexture"))
      ((integer a0) (integer a1))
      "struct RenderTexture * tmp = (struct RenderTexture *) C_malloc(sizeof(struct RenderTexture));\n*tmp = LoadRenderTexture(a0 , a1);\nreturn(tmp);;\n")))
(begin
  (define load-render-texture-ex
    (foreign-lambda*
      (c-pointer (struct "RenderTexture"))
      ((integer a0) (integer a1) (integer a2))
      "struct RenderTexture * tmp = (struct RenderTexture *) C_malloc(sizeof(struct RenderTexture));\n*tmp = LoadRenderTextureEx(a0 , a1 , a2);\nreturn(tmp);;\n")))
(begin
  (define is-texture-valid
    (foreign-lambda*
      bool
      (((c-pointer (struct "Texture")) a0))
      "return(IsTextureValid(*a0));")))
(begin
  (define unload-texture
    (foreign-lambda*
      void
      (((c-pointer (struct "Texture")) a0))
      "UnloadTexture(*a0);")))
(begin
  (define is-render-texture-valid
    (foreign-lambda*
      bool
      (((c-pointer (struct "RenderTexture")) a0))
      "return(IsRenderTextureValid(*a0));")))
(begin
  (define unload-render-texture
    (foreign-lambda*
      void
      (((c-pointer (struct "RenderTexture")) a0))
      "UnloadRenderTexture(*a0);")))
(begin
  (define update-texture
    (foreign-lambda*
      void
      (((c-pointer (struct "Texture")) a0) ((c-pointer void) a1))
      "UpdateTexture(*a0 , a1);")))
(begin
  (define update-texture-rec
    (foreign-lambda*
      void
      (((c-pointer (struct "Texture")) a0)
       (f32vector a1)
       ((c-pointer void) a2))
      "UpdateTextureRec(*a0 , *((Rectangle*)a1) , a2);")))
(begin
  (define gen-texture-mipmaps
    (foreign-lambda*
      void
      (((c-pointer (struct "Texture")) a0))
      "GenTextureMipmaps(a0);")))
(begin
  (define set-texture-filter
    (foreign-lambda*
      void
      (((c-pointer (struct "Texture")) a0) (integer a1))
      "SetTextureFilter(*a0 , a1);")))
(begin
  (define set-texture-wrap
    (foreign-lambda*
      void
      (((c-pointer (struct "Texture")) a0) (integer a1))
      "SetTextureWrap(*a0 , a1);")))
(begin
  (define draw-texture
    (foreign-lambda*
      void
      (((c-pointer (struct "Texture")) a0)
       (integer a1)
       (integer a2)
       (u8vector a3))
      "DrawTexture(*a0 , a1 , a2 , *((Color*)a3));")))
(begin
  (define draw-texture-v
    (foreign-lambda*
      void
      (((c-pointer (struct "Texture")) a0) (f32vector a1) (u8vector a2))
      "DrawTextureV(*a0 , *((Vector2*)a1) , *((Color*)a2));")))
(begin
  (define draw-texture-ex
    (foreign-lambda*
      void
      (((c-pointer (struct "Texture")) a0)
       (f32vector a1)
       (float a2)
       (float a3)
       (u8vector a4))
      "DrawTextureEx(*a0 , *((Vector2*)a1) , a2 , a3 , *((Color*)a4));")))
(begin
  (define draw-texture-rec
    (foreign-lambda*
      void
      (((c-pointer (struct "Texture")) a0)
       (f32vector a1)
       (f32vector a2)
       (u8vector a3))
      "DrawTextureRec(*a0 , *((Rectangle*)a1) , *((Vector2*)a2) , *((Color*)a3));")))
(begin
  (define draw-texture-pro
    (foreign-lambda*
      void
      (((c-pointer (struct "Texture")) a0)
       (f32vector a1)
       (f32vector a2)
       (f32vector a3)
       (float a4)
       (u8vector a5))
      "DrawTexturePro(*a0 , *((Rectangle*)a1) , *((Rectangle*)a2) , *((Vector2*)a3) , a4 , *((Color*)a5));")))
(begin
  (define draw-texture-npatch
    (foreign-lambda*
      void
      (((c-pointer (struct "Texture")) a0)
       ((c-pointer (struct "NPatchInfo")) a1)
       (f32vector a2)
       (f32vector a3)
       (float a4)
       (u8vector a5))
      "DrawTextureNPatch(*a0 , *a1 , *((Rectangle*)a2) , *((Vector2*)a3) , a4 , *((Color*)a5));")))
(begin
  (define color-is-equal
    (foreign-lambda*
      bool
      ((u8vector a0) (u8vector a1))
      "return(ColorIsEqual(*((Color*)a0) , *((Color*)a1)));")))
(begin
  (define fade
    (lambda (a0 a1)
      (let ((out (make-u8vector 4)))
        ((foreign-lambda*
           void
           ((u8vector out) (u8vector a0) (float a1))
           "*((Color*)out) = Fade(*((Color*)a0) , a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define color-to-int
    (foreign-lambda*
      integer
      ((u8vector a0))
      "return(ColorToInt(*((Color*)a0)));")))
(begin
  (define color-normalize
    (lambda (a0)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) (u8vector a0))
           "*((Vector4*)out) = ColorNormalize(*((Color*)a0));\n")
         out
         a0)
        out))))
(begin
  (define color-from-normalized
    (lambda (a0)
      (let ((out (make-u8vector 4)))
        ((foreign-lambda*
           void
           ((u8vector out) (f32vector a0))
           "*((Color*)out) = ColorFromNormalized(*((Vector4*)a0));\n")
         out
         a0)
        out))))
(begin
  (define color-to-hsv
    (lambda (a0)
      (let ((out (make-f32vector 3)))
        ((foreign-lambda*
           void
           ((f32vector out) (u8vector a0))
           "*((Vector3*)out) = ColorToHSV(*((Color*)a0));\n")
         out
         a0)
        out))))
(begin
  (define color-from-hsv
    (lambda (a0 a1 a2)
      (let ((out (make-u8vector 4)))
        ((foreign-lambda*
           void
           ((u8vector out) (float a0) (float a1) (float a2))
           "*((Color*)out) = ColorFromHSV(a0 , a1 , a2);\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define color-tint
    (lambda (a0 a1)
      (let ((out (make-u8vector 4)))
        ((foreign-lambda*
           void
           ((u8vector out) (u8vector a0) (u8vector a1))
           "*((Color*)out) = ColorTint(*((Color*)a0) , *((Color*)a1));\n")
         out
         a0
         a1)
        out))))
(begin
  (define color-brightness
    (lambda (a0 a1)
      (let ((out (make-u8vector 4)))
        ((foreign-lambda*
           void
           ((u8vector out) (u8vector a0) (float a1))
           "*((Color*)out) = ColorBrightness(*((Color*)a0) , a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define color-contrast
    (lambda (a0 a1)
      (let ((out (make-u8vector 4)))
        ((foreign-lambda*
           void
           ((u8vector out) (u8vector a0) (float a1))
           "*((Color*)out) = ColorContrast(*((Color*)a0) , a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define color-alpha
    (lambda (a0 a1)
      (let ((out (make-u8vector 4)))
        ((foreign-lambda*
           void
           ((u8vector out) (u8vector a0) (float a1))
           "*((Color*)out) = ColorAlpha(*((Color*)a0) , a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define color-alpha-blend
    (lambda (a0 a1 a2)
      (let ((out (make-u8vector 4)))
        ((foreign-lambda*
           void
           ((u8vector out) (u8vector a0) (u8vector a1) (u8vector a2))
           "*((Color*)out) = ColorAlphaBlend(*((Color*)a0) , *((Color*)a1) , *((Color*)a2));\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define color-lerp
    (lambda (a0 a1 a2)
      (let ((out (make-u8vector 4)))
        ((foreign-lambda*
           void
           ((u8vector out) (u8vector a0) (u8vector a1) (float a2))
           "*((Color*)out) = ColorLerp(*((Color*)a0) , *((Color*)a1) , a2);\n")
         out
         a0
         a1
         a2)
        out))))
(begin
  (define get-color
    (lambda (a0)
      (let ((out (make-u8vector 4)))
        ((foreign-lambda*
           void
           ((u8vector out) (unsigned-integer a0))
           "*((Color*)out) = GetColor(a0);\n")
         out
         a0)
        out))))
(begin
  (define get-pixel-color
    (lambda (a0 a1)
      (let ((out (make-u8vector 4)))
        ((foreign-lambda*
           void
           ((u8vector out) ((c-pointer void) a0) (integer a1))
           "*((Color*)out) = GetPixelColor(a0 , a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define set-pixel-color
    (foreign-lambda*
      void
      (((c-pointer void) a0) (u8vector a1) (integer a2))
      "SetPixelColor(a0 , *((Color*)a1) , a2);")))
(begin
  (define get-pixel-data-size
    (foreign-lambda*
      integer
      ((integer a0) (integer a1) (integer a2))
      "return(GetPixelDataSize(a0 , a1 , a2));")))
(begin
  (define get-font-default
    (foreign-lambda*
      (c-pointer (struct "Font"))
      ()
      "struct Font * tmp = (struct Font *) C_malloc(sizeof(struct Font));\n*tmp = GetFontDefault();\nreturn(tmp);;\n")))
(begin
  (define load-font
    (foreign-lambda*
      (c-pointer (struct "Font"))
      ((c-string a0))
      "struct Font * tmp = (struct Font *) C_malloc(sizeof(struct Font));\n*tmp = LoadFont(a0);\nreturn(tmp);;\n")))
(begin
  (define load-font-ex
    (foreign-lambda*
      (c-pointer (struct "Font"))
      ((c-string a0) (integer a1) (s32vector a2) (integer a3))
      "struct Font * tmp = (struct Font *) C_malloc(sizeof(struct Font));\n*tmp = LoadFontEx(a0 , a1 , a2 , a3);\nreturn(tmp);;\n")))
(begin
  (define load-font-from-image
    (foreign-lambda*
      (c-pointer (struct "Font"))
      (((c-pointer (struct "Image")) a0) (u8vector a1) (integer a2))
      "struct Font * tmp = (struct Font *) C_malloc(sizeof(struct Font));\n*tmp = LoadFontFromImage(*a0 , *((Color*)a1) , a2);\nreturn(tmp);;\n")))
(begin
  (define load-font-from-memory
    (foreign-lambda*
      (c-pointer (struct "Font"))
      ((c-string a0)
       (u8vector a1)
       (integer a2)
       (integer a3)
       (s32vector a4)
       (integer a5))
      "struct Font * tmp = (struct Font *) C_malloc(sizeof(struct Font));\n*tmp = LoadFontFromMemory(a0 , a1 , a2 , a3 , a4 , a5);\nreturn(tmp);;\n")))
(begin
  (define is-font-valid
    (foreign-lambda*
      bool
      (((c-pointer (struct "Font")) a0))
      "return(IsFontValid(*a0));")))
(begin
  (define load-font-data
    (foreign-lambda*
      (c-pointer (struct "GlyphInfo"))
      ((u8vector a0)
       (integer a1)
       (integer a2)
       (s32vector a3)
       (integer a4)
       (integer a5)
       (s32vector a6))
      "return(LoadFontData(a0 , a1 , a2 , a3 , a4 , a5 , a6));")))
(begin
  (define gen-image-font-atlas
    (foreign-lambda*
      (c-pointer (struct "Image"))
      (((c-pointer (struct "GlyphInfo")) a0)
       ((c-pointer (c-pointer (struct "Rectangle"))) a1)
       (integer a2)
       (integer a3)
       (integer a4)
       (integer a5))
      "struct Image * tmp = (struct Image *) C_malloc(sizeof(struct Image));\n*tmp = GenImageFontAtlas(a0 , a1 , a2 , a3 , a4 , a5);\nreturn(tmp);;\n")))
(begin
  (define unload-font-data
    (foreign-lambda*
      void
      (((c-pointer (struct "GlyphInfo")) a0) (integer a1))
      "UnloadFontData(a0 , a1);")))
(begin
  (define unload-font
    (foreign-lambda*
      void
      (((c-pointer (struct "Font")) a0))
      "UnloadFont(*a0);")))
(begin
  (define export-font-as-code
    (foreign-lambda*
      bool
      (((c-pointer (struct "Font")) a0) (c-string a1))
      "return(ExportFontAsCode(*a0 , a1));")))
(begin
  (define draw-fps
    (foreign-lambda* void ((integer a0) (integer a1)) "DrawFPS(a0 , a1);")))
(begin
  (define draw-text
    (foreign-lambda*
      void
      ((c-string a0) (integer a1) (integer a2) (integer a3) (u8vector a4))
      "DrawText(a0 , a1 , a2 , a3 , *((Color*)a4));")))
(begin
  (define draw-text-ex
    (foreign-lambda*
      void
      (((c-pointer (struct "Font")) a0)
       (c-string a1)
       (f32vector a2)
       (float a3)
       (float a4)
       (u8vector a5))
      "DrawTextEx(*a0 , a1 , *((Vector2*)a2) , a3 , a4 , *((Color*)a5));")))
(begin
  (define draw-text-pro
    (foreign-lambda*
      void
      (((c-pointer (struct "Font")) a0)
       (c-string a1)
       (f32vector a2)
       (f32vector a3)
       (float a4)
       (float a5)
       (float a6)
       (u8vector a7))
      "DrawTextPro(*a0 , a1 , *((Vector2*)a2) , *((Vector2*)a3) , a4 , a5 , a6 , *((Color*)a7));")))
(begin
  (define draw-text-codepoint
    (foreign-lambda*
      void
      (((c-pointer (struct "Font")) a0)
       (integer a1)
       (f32vector a2)
       (float a3)
       (u8vector a4))
      "DrawTextCodepoint(*a0 , a1 , *((Vector2*)a2) , a3 , *((Color*)a4));")))
(begin
  (define draw-text-codepoints
    (foreign-lambda*
      void
      (((c-pointer (struct "Font")) a0)
       (s32vector a1)
       (integer a2)
       (f32vector a3)
       (float a4)
       (float a5)
       (u8vector a6))
      "DrawTextCodepoints(*a0 , a1 , a2 , *((Vector2*)a3) , a4 , a5 , *((Color*)a6));")))
(begin
  (define set-text-line-spacing
    (foreign-lambda* void ((integer a0)) "SetTextLineSpacing(a0);")))
(begin
  (define measure-text
    (foreign-lambda*
      integer
      ((c-string a0) (integer a1))
      "return(MeasureText(a0 , a1));")))
(begin
  (define measure-text-ex
    (lambda (a0 a1 a2 a3)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out)
            ((c-pointer (struct "Font")) a0)
            (c-string a1)
            (float a2)
            (float a3))
           "*((Vector2*)out) = MeasureTextEx(*a0 , a1 , a2 , a3);\n")
         out
         a0
         a1
         a2
         a3)
        out))))
(begin
  (define measure-text-codepoints
    (lambda (a0 a1 a2 a3 a4)
      (let ((out (make-f32vector 2)))
        ((foreign-lambda*
           void
           ((f32vector out)
            ((c-pointer (struct "Font")) a0)
            (s32vector a1)
            (integer a2)
            (float a3)
            (float a4))
           "*((Vector2*)out) = MeasureTextCodepoints(*a0 , a1 , a2 , a3 , a4);\n")
         out
         a0
         a1
         a2
         a3
         a4)
        out))))
(begin
  (define get-glyph-index
    (foreign-lambda*
      integer
      (((c-pointer (struct "Font")) a0) (integer a1))
      "return(GetGlyphIndex(*a0 , a1));")))
(begin
  (define get-glyph-info
    (foreign-lambda*
      (c-pointer (struct "GlyphInfo"))
      (((c-pointer (struct "Font")) a0) (integer a1))
      "struct GlyphInfo * tmp = (struct GlyphInfo *) C_malloc(sizeof(struct GlyphInfo));\n*tmp = GetGlyphInfo(*a0 , a1);\nreturn(tmp);;\n")))
(begin
  (define get-glyph-atlas-rec
    (lambda (a0 a1)
      (let ((out (make-f32vector 4)))
        ((foreign-lambda*
           void
           ((f32vector out) ((c-pointer (struct "Font")) a0) (integer a1))
           "*((Rectangle*)out) = GetGlyphAtlasRec(*a0 , a1);\n")
         out
         a0
         a1)
        out))))
(begin
  (define load-utf8
    (foreign-lambda*
      c-string
      ((s32vector a0) (integer a1))
      "return(LoadUTF8(a0 , a1));")))
(begin
  (define unload-utf8
    (foreign-lambda* void ((c-string a0)) "UnloadUTF8(a0);")))
(begin
  (define load-codepoints
    (foreign-lambda*
      (c-pointer integer)
      ((c-string a0) (s32vector a1))
      "return(LoadCodepoints(a0 , a1));")))
(begin
  (define unload-codepoints
    (foreign-lambda* void ((s32vector a0)) "UnloadCodepoints(a0);")))
(begin
  (define get-codepoint-count
    (foreign-lambda*
      integer
      ((c-string a0))
      "return(GetCodepointCount(a0));")))
(begin
  (define get-codepoint
    (foreign-lambda*
      integer
      ((c-string a0) (s32vector a1))
      "return(GetCodepoint(a0 , a1));")))
(begin
  (define get-codepoint-next
    (foreign-lambda*
      integer
      ((c-string a0) (s32vector a1))
      "return(GetCodepointNext(a0 , a1));")))
(begin
  (define get-codepoint-previous
    (foreign-lambda*
      integer
      ((c-string a0) (s32vector a1))
      "return(GetCodepointPrevious(a0 , a1));")))
(begin
  (define codepoint-to-utf8
    (foreign-lambda*
      c-string
      ((integer a0) (s32vector a1))
      "return(CodepointToUTF8(a0 , a1));")))
(begin
  (define load-text-lines
    (foreign-lambda*
      (c-pointer (c-pointer char))
      ((c-string a0) (s32vector a1))
      "return(LoadTextLines(a0 , a1));")))
(begin
  (define unload-text-lines
    (foreign-lambda*
      void
      (((c-pointer (c-pointer char)) a0) (integer a1))
      "UnloadTextLines(a0 , a1);")))
(begin
  (define text-copy
    (foreign-lambda*
      integer
      ((c-string a0) (c-string a1))
      "return(TextCopy(a0 , a1));")))
(begin
  (define text-is-equal
    (foreign-lambda*
      bool
      ((c-string a0) (c-string a1))
      "return(TextIsEqual(a0 , a1));")))
(begin
  (define text-length
    (foreign-lambda*
      unsigned-integer
      ((c-string a0))
      "return(TextLength(a0));")))
(begin
  (define text-subtext
    (foreign-lambda*
      c-string
      ((c-string a0) (integer a1) (integer a2))
      "return(TextSubtext(a0 , a1 , a2));")))
(begin
  (define text-remove-spaces
    (foreign-lambda*
      c-string
      ((c-string a0))
      "return(TextRemoveSpaces(a0));")))
(begin
  (define get-text-between
    (foreign-lambda*
      c-string
      ((c-string a0) (c-string a1) (c-string a2))
      "return(GetTextBetween(a0 , a1 , a2));")))
(begin
  (define text-replace
    (foreign-lambda*
      c-string
      ((c-string a0) (c-string a1) (c-string a2))
      "return(TextReplace(a0 , a1 , a2));")))
(begin
  (define text-replace-alloc
    (foreign-lambda*
      c-string
      ((c-string a0) (c-string a1) (c-string a2))
      "return(TextReplaceAlloc(a0 , a1 , a2));")))
(begin
  (define text-replace-between
    (foreign-lambda*
      c-string
      ((c-string a0) (c-string a1) (c-string a2) (c-string a3))
      "return(TextReplaceBetween(a0 , a1 , a2 , a3));")))
(begin
  (define text-replace-between-alloc
    (foreign-lambda*
      c-string
      ((c-string a0) (c-string a1) (c-string a2) (c-string a3))
      "return(TextReplaceBetweenAlloc(a0 , a1 , a2 , a3));")))
(begin
  (define text-insert
    (foreign-lambda*
      c-string
      ((c-string a0) (c-string a1) (integer a2))
      "return(TextInsert(a0 , a1 , a2));")))
(begin
  (define text-insert-alloc
    (foreign-lambda*
      c-string
      ((c-string a0) (c-string a1) (integer a2))
      "return(TextInsertAlloc(a0 , a1 , a2));")))
(begin
  (define text-join
    (foreign-lambda*
      c-string
      (((c-pointer (c-pointer char)) a0) (integer a1) (c-string a2))
      "return(TextJoin(a0 , a1 , a2));")))
(begin
  (define text-split
    (foreign-lambda*
      (c-pointer (c-pointer char))
      ((c-string a0) (char a1) (s32vector a2))
      "return(TextSplit(a0 , a1 , a2));")))
(begin
  (define text-append
    (foreign-lambda*
      void
      ((c-string a0) (c-string a1) (s32vector a2))
      "TextAppend(a0 , a1 , a2);")))
(begin
  (define text-find-index
    (foreign-lambda*
      integer
      ((c-string a0) (c-string a1))
      "return(TextFindIndex(a0 , a1));")))
(begin
  (define text-to-upper
    (foreign-lambda* c-string ((c-string a0)) "return(TextToUpper(a0));")))
(begin
  (define text-to-lower
    (foreign-lambda* c-string ((c-string a0)) "return(TextToLower(a0));")))
(begin
  (define text-to-pascal
    (foreign-lambda* c-string ((c-string a0)) "return(TextToPascal(a0));")))
(begin
  (define text-to-snake
    (foreign-lambda* c-string ((c-string a0)) "return(TextToSnake(a0));")))
(begin
  (define text-to-camel
    (foreign-lambda* c-string ((c-string a0)) "return(TextToCamel(a0));")))
(begin
  (define text-to-integer
    (foreign-lambda* integer ((c-string a0)) "return(TextToInteger(a0));")))
(begin
  (define text-to-float
    (foreign-lambda* float ((c-string a0)) "return(TextToFloat(a0));")))
(begin
  (define draw-line3d
    (foreign-lambda*
      void
      ((f32vector a0) (f32vector a1) (u8vector a2))
      "DrawLine3D(*((Vector3*)a0) , *((Vector3*)a1) , *((Color*)a2));")))
(begin
  (define draw-point3d
    (foreign-lambda*
      void
      ((f32vector a0) (u8vector a1))
      "DrawPoint3D(*((Vector3*)a0) , *((Color*)a1));")))
(begin
  (define draw-circle3d
    (foreign-lambda*
      void
      ((f32vector a0) (float a1) (f32vector a2) (float a3) (u8vector a4))
      "DrawCircle3D(*((Vector3*)a0) , a1 , *((Vector3*)a2) , a3 , *((Color*)a4));")))
(begin
  (define draw-triangle3d
    (foreign-lambda*
      void
      ((f32vector a0) (f32vector a1) (f32vector a2) (u8vector a3))
      "DrawTriangle3D(*((Vector3*)a0) , *((Vector3*)a1) , *((Vector3*)a2) , *((Color*)a3));")))
(begin
  (define draw-triangle-strip3d
    (foreign-lambda*
      void
      (((c-pointer (struct "Vector3")) a0) (integer a1) (u8vector a2))
      "DrawTriangleStrip3D(a0 , a1 , *((Color*)a2));")))
(begin
  (define draw-cube
    (foreign-lambda*
      void
      ((f32vector a0) (float a1) (float a2) (float a3) (u8vector a4))
      "DrawCube(*((Vector3*)a0) , a1 , a2 , a3 , *((Color*)a4));")))
(begin
  (define draw-cube-v
    (foreign-lambda*
      void
      ((f32vector a0) (f32vector a1) (u8vector a2))
      "DrawCubeV(*((Vector3*)a0) , *((Vector3*)a1) , *((Color*)a2));")))
(begin
  (define draw-cube-wires
    (foreign-lambda*
      void
      ((f32vector a0) (float a1) (float a2) (float a3) (u8vector a4))
      "DrawCubeWires(*((Vector3*)a0) , a1 , a2 , a3 , *((Color*)a4));")))
(begin
  (define draw-cube-wires-v
    (foreign-lambda*
      void
      ((f32vector a0) (f32vector a1) (u8vector a2))
      "DrawCubeWiresV(*((Vector3*)a0) , *((Vector3*)a1) , *((Color*)a2));")))
(begin
  (define draw-sphere
    (foreign-lambda*
      void
      ((f32vector a0) (float a1) (u8vector a2))
      "DrawSphere(*((Vector3*)a0) , a1 , *((Color*)a2));")))
(begin
  (define draw-sphere-ex
    (foreign-lambda*
      void
      ((f32vector a0) (float a1) (integer a2) (integer a3) (u8vector a4))
      "DrawSphereEx(*((Vector3*)a0) , a1 , a2 , a3 , *((Color*)a4));")))
(begin
  (define draw-sphere-wires
    (foreign-lambda*
      void
      ((f32vector a0) (float a1) (integer a2) (integer a3) (u8vector a4))
      "DrawSphereWires(*((Vector3*)a0) , a1 , a2 , a3 , *((Color*)a4));")))
(begin
  (define draw-cylinder
    (foreign-lambda*
      void
      ((f32vector a0)
       (float a1)
       (float a2)
       (float a3)
       (integer a4)
       (u8vector a5))
      "DrawCylinder(*((Vector3*)a0) , a1 , a2 , a3 , a4 , *((Color*)a5));")))
(begin
  (define draw-cylinder-ex
    (foreign-lambda*
      void
      ((f32vector a0)
       (f32vector a1)
       (float a2)
       (float a3)
       (integer a4)
       (u8vector a5))
      "DrawCylinderEx(*((Vector3*)a0) , *((Vector3*)a1) , a2 , a3 , a4 , *((Color*)a5));")))
(begin
  (define draw-cylinder-wires
    (foreign-lambda*
      void
      ((f32vector a0)
       (float a1)
       (float a2)
       (float a3)
       (integer a4)
       (u8vector a5))
      "DrawCylinderWires(*((Vector3*)a0) , a1 , a2 , a3 , a4 , *((Color*)a5));")))
(begin
  (define draw-cylinder-wires-ex
    (foreign-lambda*
      void
      ((f32vector a0)
       (f32vector a1)
       (float a2)
       (float a3)
       (integer a4)
       (u8vector a5))
      "DrawCylinderWiresEx(*((Vector3*)a0) , *((Vector3*)a1) , a2 , a3 , a4 , *((Color*)a5));")))
(begin
  (define draw-capsule
    (foreign-lambda*
      void
      ((f32vector a0)
       (f32vector a1)
       (float a2)
       (integer a3)
       (integer a4)
       (u8vector a5))
      "DrawCapsule(*((Vector3*)a0) , *((Vector3*)a1) , a2 , a3 , a4 , *((Color*)a5));")))
(begin
  (define draw-capsule-wires
    (foreign-lambda*
      void
      ((f32vector a0)
       (f32vector a1)
       (float a2)
       (integer a3)
       (integer a4)
       (u8vector a5))
      "DrawCapsuleWires(*((Vector3*)a0) , *((Vector3*)a1) , a2 , a3 , a4 , *((Color*)a5));")))
(begin
  (define draw-plane
    (foreign-lambda*
      void
      ((f32vector a0) (f32vector a1) (u8vector a2))
      "DrawPlane(*((Vector3*)a0) , *((Vector2*)a1) , *((Color*)a2));")))
(begin
  (define draw-ray
    (foreign-lambda*
      void
      (((c-pointer (struct "Ray")) a0) (u8vector a1))
      "DrawRay(*a0 , *((Color*)a1));")))
(begin
  (define draw-grid
    (foreign-lambda* void ((integer a0) (float a1)) "DrawGrid(a0 , a1);")))
(begin
  (define load-model
    (foreign-lambda*
      (c-pointer (struct "Model"))
      ((c-string a0))
      "struct Model * tmp = (struct Model *) C_malloc(sizeof(struct Model));\n*tmp = LoadModel(a0);\nreturn(tmp);;\n")))
(begin
  (define load-model-from-mesh
    (foreign-lambda*
      (c-pointer (struct "Model"))
      (((c-pointer (struct "Mesh")) a0))
      "struct Model * tmp = (struct Model *) C_malloc(sizeof(struct Model));\n*tmp = LoadModelFromMesh(*a0);\nreturn(tmp);;\n")))
(begin
  (define is-model-valid
    (foreign-lambda*
      bool
      (((c-pointer (struct "Model")) a0))
      "return(IsModelValid(*a0));")))
(begin
  (define unload-model
    (foreign-lambda*
      void
      (((c-pointer (struct "Model")) a0))
      "UnloadModel(*a0);")))
(begin
  (define get-model-bounding-box
    (foreign-lambda*
      (c-pointer (struct "BoundingBox"))
      (((c-pointer (struct "Model")) a0))
      "struct BoundingBox * tmp = (struct BoundingBox *) C_malloc(sizeof(struct BoundingBox));\n*tmp = GetModelBoundingBox(*a0);\nreturn(tmp);;\n")))
(begin
  (define draw-model
    (foreign-lambda*
      void
      (((c-pointer (struct "Model")) a0)
       (f32vector a1)
       (float a2)
       (u8vector a3))
      "DrawModel(*a0 , *((Vector3*)a1) , a2 , *((Color*)a3));")))
(begin
  (define draw-model-ex
    (foreign-lambda*
      void
      (((c-pointer (struct "Model")) a0)
       (f32vector a1)
       (f32vector a2)
       (float a3)
       (f32vector a4)
       (u8vector a5))
      "DrawModelEx(*a0 , *((Vector3*)a1) , *((Vector3*)a2) , a3 , *((Vector3*)a4) , *((Color*)a5));")))
(begin
  (define draw-model-wires
    (foreign-lambda*
      void
      (((c-pointer (struct "Model")) a0)
       (f32vector a1)
       (float a2)
       (u8vector a3))
      "DrawModelWires(*a0 , *((Vector3*)a1) , a2 , *((Color*)a3));")))
(begin
  (define draw-model-wires-ex
    (foreign-lambda*
      void
      (((c-pointer (struct "Model")) a0)
       (f32vector a1)
       (f32vector a2)
       (float a3)
       (f32vector a4)
       (u8vector a5))
      "DrawModelWiresEx(*a0 , *((Vector3*)a1) , *((Vector3*)a2) , a3 , *((Vector3*)a4) , *((Color*)a5));")))
(begin
  (define draw-bounding-box
    (foreign-lambda*
      void
      (((c-pointer (struct "BoundingBox")) a0) (u8vector a1))
      "DrawBoundingBox(*a0 , *((Color*)a1));")))
(begin
  (define draw-billboard
    (foreign-lambda*
      void
      (((c-pointer (struct "Camera3D")) a0)
       ((c-pointer (struct "Texture")) a1)
       (f32vector a2)
       (float a3)
       (u8vector a4))
      "DrawBillboard(*a0 , *a1 , *((Vector3*)a2) , a3 , *((Color*)a4));")))
(begin
  (define draw-billboard-rec
    (foreign-lambda*
      void
      (((c-pointer (struct "Camera3D")) a0)
       ((c-pointer (struct "Texture")) a1)
       (f32vector a2)
       (f32vector a3)
       (f32vector a4)
       (u8vector a5))
      "DrawBillboardRec(*a0 , *a1 , *((Rectangle*)a2) , *((Vector3*)a3) , *((Vector2*)a4) , *((Color*)a5));")))
(begin
  (define draw-billboard-pro
    (foreign-lambda*
      void
      (((c-pointer (struct "Camera3D")) a0)
       ((c-pointer (struct "Texture")) a1)
       (f32vector a2)
       (f32vector a3)
       (f32vector a4)
       (f32vector a5)
       (f32vector a6)
       (float a7)
       (u8vector a8))
      "DrawBillboardPro(*a0 , *a1 , *((Rectangle*)a2) , *((Vector3*)a3) , *((Vector3*)a4) , *((Vector2*)a5) , *((Vector2*)a6) , a7 , *((Color*)a8));")))
(begin
  (define upload-mesh
    (foreign-lambda*
      void
      (((c-pointer (struct "Mesh")) a0) (bool a1))
      "UploadMesh(a0 , a1);")))
(begin
  (define update-mesh-buffer
    (foreign-lambda*
      void
      (((c-pointer (struct "Mesh")) a0)
       (integer a1)
       ((c-pointer void) a2)
       (integer a3)
       (integer a4))
      "UpdateMeshBuffer(*a0 , a1 , a2 , a3 , a4);")))
(begin
  (define unload-mesh
    (foreign-lambda*
      void
      (((c-pointer (struct "Mesh")) a0))
      "UnloadMesh(*a0);")))
(begin
  (define draw-mesh
    (foreign-lambda*
      void
      (((c-pointer (struct "Mesh")) a0)
       ((c-pointer (struct "Material")) a1)
       (f32vector a2))
      "DrawMesh(*a0 , *a1 , *((Matrix*)a2));")))
(begin
  (define draw-mesh-instanced
    (foreign-lambda*
      void
      (((c-pointer (struct "Mesh")) a0)
       ((c-pointer (struct "Material")) a1)
       ((c-pointer (struct "Matrix")) a2)
       (integer a3))
      "DrawMeshInstanced(*a0 , *a1 , a2 , a3);")))
(begin
  (define get-mesh-bounding-box
    (foreign-lambda*
      (c-pointer (struct "BoundingBox"))
      (((c-pointer (struct "Mesh")) a0))
      "struct BoundingBox * tmp = (struct BoundingBox *) C_malloc(sizeof(struct BoundingBox));\n*tmp = GetMeshBoundingBox(*a0);\nreturn(tmp);;\n")))
(begin
  (define gen-mesh-tangents
    (foreign-lambda*
      void
      (((c-pointer (struct "Mesh")) a0))
      "GenMeshTangents(a0);")))
(begin
  (define export-mesh
    (foreign-lambda*
      bool
      (((c-pointer (struct "Mesh")) a0) (c-string a1))
      "return(ExportMesh(*a0 , a1));")))
(begin
  (define export-mesh-as-code
    (foreign-lambda*
      bool
      (((c-pointer (struct "Mesh")) a0) (c-string a1))
      "return(ExportMeshAsCode(*a0 , a1));")))
(begin
  (define gen-mesh-poly
    (foreign-lambda*
      (c-pointer (struct "Mesh"))
      ((integer a0) (float a1))
      "struct Mesh * tmp = (struct Mesh *) C_malloc(sizeof(struct Mesh));\n*tmp = GenMeshPoly(a0 , a1);\nreturn(tmp);;\n")))
(begin
  (define gen-mesh-plane
    (foreign-lambda*
      (c-pointer (struct "Mesh"))
      ((float a0) (float a1) (integer a2) (integer a3))
      "struct Mesh * tmp = (struct Mesh *) C_malloc(sizeof(struct Mesh));\n*tmp = GenMeshPlane(a0 , a1 , a2 , a3);\nreturn(tmp);;\n")))
(begin
  (define gen-mesh-cube
    (foreign-lambda*
      (c-pointer (struct "Mesh"))
      ((float a0) (float a1) (float a2))
      "struct Mesh * tmp = (struct Mesh *) C_malloc(sizeof(struct Mesh));\n*tmp = GenMeshCube(a0 , a1 , a2);\nreturn(tmp);;\n")))
(begin
  (define gen-mesh-sphere
    (foreign-lambda*
      (c-pointer (struct "Mesh"))
      ((float a0) (integer a1) (integer a2))
      "struct Mesh * tmp = (struct Mesh *) C_malloc(sizeof(struct Mesh));\n*tmp = GenMeshSphere(a0 , a1 , a2);\nreturn(tmp);;\n")))
(begin
  (define gen-mesh-hemi-sphere
    (foreign-lambda*
      (c-pointer (struct "Mesh"))
      ((float a0) (integer a1) (integer a2))
      "struct Mesh * tmp = (struct Mesh *) C_malloc(sizeof(struct Mesh));\n*tmp = GenMeshHemiSphere(a0 , a1 , a2);\nreturn(tmp);;\n")))
(begin
  (define gen-mesh-cylinder
    (foreign-lambda*
      (c-pointer (struct "Mesh"))
      ((float a0) (float a1) (integer a2))
      "struct Mesh * tmp = (struct Mesh *) C_malloc(sizeof(struct Mesh));\n*tmp = GenMeshCylinder(a0 , a1 , a2);\nreturn(tmp);;\n")))
(begin
  (define gen-mesh-cone
    (foreign-lambda*
      (c-pointer (struct "Mesh"))
      ((float a0) (float a1) (integer a2))
      "struct Mesh * tmp = (struct Mesh *) C_malloc(sizeof(struct Mesh));\n*tmp = GenMeshCone(a0 , a1 , a2);\nreturn(tmp);;\n")))
(begin
  (define gen-mesh-torus
    (foreign-lambda*
      (c-pointer (struct "Mesh"))
      ((float a0) (float a1) (integer a2) (integer a3))
      "struct Mesh * tmp = (struct Mesh *) C_malloc(sizeof(struct Mesh));\n*tmp = GenMeshTorus(a0 , a1 , a2 , a3);\nreturn(tmp);;\n")))
(begin
  (define gen-mesh-knot
    (foreign-lambda*
      (c-pointer (struct "Mesh"))
      ((float a0) (float a1) (integer a2) (integer a3))
      "struct Mesh * tmp = (struct Mesh *) C_malloc(sizeof(struct Mesh));\n*tmp = GenMeshKnot(a0 , a1 , a2 , a3);\nreturn(tmp);;\n")))
(begin
  (define gen-mesh-heightmap
    (foreign-lambda*
      (c-pointer (struct "Mesh"))
      (((c-pointer (struct "Image")) a0) (f32vector a1))
      "struct Mesh * tmp = (struct Mesh *) C_malloc(sizeof(struct Mesh));\n*tmp = GenMeshHeightmap(*a0 , *((Vector3*)a1));\nreturn(tmp);;\n")))
(begin
  (define gen-mesh-cubicmap
    (foreign-lambda*
      (c-pointer (struct "Mesh"))
      (((c-pointer (struct "Image")) a0) (f32vector a1))
      "struct Mesh * tmp = (struct Mesh *) C_malloc(sizeof(struct Mesh));\n*tmp = GenMeshCubicmap(*a0 , *((Vector3*)a1));\nreturn(tmp);;\n")))
(begin
  (define load-materials
    (foreign-lambda*
      (c-pointer (struct "Material"))
      ((c-string a0) (s32vector a1))
      "return(LoadMaterials(a0 , a1));")))
(begin
  (define load-material-default
    (foreign-lambda*
      (c-pointer (struct "Material"))
      ()
      "struct Material * tmp = (struct Material *) C_malloc(sizeof(struct Material));\n*tmp = LoadMaterialDefault();\nreturn(tmp);;\n")))
(begin
  (define is-material-valid
    (foreign-lambda*
      bool
      (((c-pointer (struct "Material")) a0))
      "return(IsMaterialValid(*a0));")))
(begin
  (define unload-material
    (foreign-lambda*
      void
      (((c-pointer (struct "Material")) a0))
      "UnloadMaterial(*a0);")))
(begin
  (define set-material-texture
    (foreign-lambda*
      void
      (((c-pointer (struct "Material")) a0)
       (integer a1)
       ((c-pointer (struct "Texture")) a2))
      "SetMaterialTexture(a0 , a1 , *a2);")))
(begin
  (define set-model-mesh-material
    (foreign-lambda*
      void
      (((c-pointer (struct "Model")) a0) (integer a1) (integer a2))
      "SetModelMeshMaterial(a0 , a1 , a2);")))
(begin
  (define load-model-animations
    (foreign-lambda*
      (c-pointer (struct "ModelAnimation"))
      ((c-string a0) (s32vector a1))
      "return(LoadModelAnimations(a0 , a1));")))
(begin
  (define update-model-animation
    (foreign-lambda*
      void
      (((c-pointer (struct "Model")) a0)
       ((c-pointer (struct "ModelAnimation")) a1)
       (float a2))
      "UpdateModelAnimation(*a0 , *a1 , a2);")))
(begin
  (define update-model-animation-ex
    (foreign-lambda*
      void
      (((c-pointer (struct "Model")) a0)
       ((c-pointer (struct "ModelAnimation")) a1)
       (float a2)
       ((c-pointer (struct "ModelAnimation")) a3)
       (float a4)
       (float a5))
      "UpdateModelAnimationEx(*a0 , *a1 , a2 , *a3 , a4 , a5);")))
(begin
  (define unload-model-animations
    (foreign-lambda*
      void
      (((c-pointer (struct "ModelAnimation")) a0) (integer a1))
      "UnloadModelAnimations(a0 , a1);")))
(begin
  (define is-model-animation-valid
    (foreign-lambda*
      bool
      (((c-pointer (struct "Model")) a0)
       ((c-pointer (struct "ModelAnimation")) a1))
      "return(IsModelAnimationValid(*a0 , *a1));")))
(begin
  (define check-collision-spheres
    (foreign-lambda*
      bool
      ((f32vector a0) (float a1) (f32vector a2) (float a3))
      "return(CheckCollisionSpheres(*((Vector3*)a0) , a1 , *((Vector3*)a2) , a3));")))
(begin
  (define check-collision-boxes
    (foreign-lambda*
      bool
      (((c-pointer (struct "BoundingBox")) a0)
       ((c-pointer (struct "BoundingBox")) a1))
      "return(CheckCollisionBoxes(*a0 , *a1));")))
(begin
  (define check-collision-box-sphere
    (foreign-lambda*
      bool
      (((c-pointer (struct "BoundingBox")) a0) (f32vector a1) (float a2))
      "return(CheckCollisionBoxSphere(*a0 , *((Vector3*)a1) , a2));")))
(begin
  (define get-ray-collision-sphere
    (foreign-lambda*
      (c-pointer (struct "RayCollision"))
      (((c-pointer (struct "Ray")) a0) (f32vector a1) (float a2))
      "struct RayCollision * tmp = (struct RayCollision *) C_malloc(sizeof(struct RayCollision));\n*tmp = GetRayCollisionSphere(*a0 , *((Vector3*)a1) , a2);\nreturn(tmp);;\n")))
(begin
  (define get-ray-collision-box
    (foreign-lambda*
      (c-pointer (struct "RayCollision"))
      (((c-pointer (struct "Ray")) a0) ((c-pointer (struct "BoundingBox")) a1))
      "struct RayCollision * tmp = (struct RayCollision *) C_malloc(sizeof(struct RayCollision));\n*tmp = GetRayCollisionBox(*a0 , *a1);\nreturn(tmp);;\n")))
(begin
  (define get-ray-collision-mesh
    (foreign-lambda*
      (c-pointer (struct "RayCollision"))
      (((c-pointer (struct "Ray")) a0)
       ((c-pointer (struct "Mesh")) a1)
       (f32vector a2))
      "struct RayCollision * tmp = (struct RayCollision *) C_malloc(sizeof(struct RayCollision));\n*tmp = GetRayCollisionMesh(*a0 , *a1 , *((Matrix*)a2));\nreturn(tmp);;\n")))
(begin
  (define get-ray-collision-triangle
    (foreign-lambda*
      (c-pointer (struct "RayCollision"))
      (((c-pointer (struct "Ray")) a0)
       (f32vector a1)
       (f32vector a2)
       (f32vector a3))
      "struct RayCollision * tmp = (struct RayCollision *) C_malloc(sizeof(struct RayCollision));\n*tmp = GetRayCollisionTriangle(*a0 , *((Vector3*)a1) , *((Vector3*)a2) , *((Vector3*)a3));\nreturn(tmp);;\n")))
(begin
  (define get-ray-collision-quad
    (foreign-lambda*
      (c-pointer (struct "RayCollision"))
      (((c-pointer (struct "Ray")) a0)
       (f32vector a1)
       (f32vector a2)
       (f32vector a3)
       (f32vector a4))
      "struct RayCollision * tmp = (struct RayCollision *) C_malloc(sizeof(struct RayCollision));\n*tmp = GetRayCollisionQuad(*a0 , *((Vector3*)a1) , *((Vector3*)a2) , *((Vector3*)a3) , *((Vector3*)a4));\nreturn(tmp);;\n")))
(begin
  (define init-audio-device (foreign-lambda* void () "InitAudioDevice();")))
(begin
  (define close-audio-device (foreign-lambda* void () "CloseAudioDevice();")))
(begin
  (define is-audio-device-ready
    (foreign-lambda* bool () "return(IsAudioDeviceReady());")))
(begin
  (define set-master-volume
    (foreign-lambda* void ((float a0)) "SetMasterVolume(a0);")))
(begin
  (define get-master-volume
    (foreign-lambda* float () "return(GetMasterVolume());")))
(begin
  (define load-wave
    (foreign-lambda*
      (c-pointer (struct "Wave"))
      ((c-string a0))
      "struct Wave * tmp = (struct Wave *) C_malloc(sizeof(struct Wave));\n*tmp = LoadWave(a0);\nreturn(tmp);;\n")))
(begin
  (define load-wave-from-memory
    (foreign-lambda*
      (c-pointer (struct "Wave"))
      ((c-string a0) (u8vector a1) (integer a2))
      "struct Wave * tmp = (struct Wave *) C_malloc(sizeof(struct Wave));\n*tmp = LoadWaveFromMemory(a0 , a1 , a2);\nreturn(tmp);;\n")))
(begin
  (define is-wave-valid
    (foreign-lambda*
      bool
      (((c-pointer (struct "Wave")) a0))
      "return(IsWaveValid(*a0));")))
(begin
  (define load-sound
    (foreign-lambda*
      (c-pointer (struct "Sound"))
      ((c-string a0))
      "struct Sound * tmp = (struct Sound *) C_malloc(sizeof(struct Sound));\n*tmp = LoadSound(a0);\nreturn(tmp);;\n")))
(begin
  (define load-sound-from-wave
    (foreign-lambda*
      (c-pointer (struct "Sound"))
      (((c-pointer (struct "Wave")) a0))
      "struct Sound * tmp = (struct Sound *) C_malloc(sizeof(struct Sound));\n*tmp = LoadSoundFromWave(*a0);\nreturn(tmp);;\n")))
(begin
  (define load-sound-alias
    (foreign-lambda*
      (c-pointer (struct "Sound"))
      (((c-pointer (struct "Sound")) a0))
      "struct Sound * tmp = (struct Sound *) C_malloc(sizeof(struct Sound));\n*tmp = LoadSoundAlias(*a0);\nreturn(tmp);;\n")))
(begin
  (define is-sound-valid
    (foreign-lambda*
      bool
      (((c-pointer (struct "Sound")) a0))
      "return(IsSoundValid(*a0));")))
(begin
  (define update-sound
    (foreign-lambda*
      void
      (((c-pointer (struct "Sound")) a0) ((c-pointer void) a1) (integer a2))
      "UpdateSound(*a0 , a1 , a2);")))
(begin
  (define unload-wave
    (foreign-lambda*
      void
      (((c-pointer (struct "Wave")) a0))
      "UnloadWave(*a0);")))
(begin
  (define unload-sound
    (foreign-lambda*
      void
      (((c-pointer (struct "Sound")) a0))
      "UnloadSound(*a0);")))
(begin
  (define unload-sound-alias
    (foreign-lambda*
      void
      (((c-pointer (struct "Sound")) a0))
      "UnloadSoundAlias(*a0);")))
(begin
  (define export-wave
    (foreign-lambda*
      bool
      (((c-pointer (struct "Wave")) a0) (c-string a1))
      "return(ExportWave(*a0 , a1));")))
(begin
  (define export-wave-as-code
    (foreign-lambda*
      bool
      (((c-pointer (struct "Wave")) a0) (c-string a1))
      "return(ExportWaveAsCode(*a0 , a1));")))
(begin
  (define play-sound
    (foreign-lambda*
      void
      (((c-pointer (struct "Sound")) a0))
      "PlaySound(*a0);")))
(begin
  (define stop-sound
    (foreign-lambda*
      void
      (((c-pointer (struct "Sound")) a0))
      "StopSound(*a0);")))
(begin
  (define pause-sound
    (foreign-lambda*
      void
      (((c-pointer (struct "Sound")) a0))
      "PauseSound(*a0);")))
(begin
  (define resume-sound
    (foreign-lambda*
      void
      (((c-pointer (struct "Sound")) a0))
      "ResumeSound(*a0);")))
(begin
  (define is-sound-playing
    (foreign-lambda*
      bool
      (((c-pointer (struct "Sound")) a0))
      "return(IsSoundPlaying(*a0));")))
(begin
  (define set-sound-volume
    (foreign-lambda*
      void
      (((c-pointer (struct "Sound")) a0) (float a1))
      "SetSoundVolume(*a0 , a1);")))
(begin
  (define set-sound-pitch
    (foreign-lambda*
      void
      (((c-pointer (struct "Sound")) a0) (float a1))
      "SetSoundPitch(*a0 , a1);")))
(begin
  (define set-sound-pan
    (foreign-lambda*
      void
      (((c-pointer (struct "Sound")) a0) (float a1))
      "SetSoundPan(*a0 , a1);")))
(begin
  (define wave-copy
    (foreign-lambda*
      (c-pointer (struct "Wave"))
      (((c-pointer (struct "Wave")) a0))
      "struct Wave * tmp = (struct Wave *) C_malloc(sizeof(struct Wave));\n*tmp = WaveCopy(*a0);\nreturn(tmp);;\n")))
(begin
  (define wave-crop
    (foreign-lambda*
      void
      (((c-pointer (struct "Wave")) a0) (integer a1) (integer a2))
      "WaveCrop(a0 , a1 , a2);")))
(begin
  (define wave-format
    (foreign-lambda*
      void
      (((c-pointer (struct "Wave")) a0) (integer a1) (integer a2) (integer a3))
      "WaveFormat(a0 , a1 , a2 , a3);")))
(begin
  (define load-wave-samples
    (foreign-lambda*
      (c-pointer float)
      (((c-pointer (struct "Wave")) a0))
      "return(LoadWaveSamples(*a0));")))
(begin
  (define unload-wave-samples
    (foreign-lambda* void ((f32vector a0)) "UnloadWaveSamples(a0);")))
(begin
  (define load-music-stream
    (foreign-lambda*
      (c-pointer (struct "Music"))
      ((c-string a0))
      "struct Music * tmp = (struct Music *) C_malloc(sizeof(struct Music));\n*tmp = LoadMusicStream(a0);\nreturn(tmp);;\n")))
(begin
  (define load-music-stream-from-memory
    (foreign-lambda*
      (c-pointer (struct "Music"))
      ((c-string a0) (u8vector a1) (integer a2))
      "struct Music * tmp = (struct Music *) C_malloc(sizeof(struct Music));\n*tmp = LoadMusicStreamFromMemory(a0 , a1 , a2);\nreturn(tmp);;\n")))
(begin
  (define is-music-valid
    (foreign-lambda*
      bool
      (((c-pointer (struct "Music")) a0))
      "return(IsMusicValid(*a0));")))
(begin
  (define unload-music-stream
    (foreign-lambda*
      void
      (((c-pointer (struct "Music")) a0))
      "UnloadMusicStream(*a0);")))
(begin
  (define play-music-stream
    (foreign-lambda*
      void
      (((c-pointer (struct "Music")) a0))
      "PlayMusicStream(*a0);")))
(begin
  (define is-music-stream-playing
    (foreign-lambda*
      bool
      (((c-pointer (struct "Music")) a0))
      "return(IsMusicStreamPlaying(*a0));")))
(begin
  (define update-music-stream
    (foreign-lambda*
      void
      (((c-pointer (struct "Music")) a0))
      "UpdateMusicStream(*a0);")))
(begin
  (define stop-music-stream
    (foreign-lambda*
      void
      (((c-pointer (struct "Music")) a0))
      "StopMusicStream(*a0);")))
(begin
  (define pause-music-stream
    (foreign-lambda*
      void
      (((c-pointer (struct "Music")) a0))
      "PauseMusicStream(*a0);")))
(begin
  (define resume-music-stream
    (foreign-lambda*
      void
      (((c-pointer (struct "Music")) a0))
      "ResumeMusicStream(*a0);")))
(begin
  (define seek-music-stream
    (foreign-lambda*
      void
      (((c-pointer (struct "Music")) a0) (float a1))
      "SeekMusicStream(*a0 , a1);")))
(begin
  (define set-music-volume
    (foreign-lambda*
      void
      (((c-pointer (struct "Music")) a0) (float a1))
      "SetMusicVolume(*a0 , a1);")))
(begin
  (define set-music-pitch
    (foreign-lambda*
      void
      (((c-pointer (struct "Music")) a0) (float a1))
      "SetMusicPitch(*a0 , a1);")))
(begin
  (define set-music-pan
    (foreign-lambda*
      void
      (((c-pointer (struct "Music")) a0) (float a1))
      "SetMusicPan(*a0 , a1);")))
(begin
  (define get-music-time-length
    (foreign-lambda*
      float
      (((c-pointer (struct "Music")) a0))
      "return(GetMusicTimeLength(*a0));")))
(begin
  (define get-music-time-played
    (foreign-lambda*
      float
      (((c-pointer (struct "Music")) a0))
      "return(GetMusicTimePlayed(*a0));")))
(begin
  (define load-audio-stream
    (foreign-lambda*
      (c-pointer (struct "AudioStream"))
      ((unsigned-integer a0) (unsigned-integer a1) (unsigned-integer a2))
      "struct AudioStream * tmp = (struct AudioStream *) C_malloc(sizeof(struct AudioStream));\n*tmp = LoadAudioStream(a0 , a1 , a2);\nreturn(tmp);;\n")))
(begin
  (define is-audio-stream-valid
    (foreign-lambda*
      bool
      (((c-pointer (struct "AudioStream")) a0))
      "return(IsAudioStreamValid(*a0));")))
(begin
  (define unload-audio-stream
    (foreign-lambda*
      void
      (((c-pointer (struct "AudioStream")) a0))
      "UnloadAudioStream(*a0);")))
(begin
  (define update-audio-stream
    (foreign-lambda*
      void
      (((c-pointer (struct "AudioStream")) a0)
       ((c-pointer void) a1)
       (integer a2))
      "UpdateAudioStream(*a0 , a1 , a2);")))
(begin
  (define is-audio-stream-processed
    (foreign-lambda*
      bool
      (((c-pointer (struct "AudioStream")) a0))
      "return(IsAudioStreamProcessed(*a0));")))
(begin
  (define play-audio-stream
    (foreign-lambda*
      void
      (((c-pointer (struct "AudioStream")) a0))
      "PlayAudioStream(*a0);")))
(begin
  (define pause-audio-stream
    (foreign-lambda*
      void
      (((c-pointer (struct "AudioStream")) a0))
      "PauseAudioStream(*a0);")))
(begin
  (define resume-audio-stream
    (foreign-lambda*
      void
      (((c-pointer (struct "AudioStream")) a0))
      "ResumeAudioStream(*a0);")))
(begin
  (define is-audio-stream-playing
    (foreign-lambda*
      bool
      (((c-pointer (struct "AudioStream")) a0))
      "return(IsAudioStreamPlaying(*a0));")))
(begin
  (define stop-audio-stream
    (foreign-lambda*
      void
      (((c-pointer (struct "AudioStream")) a0))
      "StopAudioStream(*a0);")))
(begin
  (define set-audio-stream-volume
    (foreign-lambda*
      void
      (((c-pointer (struct "AudioStream")) a0) (float a1))
      "SetAudioStreamVolume(*a0 , a1);")))
(begin
  (define set-audio-stream-pitch
    (foreign-lambda*
      void
      (((c-pointer (struct "AudioStream")) a0) (float a1))
      "SetAudioStreamPitch(*a0 , a1);")))
(begin
  (define set-audio-stream-pan
    (foreign-lambda*
      void
      (((c-pointer (struct "AudioStream")) a0) (float a1))
      "SetAudioStreamPan(*a0 , a1);")))
(begin
  (define set-audio-stream-buffer-size-default
    (foreign-lambda*
      void
      ((integer a0))
      "SetAudioStreamBufferSizeDefault(a0);")))
