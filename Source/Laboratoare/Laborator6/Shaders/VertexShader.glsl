  
#version 330

// TODO: get vertex attributes from each location
layout(location = 0) in vec3 v_position;
layout(location = 1) in vec3 v_normal;   // 3  //1
layout(location = 2) in vec2 v_coord;
layout(location = 3) in vec3 v_color;  //1     //3

// Uniform properties
uniform mat4 Model;
uniform mat4 View;
uniform mat4 Projection;
uniform float Clock;

// TODO: output values to fragment shader
out vec2 frag_coord;
out vec3 frag_normal;
out vec3 frag_color;
out vec3 frag_position;

void main()
{
	// TODO: send output to fragment shader
	frag_position = v_position;
	frag_color = Clock * v_color;
	frag_normal = v_normal + vec3(sin(Clock), cos(Clock), 1.0);
	frag_coord = v_coord;

	// TODO: compute gl_Position
    vec3 v_position2 = v_position + vec3(sin(Clock), 0, cos(Clock));
	gl_Position = Projection * View * Model * vec4(v_position2, 1.0);
}