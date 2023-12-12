#define PI 3.141569

Texture2D<float4> Tex0: register(t0); sampler _Tex0 : register(s0);
Texture2D<float4> Tex1: register(t1); sampler _Tex1 : register(s1);

cbuffer PS_VARIABLES : register(b0)
{
    float aperture;
    float scale;
    float fScale;
    float xScale;
    bool overlay;
    int edgemode;
    float edgeScale;
}

struct PS_INPUT
{
    float4 Tint : COLOR0;
    float2 texCoord : TEXCOORD0;
    float4 Position : SV_POSITION;  
};

struct PS_OUTPUT
{   
    float4 Color : SV_TARGET;   
};

float4 GetColorPM(float4 Image)
{
	if ( Image.a != 0 )
		Image.rgb /= Image.a;
	return Image;
}

float2 fisheye(float2 xy, float d)
{
    float z = scale*sqrt(1.0-d*d*fScale);
    float r = atan2(d,z)/PI;
    r*=xScale;
    float phi = atan2(xy.y,xy.x);

    return r*float2(cos(phi),sin(phi))+0.5;
}

float4 ps_main(in PS_INPUT In) : SV_TARGET
{
    float2 _texCoord = In.texCoord.xy;

    float2 output = _texCoord;
    float maxFactor = sin(0.5*aperture*(PI/180.0));

    float2 xy = 2.0*_texCoord-1.0;
    float d = length(xy*maxFactor);

    if(edgemode==0)
    {
        output = fisheye(xy,d);
    }
    if(edgemode==2)
    {
        if(d < (maxFactor/fScale)*edgeScale)
            output = fisheye(xy,d);
    }
    if(edgemode==1)
    {
        if(d < edgeScale * maxFactor)
        {
            output = fisheye(xy,d);
        }else{
            output = float2(0.0,0.0);
        }
    }

    float4 Out = overlay ? Tex1.Sample(_Tex1,output)*In.Tint : Tex0.Sample(_Tex0,output)*In.Tint;
    
    return Out;
}

float4 ps_main_pm(in PS_INPUT In) : SV_TARGET
{
    float2 _texCoord = In.texCoord.xy;

    float2 output = _texCoord;
    float maxFactor = sin(0.5*aperture*(PI/180.0));

    float2 xy = 2.0*_texCoord-1.0;
    float d = length(xy*maxFactor);

    if(edgemode==0)
    {
        output = fisheye(xy,d);
    }
    if(edgemode==2)
    {
        if(d < edgeScale * maxFactor)
            output = fisheye(xy,d);
    }
    if(edgemode==1)
    {
        if(d < edgeScale * maxFactor)
        {
            output = fisheye(xy,d);
        }else{
            output = float2(0.0,0.0);
        }
    }

    float4 Out = overlay ? Tex1.Sample(_Tex1,output) : Tex0.Sample(_Tex0,output);

    Out.rgb *= Out.a;
    Out *= In.Tint;
    return Out;
}