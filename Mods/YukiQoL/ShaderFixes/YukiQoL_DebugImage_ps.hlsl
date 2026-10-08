Texture2D<float4> DebugTexture : register(t100);

float4 main(
    float4 position : SV_Position,
    float2 uv : TEXCOORD0
) : SV_Target
{
    uint width;
    uint height;

    DebugTexture.GetDimensions(width, height);

    uint2 pixel = uint2(
        uv.x * width,
        uv.y * height
    );

    return DebugTexture.Load(
        int3(pixel, 0)
    );
}