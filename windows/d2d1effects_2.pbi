XIncludeFile "d2d1effects_1.pbi"

; Built in effect CLSIDs
DEFINE_GUID(CLSID_D2D1Contrast,                 $b648a78a, $0ed5, $4f80, $a9, $4a, $8e, $82, $5a, $ca, $6b, $77)
DEFINE_GUID(CLSID_D2D1RgbToHue,                 $23f3e5ec, $91e8, $4d3d, $ad, $0a, $af, $ad, $c1, $00, $4a, $a1)
DEFINE_GUID(CLSID_D2D1HueToRgb,                 $7b78a6bd, $0141, $4def, $8a, $52, $63, $56, $ee, $0c, $bd, $d5)
DEFINE_GUID(CLSID_D2D1ChromaKey,                $74C01F5B, $2A0D, $408C, $88, $E2, $C7, $A3, $C7, $19, $77, $42)
DEFINE_GUID(CLSID_D2D1Emboss,                   $b1c5eb2b, $0348, $43f0, $81, $07, $49, $57, $ca, $cb, $a2, $ae)
DEFINE_GUID(CLSID_D2D1Exposure,                 $b56c8cfa, $f634, $41ee, $be, $e0, $ff, $a6, $17, $10, $60, $04)
DEFINE_GUID(CLSID_D2D1Grayscale,                $36DDE0EB, $3725, $42E0, $83, $6D, $52, $FB, $20, $AE, $E6, $44)
DEFINE_GUID(CLSID_D2D1Invert,                   $e0c3784d, $cb39, $4e84, $b6, $fd, $6b, $72, $f0, $81, $02, $63)
DEFINE_GUID(CLSID_D2D1Posterize,                $2188945e, $33a3, $4366, $b7, $bc, $08, $6b, $d0, $2d, $08, $84)
DEFINE_GUID(CLSID_D2D1Sepia,                    $3a1af410, $5f1d, $4dbe, $84, $df, $91, $5d, $a7, $9b, $71, $53)
DEFINE_GUID(CLSID_D2D1Sharpen,                  $C9B887CB, $C5FF, $4DC5, $97, $79, $27, $3D, $CF, $41, $7C, $7D)
DEFINE_GUID(CLSID_D2D1Straighten,               $4da47b12, $79a3, $4fb0, $82, $37, $bb, $c3, $b2, $a4, $de, $08)
DEFINE_GUID(CLSID_D2D1TemperatureTint,          $89176087, $8AF9, $4A08, $AE, $B1, $89, $5F, $38, $DB, $17, $66)
DEFINE_GUID(CLSID_D2D1Vignette,                 $c00c40be, $5e67, $4ca3, $95, $b4, $f4, $b0, $2c, $11, $51, $35)
DEFINE_GUID(CLSID_D2D1EdgeDetection,            $EFF583CA, $CB07, $4AA9, $AC, $5D, $2C, $C4, $4C, $76, $46, $0F)
DEFINE_GUID(CLSID_D2D1HighlightsShadows,        $CADC8384, $323F, $4C7E, $A3, $61, $2E, $2B, $24, $DF, $6E, $E4)
DEFINE_GUID(CLSID_D2D1LookupTable3D,            $349E0EDA, $0088, $4A79, $9C, $A3, $C7, $E3, $00, $20, $20, $20)


DEFINE_GUID(CLSID_D2D1Opacity,                  $811d79a4, $de28, $4454, $80, $94, $c6, $46, $85, $f8, $bd, $4c)
DEFINE_GUID(CLSID_D2D1AlphaMask,                $c80ecff0, $3fd5, $4f05, $83, $28, $c5, $d1, $72, $4b, $4f, $0a)
DEFINE_GUID(CLSID_D2D1CrossFade,                $12f575e8, $4db1, $485f, $9a, $84, $03, $a0, $7d, $d3, $82, $9f)
DEFINE_GUID(CLSID_D2D1Tint,                     $36312b17, $f7dd, $4014, $91, $5d, $ff, $ca, $76, $8c, $f2, $11)


