# Remixvideo-generators

Remixvideo supports glsl shaders as generative media. It features:

 * GLSL fragment shader support
 * some audio related uniforms to react to audio features
 * macros to support [shadertoy](https://www.shadertoy.com/) and [glslsandbox](http://glslsandbox.com/) shaders
 
 Known issues:
  * images are flipped along y axis (fixed in version > 1.1.3)
  * audio FFT is not working properly (fixed in version > 1.1.3)
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
#pragma autoreload; // (availlable in version > 1.1.3)
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
