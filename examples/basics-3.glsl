//position dependant color

#define pi 3.14159265

uniform float time;
uniform vec2 resolution;

void main( void )
{
    float red = 1.0 * sin(time)/2.0 + 0.5;
    float green = 1.0 * sin(time + pi / 2.0)/2.0 + 0.5;
    float blue = 1.0 * sin(time + pi)/2.0 + 0.5;
    float alpha = 1.0;

    vec4 color = vec4(red, green, blue, alpha);

    gl_FragColor = vec4(color);
}