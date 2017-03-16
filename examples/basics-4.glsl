//remixvideo specific variables

uniform float audioLevel;
uniform float barClock;
uniform float cycleClock;

uniform vec2 resolution;

vec4 white = vec4(1.0, 1.0, 1.0, 1.0);
vec4 black = vec4(0.0, 0.0, 0.0, 1.0);
vec4 red = vec4(1.0, 0.0, 0.0, 1.0);
vec4 green = vec4(0.0, 1.0, 0.0, 1.0);
vec4 blue = vec4(0.0, 0.0, 1.0, 1.0);
    
void main( void )
{
    vec2 uv = gl_FragCoord.xy / resolution.xy;

    vec4 color = black;

    if(uv.x < 0.33)
    {
        if(uv.y < audioLevel)
            color = red;
    }
    else if(uv.x < 0.66)
    {
        if(uv.y < barClock)
            color = green;
    }
    else
    {
        if(uv.y < cycleClock)
            color = blue;
    }

    gl_FragColor = vec4(color);
}