; The number of nits that sRGB Or scRGB color space uses For SDR white, Or
; floating point values of 1.0f. Note that this value is only constant when the
; color space uses scene-referred luminance, which is true For HDR content. If
; the color space uses display-referred luminance instead, then the SDR white
; level should be queried from the display.


DEFINE_GUID(CLSID_D2D1WhiteLevelAdjustment,     $44a1cadb, $6cdd, $4818, $8f, $f4, $26, $c1, $cf, $e9, $5b, $db)
DEFINE_GUID(CLSID_D2D1HdrToneMap,               $7b0b748d, $4610, $4486, $a9, $0c, $99, $9d, $9a, $2e, $2b, $11)


; <summary>
; The Enumeration of the Contrast effect's top level properties.
; Effect description: Adjusts the contrast of an image.
; </summary>
;- Enum D2D1_CONTRAST_PROP

    
    ; <summary>
    ; Property Name: "Contrast"
    ; Property Type: FLOAT
    ; </summary>
 #D2D1_CONTRAST_PROP_CONTRAST = 0
    
    ; <summary>
    ; Property Name: "ClampInput"
    ; Property Type: BOOL
    ; </summary>
 #D2D1_CONTRAST_PROP_CLAMP_INPUT = 1
 #D2D1_CONTRAST_PROP_FORCE_DWORD = $ffffffff


; <summary>
; The enumeration of the RgbToHue effect's top level properties.
; Effect description: Converts an RGB bitmap to HSV or HSL.
; </summary>
;- Enum D2D1_RGBTOHUE_PROP

    
    ; <summary>
    ; Property Name: "OutputColorSpace"
    ; Property Type: D2D1_RGBTOHUE_OUTPUT_COLOR_SPACE
    ; </summary>
 #D2D1_RGBTOHUE_PROP_OUTPUT_COLOR_SPACE = 0
 #D2D1_RGBTOHUE_PROP_FORCE_DWORD = $ffffffff


;- Enum D2D1_RGBTOHUE_OUTPUT_COLOR_SPACE

 #D2D1_RGBTOHUE_OUTPUT_COLOR_SPACE_HUE_SATURATION_VALUE = 0
 #D2D1_RGBTOHUE_OUTPUT_COLOR_SPACE_HUE_SATURATION_LIGHTNESS = 1
 #D2D1_RGBTOHUE_OUTPUT_COLOR_SPACE_FORCE_DWORD = $ffffffff



; <summary>
; The enumeration of the HueToRgb effect's top level properties.
; Effect description: Converts an HSV or HSL bitmap into an RGB bitmap.
; </summary>
;- Enum D2D1_HUETORGB_PROP

    
    ; <summary>
    ; Property Name: "InputColorSpace"
    ; Property Type: D2D1_HUETORGB_INPUT_COLOR_SPACE
    ; </summary>
 #D2D1_HUETORGB_PROP_INPUT_COLOR_SPACE = 0
 #D2D1_HUETORGB_PROP_FORCE_DWORD = $ffffffff


;- Enum D2D1_HUETORGB_INPUT_COLOR_SPACE

 #D2D1_HUETORGB_INPUT_COLOR_SPACE_HUE_SATURATION_VALUE = 0
 #D2D1_HUETORGB_INPUT_COLOR_SPACE_HUE_SATURATION_LIGHTNESS = 1
 #D2D1_HUETORGB_INPUT_COLOR_SPACE_FORCE_DWORD = $ffffffff



