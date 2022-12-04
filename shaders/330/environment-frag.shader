#version 330
#define PI 3.1415926535897932384626433832795

uniform vec3 myLightPos;
uniform sampler2D environMap;

in vec3 outPos;
in vec3 normal;
in float scale;

out vec4 outputColor;

vec2 textureLocation(vec3 point) {
	vec3 scaledDownPoint = point / scale;
	float u;
	float v;

	float theta = atan(scaledDownPoint.z, scaledDownPoint.x);
	u = theta < 0.0 ?  -(theta / (2.0 * PI)) : 1 - (theta / (2.0 * PI));

	float phi = asin(scaledDownPoint.y / 0.5);
	v = (phi / PI) + 0.5; //ask about the radius

	return vec2(u, 1 - v);
}

void main()
{
	vec3 lightVec = -normalize(outPos - myLightPos);

	vec3 textureColor = texture(environMap, textureLocation(outPos)).xyz;

	outputColor = vec4(textureColor, 1.0);
}