shader_type canvas_item;

uniform vec4 ChromaKey:source_color = vec4(1.0, 1.0, 1.0, 1.0);

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 sprite_color = texture(TEXTURE, UV).rgba;
    
    //if(sprite_color.r == 1.0 && sprite_color.g == 0.0 && sprite_color.b == 1.0) {
	if(sprite_color == ChromaKey){
        sprite_color.a = 0.0;
    }
    COLOR = sprite_color;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
