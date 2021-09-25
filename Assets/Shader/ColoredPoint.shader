Shader "Custom/ColoredPoint"
{
    Properties
    {
        _Glossiness("Smoothess", Range(0,1)) = 0.5
        _Metallic("Metallic", Range(0,1)) = 0.0
    }
        SubShader
        {
            Tags { "RenderType" = "Opaque" }
            LOD 200

            CGPROGRAM
    #pragma surface surf Standard fullforwardshadows

    #pragma target 3.0

        struct Input
        {
            float worldPos;
        };

        half _Glossiness;
        half _Metallic;

        void surf(Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo.rg = IN.worldPos.x * 0.5 + 0.5;
            o.Metallic = _Metallic;
            o.Smoothness = _Glossiness;
            o.Alpha = 1;
        }
      
        ENDCG
    }
            FallBack "Diffuse"
}
