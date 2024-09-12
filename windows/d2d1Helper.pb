;d2d1Helper.pb

EnableExplicit

Procedure.q D2D1_Point2F(x.f, y.f)
	Protected.q ret
	
	PokeF(@ret, x) : PokeF(@ret + SizeOf(Float), y)
	
	ProcedureReturn ret
EndProcedure

Procedure.q D2D1_SizeF(x.f, y.f)
	Protected.q ret
	
	PokeF(@ret, x) : PokeF(@ret + SizeOf(Float), y)
	
	ProcedureReturn ret
EndProcedure

Procedure.l D2D1_Matrix3x2F_Identity(*m.D2D1_MATRIX_3X2_F)
	If *m = 0 : ProcedureReturn 0 : EndIf
	
	*m\_11 = 1.0
	*m\_12 = 0.0
	*m\_21 = 0.0
	*m\_22 = 1.0
	*m\_31 = 0.0
	*m\_32 = 0.0
EndProcedure

Procedure.l D2D1_Matrix3x2F_Translation(*m.D2D1_MATRIX_3X2_F, x.f, y.f)
	If *m = 0 : ProcedureReturn 0 : EndIf
	
	*m\_11 = 1.0
	*m\_12 = 0.0
	*m\_21 = 0.0
	*m\_22 = 1.0
	*m\_31 = x
	*m\_32 = y
EndProcedure


Procedure.l D2D1_Matrix3x2F_Scale(*m.D2D1_MATRIX_3X2_F, sw.f, sh.f, cx.f, cy.f)
	If *m = 0 : ProcedureReturn 0 : EndIf
	
	
	*m\_11 = sw :  *m\_12 = 0.0
	*m\_21 = 0.0 :  *m\_22 = sh
	*m\_31 = cx - sw * cx
	*m\_32 = cy - sh * cy
EndProcedure

Procedure.l D2D1_Matrix3x2F_Multiply(*a.D2D1_MATRIX_3X2_F, *b.D2D1_MATRIX_3X2_F, *r.D2D1_MATRIX_3X2_F)
	If *a = 0 Or *b = 0 Or *r = 0 : ProcedureReturn 0 : EndIf
	
	*r\_11 = *a\_11 * *b\_11 + *a\_12 * *b\_21
	*r\_12 = *a\_11 * *b\_12 + *a\_12 * *b\_22
	*r\_21 = *a\_21 * *b\_11 + *a\_22 * *b\_21
	*r\_22 = *a\_21 * *b\_12 + *a\_22 * *b\_22
	*r\_31 = *a\_31 * *b\_11 + *a\_32 * *b\_21 + *b\_31
	*r\_32 = *a\_31 * *b\_12 + *a\_32 * *b\_22 + *b\_32
EndProcedure