; <summary>
; The enumeration of the Chroma Key effect's top level properties.
; Effect description: Converts a specified color to transparent.
; </summary>
;- Enum D2D1_CHROMAKEY_PROP

    
    ; <summary>
    ; Property Name: "Color"
    ; Property Type: D2D1_VECTOR_3F
    ; </summary>
 #D2D1_CHROMAKEY_PROP_COLOR = 0
    
    ; <summary>
    ; Property Name: "Tolerance"
    ; Property Type: FLOAT
    ; </summary>
 #D2D1_CHROMAKEY_PROP_TOLERANCE = 1
    
    ; <summary>
    ; Property Name: "InvertAlpha"
    ; Property Type: BOOL
    ; </summary>
 #D2D1_CHROMAKEY_PROP_INVERT_ALPHA = 2
    
    ; <summary>
    ; Property Name: "Feather"
    ; Property Type: BOOL
    ; </summary>
 #D2D1_CHROMAKEY_PROP_FEATHER = 3
 #D2D1_CHROMAKEY_PROP_FORCE_DWORD = $ffffffff



; <summary>
; The enumeration of the Emboss effect's top level properties.
; Effect description: Applies an embossing effect to an image.
; </summary>
;- Enum D2D1_EMBOSS_PROP

    
    ; <summary>
    ; Property Name: "Height"
    ; Property Type: FLOAT
    ; </summary>
 #D2D1_EMBOSS_PROP_HEIGHT = 0
    
    ; <summary>
    ; Property Name: "Direction"
    ; Property Type: FLOAT
    ; </summary>
 #D2D1_EMBOSS_PROP_DIRECTION = 1
 #D2D1_EMBOSS_PROP_FORCE_DWORD = $ffffffff



; <summary>
; The enumeration of the Exposure effect's top level properties.
; Effect description: Simulates camera exposure adjustment.
; </summary>
;- Enum D2D1_EXPOSURE_PROP

    
    ; <summary>
    ; Property Name: "ExposureValue"
    ; Property Type: FLOAT
    ; </summary>
 #D2D1_EXPOSURE_PROP_EXPOSURE_VALUE = 0
 #D2D1_EXPOSURE_PROP_FORCE_DWORD = $ffffffff



; <summary>
; The enumeration of the Posterize effect's top level properties.
; Effect description: Reduces the number of colors in an image.
; </summary>
;- Enum D2D1_POSTERIZE_PROP

    
    ; <summary>
    ; Property Name: "RedValueCount"
    ; Property Type: UINT32
    ; </summary>
 #D2D1_POSTERIZE_PROP_RED_VALUE_COUNT = 0
    
    ; <summary>
    ; Property Name: "GreenValueCount"
    ; Property Type: UINT32
    ; </summary>
 #D2D1_POSTERIZE_PROP_GREEN_VALUE_COUNT = 1
    
    ; <summary>
    ; Property Name: "BlueValueCount"
    ; Property Type: UINT32
    ; </summary>
 #D2D1_POSTERIZE_PROP_BLUE_VALUE_COUNT = 2
 #D2D1_POSTERIZE_PROP_FORCE_DWORD = $ffffffff



; <summary>
; The enumeration of the Sepia effect's top level properties.
; Effect description: Applies a Sepia tone to an image.
; </summary>
;- Enum D2D1_SEPIA_PROP

    
    ; <summary>
    ; Property Name: "Intensity"
    ; Property Type: FLOAT
    ; </summary>
 #D2D1_SEPIA_PROP_INTENSITY = 0
    
    ; <summary>
    ; Property Name: "AlphaMode"
    ; Property Type: D2D1_ALPHA_MODE
    ; </summary>
 #D2D1_SEPIA_PROP_ALPHA_MODE = 1
 #D2D1_SEPIA_PROP_FORCE_DWORD = $ffffffff



; <summary>
; The enumeration of the Sharpen effect's top level properties.
; Effect description: Performs sharpening adjustment
; </summary>
;- Enum D2D1_SHARPEN_PROP

    
    ; <summary>
    ; Property Name: "Sharpness"
    ; Property Type: FLOAT
    ; </summary>
 #D2D1_SHARPEN_PROP_SHARPNESS = 0
    
    ; <summary>
    ; Property Name: "Threshold"
    ; Property Type: FLOAT
    ; </summary>
 #D2D1_SHARPEN_PROP_THRESHOLD = 1
 #D2D1_SHARPEN_PROP_FORCE_DWORD = $ffffffff



