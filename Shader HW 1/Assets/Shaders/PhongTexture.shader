﻿// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "CMPM163/HalfnHalfPhong"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _SpecularColor ("Specular Color", Color) = (1, 1, 1, 1)
        _Shininess("Shininess", Float) = 1.0
        _MainTex1 ("Main Tex", 2D) = "white" {}
        _MainTex2 ("Main Tex", 2D) = "white" {}
        
    }
    SubShader
    {
        
        Pass 
        {
            Tags {"LightMode" = "ForwardAdd"}
            //Blend One One
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            #include "UnityCG.cginc"
            
            float4 _LightColor0;
            float4 _Color;
            float4 _SpecularColor;
            float _Shininess;
            //The two different textures we will be sampling with
            sampler2D _MainTex1;
            sampler2D _MainTex2;
            
            struct vertexShaderInput 
            {
                float4 position: POSITION;
                float3 normal: NORMAL; 
                float2 uv: TEXCOORD0;
            };
            
            struct vertexShaderOutput
            {
                float4 position: SV_POSITION;
                float3 normal: NORMAL;
                float3 vertInWorldCoords: TEXCOORD1;
                float2 uv: TEXCOORD0;
                //Save a coordinate for the object position
                float3 objPos: TEXCOORD2;
            };
            
            vertexShaderOutput vert(vertexShaderInput v)
            {
                vertexShaderOutput o;
                o.vertInWorldCoords = mul(unity_ObjectToWorld, v.position);
                o.position = UnityObjectToClipPos(v.position);
                o.normal = v.normal;
                o.uv = v.uv;
                o.objPos = v.position.xyz;
                return o;
            }
            
            float4 frag(vertexShaderOutput i):SV_Target
            {
                float3 Ka = float3(1, 1, 1);
                float3 globalAmbient = float3(0.1, 0.1, 0.1);
                float3 ambientComponent = Ka * globalAmbient;

                float3 P = i.vertInWorldCoords.xyz;
                float3 N = normalize(i.normal);
                float3 L = normalize(_WorldSpaceLightPos0.xyz - P);
                float3 Kd = _Color.rgb;
                float3 lightColor = _LightColor0.rgb;
                float3 diffuseComponent = Kd * lightColor * max(dot(N, L), 0);
                
                float3 Ks = _SpecularColor.rgb;
                float3 V = normalize(_WorldSpaceCameraPos - P);
                float3 H = normalize(L + V);
                float3 specularComponent = Ks * lightColor * pow(max(dot(N, H), 0), _Shininess);
                
                
                float3 finalColor = ambientComponent + diffuseComponent + specularComponent;
                
                //Based on the object space x coordinate, place one texture or the other
                if(i.objPos.x < .02 ) {
                    return float4(finalColor, 1.0) * tex2D (_MainTex1, i.uv);
                }
                else 
                    return float4(finalColor, 1.0) * tex2D (_MainTex2, i.uv);
            }
            
            ENDCG
        }
    }
    FallBack "Diffuse"
}
