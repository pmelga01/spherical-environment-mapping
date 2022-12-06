#version 330
#define PI 3.1415926535897932384626433832795

uniform vec3 myLightPos;
uniform sampler2D objectTexture;
uniform bool useDiffuse;
uniform float textureBlend;

in vec3 normal;
in vec3 outPos;

out vec4 outputColor;

vec2 textureLocation(vec3 point) {
	float u;
	float v;

	float theta = atan(point.z, point.x);
	u = theta >= 0.0 ? 1 - (theta / (2.0 * PI)) : -(theta / (2.0 * PI));

	float phi = asin(point.y / 0.5);
	v = (phi / PI) + 0.5;

	return vec2(u, 1 - v);
}

void main()
{
	vec3 lightVec = -normalize(outPos - myLightPos);

	float diffuseK = useDiffuse ? max(dot(lightVec, normal), 0.0) : 1.0;

	vec3 textureColor = texture(objectTexture, textureLocation(outPos)).xyz;
	vec3 thisColor = vec3(1.0, 1.0, 1.0);

	vec3 blendedColor = (textureBlend * textureColor + (1.0 - textureBlend) * thisColor);
	outputColor = vec4(diffuseK * blendedColor, 1.0);
}