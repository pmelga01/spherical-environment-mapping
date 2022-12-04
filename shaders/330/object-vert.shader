#version 330

in vec3 myNormal;
in vec3 myPosition;

out vec3 normal;
out vec3 outPos;

void main()
{
	gl_Position = vec4(myPosition, 1.0);
	normal = -myNormal;
	outPos = myPosition;
}

