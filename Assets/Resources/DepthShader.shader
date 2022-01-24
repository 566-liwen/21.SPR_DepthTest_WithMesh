Shader "Unlit/DepthShader"
{
    Properties
    {
    }
    SubShader
    {

        Pass
        {
            Tags { "LightMode"="ObjectA" }

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct VertInput
            {
                float4 vertex : POSITION;
            };

            struct VertOutput
            {
                float4 vertex : POSITION;
                float dist : float;
            };

            VertOutput vert(VertInput v) {
                VertOutput o;

                /*
                float3 _Camera_Position = _WorldSpaceCameraPos; //xyz

                o.pos = UnityObjectToClipPos(v.pos);
                float4 worldPos = mul(unity_ObjectToWorld, v.pos);
                //o.dis= distance(_Camera_Position, worldPos);
                float dis = worldPos.z - _Camera_Position.z;
                o.color = half3(0, 0, 10/dis);
                */
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.dist = length(WorldSpaceViewDir(v.vertex));
                return o;
            }

            /*
            half4 frag(VertOutput i) : COLOR{
                half toColor = 100/i.vertex;
                return half4(0, 0, toColor, 1.0f);
            }
            */

            void frag (VertOutput i,
            out half4 GRT0:SV_Target0
            )
			{                
				half toColor = i.dist/30;
                GRT0 = half4(toColor, toColor, toColor, 1.0f);
			}
            ENDCG
        }
    }
}
