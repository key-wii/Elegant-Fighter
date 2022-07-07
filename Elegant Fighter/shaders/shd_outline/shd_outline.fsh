varying vec2	v_vTexcoord;
varying vec4	v_vColour;

uniform vec4	u_line_color;
uniform vec2	u_pixel_size;
uniform float	u_thickness;
uniform float	u_roundness;
uniform float	u_tolerance;
uniform vec4	u_uv;

float point_in_elipse(vec2 center, vec2 point, vec2 axis) {
	//turn on again if scales are glitchy
	//vec2 semi_axis = vec2(max(axis.x, axis.y), min(axis.x, axis.y));
	
    float dist = (pow((point.x - center.x), 2.0) / pow(axis.x, 2.0))
			   + (pow((point.y - center.y), 2.0) / pow(axis.y, 2.0));
    return dist;
}


void main() {
	vec4 outline		= vec4(0.0);
	vec4 frag_col		= texture2D(gm_BaseTexture, v_vTexcoord);
	vec4 line_col		= u_line_color;
	bool in_line		= u_thickness < 0.0;
	float thickness		= abs(u_thickness);
	float tolerance		= clamp(u_tolerance, 0.0, 0.99999);
	
	if (frag_col.a <= tolerance ^^ in_line) {
		for (float xx = -thickness; xx <= thickness; xx ++) {
			for (float yy = -thickness; yy <= thickness; yy ++) {					
					
				vec2 loop_pos = vec2(xx, yy);
				vec2 chk_pos = v_vTexcoord+(loop_pos*u_pixel_size);
				vec4 chk_col = texture2D(gm_BaseTexture, chk_pos);	
					
				if (chk_col.a > tolerance ^^ in_line) {
					bool out_bound = (chk_pos.x < u_uv.r || chk_pos.y < u_uv.g || chk_pos.x > u_uv.b || chk_pos.y > u_uv.a);
					vec2 axis = u_pixel_size.xy * thickness;
						
					float dist = point_in_elipse(v_vTexcoord, chk_pos, axis);
					if (dist <= 2.0-u_roundness && !out_bound) {
						outline = vec4(1.0);
						xx = thickness;
						break;
					}
				}
			}
		}
	}

	gl_FragColor = mix(v_vColour * frag_col, line_col, outline);
}