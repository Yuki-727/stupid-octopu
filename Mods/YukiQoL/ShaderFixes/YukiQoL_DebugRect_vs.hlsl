Texture1D<float4> IniParams : register(t120);

struct VSOut
{
    float4 position : SV_Position;
};


VSOut main(uint vertexID : SV_VertexID)
{
    VSOut o;

    float x = IniParams[1].x;
    float y = IniParams[1].y;
    float width = IniParams[1].z;
    float height = IniParams[1].w;

    float2 positions[6] =
    {
        float2(x, y),
        float2(x + width, y),
        float2(x, y + height),

        float2(x, y + height),
        float2(x + width, y),
        float2(x + width, y + height)
    };

    o.position = float4(
        positions[vertexID],
        0.0,
        1.0
    );

    return o;
}