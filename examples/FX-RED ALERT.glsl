
uniform sampler2D textureA;
uniform float intensity;
uniform float parameter;
uniform float barClock;
uniform float cycleClock;

void main()
{
	vec4 color = texture2D(textureA, gl_TexCoord[0].st);
	color.g *= (barClock * intensity);
    color.b *= (barClock * parameter);
	gl_FragColor = color;
}
