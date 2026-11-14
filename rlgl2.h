// Dynamic vertex buffers (position + texcoords + colors + indices arrays)
typedef struct rlVertexBuffer {
    int elementCount;           // Number of elements in the buffer (QUADS)

    float *vertices;            // Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
    float *texcoords;           // Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
    float *normals;             // Vertex normal (XYZ - 3 components per vertex) (shader-location = 2)
    unsigned char *colors;      // Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
    unsigned int *indices;      // Vertex indices (in case vertex data comes indexed) (6 indices per quad)
    unsigned int vaoId;         // OpenGL Vertex Array Object id
    //unsigned int vboId[5];      // OpenGL Vertex Buffer Objects id (5 types of vertex data)
} rlVertexBuffer;

// Draw call type
// NOTE: Only texture changes register a new draw, other state-change-related elements are not
// used at this moment (vaoId, shaderId, matrices), raylib forces a batch draw call if any
// of those state-change happens (this is done in core module)
typedef struct rlDrawCall {
    int mode;                   // Drawing mode: LINES, TRIANGLES, QUADS
    int vertexCount;            // Number of vertex of the draw
    int vertexAlignment;        // Number of vertex required for index alignment (LINES, TRIANGLES)
    //unsigned int vaoId;       // Vertex array id to be used on the draw -> Using RLGL.currentBatch->vertexBuffer.vaoId
    //unsigned int shaderId;    // Shader id to be used on the draw -> Using RLGL.currentShaderId
    unsigned int textureId;     // Texture id to be used on the draw -> Use to create new draw call if changes

    //Matrix projection;        // Projection matrix for this draw -> Using RLGL.projection by default
    //Matrix modelview;         // Modelview matrix for this draw -> Using RLGL.modelview by default
} rlDrawCall;

// rlRenderBatch type
typedef struct rlRenderBatch {
    int bufferCount;            // Number of vertex buffers (multi-buffering support)
    int currentBuffer;          // Current buffer tracking in case of multi-buffering
    rlVertexBuffer *vertexBuffer; // Dynamic buffer(s) for vertex data

    rlDrawCall *draws;          // Draw calls array, depends on textureId
    int drawCounter;            // Draw calls counter
    float currentDepth;         // Current depth value for next draw
} rlRenderBatch;

typedef struct Matrix {} Matrix;

void rlMatrixMode(int mode);                      // Choose the current matrix to be transformed
void rlPushMatrix(void);                          // Push the current matrix to stack
void rlPopMatrix(void);                           // Pop latest inserted matrix from stack
void rlLoadIdentity(void);                        // Reset current matrix to identity matrix
void rlTranslatef(float x, float y, float z);     // Multiply the current matrix by a translation matrix
void rlRotatef(float angle, float x, float y, float z); // Multiply the current matrix by a rotation matrix
void rlScalef(float x, float y, float z);         // Multiply the current matrix by a scaling matrix
void rlMultMatrixf(const float *matf);            // Multiply the current matrix by another matrix
void rlFrustum(double left, double right, double bottom, double top, double znear, double zfar);
void rlOrtho(double left, double right, double bottom, double top, double znear, double zfar);
void rlViewport(int x, int y, int width, int height); // Set the viewport area
void rlSetClipPlanes(double nearPlane, double farPlane);    // Set clip planes distances
double rlGetCullDistanceNear(void);               // Get cull plane distance near
double rlGetCullDistanceFar(void);                // Get cull plane distance far

//------------------------------------------------------------------------------------
// Functions Declaration - Vertex level operations
//------------------------------------------------------------------------------------
void rlBegin(int mode);                           // Initialize drawing mode (how to organize vertex)
void rlEnd(void);                                 // Finish vertex providing
void rlVertex2i(int x, int y);                    // Define one vertex (position) - 2 int
void rlVertex2f(float x, float y);                // Define one vertex (position) - 2 float
void rlVertex3f(float x, float y, float z);       // Define one vertex (position) - 3 float
void rlTexCoord2f(float x, float y);              // Define one vertex (texture coordinate) - 2 float
void rlNormal3f(float x, float y, float z);       // Define one vertex (normal) - 3 float
void rlColor4ub(unsigned char r, unsigned char g, unsigned char b, unsigned char a); // Define one vertex (color) - 4 byte
void rlColor3f(float x, float y, float z);        // Define one vertex (color) - 3 float
void rlColor4f(float x, float y, float z, float w); // Define one vertex (color) - 4 float

//------------------------------------------------------------------------------------
// Functions Declaration - OpenGL style functions (common to 1.1, 3.3+, ES2)
// NOTE: This functions are used to completely abstract raylib code from OpenGL layer,
// some of them are direct wrappers over OpenGL calls, some others are custom
//------------------------------------------------------------------------------------

