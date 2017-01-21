// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2,x:33235,y:32712,varname:node_2,prsc:2|emission-5365-OUT,alpha-5567-A;n:type:ShaderForge.SFN_TexCoord,id:8450,x:32019,y:32839,varname:node_8450,prsc:2,uv:0;n:type:ShaderForge.SFN_RemapRange,id:2706,x:32187,y:32839,varname:node_2706,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-8450-UVOUT;n:type:ShaderForge.SFN_Length,id:9679,x:32349,y:32839,varname:node_9679,prsc:2|IN-2706-OUT;n:type:ShaderForge.SFN_Tex2d,id:4906,x:32187,y:33018,varname:node_4906,prsc:2,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|TEX-1302-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:1302,x:32019,y:33018,ptovrint:False,ptlb:node_1302,ptin:_node_1302,varname:node_1302,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_OneMinus,id:9287,x:32518,y:32839,varname:node_9287,prsc:2|IN-9679-OUT;n:type:ShaderForge.SFN_Multiply,id:1316,x:32701,y:33000,varname:node_1316,prsc:2|A-9287-OUT,B-4906-RGB;n:type:ShaderForge.SFN_VertexColor,id:5567,x:32701,y:32728,varname:node_5567,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5365,x:32968,y:32729,varname:node_5365,prsc:2|A-5567-RGB,B-1316-OUT;proporder:1302;pass:END;sub:END;*/

Shader "Custom/Smoke" {
    Properties {
        _node_1302 ("node_1302", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        LOD 200
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One One
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _node_1302; uniform float4 _node_1302_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 node_4906 = tex2D(_node_1302,TRANSFORM_TEX(i.uv0, _node_1302));
                float3 emissive = (i.vertexColor.rgb*((1.0 - length((i.uv0*2.0+-1.0)))*node_4906.rgb));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,i.vertexColor.a);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
