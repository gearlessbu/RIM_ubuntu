#version 450

out vec2 texcoord;
out vec3 dir;

uniform mat4 vpMatrixInv;
uniform vec3 wsCamPos;

void main()
{
    vec2 ndcCoords[4] = vec2[4](
        vec2(-1.0,  1.0), 
        vec2(-1.0, -1.0), 
        vec2( 1.0, -1.0), 
        vec2( 1.0,  1.0)
    );
    
    vec4 ndcVertPos = vec4(ndcCoords[gl_VertexID], 0.0, 1.0);
    gl_Position = ndcVertPos;
    
    texcoord = ndcVertPos.xy * 0.5 + 0.5;
    
    vec4 wsVertPos = vpMatrixInv * ndcVertPos;
    wsVertPos.xyz /= wsVertPos.w;

    dir = normalize(wsVertPos.xyz - wsCamPos);
}
