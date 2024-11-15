// Matthias Holl�nder 2013
#version 430 core

//#pragma MX_PORT_ATTRIBUTE(Position,"Positions");

//////////////////////////////////////////////////////////////////////////
// input variables
//////////////////////////////////////////////////////////////////////////
layout( location = 1 ) uniform mat4 MVP;

layout( location = 0 ) in vec3 Position;

//////////////////////////////////////////////////////////////////////////
// Specify exactly what the gl_PerVertex output contains
//////////////////////////////////////////////////////////////////////////
out gl_PerVertex
{
    vec4 gl_Position;
};

//////////////////////////////////////////////////////////////////////////
// Vertex-Shader
//////////////////////////////////////////////////////////////////////////
void main()
{	
	gl_Position = MVP * vec4( Position, 1.0 );
}
