
//hello world

void main( void )
{
    float red = 1.0;
    float green = 0.0;
    float blue = 0.0;
    float alpha = 1.0;

    vec4 color = vec4(red, green, blue, alpha);

    gl_FragColor = vec4(color);
}