; <summary>
; The enumeration of the Straighten effect's top level properties.
; Effect description: Straightens an image.
; </summary>
;- Enum D2D1_STRAIGHTEN_PROP

    
    ; <summary>
    ; Property Name: "Angle"
    ; Property Type: FLOAT
    ; </summary>
 #D2D1_STRAIGHTEN_PROP_ANGLE = 0
    
    ; <summary>
    ; Property Name: "MaintainSize"
    ; Property Type: BOOL
    ; </summary>
 #D2D1_STRAIGHTEN_PROP_MAINTAIN_SIZE = 1
    
    ; <summary>
    ; Property Name: "ScaleMode"
    ; Property Type: D2D1_STRAIGHTEN_SCALE_MODE
    ; </summary>
 #D2D1_STRAIGHTEN_PROP_SCALE_MODE = 2
 #D2D1_STRAIGHTEN_PROP_FORCE_DWORD = $ffffffff


;- Enum D2D1_STRAIGHTEN_SCALE_MODE

 #D2D1_STRAIGHTEN_SCALE_MODE_NEAREST_NEIGHBOR = 0
 #D2D1_STRAIGHTEN_SCALE_MODE_LINEAR = 1
 #D2D1_STRAIGHTEN_SCALE_MODE_CUBIC = 2
 #D2D1_STRAIGHTEN_SCALE_MODE_MULTI_SAMPLE_LINEAR = 3
 #D2D1_STRAIGHTEN_SCALE_MODE_ANISOTROPIC = 4
 #D2D1_STRAIGHTEN_SCALE_MODE_FORCE_DWORD = $ffffffff



; <summary>
; The enumeration of the Temperature And Tint effect's top level properties.
; Effect description: Adjusts the temperature and tint of an image.
; </summary>
;- Enum D2D1_TEMPERATUREANDTINT_PROP

    
    ; <summary>
    ; Property Name: "Temperature"
    ; Property Type: FLOAT
    ; </summary>
 #D2D1_TEMPERATUREANDTINT_PROP_TEMPERATURE = 0
    
    ; <summary>
    ; Property Name: "Tint"
    ; Property Type: FLOAT
    ; </summary>
 #D2D1_TEMPERATUREANDTINT_PROP_TINT = 1
 #D2D1_TEMPERATUREANDTINT_PROP_FORCE_DWORD = $ffffffff



; <summary>
; The enumeration of the Vignette effect's top level properties.
; Effect description: Fades the edges of an image to the specified color.
; </summary>
;- Enum D2D1_VIGNETTE_PROP

    
    ; <summary>
    ; Property Name: "Color"
    ; Property Type: D2D1_VECTOR_4F
    ; </summary>
 #D2D1_VIGNETTE_PROP_COLOR = 0
    
    ; <summary>
    ; Property Name: "TransitionSize"
    ; Property Type: FLOAT
    ; </summary>
 #D2D1_VIGNETTE_PROP_TRANSITION_SIZE = 1
    
    ; <summary>
    ; Property Name: "Strength"
    ; Property Type: FLOAT
    ; </summary>
 #D2D1_VIGNETTE_PROP_STRENGTH = 2
 #D2D1_VIGNETTE_PROP_FORCE_DWORD = $ffffffff



; <summary>
; The enumeration of the Edge Detection effect's top level properties.
; Effect description: Detects edges of an image.
; </summary>
;- Enum D2D1_EDGEDETECTION_PROP

    
    ; <summary>
    ; Property Name: "Strength"
    ; Property Type: FLOAT
    ; </summary>
 #D2D1_EDGEDETECTION_PROP_STRENGTH = 0
    
    ; <summary>
    ; Property Name: "BlurRadius"
    ; Property Type: FLOAT
    ; </summary>
 #D2D1_EDGEDETECTION_PROP_BLUR_RADIUS = 1
    
    ; <summary>
    ; Property Name: "Mode"
    ; Property Type: D2D1_EDGEDETECTION_MODE
    ; </summary>
 #D2D1_EDGEDETECTION_PROP_MODE = 2
    
    ; <summary>
    ; Property Name: "OverlayEdges"
    ; Property Type: BOOL
    ; </summary>
 #D2D1_EDGEDETECTION_PROP_OVERLAY_EDGES = 3
    
    ; <summary>
    ; Property Name: "AlphaMode"
    ; Property Type: D2D1_ALPHA_MODE
    ; </summary>
 #D2D1_EDGEDETECTION_PROP_ALPHA_MODE = 4
 #D2D1_EDGEDETECTION_PROP_FORCE_DWORD = $ffffffff