// Vertex buffers state
bool rlEnableVertexArray(unsigned int vaoId);     // Enable vertex array (VAO, if supported)
void rlDisableVertexArray(void);                  // Disable vertex array (VAO, if supported)
void rlEnableVertexBuffer(unsigned int id);       // Enable vertex buffer (VBO)
void rlDisableVertexBuffer(void);                 // Disable vertex buffer (VBO)
void rlEnableVertexBufferElement(unsigned int id); // Enable vertex buffer element (VBO element)
void rlDisableVertexBufferElement(void);          // Disable vertex buffer element (VBO element)
void rlEnableVertexAttribute(unsigned int index); // Enable vertex attribute index
void rlDisableVertexAttribute(unsigned int index); // Disable vertex attribute index
void rlEnableStatePointer(int vertexAttribType, void *buffer); // Enable attribute state pointer
void rlDisableStatePointer(int vertexAttribType); // Disable attribute state pointer

// Textures state
void rlActiveTextureSlot(int slot);               // Select and active a texture slot
void rlEnableTexture(unsigned int id);            // Enable texture
void rlDisableTexture(void);                      // Disable texture
void rlEnableTextureCubemap(unsigned int id);     // Enable texture cubemap
void rlDisableTextureCubemap(void);               // Disable texture cubemap
void rlTextureParameters(unsigned int id, int param, int value); // Set texture parameters (filter, wrap)
void rlCubemapParameters(unsigned int id, int param, int value); // Set cubemap parameters (filter, wrap)

// Shader state
void rlEnableShader(unsigned int id);             // Enable shader program
void rlDisableShader(void);                       // Disable shader program

// Framebuffer state
void rlEnableFramebuffer(unsigned int id);        // Enable render texture (fbo)
void rlDisableFramebuffer(void);                  // Disable render texture (fbo), return to default framebuffer
unsigned int rlGetActiveFramebuffer(void);        // Get the currently active render texture (fbo), 0 for default framebuffer
void rlActiveDrawBuffers(int count);              // Activate multiple draw color buffers
void rlBlitFramebuffer(int srcX, int srcY, int srcWidth, int srcHeight, int dstX, int dstY, int dstWidth, int dstHeight, int bufferMask); // Blit active framebuffer to main framebuffer
void rlBindFramebuffer(unsigned int target, unsigned int framebuffer); // Bind framebuffer (FBO)

// General render state
void rlEnableColorBlend(void);                    // Enable color blending
void rlDisableColorBlend(void);                   // Disable color blending
void rlEnableDepthTest(void);                     // Enable depth test
void rlDisableDepthTest(void);                    // Disable depth test
void rlEnableDepthMask(void);                     // Enable depth write
void rlDisableDepthMask(void);                    // Disable depth write
void rlEnableBackfaceCulling(void);               // Enable backface culling
void rlDisableBackfaceCulling(void);              // Disable backface culling
void rlColorMask(bool r, bool g, bool b, bool a); // Color mask control
void rlSetCullFace(int mode);                     // Set face culling mode
void rlEnableScissorTest(void);                   // Enable scissor test
void rlDisableScissorTest(void);                  // Disable scissor test
void rlScissor(int x, int y, int width, int height); // Scissor test
void rlEnablePointMode(void);                     // Enable point mode
void rlDisablePointMode(void);                    // Disable point mode
void rlSetPointSize(float size);                  // Set the point drawing size
float rlGetPointSize(void);                       // Get the point drawing size
void rlEnableWireMode(void);                      // Enable wire mode
void rlDisableWireMode(void);                     // Disable wire mode
void rlSetLineWidth(float width);                 // Set the line drawing width
float rlGetLineWidth(void);                       // Get the line drawing width
void rlEnableSmoothLines(void);                   // Enable line aliasing
void rlDisableSmoothLines(void);                  // Disable line aliasing
void rlEnableStereoRender(void);                  // Enable stereo rendering
void rlDisableStereoRender(void);                 // Disable stereo rendering
bool rlIsStereoRenderEnabled(void);               // Check if stereo render is enabled

void rlClearColor(unsigned char r, unsigned char g, unsigned char b, unsigned char a); // Clear color buffer with color
void rlClearScreenBuffers(void);                  // Clear used screen buffers (color and depth)
void rlCheckErrors(void);                         // Check and log OpenGL error codes
void rlSetBlendMode(int mode);                    // Set blending mode
void rlSetBlendFactors(int glSrcFactor, int glDstFactor, int glEquation); // Set blending mode factor and equation (using OpenGL factors)
void rlSetBlendFactorsSeparate(int glSrcRGB, int glDstRGB, int glSrcAlpha, int glDstAlpha, int glEqRGB, int glEqAlpha); // Set blending mode factors and equations separately (using OpenGL factors)

