IncludeFile "PBDirect2D.pb"

;https://learn.microsoft.com/en-us/windows/win32/direct2d/direct2d-quickstart
;https://learn.microsoft.com/en-us/windows/win32/direct2d/direct2d-and-directwrite
;https://learn.microsoft.com/en-us/windows/win32/wic/-wic-bitmapsources-howto-drawusingd2d
;https://github.com/microsoft/Windows-universal-samples/tree/main/Samples/D2DSvgImage
;https://learn.microsoft.com/en-us/windows/win32/direct2d/effects-overview

EnableExplicit

;- _APP
Structure _APP
	win.i
	d2dFactory.ID2D1Factory
	renderTarget.ID2D1HwndRenderTarget
	brush1.ID2D1SolidColorBrush
	brush2.ID2D1SolidColorBrush
	strokeStyle.ID2D1StrokeStyle
	dWriteFactory.IDWriteFactory
	txtFormat.IDWriteTextFormat
	imgFactory.IWICImagingFactory
	d2dBmp.ID2D1Bitmap
	svgDoc.IUnknown
	scaleEffect.ID2D1Effect
	grayScaleEffect.ID2D1Effect

	oldProc.i
EndStructure
Global._APP app

Procedure.f minF(a.f, b.f)
	If a < b
		ProcedureReturn a
		
	Else
		ProcedureReturn b
	EndIf 
EndProcedure

Procedure imgFit(srcWidth.f, srcHeight.f, maxWidth.f, maxHeight.f, *sz.D2D1_SIZE_F)
	Protected.f ratio
	
	If *sz = 0 : ProcedureReturn : EndIf
	
	ratio = minF(maxWidth / srcWidth, maxHeight / srcHeight)
	*sz\width = srcWidth * ratio
	*sz\height = srcHeight * ratio
EndProcedure

Procedure imgCenter(srcWidth.f, srcHeight.f, maxWidth.f, maxHeight.f, *pt.D2D1_POINT_2F)
	If *pt = 0 : ProcedureReturn : EndIf
	
	*pt\x = (maxWidth - srcWidth) / 2
	*pt\y = (maxHeight - srcHeight) / 2
EndProcedure

Procedure app_discardDeviceResources()	
	If app\renderTarget
		app\renderTarget\Release() : app\renderTarget = 0
	EndIf
	
	If app\brush1
		app\brush1\Release() : app\brush1 = 0
	EndIf
	
	If app\brush2
		app\brush2\Release() : app\brush2 = 0
	EndIf
	
	If app\d2dBmp
		app\d2dBmp\Release() : app\d2dBmp = 0
	EndIf
	
	If app\svgDoc
		app\svgDoc\Release() : app\svgDoc = 0
	EndIf 
	
	If app\grayScaleEffect
		app\grayScaleEffect\Release() : app\grayScaleEffect = 0
	EndIf 
	
	If app\scaleEffect
		app\scaleEffect\Release() : app\scaleEffect = 0
	EndIf 
EndProcedure

Procedure app_release()
	If app\d2dFactory
		app\d2dFactory\Release() : app\d2dFactory = 0
	EndIf
	
	If app\strokeStyle
		app\strokeStyle\Release() : app\strokeStyle = 0
	EndIf
	
	If app\dWriteFactory
		app\dWriteFactory\Release() : app\dWriteFactory = 0
	EndIf
	
	If app\txtFormat
		app\txtFormat\Release() : app\txtFormat = 0
	EndIf 
	
	If app\imgFactory
		app\imgFactory\Release() : app\imgFactory = 0
	EndIf 
	
	app_discardDeviceResources()
EndProcedure	

