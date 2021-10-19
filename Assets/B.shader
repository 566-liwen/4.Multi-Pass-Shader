Shader "Unlit/B"
{
    Properties
    {
        _White("white color", Color) = (0, 0, 0, 1)
    }
        SubShader
    {
        Tags { "Queue" = "Transparent" "RenderType" = "Transparent" }
        LOD 100

        ZWrite Off

        // apply red color
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct vertInput
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct vertOutput
            {
                float4 vertex : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            // fixed 4 for color
            fixed4 _White;

            vertOutput vert(vertInput v)
            {
                vertOutput o;
                o.vertex = UnityObjectToClipPos(v.vertex/2);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag(vertOutput i) : SV_Target
            {
                return _White;
            }
            ENDCG
        }

    }
}
