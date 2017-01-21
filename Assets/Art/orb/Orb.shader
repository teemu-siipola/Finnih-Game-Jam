// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:6739,x:33703,y:32743,varname:node_6739,prsc:2|emission-5648-OUT;n:type:ShaderForge.SFN_ScreenPos,id:4940,x:31261,y:32908,varname:node_4940,prsc:2,sctp:1;n:type:ShaderForge.SFN_Tex2dAsset,id:6310,x:31488,y:32651,ptovrint:False,ptlb:Texture,ptin:_Texture,varname:node_6310,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Vector1,id:5155,x:31261,y:33090,varname:node_5155,prsc:2,v1:0.2;n:type:ShaderForge.SFN_Append,id:2348,x:32119,y:32874,varname:node_2348,prsc:2|A-5545-R,B-4687-OUT;n:type:ShaderForge.SFN_Vector1,id:4687,x:31926,y:32933,varname:node_4687,prsc:2,v1:1;n:type:ShaderForge.SFN_Tex2d,id:5545,x:31926,y:32784,varname:node_5545,prsc:2,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-3593-UVOUT,TEX-6310-TEX;n:type:ShaderForge.SFN_Tex2d,id:7376,x:32526,y:32808,varname:node_7376,prsc:2,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-3372-UVOUT,TEX-6310-TEX;n:type:ShaderForge.SFN_Panner,id:3372,x:32305,y:32874,varname:node_3372,prsc:2,spu:0.002,spv:0.15|UVIN-2348-OUT;n:type:ShaderForge.SFN_Tex2d,id:41,x:31926,y:33003,varname:node_41,prsc:2,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-8424-UVOUT,TEX-6310-TEX;n:type:ShaderForge.SFN_Multiply,id:6321,x:31463,y:33002,varname:node_6321,prsc:2|A-4940-UVOUT,B-5155-OUT;n:type:ShaderForge.SFN_Multiply,id:1695,x:31463,y:32873,varname:node_1695,prsc:2|A-5100-OUT,B-4940-UVOUT;n:type:ShaderForge.SFN_Vector1,id:5100,x:31259,y:32823,varname:node_5100,prsc:2,v1:0.4;n:type:ShaderForge.SFN_Append,id:8005,x:32119,y:33014,varname:node_8005,prsc:2|A-41-R,B-1674-OUT;n:type:ShaderForge.SFN_Vector1,id:1674,x:31926,y:33145,varname:node_1674,prsc:2,v1:1;n:type:ShaderForge.SFN_Panner,id:8351,x:32305,y:33014,varname:node_8351,prsc:2,spu:0.2,spv:0.3|UVIN-8005-OUT;n:type:ShaderForge.SFN_Tex2d,id:1471,x:32611,y:32942,varname:node_1471,prsc:2,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-8351-UVOUT,TEX-6310-TEX;n:type:ShaderForge.SFN_Multiply,id:470,x:33163,y:32809,varname:node_470,prsc:2|A-8810-OUT,B-1114-OUT;n:type:ShaderForge.SFN_Panner,id:3593,x:31649,y:32873,varname:node_3593,prsc:2,spu:0.008,spv:0.02|UVIN-1695-OUT;n:type:ShaderForge.SFN_Panner,id:8424,x:31649,y:33016,varname:node_8424,prsc:2,spu:0.01,spv:0.004|UVIN-6321-OUT;n:type:ShaderForge.SFN_RemapRange,id:8243,x:31852,y:33293,varname:node_8243,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-3000-UVOUT;n:type:ShaderForge.SFN_ArcTan2,id:5378,x:32045,y:33468,varname:node_5378,prsc:2,attp:0|A-8892-G,B-8892-R;n:type:ShaderForge.SFN_ComponentMask,id:8892,x:31852,y:33468,varname:node_8892,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-8243-OUT;n:type:ShaderForge.SFN_RemapRange,id:8777,x:32216,y:33468,varname:node_8777,prsc:2,frmn:-3.14,frmx:3.14,tomn:0,tomx:1|IN-5378-OUT;n:type:ShaderForge.SFN_Length,id:6330,x:32085,y:33293,varname:node_6330,prsc:2|IN-8243-OUT;n:type:ShaderForge.SFN_Multiply,id:9441,x:32436,y:33266,varname:node_9441,prsc:2|A-6330-OUT,B-7456-OUT;n:type:ShaderForge.SFN_Append,id:4297,x:32618,y:33266,varname:node_4297,prsc:2|A-9441-OUT,B-2478-OUT;n:type:ShaderForge.SFN_Vector1,id:2478,x:32445,y:33399,varname:node_2478,prsc:2,v1:1;n:type:ShaderForge.SFN_ScreenPos,id:3000,x:31652,y:33293,varname:node_3000,prsc:2,sctp:2;n:type:ShaderForge.SFN_Panner,id:4037,x:32787,y:33266,varname:node_4037,prsc:2,spu:0.1,spv:0.1|UVIN-4297-OUT;n:type:ShaderForge.SFN_Multiply,id:7456,x:32467,y:33602,varname:node_7456,prsc:2|A-8777-OUT,B-9631-OUT;n:type:ShaderForge.SFN_Vector1,id:9631,x:32212,y:33712,varname:node_9631,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Lerp,id:8810,x:32864,y:32628,varname:node_8810,prsc:2|A-3904-OUT,B-3562-OUT,T-1471-RGB;n:type:ShaderForge.SFN_TexCoord,id:8270,x:32115,y:32368,varname:node_8270,prsc:2,uv:0;n:type:ShaderForge.SFN_ComponentMask,id:1155,x:32287,y:32368,varname:node_1155,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-8270-UVOUT;n:type:ShaderForge.SFN_Vector3,id:3904,x:32287,y:32521,varname:node_3904,prsc:2,v1:0.9632353,v2:0.4462046,v3:0.9275781;n:type:ShaderForge.SFN_Vector3,id:3562,x:32287,y:32608,varname:node_3562,prsc:2,v1:0.03033088,v2:0.04936607,v3:0.2426471;n:type:ShaderForge.SFN_Lerp,id:1114,x:32864,y:32754,varname:node_1114,prsc:2|A-9251-OUT,B-473-OUT,T-7376-RGB;n:type:ShaderForge.SFN_Vector3,id:9251,x:32287,y:32689,varname:node_9251,prsc:2,v1:0.06623054,v2:0.06623054,v3:0.3602941;n:type:ShaderForge.SFN_Vector3,id:473,x:32287,y:32773,varname:node_473,prsc:2,v1:0.8071383,v2:0.06131056,v3:0.9264706;n:type:ShaderForge.SFN_Fresnel,id:3240,x:32801,y:33033,varname:node_3240,prsc:2|EXP-3313-OUT;n:type:ShaderForge.SFN_Add,id:5648,x:33420,y:32874,varname:node_5648,prsc:2|A-470-OUT,B-4573-OUT;n:type:ShaderForge.SFN_Multiply,id:4573,x:33183,y:32985,varname:node_4573,prsc:2|A-172-OUT,B-6089-OUT;n:type:ShaderForge.SFN_Vector3,id:6089,x:33000,y:32957,varname:node_6089,prsc:2,v1:0.6673577,v2:0.4725346,v3:0.6985294;n:type:ShaderForge.SFN_Vector1,id:3313,x:32618,y:33136,varname:node_3313,prsc:2,v1:4;n:type:ShaderForge.SFN_Multiply,id:172,x:32985,y:33082,varname:node_172,prsc:2|A-3240-OUT,B-1414-OUT;n:type:ShaderForge.SFN_Vector1,id:1414,x:32787,y:33156,varname:node_1414,prsc:2,v1:3;proporder:6310;pass:END;sub:END;*/