Procedure.i D2D1_PixelFormat(*pf.D2D1_PIXEL_FORMAT, format.l = #DXGI_FORMAT_UNKNOWN, alphaMode.l = #D2D1_ALPHA_MODE_UNKNOWN)
	*pf\format = format
	*pf\alphaMode = alphaMode
	
	ProcedureReturn *pf
EndProcedure

Procedure.i D2D1_RenderTargetProperties(*rtp.D2D1_RENDER_TARGET_PROPERTIES, type.l = #D2D1_RENDER_TARGET_TYPE_DEFAULT, 
	*pixelFormat.D2D1_PIXEL_FORMAT = #Null, dpiX.f = 0.0, dpiY.f = 0.0, usage.l = #D2D1_RENDER_TARGET_USAGE_NONE, 
	minLevel.l = #D2D1_FEATURE_LEVEL_DEFAULT)

	*rtp\type = type
	*rtp\dpiX = dpiX
	*rtp\dpiY = dpiY
	*rtp\usage = usage
	*rtp\minLevel = minLevel
	If *pixelFormat = #Null
		D2D1_PixelFormat(@*rtp\pixelFormat)
		
	Else
		*rtp\pixelFormat\format = *pixelFormat\format
		*rtp\pixelFormat\alphaMode = *pixelFormat\alphaMode
	EndIf 
	
	ProcedureReturn *rtp
EndProcedure

;- Enum D2D1_Color
#D2D1_Color_AliceBlue = $F0F8FF
#D2D1_Color_AntiqueWhite = $FAEBD7
#D2D1_Color_Aqua = $00FFFF
#D2D1_Color_Aquamarine = $7FFFD4
#D2D1_Color_Azure = $F0FFFF
#D2D1_Color_Beige = $F5F5DC
#D2D1_Color_Bisque = $FFE4C4
#D2D1_Color_Black = $000000
#D2D1_Color_BlanchedAlmond = $FFEBCD
#D2D1_Color_Blue = $0000FF
#D2D1_Color_BlueViolet = $8A2BE2
#D2D1_Color_Brown = $A52A2A
#D2D1_Color_BurlyWood = $DEB887
#D2D1_Color_CadetBlue = $5F9EA0
#D2D1_Color_Chartreuse = $7FFF00
#D2D1_Color_Chocolate = $D2691E
#D2D1_Color_Coral = $FF7F50
#D2D1_Color_CornflowerBlue = $6495ED
#D2D1_Color_Cornsilk = $FFF8DC
#D2D1_Color_Crimson = $DC143C
#D2D1_Color_Cyan = $00FFFF
#D2D1_Color_DarkBlue = $00008B
#D2D1_Color_DarkCyan = $008B8B
#D2D1_Color_DarkGoldenrod = $B8860B
#D2D1_Color_DarkGray = $A9A9A9
#D2D1_Color_DarkGreen = $006400
#D2D1_Color_DarkKhaki = $BDB76B
#D2D1_Color_DarkMagenta = $8B008B
#D2D1_Color_DarkOliveGreen = $556B2F
#D2D1_Color_DarkOrange = $FF8C00
#D2D1_Color_DarkOrchid = $9932CC
#D2D1_Color_DarkRed = $8B0000
#D2D1_Color_DarkSalmon = $E9967A
#D2D1_Color_DarkSeaGreen = $8FBC8F
#D2D1_Color_DarkSlateBlue = $483D8B
#D2D1_Color_DarkSlateGray = $2F4F4F
#D2D1_Color_DarkTurquoise = $00CED1
#D2D1_Color_DarkViolet = $9400D3
#D2D1_Color_DeepPink = $FF1493
#D2D1_Color_DeepSkyBlue = $00BFFF
#D2D1_Color_DimGray = $696969
#D2D1_Color_DodgerBlue = $1E90FF
#D2D1_Color_Firebrick = $B22222
#D2D1_Color_FloralWhite = $FFFAF0
#D2D1_Color_ForestGreen = $228B22
#D2D1_Color_Fuchsia = $FF00FF
#D2D1_Color_Gainsboro = $DCDCDC
#D2D1_Color_GhostWhite = $F8F8FF
#D2D1_Color_Gold = $FFD700
#D2D1_Color_Goldenrod = $DAA520
#D2D1_Color_Gray = $808080
#D2D1_Color_Green = $008000
#D2D1_Color_GreenYellow = $ADFF2F
#D2D1_Color_Honeydew = $F0FFF0
#D2D1_Color_HotPink = $FF69B4
#D2D1_Color_IndianRed = $CD5C5C
#D2D1_Color_Indigo = $4B0082
#D2D1_Color_Ivory = $FFFFF0
#D2D1_Color_Khaki = $F0E68C
#D2D1_Color_Lavender = $E6E6FA
#D2D1_Color_LavenderBlush = $FFF0F5
#D2D1_Color_LawnGreen = $7CFC00
#D2D1_Color_LemonChiffon = $FFFACD
#D2D1_Color_LightBlue = $ADD8E6
#D2D1_Color_LightCoral = $F08080
#D2D1_Color_LightCyan = $E0FFFF
#D2D1_Color_LightGoldenrodYellow = $FAFAD2
#D2D1_Color_LightGreen = $90EE90
#D2D1_Color_LightGray = $D3D3D3
#D2D1_Color_LightPink = $FFB6C1
#D2D1_Color_LightSalmon = $FFA07A
#D2D1_Color_LightSeaGreen = $20B2AA
#D2D1_Color_LightSkyBlue = $87CEFA
#D2D1_Color_LightSlateGray = $778899
#D2D1_Color_LightSteelBlue = $B0C4DE
#D2D1_Color_LightYellow = $FFFFE0
#D2D1_Color_Lime = $00FF00
#D2D1_Color_LimeGreen = $32CD32
#D2D1_Color_Linen = $FAF0E6
#D2D1_Color_Magenta = $FF00FF
#D2D1_Color_Maroon = $800000
#D2D1_Color_MediumAquamarine = $66CDAA
#D2D1_Color_MediumBlue = $0000CD
#D2D1_Color_MediumOrchid = $BA55D3
#D2D1_Color_MediumPurple = $9370DB
#D2D1_Color_MediumSeaGreen = $3CB371
#D2D1_Color_MediumSlateBlue = $7B68EE
#D2D1_Color_MediumSpringGreen = $00FA9A
#D2D1_Color_MediumTurquoise = $48D1CC
#D2D1_Color_MediumVioletRed = $C71585
#D2D1_Color_MidnightBlue = $191970
#D2D1_Color_MintCream = $F5FFFA
#D2D1_Color_MistyRose = $FFE4E1
#D2D1_Color_Moccasin = $FFE4B5
#D2D1_Color_NavajoWhite = $FFDEAD
#D2D1_Color_Navy = $000080
#D2D1_Color_OldLace = $FDF5E6
#D2D1_Color_Olive = $808000
#D2D1_Color_OliveDrab = $6B8E23
#D2D1_Color_Orange = $FFA500
#D2D1_Color_OrangeRed = $FF4500
#D2D1_Color_Orchid = $DA70D6
#D2D1_Color_PaleGoldenrod = $EEE8AA
#D2D1_Color_PaleGreen = $98FB98
#D2D1_Color_PaleTurquoise = $AFEEEE
#D2D1_Color_PaleVioletRed = $DB7093
#D2D1_Color_PapayaWhip = $FFEFD5
#D2D1_Color_PeachPuff = $FFDAB9
#D2D1_Color_Peru = $CD853F
#D2D1_Color_Pink = $FFC0CB
#D2D1_Color_Plum = $DDA0DD
#D2D1_Color_PowderBlue = $B0E0E6
#D2D1_Color_Purple = $800080
#D2D1_Color_Red = $FF0000
#D2D1_Color_RosyBrown = $BC8F8F
#D2D1_Color_RoyalBlue = $4169E1
#D2D1_Color_SaddleBrown = $8B4513
#D2D1_Color_Salmon = $FA8072
#D2D1_Color_SandyBrown = $F4A460
#D2D1_Color_SeaGreen = $2E8B57
#D2D1_Color_SeaShell = $FFF5EE
#D2D1_Color_Sienna = $A0522D
#D2D1_Color_Silver = $C0C0C0
#D2D1_Color_SkyBlue = $87CEEB
#D2D1_Color_SlateBlue = $6A5ACD
#D2D1_Color_SlateGray = $708090
#D2D1_Color_Snow = $FFFAFA
#D2D1_Color_SpringGreen = $00FF7F
#D2D1_Color_SteelBlue = $4682B4
#D2D1_Color_Tan = $D2B48C
#D2D1_Color_Teal = $008080
#D2D1_Color_Thistle = $D8BFD8
#D2D1_Color_Tomato = $FF6347
#D2D1_Color_Turquoise = $40E0D0
#D2D1_Color_Violet = $EE82EE
#D2D1_Color_Wheat = $F5DEB3
#D2D1_Color_White = $FFFFFF
#D2D1_Color_WhiteSmoke = $F5F5F5
#D2D1_Color_Yellow = $FFFF00
#D2D1_Color_YellowGreen = $9ACD32

#_D2D1_Color_sc_redShift   = 16
#_D2D1_Color_sc_greenShift = 8
#_D2D1_Color_sc_blueShift  = 0

#_D2D1_Color_sc_redMask = $ff << #_D2D1_Color_sc_redShift
#_D2D1_Color_sc_greenMask = $ff << #_D2D1_Color_sc_greenShift
#_D2D1_Color_sc_blueMask = $ff << #_D2D1_Color_sc_blueShift

Procedure.i _D2D1_ColorF_InitHex(*c.D2D1_COLOR_F, rgbHex.l, alpha.f = 1.0)
	Protected.a r, g, b
	
	r = ((rgbHex & #_D2D1_Color_sc_redMask) >> #_D2D1_Color_sc_redShift) : *c\r = r / 255
	g = ((rgbHex & #_D2D1_Color_sc_greenMask) >> #_D2D1_Color_sc_greenShift) : *c\g = g / 255
	b = ((rgbHex & #_D2D1_Color_sc_blueMask) >> #_D2D1_Color_sc_blueShift) : *c\b = b / 255
	*c\a = alpha
EndProcedure

Procedure.i D2D1_ColorF(*c.D2D1_COLOR_F, red.f, green.f, blue.f, alpha.f = 1.0)
	*c\r = red
	*c\g = green
	*c\b = blue
	*c\a = alpha
	
	ProcedureReturn *c
EndProcedure

Procedure.i D2D1_ColorFRgb(*c.D2D1_COLOR_F, rgb.l, alpha.f = 1.0)
	*c\r = Red(rgb) / 255
	*c\g = Green(rgb) / 255
	*c\b = Blue(rgb) / 255
	*c\a = alpha
	
	ProcedureReturn *c
EndProcedure

Procedure.i D2D1_ColorFHex(*c.D2D1_COLOR_F, rgbHex.l, alpha.f = 1.0)
	_D2D1_ColorF_InitHex(*c, rgbHEX, alpha)
	
	ProcedureReturn *c
EndProcedure