Procedure app_createDeviceIndependentResources()
	Protected.D2D1_FACTORY_OPTIONS fOpts
	Protected.l hr
	Protected.D2D1_STROKE_STYLE_PROPERTIES props
	
	fOpts\DebugLevel = #D2D1_DEBUG_LEVEL_NONE
	hr = D2D1CreateFactory_(#D2D1_FACTORY_TYPE_SINGLE_THREADED, ?IID_ID2D1Factory, @fOpts, @app\d2dFactory)
	
	If hr = #S_OK
		;Stroke style
		props\startCap = #D2D1_CAP_STYLE_FLAT
		props\endCap = #D2D1_CAP_STYLE_FLAT
		props\dashCap = #D2D1_CAP_STYLE_FLAT
		props\lineJoin = #D2D1_LINE_JOIN_MITER
		props\miterLimit = 1.0
		props\dashStyle = #D2D1_DASH_STYLE_SOLID
		props\dashOffset = 0.0
		hr = app\d2dFactory\CreateStrokeStyle(@props, 0, 0, @app\strokeStyle)
	EndIf
	
	hr = DWriteCreateFactory_(#DWRITE_FACTORY_TYPE_SHARED, ?IID_IDWriteFactory, @app\dWriteFactory)
	If hr = #S_OK
		;Text format
		hr = app\dWriteFactory\CreateTextFormat("Segoe UI Emoji", #Null, #DWRITE_FONT_WEIGHT_REGULAR, 
			#DWRITE_FONT_STYLE_NORMAL, #DWRITE_FONT_STRETCH_NORMAL, 18.0,
			"en-us", @app\txtFormat)
		
		If hr = #S_OK
			app\txtFormat\SetTextAlignment(#DWRITE_TEXT_ALIGNMENT_CENTER)
			app\txtFormat\SetParagraphAlignment(#DWRITE_PARAGRAPH_ALIGNMENT_CENTER)
		EndIf 
	EndIf
		
	hr = CoCreateInstance_(?CLSID_WICImagingFactory, #Null, #CLSCTX_INPROC_SERVER, ?IID_IWICImagingFactory, @app\imgFactory)
	
	ProcedureReturn hr
EndProcedure

#D2D1_SCALE_PROP_SCALE = 0
Procedure app_createDeviceResources()
	Protected.RECT rc
	Protected.l hr
	Protected.i hwnd
	Protected.D2D1_SIZE_U sz
	Protected.D2D1_RENDER_TARGET_PROPERTIES props
	Protected.D2D1_HWND_RENDER_TARGET_PROPERTIES  hwndProps
	Protected.D2D1_COLOR_F color
	Protected.D2D1_BRUSH_PROPERTIES bProp
	Protected.IWICFormatConverter wicBmp
	Protected.IWICBitmapDecoder imgDecoder
	Protected.IWICBitmapFrameDecode pFrame
	Protected.ID2D1DeviceContext5 dc5
	Protected.IStream svgStream
	Protected.ID2D1Image img
	Protected.ID2D1DeviceContext dc

	hr = #S_OK
	
	If app\renderTarget = 0
		hwnd = WindowID(app\win)
		GetClientRect_(hwnd, @rc)
		sz\width = rc\right - rc\left
		sz\height = rc\bottom - rc\top
		
		;Create a Direct2D render target.
		props\type = #D2D1_RENDER_TARGET_TYPE_DEFAULT
		props\pixelFormat\format = #DXGI_FORMAT_UNKNOWN
		props\pixelFormat\alphaMode = #D2D1_ALPHA_MODE_UNKNOWN
		props\dpiX = 0.0
		props\dpiY = 0.0
		props\usage = #D2D1_RENDER_TARGET_USAGE_NONE
		props\minLevel = #D2D1_FEATURE_LEVEL_DEFAULT
		
		hwndProps\hwnd = hwnd
		hwndProps\pixelSize\height = sz\height
		hwndProps\pixelSize\width = sz\width
		hwndProps\presentOptions = #D2D1_PRESENT_OPTIONS_NONE
		
		hr = app\d2dFactory\CreateHwndRenderTarget(@props, @hwndProps, @app\renderTarget)
		If hr = #S_OK		
			;Brushes
			bProp\opacity = 1.0
			
			color\r = 0 : color\g = 162/255 : color\b = 232/255 : color\a = 1.0
			app\renderTarget\CreateSolidColorBrush(@color, @bProp, @app\brush1)
			
			color\r = 0.0 : color\g = 1.0 : color\b = 0.0 : color\a = 1.0
			app\renderTarget\CreateSolidColorBrush(@color, @bProp, @app\brush2)
			
			;Bitmap
			If app\imgFactory
				If app\imgFactory\CreateDecoderFromFilename("assets\pic1.jpg", #Null, #GENERIC_READ, #WICDecodeMetadataCacheOnDemand, @imgDecoder) = #S_OK
					If imgDecoder\GetFrame(0, @pFrame) = #S_OK
						If app\imgFactory\CreateFormatConverter(@wicBmp) = #S_OK
							If wicBmp\Initialize(pFrame, ?GUID_WICPixelFormat32bppPBGRA, #WICBitmapDitherTypeNone, #Null, 0.0, #WICBitmapPaletteTypeCustom) = #S_OK
								app\renderTarget\CreateBitmapFromWicBitmap(wicBmp, #Null, @app\d2dBmp)
								
								;Effects
								If app\renderTarget\QueryInterface(?IID_ID2D1DeviceContext, @dc) = #S_OK
									dc\CreateEffect(?CLSID_D2D1Scale, @app\scaleEffect)
									dc\CreateEffect(?CLSID_D2D1Grayscale, @app\grayScaleEffect)
									If app\grayScaleEffect = 0
										Debug "Grayscale not supported"
									EndIf 									
								EndIf
							EndIf
							wicBmp\Release()
						EndIf
						pFrame\Release()
					EndIf 
					imgDecoder\Release()
				EndIf	
			EndIf
			
			;Svg
			If app\renderTarget\QueryInterface(?IID_ID2D1DeviceContext5, @dc5) = #S_OK
				If SHCreateStreamOnFile_("assets\drawing.svg", #STGM_READ, @svgStream) = #S_OK
					dc5\CreateSvgDocument(svgStream, D2D1_SizeF(100, 100), @app\svgDoc)
					svgStream\Release()
				EndIf 
				dc5\Release()
				
			Else 
				Debug "SVG Not supported"
			EndIf 
		EndIf 
	EndIf
	
	ProcedureReturn hr
EndProcedure

Procedure app_onSize(width.w, height.w)
	Protected.D2D1_SIZE_U sz
		
	If app\renderTarget
		sz\width = width
		sz\height = height
		
		app\renderTarget\Resize(@sz)
	EndIf
EndProcedure

Procedure app_onRender()
	Protected.l hr, x, y, width, height, txtOpts
	Protected.D2D1_MATRIX_3X2_F im, tm1, tm2, tm3
	Protected.D2D1_COLOR_F color
	Protected.q tag1, tag2
	Protected.D2D1_SIZE_F rectSize, rtSize, bmpSize, scaledBmpSize
	Protected.D2D1_RECT_F rcF2
	Protected.D2D1_POINT_2F bmpPos, pt
	Protected.s txt
	Protected.ID2D1DeviceContext5 dc5
	Protected.ID2D1DeviceContext dc
	Protected.ID2D1Image img
	Protected.ID2D1Bitmap scaledBmp
	Protected.ID2D1Effect effect
	
	hr = #S_OK
	
	hr = app_createDeviceResources()
	If hr = #S_OK	
		rectSize\width = 200.0
		rectSize\height = 200.0
				
		app\renderTarget\BeginDraw()
		D2D1_Matrix3x2F_Identity(@im)
		D2D1_Matrix3x2F_Identity(@tm1)
		D2D1_Matrix3x2F_Identity(@tm2)
		D2D1_Matrix3x2F_Identity(@tm3)

		color\r = 1.0 : color\g = 1.0 : color\b = 1.0 : color\a = 1.0
		app\renderTarget\Clear(@color)
		app\renderTarget\GetSize(@rtSize)
	
		;Grid
		width = rtSize\width
		height = rtSize\height

		For x = 0 To width Step 10
			app\renderTarget\DrawLine(D2D1_Point2F(x, 0.0), D2D1_Point2F(x, rtSize\height), app\brush1, 0.5, app\strokeStyle)
		Next 

		For y = 0 To height Step 10
			app\renderTarget\DrawLine(D2D1_Point2F(0.0, y), D2D1_Point2F(rtSize\width, y), app\brush1, 0.5, app\strokeStyle) 
		Next 
    
		;Rectangles
		rcF2\left = (rtSize\width / 2) - rectSize\width / 2
		rcF2\top = (rtSize\height / 2) - rectSize\width / 2
		rcF2\right = (rtSize\width / 2) + rectSize\width / 2
		rcF2\bottom = (rtSize\height / 2) + rectSize\width / 2
	
		;Image
		If app\d2dBmp And app\renderTarget\QueryInterface(?IID_ID2D1DeviceContext, @dc) = #S_OK
			app\d2dBmp\GetSize(@bmpSize)
			
			;Scale to rectangle keeping ratio
			pt\x = (rectSize\width  / bmpSize\width) * DesktopResolutionX()
			pt\y = (rectSize\height / bmpSize\width) * DesktopResolutionX()

			app\scaleEffect\SetInput(0, app\d2dBmp, 0)
			app\scaleEffect\SetValue(#D2D1_SCALE_PROP_SCALE, #D2D1_PROPERTY_TYPE_VECTOR2, @pt, SizeOf(D2D1_POINT_2F))

			;Apply gray scale
			If app\grayScaleEffect
				app\scaleEffect\GetOutput(@img)
				app\grayScaleEffect\SetInput(0, img, 0)
				img\Release()
				effect = app\grayScaleEffect

			Else
				effect = app\scaleEffect
			EndIf

			;Get scaled size and center in rectangle
			scaledBmpSize\width = (bmpSize\width * pt\x) / DesktopResolutionX()
			scaledBmpSize\height = (bmpSize\height * pt\y) / DesktopResolutionY()
			imgCenter(scaledBmpSize\width, scaledBmpSize\height, rectSize\width, rectSize\height, @bmpPos)
			
			pt\x = rcF2\left + bmpPos\x
			pt\y = rcF2\top + bmpPos\y
			effect\GetOutput(@img)
			If img
				dc\DrawImage(img, @pt, 0, #D2D1_BITMAP_INTERPOLATION_MODE_LINEAR, #D2D1_COMPOSITE_MODE_SOURCE_OVER)
				img\Release()
			EndIf
			
			dc\Release()
		EndIf
		
		;SVG
		If app\svgDoc And app\renderTarget\QueryInterface(?IID_ID2D1DeviceContext5, @dc5) = #S_OK
			;DrawSvgDocument() always draws at 0,0 scale and translate
			D2D1_Matrix3x2F_Scale(@tm2, 1.5, 1.5, 0, 0)
			D2D1_Matrix3x2F_Translation(@tm1, 0, rcF2\top)
			D2D1_Matrix3x2F_Multiply(@tm2, @tm1, @tm3)
			
			dc5\SetTransform(@tm3)
			dc5\DrawSvgDocument(app\svgDoc)
			dc5\SetTransform(@im)
			dc5\Release()
		EndIf 

		;Text
		txt = "Hello World! " + #CRLF$ + "😀 😬 😁 😂 😃 😄 😅 😆" 
		If OSVersion() >= #PB_OS_Windows_8_1
			txtOpts = #D2D1_DRAW_TEXT_OPTIONS_ENABLE_COLOR_FONT
			
		Else ;Color emoji not supported
			txtOpts = #D2D1_DRAW_TEXT_OPTIONS_NONE
		EndIf 
		dc\DrawText(txt, Len(txt), app\txtFormat, @rcF2, app\brush2, txtOpts, #DWRITE_MEASURING_MODE_NATURAL)
	
		;Border
		dc\DrawRectangle(@rcF2, app\brush2, 2.0, app\strokeStyle)
		hr = dc\EndDraw(@tag1, @tag2)
	EndIf
	
	If (hr = #D2DERR_RECREATE_TARGET)
		hr = #S_OK
		app_discardDeviceResources()
	EndIf 
	
	ProcedureReturn hr
EndProcedure

Procedure win_proc(hwnd.i, msg.l, wparam.i, lparam.i)	
	Select msg
		Case #WM_SIZE
			app_onSize(PeekW(@lparam), PeekW(@lparam + SizeOf(Word)))
			
		Case #WM_DISPLAYCHANGE
			InvalidateRect_(hwnd, #Null, #False)
 			
		Case #WM_ERASEBKGND
			Protected.RECT rc
			
			GetClientRect_(hwnd, @rc)
			app_onSize(rc\right, rc\bottom)
			app_onRender()
			ProcedureReturn 1
			
		Case #WM_PAINT
			app_onRender()
			ValidateRect_(hwnd, #Null)
			ProcedureReturn 0
	EndSelect
	
	ProcedureReturn CallWindowProc_(app\oldProc, hwnd, msg, wparam, lparam)
EndProcedure

Procedure main()
	Protected.l ev
		

	app\win = OpenWindow(#PB_Any, 10, 10, 600, 400, "Direct2D", #PB_Window_MaximizeGadget | #PB_Window_MinimizeGadget | 
		#PB_Window_SizeGadget)
	app\oldProc = SetWindowLongPtr_(WindowID(app\win), #GWLP_WNDPROC, @win_proc())
	
	If app_createDeviceIndependentResources() <> #S_OK
		MessageRequester("Error" , "Failed to initialize Direct2D")
		End
	EndIf

	Repeat
		ev = WaitWindowEvent()
		
	Until ev = #PB_Event_CloseWindow
	
	app_release()
EndProcedure

main()