//------------------------------------------------------------------------------------
// Functions Declaration - rlgl functionality
//------------------------------------------------------------------------------------
// rlgl initialization functions
void rlglInit(int width, int height);             // Initialize rlgl (buffers, shaders, textures, states)
void rlglClose(void);                             // De-initialize rlgl (buffers, shaders, textures)
void rlLoadExtensions(void *loader);              // Load OpenGL extensions (loader function required)
void *rlGetProcAddress(const char *procName);     // Get OpenGL procedure address
int rlGetVersion(void);                           // Get current OpenGL version
void rlSetFramebufferWidth(int width);            // Set current framebuffer width
int rlGetFramebufferWidth(void);                  // Get default framebuffer width
void rlSetFramebufferHeight(int height);          // Set current framebuffer height
int rlGetFramebufferHeight(void);                 // Get default framebuffer height

unsigned int rlGetTextureIdDefault(void);         // Get default texture id
unsigned int rlGetShaderIdDefault(void);          // Get default shader id
int *rlGetShaderLocsDefault(void);                // Get default shader locations

// Render batch management
// NOTE: rlgl provides a default render batch to behave like OpenGL 1.1 immediate mode
// but this render batch API is exposed in case of custom batches are required
rlRenderBatch rlLoadRenderBatch(int numBuffers, int bufferElements); // Load a render batch system
void rlUnloadRenderBatch(rlRenderBatch batch);    // Unload render batch system
void rlDrawRenderBatch(rlRenderBatch *batch);     // Draw render batch data (Update->Draw->Reset)
void rlSetRenderBatchActive(rlRenderBatch *batch); // Set the active render batch for rlgl (NULL for default internal)
void rlDrawRenderBatchActive(void);               // Update and draw internal render batch
bool rlCheckRenderBatchLimit(int vCount);         // Check internal buffer overflow for a given number of vertex

void rlSetTexture(unsigned int id);               // Set current texture for render batch and check buffers limits

//------------------------------------------------------------------------------------------------------------------------

// Vertex buffers management
unsigned int rlLoadVertexArray(void);             // Load vertex array (vao) if supported
unsigned int rlLoadVertexBuffer(const void *buffer, int size, bool dynamic); // Load a vertex buffer object
unsigned int rlLoadVertexBufferElement(const void *buffer, int size, bool dynamic); // Load vertex buffer elements object
void rlUpdateVertexBuffer(unsigned int bufferId, const void *data, int dataSize, int offset); // Update vertex buffer object data on GPU buffer
void rlUpdateVertexBufferElements(unsigned int id, const void *data, int dataSize, int offset); // Update vertex buffer elements data on GPU buffer
void rlUnloadVertexArray(unsigned int vaoId);     // Unload vertex array (vao)
void rlUnloadVertexBuffer(unsigned int vboId);    // Unload vertex buffer object
void rlSetVertexAttribute(unsigned int index, int compSize, int type, bool normalized, int stride, int offset); // Set vertex attribute data configuration
void rlSetVertexAttributeDivisor(unsigned int index, int divisor); // Set vertex attribute data divisor
void rlSetVertexAttributeDefault(int locIndex, const void *value, int attribType, int count); // Set vertex attribute default value, when attribute to provided
void rlDrawVertexArray(int offset, int count);    // Draw vertex array (currently active vao)
void rlDrawVertexArrayElements(int offset, int count, const void *buffer); // Draw vertex array elements
void rlDrawVertexArrayInstanced(int offset, int count, int instances); // Draw vertex array (currently active vao) with instancing
void rlDrawVertexArrayElementsInstanced(int offset, int count, const void *buffer, int instances); // Draw vertex array elements with instancing

// Textures management
unsigned int rlLoadTexture(const void *data, int width, int height, int format, int mipmapCount); // Load texture data
unsigned int rlLoadTextureDepth(int width, int height, bool useRenderBuffer); // Load depth texture/renderbuffer (to be attached to fbo)
unsigned int rlLoadTextureCubemap(const void *data, int size, int format, int mipmapCount); // Load texture cubemap data
void rlUpdateTexture(unsigned int id, int offsetX, int offsetY, int width, int height, int format, const void *data); // Update texture with new data on GPU
void rlGetGlTextureFormats(int format, unsigned int *glInternalFormat, unsigned int *glFormat, unsigned int *glType); // Get OpenGL internal formats
const char *rlGetPixelFormatName(unsigned int format);              // Get name string for pixel format
void rlUnloadTexture(unsigned int id);                              // Unload texture from GPU memory
void rlGenTextureMipmaps(unsigned int id, int width, int height, int format, int *mipmaps); // Generate mipmap data for selected texture
void *rlReadTexturePixels(unsigned int id, int width, int height, int format); // Read texture pixel data
unsigned char *rlReadScreenPixels(int width, int height);           // Read screen pixel data (color buffer)