Shader "Custom/NewSurfaceShader" {
    Properties {
        _Texture ("Texture", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 200
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 screenPos : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 node_5746 = _Time + _TimeEditor;
                float node_5155 = 0.2;
                float4 node_41 = tex2D(_Texture,TRANSFORM_TEX(((float2(i.screenPos.x*(_ScreenParams.r/_ScreenParams.g), i.screenPos.y).rg*node_5155)+node_5746.g*float2(0.01,0.004)), _Texture));
                float2 node_8351 = (float2(node_41.r,1.0)+node_5746.g*float2(0.2,0.3));
                float4 node_1471 = tex2D(_Texture,TRANSFORM_TEX(node_8351, _Texture));
                float3 node_8810 = lerp(float3(0.9632353,0.4462046,0.9275781),float3(0.03033088,0.04936607,0.2426471),node_1471.rgb);
                float2 node_3593 = ((0.4*float2(i.screenPos.x*(_ScreenParams.r/_ScreenParams.g), i.screenPos.y).rg)+node_5746.g*float2(0.008,0.02));
                float4 node_5545 = tex2D(_Texture,TRANSFORM_TEX(node_3593, _Texture));
                float2 node_2348 = float2(node_5545.r,1.0);
                float2 node_3372 = (node_2348+node_5746.g*float2(0.002,0.15));
                float4 node_7376 = tex2D(_Texture,TRANSFORM_TEX(node_3372, _Texture));
                float3 node_1114 = lerp(float3(0.06623054,0.06623054,0.3602941),float3(0.8071383,0.06131056,0.9264706),node_7376.rgb);
                float3 node_470 = (node_8810*node_1114);
                float3 emissive = (node_470+((pow(1.0-max(0,dot(normalDirection, viewDirection)),4.0)*3.0)*float3(0.6673577,0.4725346,0.6985294)));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