;- Enum D2D1_EDGEDETECTION_MODE

 #D2D1_EDGEDETECTION_MODE_SOBEL = 0
 #D2D1_EDGEDETECTION_MODE_PREWITT = 1
 #D2D1_EDGEDETECTION_MODE_FORCE_DWORD = $ffffffff



; <summary>
; The enumeration of the Highlights and Shadows effect's top level properties.
; Effect description: Adjusts the highlight and shadow strength of an image.
; </summary>
;- Enum D2D1_HIGHLIGHTSANDSHADOWS_PROP

    
    ; <summary>
    ; Property Name: "Highlights"
    ; Property Type: FLOAT
    ; </summary>
 #D2D1_HIGHLIGHTSANDSHADOWS_PROP_HIGHLIGHTS = 0
    
    ; <summary>
    ; Property Name: "Shadows"
    ; Property Type: FLOAT
    ; </summary>
 #D2D1_HIGHLIGHTSANDSHADOWS_PROP_SHADOWS = 1
    
    ; <summary>
    ; Property Name: "Clarity"
    ; Property Type: FLOAT
    ; </summary>
 #D2D1_HIGHLIGHTSANDSHADOWS_PROP_CLARITY = 2
    
    ; <summary>
    ; Property Name: "InputGamma"
    ; Property Type: D2D1_HIGHLIGHTSANDSHADOWS_INPUT_GAMMA
    ; </summary>
 #D2D1_HIGHLIGHTSANDSHADOWS_PROP_INPUT_GAMMA = 3
    
    ; <summary>
    ; Property Name: "MaskBlurRadius"
    ; Property Type: FLOAT
    ; </summary>
 #D2D1_HIGHLIGHTSANDSHADOWS_PROP_MASK_BLUR_RADIUS = 4
 #D2D1_HIGHLIGHTSANDSHADOWS_PROP_FORCE_DWORD = $ffffffff


;- Enum D2D1_HIGHLIGHTSANDSHADOWS_INPUT_GAMMA

 #D2D1_HIGHLIGHTSANDSHADOWS_INPUT_GAMMA_LINEAR = 0
 #D2D1_HIGHLIGHTSANDSHADOWS_INPUT_GAMMA_SRGB = 1
 #D2D1_HIGHLIGHTSANDSHADOWS_INPUT_GAMMA_FORCE_DWORD = $ffffffff



; <summary>
; The enumeration of the Lookup Table 3D effect's top level properties.
; Effect description: Remaps colors in an image via a 3D lookup table.
; </summary>
;- Enum D2D1_LOOKUPTABLE3D_PROP

    
    ; <summary>
    ; Property Name: "Lut"
    ; Property Type: IUnknown *
    ; </summary>
 #D2D1_LOOKUPTABLE3D_PROP_LUT = 0
    
    ; <summary>
    ; Property Name: "AlphaMode"
    ; Property Type: D2D1_ALPHA_MODE
    ; </summary>
 #D2D1_LOOKUPTABLE3D_PROP_ALPHA_MODE = 1
 #D2D1_LOOKUPTABLE3D_PROP_FORCE_DWORD = $ffffffff


; <summary>
; The enumeration of the Opacity effect's top level properties.
; Effect description: Adjusts the opacity of an image by multiplying the alpha
; channel by the specified opacity.
; </summary>
;- Enum D2D1_OPACITY_PROP

    
    ; <summary>
    ; Property Name: "Opacity"
    ; Property Type: FLOAT
    ; </summary>
 #D2D1_OPACITY_PROP_OPACITY = 0
 #D2D1_OPACITY_PROP_FORCE_DWORD = $ffffffff



