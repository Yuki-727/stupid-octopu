Texture1D<float4> IniParams : register(t120);

struct VSOut
{
    float4 position : SV_Position;
    float2 uv : TEXCOORD0;
};


VSOut main(uint vertexID : SV_VertexID)
{
    VSOut o;

    float x = IniParams[2].x;
    float y = IniParams[2].y;
    float width = IniParams[2].z;
    float height = IniParams[2].w;

    float2 positions[6] =
    {
        float2(x, y),
        float2(x + width, y),
        float2(x, y + height),

        float2(x, y + height),
        float2(x + width, y),
        float2(x + width, y + height)
    };

    float2 uvs[6] =
    {
        float2(0.0, 0.0),
        float2(1.0, 0.0),
        float2(0.0, 1.0),

        float2(0.0, 1.0),
        float2(1.0, 0.0),
        float2(1.0, 1.0)
    };

    o.position = float4(
        positions[vertexID],
        0.0,
        1.0
    );

    o.uv = uvs[vertexID];

    return o;
}