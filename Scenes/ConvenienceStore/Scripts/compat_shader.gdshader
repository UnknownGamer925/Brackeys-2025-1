shader_type canvas_item;

uniform int pixel_size : hint_range(1, 64) = 8; // Adjust pixel size here
uniform sampler2D screen_texture : source_color, hint_screen_texture, filter_nearest;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 tex_coords = FRAGCOORD.xy / SCREEN_PIXEL_SIZE; // Get the pixel coordinates
	tex_coords = floor(tex_coords / float(pixel_size)) * float(pixel_size);
	vec4 color = texture(screen_texture, tex_coords); // Sample the texture
	COLOR = color; // Set the color to the pixelated texture color
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