; <summary>
; The enumeration of the Cross Fade effect's top level properties.
; Effect description: This effect combines two images by adding weighted pixels
; from input images. The formula can be expressed as output = weight * Destination
; + (1 - weight) * Source
; </summary>
;- Enum D2D1_CROSSFADE_PROP

    
    ; <summary>
    ; Property Name: "Weight"
    ; Property Type: FLOAT
    ; </summary>
 #D2D1_CROSSFADE_PROP_WEIGHT = 0
 #D2D1_CROSSFADE_PROP_FORCE_DWORD = $ffffffff



; <summary>
; The enumeration of the Tint effect's top level properties.
; Effect description: This effect tints the source image by multiplying the
; specified color by the source image.
; </summary>
;- Enum D2D1_TINT_PROP

    
    ; <summary>
    ; Property Name: "Color"
    ; Property Type: D2D1_VECTOR_4F
    ; </summary>
 #D2D1_TINT_PROP_COLOR = 0
    
    ; <summary>
    ; Property Name: "ClampOutput"
    ; Property Type: BOOL
    ; </summary>
 #D2D1_TINT_PROP_CLAMP_OUTPUT = 1
 #D2D1_TINT_PROP_FORCE_DWORD = $ffffffff


; <summary>
; The enumeration of the White Level Adjustment effect's top level properties.
; Effect description: This effect adjusts the white level of the source image by
; multiplying the source image color by the ratio of the input and output white
; levels. Input and output white levels are specified in nits.
; </summary>
;- Enum D2D1_WHITELEVELADJUSTMENT_PROP

    
    ; <summary>
    ; Property Name: "InputWhiteLevel"
    ; Property Type: FLOAT
    ; </summary>
 #D2D1_WHITELEVELADJUSTMENT_PROP_INPUT_WHITE_LEVEL = 0
    
    ; <summary>
    ; Property Name: "OutputWhiteLevel"
    ; Property Type: FLOAT
    ; </summary>
 #D2D1_WHITELEVELADJUSTMENT_PROP_OUTPUT_WHITE_LEVEL = 1
 #D2D1_WHITELEVELADJUSTMENT_PROP_FORCE_DWORD = $ffffffff



; <summary>
; The enumeration of the HDR Tone Map effect's top level properties.
; Effect description: Adjusts the maximum luminance of the source image to fit
; within the maximum output luminance supported. Input and output luminance values
; are specified in nits. Note that the color space of the image is assumed to be
; scRGB.
; </summary>
;- Enum D2D1_HDRTONEMAP_PROP

    
    ; <summary>
    ; Property Name: "InputMaxLuminance"
    ; Property Type: FLOAT
    ; </summary>
 #D2D1_HDRTONEMAP_PROP_INPUT_MAX_LUMINANCE = 0
    
    ; <summary>
    ; Property Name: "OutputMaxLuminance"
    ; Property Type: FLOAT
    ; </summary>
 #D2D1_HDRTONEMAP_PROP_OUTPUT_MAX_LUMINANCE = 1
    
    ; <summary>
    ; Property Name: "DisplayMode"
    ; Property Type: D2D1_HDRTONEMAP_DISPLAY_MODE
    ; </summary>
 #D2D1_HDRTONEMAP_PROP_DISPLAY_MODE = 2
 #D2D1_HDRTONEMAP_PROP_FORCE_DWORD = $ffffffff


;- Enum D2D1_HDRTONEMAP_DISPLAY_MODE

 #D2D1_HDRTONEMAP_DISPLAY_MODE_SDR = 0
 #D2D1_HDRTONEMAP_DISPLAY_MODE_HDR = 1
 #D2D1_HDRTONEMAP_DISPLAY_MODE_FORCE_DWORD = $ffffffff



