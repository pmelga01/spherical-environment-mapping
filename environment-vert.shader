#version 330

uniform mat4 modelM;
uniform mat4 viewM;
uniform mat4 perspectiveM;

in vec3 myNormal;
in vec3 myPosition;

out vec3 normal;
out vec3 outPos;
out float scale;

void main()
{
	outPos = myPosition;

	scale = 7.0;
	vec3 toScale = myPosition * scale;

	vec4 tmpPos = perspectiveM * viewM * vec4(toScale, 1.0);

	gl_Position = tmpPos;

	normal = -myNormal;
}



