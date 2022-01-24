Shader "Unlit/CombineShader"
{
   Properties
    {
    }
    SubShader
    {
        Tags { "RenderType"="Transparent+400" "Queue"="Transparent"}


        Pass
        {

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma target 4.0

            #include "UnityCG.cginc"

            Texture2D _GBuffer0;
            Texture2D _GBuffer1;
            Texture2D _GBuffer2;
            Texture2D _GBuffer3;

            Texture2D _Depth;

            SamplerState sampler_pointer_clamp;

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2ff
            {
                float4 vertex : SV_POSITION;
                 float2 uv : TEXCOORD0;
            };

            struct GBufferOutput
            {
                half4 GBuffer4 : SV_Target4;
            };

            v2ff vert (appdata v)
            {
                v2ff o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

			half4 frag (v2ff i): SV_Target
			{            
                half4 g0 = _GBuffer0.Sample(sampler_pointer_clamp, i.uv);
                //half4 g1 = _GBuffer1.Sample(sampler_pointer_clamp, i.uv);
                //half4 g3 = _GBuffer3.Sample(sampler_pointer_clamp, i.uv);


                return g0;

                
              
			}

            ENDCG
        }
    }
}
