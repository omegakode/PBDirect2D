;DemoWAM.pb

IncludeFile "PBDirect2D.pb"

EnableExplicit

#ANIM_DOTS_COUNT = 3

Enumeration
	#MENU_ID_START_STOP
EndEnumeration

;- _ANIM_DOT
Structure _ANIM_DOT
	yPos.IUIAnimationVariable
EndStructure

;- _ANIM
Structure _ANIM
	Array dots._ANIM_DOT(#ANIM_DOTS_COUNT - 1)
EndStructure

;- _APP
Structure _APP
	win.i
	menu.i
	oldProc.i
	anim._ANIM
	
	;D2D Device independent resources
	d2dFactory.ID2D1Factory
	dWriteFactory.IDWriteFactory
	txtFormat.IDWriteTextFormat
	
	;D2D Device dependent resources
	renderTarget.ID2D1HwndRenderTarget
	dotBrush.ID2D1SolidColorBrush
	rectBrush.ID2D1SolidColorBrush
	
	;WAM
	animManager.IUIAnimationManager
	animTimer.IUIAnimationTimer;
	animTransitionLib.IUIAnimationTransitionLibrary
	storyBoard.IUIAnimationStoryboard 
EndStructure
Global._APP app


;- ANIM_MANAGER_EVENT_HANDLER
Structure ANIM_MANAGER_EVENT_HANDLER
	vt.i
	refCount.l
EndStructure

;- ANIM_MANAGER_EVENT_HANDLER_VTABLE
Structure ANIM_MANAGER_EVENT_HANDLER_VTABLE
	QueryInterface.i
	AddRef.i
	Release.i
	OnManagerStatusChanged.i
EndStructure
Global.ANIM_MANAGER_EVENT_HANDLER_VTABLE g_ANIM_MANAGER_EVENT_HANDLER_VTABLE

Procedure.i animManagerEvHandler_New()
	Protected.ANIM_MANAGER_EVENT_HANDLER *this
	
	*this = AllocateMemory(SizeOf(ANIM_MANAGER_EVENT_HANDLER))
	*this\vt = @g_ANIM_MANAGER_EVENT_HANDLER_VTABLE
	*this\refCount = 1
	
	ProcedureReturn *this
EndProcedure

Procedure.l animManagerEvHandler_Free(*this.ANIM_MANAGER_EVENT_HANDLER)
	Debug #PB_Compiler_Procedure
	
	If *this
		FreeMemory(*this)
	EndIf
EndProcedure

Procedure.l animManagerEvHandler_QueryInterface(*this.ANIM_MANAGER_EVENT_HANDLER, *iid.IID, *obj.Integer)
	If CompareMemory(*iid, ?IID_IUIAnimationManagerEventHandler, SizeOf(IID))
		*obj\i = *this
		*this\refCount + 1
		
		ProcedureReturn #S_OK
		
	Else
		*obj\i = #Null
		ProcedureReturn #E_NOINTERFACE
	EndIf 
EndProcedure

Procedure.l animManagerEvHandler_AddRef(*this.ANIM_MANAGER_EVENT_HANDLER)
	*this\refCount = *this\refCount + 1
	
	ProcedureReturn *this\refCount
EndProcedure

Procedure.l animManagerEvHandler_Release(*this.ANIM_MANAGER_EVENT_HANDLER)
	Protected.l refCount
	
	*this\refCount = *this\refCount - 1
	refCount = *this\refCount
	
	If *this\refCount = 0
		animManagerEvHandler_Free(*this)
	EndIf 
	
	ProcedureReturn refCount
EndProcedure

Procedure.l animManagerEvHandler_OnManagerStatusChanged(*this.ANIM_MANAGER_EVENT_HANDLER, newStatus.l, previousStatus.l)
	Protected.l hr
	
	hr = #S_OK
		
	If newStatus = #UI_ANIMATION_MANAGER_BUSY
		InvalidateRect_(WindowID(app\win), #Null, #False)
	EndIf
	
	ProcedureReturn hr
EndProcedure

g_ANIM_MANAGER_EVENT_HANDLER_VTABLE\QueryInterface = @animManagerEvHandler_QueryInterface()
g_ANIM_MANAGER_EVENT_HANDLER_VTABLE\AddRef = @animManagerEvHandler_AddRef()
g_ANIM_MANAGER_EVENT_HANDLER_VTABLE\Release = @animManagerEvHandler_Release()
g_ANIM_MANAGER_EVENT_HANDLER_VTABLE\OnManagerStatusChanged = @animManagerEvHandler_OnManagerStatusChanged()


;- ANIM_STORYBOARD_EVENT_HANDLER
Structure ANIM_STORYBOARD_EVENT_HANDLER
	vt.i
	refCount.l
EndStructure

;- ANIM_STORYBOARD_EVENT_HANDLER_VTABLE
Structure ANIM_STORYBOARD_EVENT_HANDLER_VTABLE
	QueryInterface.i
	AddRef.i
	Release.i
	OnStoryboardStatusChanged.i
	OnStoryboardUpdated.i
EndStructure
Global.ANIM_STORYBOARD_EVENT_HANDLER_VTABLE g_ANIM_STORYBOARD_EVENT_HANDLER_VTABLE

Procedure.i animStoryBoardEvHandler_New()
	Protected.ANIM_STORYBOARD_EVENT_HANDLER *this
	
	*this = AllocateMemory(SizeOf(ANIM_STORYBOARD_EVENT_HANDLER))
	*this\vt = @g_ANIM_STORYBOARD_EVENT_HANDLER_VTABLE
	*this\refCount = 1
	
	ProcedureReturn *this
EndProcedure

Procedure.l animStoryBoardEvHandler_Free(*this.ANIM_STORYBOARD_EVENT_HANDLER)
	Debug #PB_Compiler_Procedure

	If *this
		FreeMemory(*this)
	EndIf
EndProcedure

Procedure.l animStoryBoardEvHandler_QueryInterface(*this.ANIM_STORYBOARD_EVENT_HANDLER, *iid.IID, *obj.Integer)
	If CompareMemory(*iid, ?IID_IUIAnimationStoryboardEventHandler, SizeOf(IID))
		*obj\i = *this
		*this\refCount + 1
		
		ProcedureReturn #S_OK
		
	Else
		*obj\i = #Null
		ProcedureReturn #E_NOINTERFACE
	EndIf 
EndProcedure

Procedure.l animStoryBoardEvHandler_AddRef(*this.ANIM_STORYBOARD_EVENT_HANDLER)
	*this\refCount = *this\refCount + 1
	
	ProcedureReturn *this\refCount
EndProcedure

Procedure.l animStoryBoardEvHandler_Release(*this.ANIM_STORYBOARD_EVENT_HANDLER)
	Protected.l refCount
	
	*this\refCount = *this\refCount - 1
	refCount = *this\refCount
	
	If *this\refCount = 0
		animStoryBoardEvHandler_Free(*this)
	EndIf 
	
	ProcedureReturn refCount
EndProcedure

Procedure.l animStoryBoardEvHandler_OnStoryboardStatusChanged(*this.ANIM_STORYBOARD_EVENT_HANDLER, storyboard.IUIAnimationStoryboard, newStatus.l, previousStatus.l)	
	If newStatus = #UI_ANIMATION_STORYBOARD_FINISHED
		Debug #PB_Compiler_Procedure + " FINISHED"
	EndIf
EndProcedure

Procedure.l animStoryBoardEvHandler_OnStoryboardUpdated(*this.ANIM_STORYBOARD_EVENT_HANDLER, storyboard.IUIAnimationStoryboard)

EndProcedure

g_ANIM_STORYBOARD_EVENT_HANDLER_VTABLE\QueryInterface = @animStoryBoardEvHandler_QueryInterface()
g_ANIM_STORYBOARD_EVENT_HANDLER_VTABLE\AddRef = @animStoryBoardEvHandler_AddRef()
g_ANIM_STORYBOARD_EVENT_HANDLER_VTABLE\Release = @animStoryBoardEvHandler_Release()
g_ANIM_STORYBOARD_EVENT_HANDLER_VTABLE\OnStoryboardStatusChanged = @animStoryBoardEvHandler_OnStoryboardStatusChanged()
g_ANIM_STORYBOARD_EVENT_HANDLER_VTABLE\OnStoryboardUpdated = @animStoryBoardEvHandler_OnStoryboardUpdated()

Procedure app_createDeviceIndependentResources()
	Protected.l hr
	Protected.D2D1_FACTORY_OPTIONS fOpts
	Protected.D2D1_STROKE_STYLE_PROPERTIES props
	
	fOpts\DebugLevel = #D2D1_DEBUG_LEVEL_NONE
	hr = D2D1CreateFactory_(#D2D1_FACTORY_TYPE_SINGLE_THREADED, ?IID_ID2D1Factory, @fOpts, @app\d2dFactory)
	
	hr = DWriteCreateFactory_(#DWRITE_FACTORY_TYPE_SHARED, ?IID_IDWriteFactory, @app\dWriteFactory)
	If hr = #S_OK
		;Text format
		hr = app\dWriteFactory\CreateTextFormat("Segoe UI", #Null, #DWRITE_FONT_WEIGHT_REGULAR, 
			#DWRITE_FONT_STYLE_NORMAL, #DWRITE_FONT_STRETCH_NORMAL, 18.0,
			"en-us", @app\txtFormat)
		
		If hr = #S_OK
			app\txtFormat\SetTextAlignment(#DWRITE_TEXT_ALIGNMENT_LEADING)
		EndIf 
	EndIf
	
	ProcedureReturn hr
EndProcedure

Procedure app_discardDeviceIndependentResources()
	If app\d2dFactory
		app\d2dFactory\Release() : app\d2dFactory = 0 
	EndIf
	
	If app\dWriteFactory
		app\dWriteFactory\Release() : app\dWriteFactory = 0 
	EndIf
	
	If app\txtFormat
		app\txtFormat\Release() : app\txtFormat = 0 
	EndIf
EndProcedure

Procedure app_createDeviceResources()
	Protected.l hr
	Protected.RECT rc
	Protected.i hwnd
	Protected.D2D1_SIZE_U sz
	Protected.D2D1_RENDER_TARGET_PROPERTIES rtProps
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
		rtProps\type = #D2D1_RENDER_TARGET_TYPE_DEFAULT 
		rtProps\pixelFormat\format = #DXGI_FORMAT_UNKNOWN
		rtProps\pixelFormat\alphaMode = #D2D1_ALPHA_MODE_UNKNOWN
		rtProps\dpiX = 0.0
		rtProps\dpiY = 0.0
		rtProps\usage = #D2D1_RENDER_TARGET_USAGE_NONE
		rtProps\minLevel = #D2D1_FEATURE_LEVEL_DEFAULT
		
		hwndProps\hwnd = hwnd
		hwndProps\pixelSize\height = sz\height
		hwndProps\pixelSize\width = sz\width
		hwndProps\presentOptions = #D2D1_PRESENT_OPTIONS_NONE
		
		hr = app\d2dFactory\CreateHwndRenderTarget(@rtProps, @hwndProps, @app\renderTarget)
		If hr = #S_OK		
			;Brushes
			bProp\opacity = 1.0
			
			color\r = 0 : color\g = 162/255 : color\b = 232/255 : color\a = 1.0
			app\renderTarget\CreateSolidColorBrush(@color, @bProp, @app\rectBrush)
			
			color\r = 0.0 : color\g = 1.0 : color\b = 0.0 : color\a = 1.0
			app\renderTarget\CreateSolidColorBrush(@color, @bProp, @app\dotBrush)
		EndIf
	EndIf 
	
	ProcedureReturn hr
EndProcedure

Procedure app_discardDeviceResources()	
	If app\renderTarget
		app\renderTarget\Release() : app\renderTarget = 0
	EndIf
	
	If app\dotBrush
		app\dotBrush\Release() : app\dotBrush = 0
	EndIf
	
	If app\rectBrush
		app\rectBrush\Release() : app\rectBrush = 0
	EndIf
EndProcedure

Procedure app_initWAM()
	Protected.l i, hr
	Protected.d sinDuration
	Protected.IUIAnimationManagerEventHandler animEventHandler
	Protected.IUIAnimationTransition transYPos
	Protected.IUIAnimationStoryboardEventHandler storyBoardEvHandler
	Protected.i  keyFrame1, keyFrame2, endKeyFrame
	
	;No error checking
	
	hr = CoCreateInstance_(?CLSID_UIAnimationManager, #Null, #CLSCTX_INPROC_SERVER, ?IID_IUIAnimationManager, @app\animManager)
	hr = CoCreateInstance_(?CLSID_UIAnimationTimer, #Null, #CLSCTX_INPROC_SERVER, ?IID_IUIAnimationTimer, @app\animTimer)
	hr = CoCreateInstance_(?CLSID_UIAnimationTransitionLibrary, #Null, #CLSCTX_INPROC_SERVER, ?IID_IUIAnimationTransitionLibrary, @app\animTransitionLib)

	animEventHandler = animManagerEvHandler_New()
	hr = app\animManager\SetManagerEventHandler(animEventHandler)
	animEventHandler\Release()
	
	sinDuration = 6
	app\animManager\CreateStoryboard(@app\storyBoard)

	storyBoardEvHandler = animStoryBoardEvHandler_New()
	app\storyBoard\SetStoryboardEventHandler(storyBoardEvHandler)
	storyBoardEvHandler\Release()
	
	;Keyframes for dots 1, 2 start time and animation end
	app\storyBoard\AddKeyframeAtOffset(#UI_ANIMATION_KEYFRAME_STORYBOARD_START, 0.5, @keyFrame1)
	app\storyBoard\AddKeyframeAtOffset(#UI_ANIMATION_KEYFRAME_STORYBOARD_START, 1.0, @keyFrame2)
	app\storyBoard\AddKeyframeAtOffset(#UI_ANIMATION_KEYFRAME_STORYBOARD_START, sinDuration + 0.5 + 1.0, @endKeyFrame)
	
	app\storyBoard\RepeatBetweenKeyframes(#UI_ANIMATION_KEYFRAME_STORYBOARD_START, endKeyFrame, #UI_ANIMATION_REPEAT_INDEFINITELY)

	For i = 0 To #ANIM_DOTS_COUNT -1
		;Create variables
		app\animManager\CreateAnimationVariable(0.0, @app\anim\dots(i)\yPos)
		app\anim\dots(i)\yPos\SetLowerBound(-40.0)
		app\anim\dots(i)\yPos\SetUpperBound(40.0)
		
		;Add transitions to variables
		app\animTransitionLib\CreateSinusoidalTransitionFromRange(sinDuration, -40.0, 40.0, 1.5, #UI_ANIMATION_SLOPE_INCREASING, @transYPos)

		If i = 1
			app\storyBoard\AddTransitionAtKeyframe(app\anim\dots(i)\yPos, transYPos, keyFrame1)

		ElseIf i = 2
			app\storyBoard\AddTransitionAtKeyframe(app\anim\dots(i)\yPos, transYPos, keyFrame2)

		Else 
			app\storyBoard\AddTransition(app\anim\dots(i)\yPos, transYPos)
		EndIf 
		
		transYPos\Release()
	Next 
EndProcedure

Procedure app_ReleaseWAM()
	Protected.l i
	
	If app\animManager : app\animManager\Release() : EndIf	
	If app\animTimer : app\animTimer\Release() : EndIf	
	If app\animTransitionLib : app\animTransitionLib\Release() : EndIf	
	If app\storyBoard : app\storyBoard\Release() : EndIf	
	
	For i = 0 To #ANIM_DOTS_COUNT - 1
		app\anim\dots(i)\yPos\Release()
	Next 
EndProcedure

Procedure app_init()
	Protected.l hr 
	
	InitializeStructure(@app, _APP)
	
	;Direct2D
	hr = app_createDeviceIndependentResources()
	If hr <> #S_OK
		Debug "Failded to initialize Direct2D"
		ProcedureReturn hr
	EndIf
	
	app_initWAM()
EndProcedure

Procedure app_release()
	app_discardDeviceResources()
	app_discardDeviceIndependentResources()
	app_ReleaseWAM()
EndProcedure

Procedure app_onSize(width.w, height.w)
	Protected.D2D1_SIZE_U sz
		
	If app\renderTarget
		sz\width = width
		sz\height = height
		
		app\renderTarget\Resize(@sz)
	EndIf
EndProcedure

Procedure app_render()
	Protected.l hr, i, status
	Protected.q tag1, tag2
	Protected.D2D1_COLOR_F color
	Protected.D2D1_ROUNDED_RECT dotsRect
	Protected.D2D1_RECT_F rtRect
	Protected.D2D1_SIZE_F rtSize
	Protected.D2D1_ELLIPSE  dot
	Protected.f dotRectSize
	Protected.s text
	Protected.d yPos
	
	hr = #S_OK
		
	hr = app_createDeviceResources()
	If hr = #S_OK	
		app\renderTarget\BeginDraw()
		
		color\r = 1.0 : color\g = 1.0 : color\b = 1.0 : color\a = 1.0
		app\renderTarget\Clear(@color)
		app\renderTarget\GetSize(@rtSize)
		rtRect\right = rtSize\width
		rtRect\bottom = rtSize\height
		
		;Round Rectangle
		dotRectSize = 200.0
		dotsRect\rect\left = (rtSize\width / 2) - dotRectSize / 2
		dotsRect\rect\top = (rtSize\height / 2) - dotRectSize / 2
		dotsRect\rect\right = (rtSize\width / 2) + dotRectSize / 2
		dotsRect\rect\bottom = dotsRect\rect\top + dotRectSize 
		dotsRect\radiusX = 20.0
		dotsRect\radiusY = 20.0
 		app\renderTarget\FillRoundedRectangle(@dotsRect, app\rectBrush)

		dot\point\x = (rtSize\width / 2) - 40
		dot\radiusX = 10.0
		dot\radiusY = 10.0

		;Dots
		app\storyBoard\GetStatus(@status)
		For i = 0 To #ANIM_DOTS_COUNT - 1
			app\anim\dots(i)\yPos\GetValue(@yPos)
			
			dot\point\y = (rtSize\height / 2) + yPos
			app\renderTarget\FillEllipse(@dot, app\dotBrush)
			dot\point\x + 40.0
		Next 

		;Text
		text = "Press F1 to Start / Stop"
		app\renderTarget\DrawText(text, Len(text), app\txtFormat, @rtRect, app\rectBrush, #D2D1_DRAW_TEXT_OPTIONS_NONE, #DWRITE_MEASURING_MODE_NATURAL)

		hr = app\renderTarget\EndDraw(@tag1, @tag2)
	EndIf
	
	If (hr = #D2DERR_RECREATE_TARGET)
		hr = #S_OK
		app_discardDeviceResources()
	EndIf 
	
	ProcedureReturn hr
EndProcedure

Procedure app_onPaint(hwnd.i)
	Protected.l hr, status
	Protected.d secondsNow
	
	app\animTimer\GetTime(@secondsNow)
	app\animManager\Update(secondsNow, #Null)
	
	hr = app_render()
	If hr = #S_OK
		app\animManager\GetStatus(@status)
		If status = #UI_ANIMATION_MANAGER_BUSY
			InvalidateRect_(hwnd, #Null, #False)
		EndIf 
	EndIf 
EndProcedure

Procedure.i win_proc(hwnd.i, msg.l, wparam.i, lparam.i)	
	Select msg
		Case #WM_SIZE
			app_onSize(PeekW(@lparam), PeekW(@lparam + SizeOf(Word)))
						
		Case #WM_ERASEBKGND
			Protected.RECT rc
			
			GetClientRect_(hwnd, @rc)
			app_onSize(rc\right, rc\bottom)
			app_render()
			ProcedureReturn 1
			
		Case #WM_PAINT, #WM_DISPLAYCHANGE
			Protected.PAINTSTRUCT ps
			
			BeginPaint_(hwnd, @ps)
			app_onPaint(hwnd)
			EndPaint_(hwnd, @ps)
			ProcedureReturn 0
			
	EndSelect
	
	ProcedureReturn CallWindowProc_(app\oldProc, hwnd, msg, wparam, lparam)
EndProcedure

Procedure main()
	Protected.l ev, status
	Protected.d secondsNow

	If app_init() <> #S_OK
		MessageRequester("Error" , "Failed to initialize application")
		End
	EndIf
		
	app\win = OpenWindow(#PB_Any, 10, 10, 600, 400, "DemoAnim2", #PB_Window_MaximizeGadget | #PB_Window_MinimizeGadget | #PB_Window_SizeGadget)
	app\menu = CreateMenu(#PB_Any, WindowID(app\win))
	AddKeyboardShortcut(app\win, #PB_Shortcut_F1, #MENU_ID_START_STOP)

	app\oldProc = SetWindowLongPtr_(WindowID(app\win), #GWLP_WNDPROC, @win_proc())
	
	app\animTimer\GetTime(@secondsNow)
	app\storyBoard\Schedule(secondsNow, 0)
	
	Repeat
		ev = WaitWindowEvent()
		Select ev
			Case #PB_Event_Menu
				Select EventMenu()
					Case #MENU_ID_START_STOP
						app\storyBoard\GetStatus(@status)
						If status = #UI_ANIMATION_STORYBOARD_BUILDING Or status = #UI_ANIMATION_STORYBOARD_READY
							app\animTimer\GetTime(@secondsNow)
							app\storyBoard\Schedule(secondsNow, #Null)
	
						Else
							app\storyBoard\Finish(0)
						EndIf
				EndSelect
		EndSelect
	Until ev = #PB_Event_CloseWindow
	
	app\storyBoard\Finish(0)
	app_release()
EndProcedure

main()
