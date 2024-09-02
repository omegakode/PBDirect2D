XIncludeFile "d2d1_1.pbi"

;- Enum D2D1_RENDERING_PRIORITY
#D2D1_RENDERING_PRIORITY_NORMAL = 0
#D2D1_RENDERING_PRIORITY_LOW = 1
#D2D1_RENDERING_PRIORITY_FORCE_DWORD = -1

;- ID2D1GeometryRealization

DataSection
	IID_ID2D1GeometryRealization:
	Data.l $a16907d7
	Data.w $bc02, 4801
	Data.b $99, $e8, $8c, $f7, $f4, $85, $f7, $74
EndDataSection


Interface ID2D1GeometryRealization Extends ID2D1Resource

EndInterface


;- ID2D1DeviceContext1

DataSection
	IID_ID2D1DeviceContext1:
	Data.l $d37f57e4
	Data.w $6908, $459f
	Data.b $a1, $99, $e7, $2f, $24, $f7, $99, $87
EndDataSection


Interface ID2D1DeviceContext1 Extends ID2D1DeviceContext
	CreateFilledGeometryRealization.l(geometry.i, tolerance.f, realization.i)
	CreateStrokedGeometryRealization.l(geometry.i, tolerance.f, stroke_width.f, stroke_style.i, realization.i)
	DrawGeometryRealization.l(realization.i, brush.i)
EndInterface


;- ID2D1Device1

DataSection
	IID_ID2D1Device1:
	Data.l $d21768e1
	Data.w $23a4, $4823
	Data.b $a1, $4b, $7c, $3e, $ba, $85, $d6, $58
EndDataSection


Interface ID2D1Device1 Extends ID2D1Device
	GetRenderingPriority.l();
	SetRenderingPriority.l(priority.l)
	CreateDeviceContext2.l(options.l, device_context.i)
EndInterface


;- ID2D1Factory2

DataSection
	IID_ID2D1Factory2:
	Data.l $94f81a73
	Data.w $9212, $4376
	Data.b $9c, $58, $b1, $6a, $3a, $0d, $39, $92
EndDataSection


Interface ID2D1Factory2 Extends ID2D1Factory1
	CreateDevice2.l(dxgi_device.i, device.i)
EndInterface


;- ID2D1CommandSink1

DataSection
	IID_ID2D1CommandSink1:
	Data.l $9eb767fd
	Data.w $4269, $4467
	Data.b $b8, $c2, $eb, $30, $cb, $30, $57, $43
EndDataSection


Interface ID2D1CommandSink1 Extends ID2D1CommandSink
	SetPrimitiveBlend1.l(primitive_blend.l)
EndInterface