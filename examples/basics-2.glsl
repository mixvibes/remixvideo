
//position dependant color

#define TWO_PI 6.28318530718

uniform vec2 resolution;

vec3 rgb2hsb( in vec3 c )
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), 
                 vec4(c.gb, K.xy), 
                 step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), 
                 vec4(c.r, p.yzx), 
                 step(p.x, c.r));
    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), 
                d / (q.x + e), 
                q.x);
}

vec3 hsb2rgb( in vec3 c )
{
    vec3 rgb = clamp(abs(mod(c.x*6.0+vec3(0.0,4.0,2.0),
                             6.0)-3.0)-1.0, 
                     0.0, 
                     1.0 );
    rgb = rgb*rgb*(3.0-2.0*rgb);
    return c.z * mix(vec3(1.0), rgb, c.y);
}

void main( void )
{
    vec2 st = gl_FragCoord.xy/resolution;
    vec3 color = vec3(0.0);

    /*
    //LINEAR
    // We map x (0.0 - 1.0) to the hue (0.0 - 1.0)
    // And the y (0.0 - 1.0) to the brightness
    color = hsb2rgb(vec3(st.x,1.0,st.y));
    */

    //POLAR
    // Use polar coordinates instead of cartesian
    vec2 toCenter = vec2(0.5)-st;
    float angle = atan(toCenter.y,toCenter.x);
    float radius = length(toCenter)*2.0;
  
    // Map the angle (-PI to PI) to the Hue (from 0 to 1)
    // and the Saturation to the radius
    color = hsb2rgb(vec3((angle/TWO_PI)+0.5,radius,1.0));


    gl_FragColor = vec4(color, 1.0);
}