// Framebuffer management (fbo)
unsigned int rlLoadFramebuffer(void);                               // Load an empty framebuffer
void rlFramebufferAttach(unsigned int id, unsigned int texId, int attachType, int texType, int mipLevel); // Attach texture/renderbuffer to a framebuffer
bool rlFramebufferComplete(unsigned int id);                        // Verify framebuffer is complete
void rlUnloadFramebuffer(unsigned int id);                          // Delete framebuffer from GPU
// WARNING: Copy and resize framebuffer functionality only defined for software backend
void rlCopyFramebuffer(int x, int y, int width, int height, int format, void *pixels); // Copy framebuffer pixel data to internal buffer
void rlResizeFramebuffer(int width, int height);                    // Resize internal framebuffer

// Shaders management
unsigned int rlLoadShader(const char *code, int type);                    // Load (compile) shader and return shader id (type: RL_VERTEX_SHADER, RL_FRAGMENT_SHADER, RL_COMPUTE_SHADER)
unsigned int rlLoadShaderProgram(const char *vsCode, const char *fsCode); // Load shader from code strings
unsigned int rlLoadShaderProgramEx(unsigned int vsId, unsigned int fsId); // Load shader program, using already loaded shader ids
unsigned int rlLoadShaderProgramCompute(unsigned int csId);               // Load compute shader program
void rlUnloadShader(unsigned int id);                                     // Unload shader, loaded with rlLoadShader()
void rlUnloadShaderProgram(unsigned int id);                              // Unload shader program
int rlGetLocationUniform(unsigned int id, const char *uniformName);       // Get shader location uniform, requires shader program id
int rlGetLocationAttrib(unsigned int id, const char *attribName);         // Get shader location attribute, requires shader program id
void rlSetUniform(int locIndex, const void *value, int uniformType, int count); // Set shader value uniform
void rlSetUniformMatrix(int locIndex, Matrix mat);                        // Set shader value matrix
void rlSetUniformMatrices(int locIndex, const Matrix *mat, int count);    // Set shader value matrices
void rlSetUniformSampler(int locIndex, unsigned int textureId);           // Set shader value sampler
void rlSetShader(unsigned int id, int *locs);                             // Set shader currently active (id and locations)

// Compute shader management
void rlComputeShaderDispatch(unsigned int groupX, unsigned int groupY, unsigned int groupZ); // Dispatch compute shader (equivalent to *draw* for graphics pipeline)

// Shader buffer storage object management (ssbo)
unsigned int rlLoadShaderBuffer(unsigned int size, const void *data, int usageHint); // Load shader storage buffer object (SSBO)
void rlUnloadShaderBuffer(unsigned int ssboId);                           // Unload shader storage buffer object (SSBO)
void rlUpdateShaderBuffer(unsigned int id, const void *data, unsigned int dataSize, unsigned int offset); // Update SSBO buffer data
void rlBindShaderBuffer(unsigned int id, unsigned int index);             // Bind SSBO buffer
void rlReadShaderBuffer(unsigned int id, void *dest, unsigned int count, unsigned int offset); // Read SSBO buffer data (GPU->CPU)
void rlCopyShaderBuffer(unsigned int destId, unsigned int srcId, unsigned int destOffset, unsigned int srcOffset, unsigned int count); // Copy SSBO data between buffers
unsigned int rlGetShaderBufferSize(unsigned int id);                      // Get SSBO buffer size

// Buffer management
void rlBindImageTexture(unsigned int id, unsigned int index, int format, bool readonly);  // Bind image texture

// Matrix state management
Matrix rlGetMatrixModelview(void);                                  // Get internal modelview matrix
Matrix rlGetMatrixProjection(void);                                 // Get internal projection matrix
Matrix rlGetMatrixTransform(void);                                  // Get internal accumulated transform matrix
Matrix rlGetMatrixProjectionStereo(int eye);                        // Get internal projection matrix for stereo render (selected eye)
Matrix rlGetMatrixViewOffsetStereo(int eye);                        // Get internal view offset matrix for stereo render (selected eye)
void rlSetMatrixProjection(Matrix proj);                            // Set a custom projection matrix (replaces internal projection matrix)
void rlSetMatrixModelview(Matrix view);                             // Set a custom modelview matrix (replaces internal modelview matrix)
void rlSetMatrixProjectionStereo(Matrix right, Matrix left);        // Set eyes projection matrices for stereo rendering
void rlSetMatrixViewOffsetStereo(Matrix right, Matrix left);        // Set eyes view offsets matrices for stereo rendering

// Quick and dirty cube/quad buffers load->draw->unload
void rlLoadDrawCube(void);     // Load and draw a cube
void rlLoadDrawQuad(void);     // Load and draw a quad
