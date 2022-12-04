#version 330

in vec3 myNormal;
in vec3 myPosition;

out vec3 normal;
out vec3 outPos;
out float scale;

void main()
{
	scale = 1.0;
	vec3 tmpPos = myPosition * scale;

	gl_Position = vec4(tmpPos, 1.0);
	normal = -myNormal;
	outPos = tmpPos;
}

