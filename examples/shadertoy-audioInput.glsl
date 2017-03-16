//https://www.shadertoy.com/view/llSGDh
#pragma shadertoy;

#pragma input iChannel0 audio

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord.xy / iResolution.xy;

    float fft  = texture2D( iChannel0, vec2(uv.x,0.25) ).x;
    float wave = texture2D( iChannel0, vec2(uv.x,0.75) ).x;
    

    vec3 color = vec3(1.0)*fft; // add fft
    color += 1.0 -  smoothstep( 0.0, 0.01, abs(wave - uv.y) ); // add wave

    fragColor = vec4(color,1.0);
}