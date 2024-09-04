XIncludeFile "d2d1effects.pbi"
           
; Built in effect CLSIDs
DEFINE_GUID(CLSID_D2D1YCbCr,                    $99503cc1, $66c7, $45c9, $a8, $75, $8a, $d8, $a7, $91, $44, $01)

; <summary>
; The Enumeration of the YCbCr effect's top level properties.
; Effect description: An effect that takes a Y plane As input 0 And a CbCr plane
; As input 1 And outputs RGBA.  The CbCr plane can be chroma subsampled.  Useful
; For JPEG color conversion.
; </summary>
;- Enum D2D1_YCBCR_PROP

    
    ; <summary>
    ; Property Name: "ChromaSubsampling"
    ; Property Type: D2D1_YCBCR_CHROMA_SUBSAMPLING
    ; </summary>
#D2D1_YCBCR_PROP_CHROMA_SUBSAMPLING = 0
    
    ; <summary>
    ; Property Name: "TransformMatrix"
    ; Property Type: D2D1_MATRIX_3X2_F
    ; </summary>
#D2D1_YCBCR_PROP_TRANSFORM_MATRIX = 1
    
    ; <summary>
    ; Property Name: "InterpolationMode"
    ; Property Type: D2D1_YCBCR_INTERPOLATION_MODE
    ; </summary>
#D2D1_YCBCR_PROP_INTERPOLATION_MODE = 2
#D2D1_YCBCR_PROP_FORCE_DWORD = $ffffffff


;- Enum D2D1_YCBCR_CHROMA_SUBSAMPLING

#D2D1_YCBCR_CHROMA_SUBSAMPLING_AUTO = 0
#D2D1_YCBCR_CHROMA_SUBSAMPLING_420 = 1
#D2D1_YCBCR_CHROMA_SUBSAMPLING_422 = 2
#D2D1_YCBCR_CHROMA_SUBSAMPLING_444 = 3
#D2D1_YCBCR_CHROMA_SUBSAMPLING_440 = 4
#D2D1_YCBCR_CHROMA_SUBSAMPLING_FORCE_DWORD = $ffffffff


;- Enum D2D1_YCBCR_INTERPOLATION_MODE

#D2D1_YCBCR_INTERPOLATION_MODE_NEAREST_NEIGHBOR = 0
#D2D1_YCBCR_INTERPOLATION_MODE_LINEAR = 1
#D2D1_YCBCR_INTERPOLATION_MODE_CUBIC = 2
#D2D1_YCBCR_INTERPOLATION_MODE_MULTI_SAMPLE_LINEAR = 3
#D2D1_YCBCR_INTERPOLATION_MODE_ANISOTROPIC = 4
#D2D1_YCBCR_INTERPOLATION_MODE_HIGH_QUALITY_CUBIC = 5
#D2D1_YCBCR_INTERPOLATION_MODE_FORCE_DWORD = $ffffffff
