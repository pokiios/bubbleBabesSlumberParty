shader_type canvas_item;
render_mode blend_mix;
// Expose 'my_color' to the editor with default value of gray (r, g, b, alpha).
uniform vec4 my_colour : source_color = vec4(.5, .5, .5, 1.0);

// This function is run on every pixel.
void fragment(){
	vec4 color_also = vec4(0,0,0,0);
	
	// Modify COLOR to affect the results.
	// Here we just interpolate with default color and supplied color.
	vec4 _current_img = texture(TEXTURE, UV);
	color_also = my_colour;
	
	color_also.a = _current_img.a;
	COLOR = mix(COLOR, color_also, 1);
	
}