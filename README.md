# Remixvideo-generators

Remixvideo supports glsl shaders as generative media. It features:

 * GLSL fragment shader support
 * some audio related uniforms to react to audio features
 * macros to support [shadertoy](https://www.shadertoy.com/) and [glslsandbox](http://glslsandbox.com/) shaders
 
 Known issues:
  * images are flipped along y axis (fixed in upcomming version)
  * audio FFT is not working properly (fixed in upcomming version)   
  * supports only fragment shaders
  * supports only single pass
  
  Be sure to check [example folder](https://github.com/mixvibes/remixvideo-generators/tree/master/examples), it demonstrate some basic generator syntaxes.
  
## shader specifications

Entry point is "main"
```
void main( void )
{
}
```

## Avaiblables uniforms

 * time
 * resolution
 * audioLevelHistory
 * audioLevel
 * barClock
 * cycleClock
 
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
