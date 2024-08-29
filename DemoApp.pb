﻿IncludeFile "PBDirect2D.pb"

;https://learn.microsoft.com/en-us/windows/win32/direct2d/direct2d-quickstart

EnableExplicit

;- _APP
Structure _APP
	win.i
	d2dFactory.ID2D1Factory
	renderTarget.ID2D1HwndRenderTarget
	brush1.ID2D1SolidColorBrush
	brush2.ID2D1SolidColorBrush
	strokeStyle.ID2D1StrokeStyle 
	oldProc.i
EndStructure
Global._APP app

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
EndProcedure

Procedure app_release()
	If app\d2dFactory
		app\d2dFactory\Release() : app\d2dFactory = 0
	EndIf
	If app\strokeStyle
		app\strokeStyle\Release() : app\strokeStyle = 0
	EndIf
	
	app_discardDeviceResources()
EndProcedure	

Procedure app_createDeviceIndependentResources()
	Protected.D2D1_FACTORY_OPTIONS fOpts
	Protected.l hr
	Protected.D2D1_STROKE_STYLE_PROPERTIES props
	
	fOpts\DebugLevel = #D2D1_DEBUG_LEVEL_NONE
	hr = D2D1CreateFactory_(#D2D1_FACTORY_TYPE_SINGLE_THREADED, ?IID_ID2D1Factory, @fOpts, @app\d2dFactory)
	
	;Create stroke style
	If hr = #S_OK
		props\startCap = #D2D1_CAP_STYLE_FLAT
		props\endCap = #D2D1_CAP_STYLE_FLAT
		props\dashCap = #D2D1_CAP_STYLE_FLAT
		props\lineJoin = #D2D1_LINE_JOIN_MITER
		props\miterLimit = 1.0
		props\dashStyle = #D2D1_DASH_STYLE_SOLID
		props\dashOffset = 0.0
		hr = app\d2dFactory\CreateStrokeStyle(@props, 0, 0, @app\strokeStyle)
	EndIf
	
	ProcedureReturn hr 
EndProcedure

Procedure app_createDeviceResources()
	Protected.RECT rc
	Protected.l hr
	Protected.i hwnd
	Protected.D2D1_SIZE_U sz
	Protected.D2D1_RENDER_TARGET_PROPERTIES props
	Protected.D2D1_HWND_RENDER_TARGET_PROPERTIES  hwndProps
	Protected.D2D1_COLOR_F color
	Protected.D2D1_BRUSH_PROPERTIES bProp
		
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
			
			;Identity matrix
			bProp\transform\m11 = 1.0
			bProp\transform\m12 = 0.0
			bProp\transform\m21 = 0.0
			bProp\transform\m22 = 1.0
			bProp\transform\dx = 0.0
			bProp\transform\dy = 0.0
			
			color\r = 1.0 : color\g = 0.0 : color\b = 0.0 : color\a = 1.0
			app\renderTarget\CreateSolidColorBrush(@color, @bProp, @app\brush1)
			
			color\r = 0.0 : color\g = 1.0 : color\b = 0.0 : color\a = 1.0
			app\renderTarget\CreateSolidColorBrush(@color, @bProp, @app\brush2)
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
	Protected.l hr, x, y, width, height
	Protected.D2D1_MATRIX_3X2_F im
	Protected.D2D1_COLOR_F color
	Protected.q tag1, tag2
	Protected.D2D1_SIZE_F rtSize
	Protected.D2D1_RECT_F rcF1, rcF2
	Protected.D2D1_POINT_2F pt1, pt2
	
	hr = #S_OK
	
	hr = app_createDeviceResources()
	If hr = #S_OK	
		app\renderTarget\BeginDraw()
		
		;Identity matrix
		im\m11 = 1.0
		im\m12 = 0.0
		im\m21 = 0.0
		im\m22 = 1.0
		im\dx = 0.0
		im\dy = 0.0
		
		app\renderTarget\SetTransform(@im)
		
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
		rcF1\left = (rtSize\width / 2) - 50.0
		rcF1\top = (rtSize\height / 2) - 50.0
		rcF1\right = (rtSize\width / 2) + 50.0
		rcF1\bottom = (rtSize\height / 2) + 50.0
    
		;Rectangles
    rcF2\left = (rtSize\width / 2) - 100.0
    rcF2\top = (rtSize\height / 2) - 100.0
    rcF2\right = (rtSize\width / 2) + 100.0
    rcF2\bottom = (rtSize\height / 2) + 100.0
	
		app\renderTarget\FillRectangle(@rcF1, app\brush1)
		app\renderTarget\DrawRectangle(@rcF2, app\brush2, 2.0, app\strokeStyle)
		hr = app\renderTarget\EndDraw(@tag1, @tag2)
	EndIf
	
	If (hr = #D2DERR_RECREATE_TARGET)
		hr = #S_OK
		app_discardDeviceResources()
	EndIf 
	
	ProcedureReturn hr
EndProcedure

Procedure win_proc(hwnd.i, msg.l, wparam.i, lparam.i)
	Protected.i result
	
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
		
	If app_createDeviceIndependentResources() <> #S_OK
		MessageRequester("Error" , "Failed to initialize Direct2D")
		End
	EndIf
	
	app\win = OpenWindow(#PB_Any, 10, 10, 600, 400, "Direct2D", #PB_Window_MaximizeGadget | #PB_Window_MinimizeGadget | 
		#PB_Window_SizeGadget)
	app\oldProc = SetWindowLongPtr_(WindowID(app\win), #GWLP_WNDPROC, @win_proc())
	
	Repeat
		ev = WaitWindowEvent()
		
	Until ev = #PB_Event_CloseWindow
	
	app_release()
EndProcedure

main()