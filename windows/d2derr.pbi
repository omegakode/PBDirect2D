XIncludeFile "winerror.pbi"
XIncludeFile "wincodec.pbi"

#FACILITY_D2D = $899

Macro MAKE_D2DHR(sev, code)
	MAKE_HRESULT(sev, #FACILITY_D2D, (code))
EndMacro

Macro MAKE_D2DHR_ERR(code)
	MAKE_D2DHR(1, code)
EndMacro

;+----------------------------------------------------------------------------
;
; D2D error codes
;
;------------------------------------------------------------------------------

;
;  Error codes Shared With WINCODECS
;

;
; The pixel format is Not supported.
;
#D2DERR_UNSUPPORTED_PIXEL_FORMAT =     #WINCODEC_ERR_UNSUPPORTEDPIXELFORMAT

;
; Error codes that were already returned in prior versions And were part of the
; MIL facility.

;
; Error codes mapped from WIN32 where there isn't already another HRESULT based
; Define
;

;
; The supplied buffer was too small To accomodate the Data.
;
#D2DERR_INSUFFICIENT_BUFFER =         $8007007a


;
; D2D specific codes
;

;
; The object was Not in the correct state To process the method.
;
#D2DERR_WRONG_STATE =                 MAKE_D2DHR_ERR($001)

;
; The object has Not yet been initialized.
;
#D2DERR_NOT_INITIALIZED =            MAKE_D2DHR_ERR($002)

;
; The requested opertion is Not supported.
;
#D2DERR_UNSUPPORTED_OPERATION =      MAKE_D2DHR_ERR($003)

;
; The geomery scanner failed To process the Data.
;
#D2DERR_SCANNER_FAILED =              MAKE_D2DHR_ERR($004)

;
; D2D could Not access the screen.
;
#D2DERR_SCREEN_ACCESS_DENIED  =       MAKE_D2DHR_ERR($005)

;
; A valid display state could Not be determined.
;
#D2DERR_DISPLAY_STATE_INVALID  =      MAKE_D2DHR_ERR($006)

;
; The supplied vector is vero.
;
#D2DERR_ZERO_VECTOR  =                MAKE_D2DHR_ERR($007)

;
; An internal error (D2D bug) occurred. On checked builds, we would assert.
;
; The application should close this instance of D2D And should consider
; restarting its process.
;
#D2DERR_INTERNAL_ERROR  =             MAKE_D2DHR_ERR($008)

;
; The display format we need To render is Not supported by the
; hardware device.
;
#D2DERR_DISPLAY_FORMAT_NOT_SUPPORTED = MAKE_D2DHR_ERR($009)

;
; A call To this method is invalid.
;
#D2DERR_INVALID_CALL  =               MAKE_D2DHR_ERR($00A)

;
; No HW rendering device is available For this operation.
;
#D2DERR_NO_HARDWARE_DEVICE =          MAKE_D2DHR_ERR($00B)

;
; There has been a presentation error that may be recoverable. The caller
; needs To recreate, rerender the entire frame, And reattempt present.
;
#D2DERR_RECREATE_TARGET =             MAKE_D2DHR_ERR($00C)

;
; Shader construction failed because it was too complex.
;
#D2DERR_TOO_MANY_SHADER_ELEMENTS =    MAKE_D2DHR_ERR($00D)

;
; Shader compilation failed.
;
#D2DERR_SHADER_COMPILE_FAILED  =      MAKE_D2DHR_ERR($00E)

;
; Requested DX surface size exceeded maximum texture size.
;
#D2DERR_MAX_TEXTURE_SIZE_EXCEEDED =   MAKE_D2DHR_ERR($00F)

;
; The requested D2D version is Not supported.
;
#D2DERR_UNSUPPORTED_VERSION =       MAKE_D2DHR_ERR($010)

;
; Invalid number.
;
#D2DERR_BAD_NUMBER  =                 MAKE_D2DHR_ERR($0011)

;
; Objects used together must be created from the same factory instance.
;
#D2DERR_WRONG_FACTORY =               MAKE_D2DHR_ERR($012)

;
; A layer resource can only be in use once at any point in time.
;
#D2DERR_LAYER_ALREADY_IN_USE  =       MAKE_D2DHR_ERR($013)

;
; The pop call did Not match the corresponding push call
;
#D2DERR_POP_CALL_DID_NOT_MATCH_PUSH  = MAKE_D2DHR_ERR($014)

;
; The resource was realized on the wrong render target
;
#D2DERR_WRONG_RESOURCE_DOMAIN =       MAKE_D2DHR_ERR($015)

;
; The push And pop calls were unbalanced
;
#D2DERR_PUSH_POP_UNBALANCED  =        MAKE_D2DHR_ERR($016)

;
; Attempt To copy from a render target While a layer Or clip rect is applied
;
#D2DERR_RENDER_TARGET_HAS_LAYER_OR_CLIPRECT = MAKE_D2DHR_ERR($017)

;
; The brush types are incompatible For the call.
;
#D2DERR_INCOMPATIBLE_BRUSH_TYPES =    MAKE_D2DHR_ERR($018)

;
; An unknown win32 failure occurred.
;
#D2DERR_WIN32_ERROR  =                MAKE_D2DHR_ERR($019)

;
; The render target is Not compatible With GDI
;
#D2DERR_TARGET_NOT_GDI_COMPATIBLE =   MAKE_D2DHR_ERR($01A)

;
; A text client drawing effect object is of the wrong type
; 
#D2DERR_TEXT_EFFECT_IS_WRONG_TYPE =   MAKE_D2DHR_ERR($01B)

;
; The application is holding a reference To the IDWriteTextRenderer Interface 
; after the corresponding DrawText Or DrawTextLayout call has returned. The 
; IDWriteTextRenderer instance will be zombied.
; 
#D2DERR_TEXT_RENDERER_NOT_RELEASED =  MAKE_D2DHR_ERR($01C)

;
; The requested size is larger than the guaranteed supported texture size.
; 
#D2DERR_EXCEEDS_MAX_BITMAP_SIZE  =   MAKE_D2DHR_ERR($01D)

