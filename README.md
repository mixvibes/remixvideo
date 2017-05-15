# Remixvideo-generators

Remixvideo supports glsl shaders as generative media. It features:

 * GLSL fragment shader support
 * some audio related uniforms to react to audio features
 * macros to support [shadertoy](https://www.shadertoy.com/) and [glslsandbox](http://glslsandbox.com/) shaders
 * basic parameter support based on [ISF specification](http://interactiveshaderformat.com) 
 
 Known issues:
  * images are flipped along y axis (fixed in version > 1.1.x)
  * audio FFT is not working properly (fixed in version > 1.1.x)
  * supports only fragment shaders
  * supports only single pass
  
  Be sure to check [example folder](https://github.com/mixvibes/remixvideo-generators/tree/master/examples), it demonstrate some basic generator syntaxes.
  
## Shader specifications

Entry point is "main"
```
void main( void )
{
}
```
## Specificities

### Pragmas

```
#pragma autoreload; // (available in version > 1.1.3)
```

### Avaiblables uniforms

```
uniform float   time;
uniform vec3    resolution;
uniform float   audioLevelHistory[512];
uniform float   audioLevel;
uniform float   barClock;
uniform float   cycleClock; 
```
 
## Porting shaders 

### From shadertoy

First add pragma to install a shadertoy-like sandbox:
```
#pragma shadertoy;
```
_At this point your entry point is now "void mainImage( out vec4 fragColor, in vec2 fragCoord )"_

If your shader uses an audio input (fft + wave), declare it:
```
#pragma input iChannel0 audio
```

and/or predefined textures ([check shadertoy texture name reference](https://raw.githubusercontent.com/mixvibes/remixvideo-generators/master/shadertoy_textures.png)):
```
#pragma input iChannel0 %builtin%/tex04.jpg
```

### From glslsandbox

glslsandbox shaders are nativelly supported.
 
# Interactive Shader Format support (version > 1.1.x)
A subset of ISF support is implemented with restrictions:
 * only the first 4 parameters are displayed (but you can declare as much as you want)
 * only float/bool parameters are supported
 * IMG_PIXEL and IMG_NORM_PIXEL are supported
 * supported uniforms: PASSINDEX, RENDERSIZE, TIME, TIMEDELTA, DATE, FRAMEINDEX
 * isf_FragNormCoord convenience variable is supported
 
Check example file: https://github.com/mixvibes/remixvideo/blob/master/examples/interactiveshaderformat_stripes.glsl;

# Recommended readings
 * https://www.shadertoy.com/
 * http://glslsandbox.com/
 * https://thebookofshaders.com/
 * https://www.interactiveshaderformat.com/
 
# TIPS
## Add your own FX (version > 1.1.x)
You can add your own FX. 

On macOS:
 * go to /Users/XXX/Library/Group Containers/K22R73ZZ3Q.com.mixvibes.remixvideo
 * create this folder hierarchy: Fxs/Video 
 * place your shader in /Users/XXX/Library/Group Containers/K22R73ZZ3Q.com.mixvibes.remixvideo/Fxs/Video
 
 On Windows:
 * go to C:\Users\XXX\AppData\Roaming\Mixvibes 
 * create this folder hierarchy: Fxs\Video 
 * place your shader in C:\Users\XXX\AppData\Roaming\Mixvibes\Fxs\Video

Fx shaders uniforms (check [example FX](https://github.com/mixvibes/remixvideo/blob/master/examples/FX-RED%20ALERT.glsl)):
 * uniform sampler2D textureA; // input texture
 * uniform float intensity; // X pad
 * uniform float parameter; // Y pad
 * uniform float audioEnergy;
 * uniform float barClock;
 * uniform float cycleClock;
 
