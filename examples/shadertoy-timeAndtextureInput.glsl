//https://www.shadertoy.com/view/llKXWy

#pragma shadertoy;
#pragma input iChannel0 %builtin%/tex04.jpg

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 xy = fragCoord.xy / iResolution.xy;
    
    vec4 texColor = texture(iChannel0,xy);
    
    float origRed = texColor.r;
    float origGreen = texColor.g;
    float origBlue = texColor.b;
    
    texColor.r *= 0.3;
    texColor.g *= 0.59;
    texColor.b *= 0.11;
    
    float grey = texColor.r + texColor.g + texColor.b;
    
    fragColor.r = ((origRed - grey)/2.0)*(sin(iGlobalTime*5.0)) + ((grey+origRed)/2.0);
    fragColor.g = ((origGreen - grey)/2.0)*(sin(iGlobalTime*5.0)) + ((grey+origGreen)/2.0);
    fragColor.b = ((origBlue - grey)/2.0)*(sin(iGlobalTime*5.0)) + ((grey+origBlue)/2.0);
}