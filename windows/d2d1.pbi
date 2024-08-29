;Generated by PB Type Library Importer Version: 1.0

XIncludeFile "d2derr.pbi"

;- ID2D1Factory

DataSection
	IID_ID2D1Factory:
	Data.l $6152247
	Data.w $6F50, $465A
	Data.b $92, $45, $11, $8B, $FD, $3B, $60, $7
EndDataSection


Interface ID2D1Factory Extends IUnknown
	ReloadSystemMetrics()
	GetDesktopDpi(dpi_x.i, dpi_y.i)
	CreateRectangleGeometry(rect.i, geometry.i)
	CreateRoundedRectangleGeometry(rect.i, geometry.i)
	CreateEllipseGeometry(ellipse.i, geometry.i)
	CreateGeometryGroup(fill_mode.l, geometries.i, geometry_count.l, group.i)
	CreateTransformedGeometry(src_geometry.i, transform.i, transformed_geometry.i)
	CreatePathGeometry(geometry.i)
	CreateStrokeStyle(desc.i, dashes.i, dash_count.l, stroke_style.i)
	CreateDrawingStateBlock(desc.i, text_rendering_params.i, state_block.i)
	CreateWicBitmapRenderTarget(target.i, desc.i, render_target.i)
	CreateHwndRenderTarget(desc.i, hwnd_rt_desc.i, render_target.i)
	CreateDxgiSurfaceRenderTarget(surface.i, desc.i, render_target.i)
	CreateDCRenderTarget(desc.i, render_target.i)
EndInterface 

;- D2D1_RECT_F
Structure D2D1_RECT_F Align #PB_Structure_AlignC
	left.f
	top.f
	right.f
	bottom.f
EndStructure

;- D2D1_SIZE_F
Structure D2D1_SIZE_F Align #PB_Structure_AlignC
	width.f
	height.f
EndStructure

;- D2D1_COLOR_F
Structure D2D1_COLOR_F Align #PB_Structure_AlignC
	r.f
	g.f
	b.f
	a.f
EndStructure

;- ID2D1Resource

DataSection
	IID_ID2D1Resource:
	Data.l $2CD90691
	Data.w $12E2, $11DC
	Data.b $9F, $ED, $0, $11, $43, $A0, $55, $F9
EndDataSection


Interface ID2D1Resource Extends IUnknown
	GetFactory(factory.i)
EndInterface 

;- ID2D1Geometry

DataSection
	IID_ID2D1Geometry:
	Data.l $2CD906A1
	Data.w $12E2, $11DC
	Data.b $9F, $ED, $0, $11, $43, $A0, $55, $F9
EndDataSection


Interface ID2D1Geometry Extends ID2D1Resource
	GetBounds(transform.i, bounds.i)
	GetWidenedBounds(stroke_width.f, stroke_style.i, transform.i, tolerance.f, bounds.i)
	StrokeContainsPoint(point.q, stroke_width.f, stroke_style.i, transform.i, tolerance.f, contains.i)
	FillContainsPoint(point.q, transform.i, tolerance.f, contains.i)
	CompareWithGeometry(geometry.i, transform.i, tolerance.f, relation.i)
	Simplify(option.l, transform.i, tolerance.f, sink.i)
	Tessellate(transform.i, tolerance.f, sink.i)
	CombineWithGeometry(geometry.i, combine_mode.l, transform.i, tolerance.f, sink.i)
	Outline(transform.i, tolerance.f, sink.i)
	ComputeArea(transform.i, tolerance.f, area.i)
	ComputeLength(transform.i, tolerance.f, length.i)
	ComputePointAtLength(length.f, transform.i, tolerance.f, point.i, tangent.i)
	Widen(stroke_width.f, stroke_style.i, transform.i, tolerance.f, sink.i)
EndInterface 

;- ID2D1RectangleGeometry

DataSection
	IID_ID2D1RectangleGeometry:
	Data.l $2CD906A2
	Data.w $12E2, $11DC
	Data.b $9F, $ED, $0, $11, $43, $A0, $55, $F9
EndDataSection


Interface ID2D1RectangleGeometry Extends ID2D1Geometry
	GetRect(rect.i)
EndInterface 

;- D2D1_MATRIX_3X2_F
Structure D2D1_MATRIX_3X2_F Align #PB_Structure_AlignC
	StructureUnion
		m11.f
		_11.f
	EndStructureUnion
	StructureUnion
		m12.f
		_12.f
	EndStructureUnion
	StructureUnion
		m21.f
		_21.f
	EndStructureUnion
	StructureUnion
		m22.f
		_22.f
	EndStructureUnion
	StructureUnion
		dx.f
		_31.f
	EndStructureUnion
	StructureUnion
		dy.f
		_32.f
	EndStructureUnion
EndStructure

;- ID2D1StrokeStyle

DataSection
	IID_ID2D1StrokeStyle:
	Data.l $2CD9069D
	Data.w $12E2, $11DC
	Data.b $9F, $ED, $0, $11, $43, $A0, $55, $F9
EndDataSection


Interface ID2D1StrokeStyle Extends ID2D1Resource
	GetStartCap()
	GetEndCap()
	GetDashCap()
	GetMiterLimit.f()
	GetLineJoin()
	GetDashOffset.f()
	GetDashStyle()
	GetDashesCount()
	GetDashes(dashes.i, count.l)
EndInterface 

;- Enum D2D1_CAP_STYLE
#D2D1_CAP_STYLE_FLAT = 0
#D2D1_CAP_STYLE_SQUARE = 1
#D2D1_CAP_STYLE_ROUND = 2
#D2D1_CAP_STYLE_TRIANGLE = 3
#D2D1_CAP_STYLE_FORCE_DWORD = -1

;- Enum D2D1_LINE_JOIN
#D2D1_LINE_JOIN_MITER = 0
#D2D1_LINE_JOIN_BEVEL = 1
#D2D1_LINE_JOIN_ROUND = 2
#D2D1_LINE_JOIN_MITER_OR_BEVEL = 3
#D2D1_LINE_JOIN_FORCE_DWORD = -1

;- Enum D2D1_DASH_STYLE
#D2D1_DASH_STYLE_SOLID = 0
#D2D1_DASH_STYLE_DASH = 1
#D2D1_DASH_STYLE_DOT = 2
#D2D1_DASH_STYLE_DASH_DOT = 3
#D2D1_DASH_STYLE_DASH_DOT_DOT = 4
#D2D1_DASH_STYLE_CUSTOM = 5
#D2D1_DASH_STYLE_FORCE_DWORD = -1

;- D2D1_POINT_2F
Structure D2D1_POINT_2F Align #PB_Structure_AlignC
	x.f
	y.f
EndStructure

;- Enum D2D1_GEOMETRY_RELATION
#D2D1_GEOMETRY_RELATION_UNKNOWN = 0
#D2D1_GEOMETRY_RELATION_DISJOINT = 1
#D2D1_GEOMETRY_RELATION_IS_CONTAINED = 2
#D2D1_GEOMETRY_RELATION_CONTAINS = 3
#D2D1_GEOMETRY_RELATION_OVERLAP = 4
#D2D1_GEOMETRY_RELATION_FORCE_DWORD = -1

;- Enum D2D1_GEOMETRY_SIMPLIFICATION_OPTION
#D2D1_GEOMETRY_SIMPLIFICATION_OPTION_CUBICS_AND_LINES = 0
#D2D1_GEOMETRY_SIMPLIFICATION_OPTION_LINES = 1
#D2D1_GEOMETRY_SIMPLIFICATION_OPTION_FORCE_DWORD = -1

;- ID2D1SimplifiedGeometrySink

DataSection
	IID_ID2D1SimplifiedGeometrySink:
	Data.l $2CD9069E
	Data.w $12E2, $11DC
	Data.b $9F, $ED, $0, $11, $43, $A0, $55, $F9
EndDataSection


Interface ID2D1SimplifiedGeometrySink Extends IUnknown
	SetFillMode(mode.l)
	SetSegmentFlags(vertexFlags.l)
	BeginFigure(startPoint.q, figureBegin.l)
	AddLines(points.i, count.l)
	AddBeziers(beziers.i, count.l)
	EndFigure(figureEnd.l)
	Close()
EndInterface 

;- Enum D2D1_FILL_MODE
#D2D1_FILL_MODE_ALTERNATE = 0
#D2D1_FILL_MODE_WINDING = 1
#D2D1_FILL_MODE_FORCE_DWORD = -1

;- Enum D2D1_PATH_SEGMENT
#D2D1_PATH_SEGMENT_NONE = 0
#D2D1_PATH_SEGMENT_FORCE_UNSTROKED = 1
#D2D1_PATH_SEGMENT_FORCE_ROUND_LINE_JOIN = 2
#D2D1_PATH_SEGMENT_FORCE_DWORD = -1

;- Enum D2D1_FIGURE_BEGIN
#D2D1_FIGURE_BEGIN_FILLED = 0
#D2D1_FIGURE_BEGIN_HOLLOW = 1
#D2D1_FIGURE_BEGIN_FORCE_DWORD = -1

;- D2D1_BEZIER_SEGMENT
Structure D2D1_BEZIER_SEGMENT Align #PB_Structure_AlignC
	point1.D2D1_POINT_2F
	point2.D2D1_POINT_2F
	point3.D2D1_POINT_2F
EndStructure

;- Enum D2D1_FIGURE_END
#D2D1_FIGURE_END_OPEN = 0
#D2D1_FIGURE_END_CLOSED = 1
#D2D1_FIGURE_END_FORCE_DWORD = -1

;- ID2D1TessellationSink

DataSection
	IID_ID2D1TessellationSink:
	Data.l $2CD906C1
	Data.w $12E2, $11DC
	Data.b $9F, $ED, $0, $11, $43, $A0, $55, $F9
EndDataSection


Interface ID2D1TessellationSink Extends IUnknown
	AddTriangles(triangles.i, count.l)
	Close()
EndInterface 

;- D2D1_TRIANGLE
Structure D2D1_TRIANGLE Align #PB_Structure_AlignC
	point1.D2D1_POINT_2F
	point2.D2D1_POINT_2F
	point3.D2D1_POINT_2F
EndStructure

;- Enum D2D1_COMBINE_MODE
#D2D1_COMBINE_MODE_UNION = 0
#D2D1_COMBINE_MODE_INTERSECT = 1
#D2D1_COMBINE_MODE_XOR = 2
#D2D1_COMBINE_MODE_EXCLUDE = 3
#D2D1_COMBINE_MODE_FORCE_DWORD = -1

;- D2D1_ROUNDED_RECT
Structure D2D1_ROUNDED_RECT Align #PB_Structure_AlignC
	rect.D2D1_RECT_F
	radiusX.f
	radiusY.f
EndStructure

;- ID2D1RoundedRectangleGeometry

DataSection
	IID_ID2D1RoundedRectangleGeometry:
	Data.l $2CD906A3
	Data.w $12E2, $11DC
	Data.b $9F, $ED, $0, $11, $43, $A0, $55, $F9
EndDataSection


Interface ID2D1RoundedRectangleGeometry Extends ID2D1Geometry
	GetRoundedRect(rect.i)
EndInterface 

;- D2D1_ELLIPSE
Structure D2D1_ELLIPSE Align #PB_Structure_AlignC
	point.D2D1_POINT_2F
	radiusX.f
	radiusY.f
EndStructure

;- ID2D1EllipseGeometry

DataSection
	IID_ID2D1EllipseGeometry:
	Data.l $2CD906A4
	Data.w $12E2, $11DC
	Data.b $9F, $ED, $0, $11, $43, $A0, $55, $F9
EndDataSection


Interface ID2D1EllipseGeometry Extends ID2D1Geometry
	GetEllipse(ellipse.i)
EndInterface 

;- ID2D1GeometryGroup

DataSection
	IID_ID2D1GeometryGroup:
	Data.l $2CD906A6
	Data.w $12E2, $11DC
	Data.b $9F, $ED, $0, $11, $43, $A0, $55, $F9
EndDataSection


Interface ID2D1GeometryGroup Extends ID2D1Geometry
	GetFillMode()
	GetSourceGeometryCount()
	GetSourceGeometries(geometry.i, geometry_count.l)
EndInterface 

;- ID2D1TransformedGeometry

DataSection
	IID_ID2D1TransformedGeometry:
	Data.l $2CD906BB
	Data.w $12E2, $11DC
	Data.b $9F, $ED, $0, $11, $43, $A0, $55, $F9
EndDataSection


Interface ID2D1TransformedGeometry Extends ID2D1Geometry
	GetSourceGeometry(geometry.i)
	GetTransform(transform.i)
EndInterface 

;- ID2D1PathGeometry

DataSection
	IID_ID2D1PathGeometry:
	Data.l $2CD906A5
	Data.w $12E2, $11DC
	Data.b $9F, $ED, $0, $11, $43, $A0, $55, $F9
EndDataSection


Interface ID2D1PathGeometry Extends ID2D1Geometry
	Open(sink.i)
	Stream(sink.i)
	GetSegmentCount(count.i)
	GetFigureCount(count.i)
EndInterface 

;- ID2D1GeometrySink

DataSection
	IID_ID2D1GeometrySink:
	Data.l $2CD9069F
	Data.w $12E2, $11DC
	Data.b $9F, $ED, $0, $11, $43, $A0, $55, $F9
EndDataSection


Interface ID2D1GeometrySink Extends ID2D1SimplifiedGeometrySink
	AddLine(point.q)
	AddBezier(bezier.i)
	AddQuadraticBezier(bezier.i)
	AddQuadraticBeziers(beziers.i, bezier_count.l)
	AddArc(arc.i)
EndInterface 

;- D2D1_QUADRATIC_BEZIER_SEGMENT
Structure D2D1_QUADRATIC_BEZIER_SEGMENT Align #PB_Structure_AlignC
	point1.D2D1_POINT_2F
	point2.D2D1_POINT_2F
EndStructure

;- D2D1_ARC_SEGMENT
Structure D2D1_ARC_SEGMENT Align #PB_Structure_AlignC
	point.D2D1_POINT_2F
	size.D2D1_SIZE_F
	rotationAngle.f
	sweepDirection.l
	arcSize.l
EndStructure

;- Enum D2D1_SWEEP_DIRECTION
#D2D1_SWEEP_DIRECTION_COUNTER_CLOCKWISE = 0
#D2D1_SWEEP_DIRECTION_CLOCKWISE = 1
#D2D1_SWEEP_DIRECTION_FORCE_DWORD = -1

;- Enum D2D1_ARC_SIZE
#D2D1_ARC_SIZE_SMALL = 0
#D2D1_ARC_SIZE_LARGE = 1
#D2D1_ARC_SIZE_FORCE_DWORD = -1

;- D2D1_STROKE_STYLE_PROPERTIES
Structure D2D1_STROKE_STYLE_PROPERTIES Align #PB_Structure_AlignC
	startCap.l
	endCap.l
	dashCap.l
	lineJoin.l
	miterLimit.f
	dashStyle.l
	dashOffset.f
EndStructure

;- D2D1_DRAWING_STATE_DESCRIPTION
Structure D2D1_DRAWING_STATE_DESCRIPTION Align #PB_Structure_AlignC
	antialiasMode.l
	textAntialiasMode.l
	tag1.q
	tag2.q
	transform.D2D1_MATRIX_3X2_F
EndStructure

;- Enum D2D1_ANTIALIAS_MODE
#D2D1_ANTIALIAS_MODE_PER_PRIMITIVE = 0
#D2D1_ANTIALIAS_MODE_ALIASED = 1
#D2D1_ANTIALIAS_MODE_FORCE_DWORD = -1

;- Enum D2D1_TEXT_ANTIALIAS_MODE
#D2D1_TEXT_ANTIALIAS_MODE_DEFAULT = 0
#D2D1_TEXT_ANTIALIAS_MODE_CLEARTYPE = 1
#D2D1_TEXT_ANTIALIAS_MODE_GRAYSCALE = 2
#D2D1_TEXT_ANTIALIAS_MODE_ALIASED = 3
#D2D1_TEXT_ANTIALIAS_MODE_FORCE_DWORD = -1

;- ID2D1DrawingStateBlock

DataSection
	IID_ID2D1DrawingStateBlock:
	Data.l $28506E39
	Data.w $EBF6, $46A1
	Data.b $BB, $47, $FD, $85, $56, $5A, $B9, $57
EndDataSection


Interface ID2D1DrawingStateBlock Extends ID2D1Resource
	GetDescription(desc.i)
	SetDescription(desc.i)
	SetTextRenderingParams(text_rendering_params.i)
	GetTextRenderingParams(text_rendering_params.i)
EndInterface 

;- D2D1_PIXEL_FORMAT
Structure D2D1_PIXEL_FORMAT Align #PB_Structure_AlignC
	format.l
	alphaMode.l
EndStructure

;- D2D1_RENDER_TARGET_PROPERTIES
Structure D2D1_RENDER_TARGET_PROPERTIES Align #PB_Structure_AlignC
	type.l
	pixelFormat.D2D1_PIXEL_FORMAT
	dpiX.f
	dpiY.f
	usage.l
	minLevel.l
EndStructure

;- Enum D2D1_RENDER_TARGET_TYPE
#D2D1_RENDER_TARGET_TYPE_DEFAULT = 0
#D2D1_RENDER_TARGET_TYPE_SOFTWARE = 1
#D2D1_RENDER_TARGET_TYPE_HARDWARE = 2
#D2D1_RENDER_TARGET_TYPE_FORCE_DWORD = -1

;- Enum DXGI_FORMAT
#DXGI_FORMAT_UNKNOWN = 0
#DXGI_FORMAT_R32G32B32A32_TYPELESS = 1
#DXGI_FORMAT_R32G32B32A32_FLOAT = 2
#DXGI_FORMAT_R32G32B32A32_UINT = 3
#DXGI_FORMAT_R32G32B32A32_SINT = 4
#DXGI_FORMAT_R32G32B32_TYPELESS = 5
#DXGI_FORMAT_R32G32B32_FLOAT = 6
#DXGI_FORMAT_R32G32B32_UINT = 7
#DXGI_FORMAT_R32G32B32_SINT = 8
#DXGI_FORMAT_R16G16B16A16_TYPELESS = 9
#DXGI_FORMAT_R16G16B16A16_FLOAT = 10
#DXGI_FORMAT_R16G16B16A16_UNORM = 11
#DXGI_FORMAT_R16G16B16A16_UINT = 12
#DXGI_FORMAT_R16G16B16A16_SNORM = 13
#DXGI_FORMAT_R16G16B16A16_SINT = 14
#DXGI_FORMAT_R32G32_TYPELESS = 15
#DXGI_FORMAT_R32G32_FLOAT = 16
#DXGI_FORMAT_R32G32_UINT = 17
#DXGI_FORMAT_R32G32_SINT = 18
#DXGI_FORMAT_R32G8X24_TYPELESS = 19
#DXGI_FORMAT_D32_FLOAT_S8X24_UINT = 20
#DXGI_FORMAT_R32_FLOAT_X8X24_TYPELESS = 21
#DXGI_FORMAT_X32_TYPELESS_G8X24_UINT = 22
#DXGI_FORMAT_R10G10B10A2_TYPELESS = 23
#DXGI_FORMAT_R10G10B10A2_UNORM = 24
#DXGI_FORMAT_R10G10B10A2_UINT = 25
#DXGI_FORMAT_R11G11B10_FLOAT = 26
#DXGI_FORMAT_R8G8B8A8_TYPELESS = 27
#DXGI_FORMAT_R8G8B8A8_UNORM = 28
#DXGI_FORMAT_R8G8B8A8_UNORM_SRGB = 29
#DXGI_FORMAT_R8G8B8A8_UINT = 30
#DXGI_FORMAT_R8G8B8A8_SNORM = 31
#DXGI_FORMAT_R8G8B8A8_SINT = 32
#DXGI_FORMAT_R16G16_TYPELESS = 33
#DXGI_FORMAT_R16G16_FLOAT = 34
#DXGI_FORMAT_R16G16_UNORM = 35
#DXGI_FORMAT_R16G16_UINT = 36
#DXGI_FORMAT_R16G16_SNORM = 37
#DXGI_FORMAT_R16G16_SINT = 38
#DXGI_FORMAT_R32_TYPELESS = 39
#DXGI_FORMAT_D32_FLOAT = 40
#DXGI_FORMAT_R32_FLOAT = 41
#DXGI_FORMAT_R32_UINT = 42
#DXGI_FORMAT_R32_SINT = 43
#DXGI_FORMAT_R24G8_TYPELESS = 44
#DXGI_FORMAT_D24_UNORM_S8_UINT = 45
#DXGI_FORMAT_R24_UNORM_X8_TYPELESS = 46
#DXGI_FORMAT_X24_TYPELESS_G8_UINT = 47
#DXGI_FORMAT_R8G8_TYPELESS = 48
#DXGI_FORMAT_R8G8_UNORM = 49
#DXGI_FORMAT_R8G8_UINT = 50
#DXGI_FORMAT_R8G8_SNORM = 51
#DXGI_FORMAT_R8G8_SINT = 52
#DXGI_FORMAT_R16_TYPELESS = 53
#DXGI_FORMAT_R16_FLOAT = 54
#DXGI_FORMAT_D16_UNORM = 55
#DXGI_FORMAT_R16_UNORM = 56
#DXGI_FORMAT_R16_UINT = 57
#DXGI_FORMAT_R16_SNORM = 58
#DXGI_FORMAT_R16_SINT = 59
#DXGI_FORMAT_R8_TYPELESS = 60
#DXGI_FORMAT_R8_UNORM = 61
#DXGI_FORMAT_R8_UINT = 62
#DXGI_FORMAT_R8_SNORM = 63
#DXGI_FORMAT_R8_SINT = 64
#DXGI_FORMAT_A8_UNORM = 65
#DXGI_FORMAT_R1_UNORM = 66
#DXGI_FORMAT_R9G9B9E5_SHAREDEXP = 67
#DXGI_FORMAT_R8G8_B8G8_UNORM = 68
#DXGI_FORMAT_G8R8_G8B8_UNORM = 69
#DXGI_FORMAT_BC1_TYPELESS = 70
#DXGI_FORMAT_BC1_UNORM = 71
#DXGI_FORMAT_BC1_UNORM_SRGB = 72
#DXGI_FORMAT_BC2_TYPELESS = 73
#DXGI_FORMAT_BC2_UNORM = 74
#DXGI_FORMAT_BC2_UNORM_SRGB = 75
#DXGI_FORMAT_BC3_TYPELESS = 76
#DXGI_FORMAT_BC3_UNORM = 77
#DXGI_FORMAT_BC3_UNORM_SRGB = 78
#DXGI_FORMAT_BC4_TYPELESS = 79
#DXGI_FORMAT_BC4_UNORM = 80
#DXGI_FORMAT_BC4_SNORM = 81
#DXGI_FORMAT_BC5_TYPELESS = 82
#DXGI_FORMAT_BC5_UNORM = 83
#DXGI_FORMAT_BC5_SNORM = 84
#DXGI_FORMAT_B5G6R5_UNORM = 85
#DXGI_FORMAT_B5G5R5A1_UNORM = 86
#DXGI_FORMAT_B8G8R8A8_UNORM = 87
#DXGI_FORMAT_B8G8R8X8_UNORM = 88
#DXGI_FORMAT_R10G10B10_XR_BIAS_A2_UNORM = 89
#DXGI_FORMAT_B8G8R8A8_TYPELESS = 90
#DXGI_FORMAT_B8G8R8A8_UNORM_SRGB = 91
#DXGI_FORMAT_B8G8R8X8_TYPELESS = 92
#DXGI_FORMAT_B8G8R8X8_UNORM_SRGB = 93
#DXGI_FORMAT_BC6H_TYPELESS = 94
#DXGI_FORMAT_BC6H_UF16 = 95
#DXGI_FORMAT_BC6H_SF16 = 96
#DXGI_FORMAT_BC7_TYPELESS = 97
#DXGI_FORMAT_BC7_UNORM = 98
#DXGI_FORMAT_BC7_UNORM_SRGB = 99
#DXGI_FORMAT_AYUV = 100
#DXGI_FORMAT_Y410 = 101
#DXGI_FORMAT_Y416 = 102
#DXGI_FORMAT_NV12 = 103
#DXGI_FORMAT_P010 = 104
#DXGI_FORMAT_P016 = 105
#DXGI_FORMAT_420_OPAQUE = 106
#DXGI_FORMAT_YUY2 = 107
#DXGI_FORMAT_Y210 = 108
#DXGI_FORMAT_Y216 = 109
#DXGI_FORMAT_NV11 = 110
#DXGI_FORMAT_AI44 = 111
#DXGI_FORMAT_IA44 = 112
#DXGI_FORMAT_P8 = 113
#DXGI_FORMAT_A8P8 = 114
#DXGI_FORMAT_B4G4R4A4_UNORM = 115
#DXGI_FORMAT_P208 = 130
#DXGI_FORMAT_V208 = 131
#DXGI_FORMAT_V408 = 132
#DXGI_FORMAT_FORCE_UINT = -1

;- Enum D2D1_ALPHA_MODE
#D2D1_ALPHA_MODE_UNKNOWN = 0
#D2D1_ALPHA_MODE_PREMULTIPLIED = 1
#D2D1_ALPHA_MODE_STRAIGHT = 2
#D2D1_ALPHA_MODE_IGNORE = 3
#D2D1_ALPHA_MODE_FORCE_DWORD = -1

;- Enum D2D1_RENDER_TARGET_USAGE
#D2D1_RENDER_TARGET_USAGE_NONE = 0
#D2D1_RENDER_TARGET_USAGE_FORCE_BITMAP_REMOTING = 1
#D2D1_RENDER_TARGET_USAGE_GDI_COMPATIBLE = 2
#D2D1_RENDER_TARGET_USAGE_FORCE_DWORD = -1

;- Enum D2D1_FEATURE_LEVEL
#D2D1_FEATURE_LEVEL_DEFAULT = 0
#D2D1_FEATURE_LEVEL_FORCE_DWORD = -1

;- ID2D1RenderTarget

DataSection
	IID_ID2D1RenderTarget:
	Data.l $2CD90694
	Data.w $12E2, $11DC
	Data.b $9F, $ED, $0, $11, $43, $A0, $55, $F9
EndDataSection


Interface ID2D1RenderTarget Extends ID2D1Resource
	CreateBitmap(size.q, src_data.i, pitch.l, desc.i, bitmap.i)
	CreateBitmapFromWicBitmap(bitmap_source.i, desc.i, bitmap.i)
	CreateSharedBitmap(iid.i, Data.i, desc.i, bitmap.i)
	CreateBitmapBrush(bitmap.i, bitmap_brush_desc.i, brush_desc.i, brush.i)
	CreateSolidColorBrush(color.i, desc.i, brush.i)
	CreateGradientStopCollection(stops.i, stop_count.l, gamma.l, extend_mode.l, gradient.i)
	CreateLinearGradientBrush(gradient_brush_desc.i, brush_desc.i, gradient.i, brush.i)
	CreateRadialGradientBrush(gradient_brush_desc.i, brush_desc.i, gradient.i, brush.i)
	CreateCompatibleRenderTarget(size.i, pixel_size.i, format.i, options.l, render_target.i)
	CreateLayer(size.i, layer.i)
	CreateMesh(mesh.i)
	DrawLine(p0.q, p1.q, brush.i, stroke_width.f, stroke_style.i)
	DrawRectangle(rect.i, brush.i, stroke_width.f, stroke_style.i)
	FillRectangle(rect.i, brush.i)
	DrawRoundedRectangle(rect.i, brush.i, stroke_width.f, stroke_style.i)
	FillRoundedRectangle(rect.i, brush.i)
	DrawEllipse(ellipse.i, brush.i, stroke_width.f, stroke_style.i)
	FillEllipse(ellipse.i, brush.i)
	DrawGeometry(geometry.i, brush.i, stroke_width.f, stroke_style.i)
	FillGeometry(geometry.i, brush.i, opacity_brush.i)
	FillMesh(mesh.i, brush.i)
	FillOpacityMask(mask.i, brush.i, content.l, dst_rect.i, src_rect.i)
	DrawBitmap(bitmap.i, dst_rect.i, opacity.f, interpolation_mode.l, src_rect.i)
	DrawText(string.s, string_len.l, text_format.i, layout_rect.i, brush.i, options.l, measuring_mode.l)
	DrawTextLayout(origin.q, layout.i, brush.i, options.l)
	DrawGlyphRun(baseline_origin.q, glyph_run.i, brush.i, measuring_mode.l)
	SetTransform(transform.i)
	GetTransform(transform.i)
	SetAntialiasMode(antialias_mode.l)
	GetAntialiasMode()
	SetTextAntialiasMode(antialias_mode.l)
	GetTextAntialiasMode()
	SetTextRenderingParams(text_rendering_params.i)
	GetTextRenderingParams(text_rendering_params.i)
	SetTags(tag1.q, tag2.q)
	GetTags(tag1.i, tag2.i)
	PushLayer(layer_parameters.i, layer.i)
	PopLayer()
	Flush(tag1.i, tag2.i)
	SaveDrawingState(state_block.i)
	RestoreDrawingState(state_block.i)
	PushAxisAlignedClip(clip_rect.i, antialias_mode.l)
	PopAxisAlignedClip()
	Clear(color.i)
	BeginDraw()
	EndDraw(tag1.i, tag2.i)
	GetPixelFormat(format.i)
	SetDpi(dpi_x.f, dpi_y.f)
	GetDpi(dpi_x.i, dpi_y.i)
	GetSize(sz.i)
	GetPixelSize(sz.i)
	GetMaximumBitmapSize()
	IsSupported(desc.i)
EndInterface 

;- D2D1_SIZE_U
Structure D2D1_SIZE_U Align #PB_Structure_AlignC
	width.l
	height.l
EndStructure

;- D2D1_BITMAP_PROPERTIES
Structure D2D1_BITMAP_PROPERTIES Align #PB_Structure_AlignC
	pixelFormat.D2D1_PIXEL_FORMAT
	dpiX.f
	dpiY.f
EndStructure

;- ID2D1Image

DataSection
	IID_ID2D1Image:
	Data.l $65019F75
	Data.w $8DA2, $497C
	Data.b $B3, $2C, $DF, $A3, $4E, $48, $ED, $E6
EndDataSection


Interface ID2D1Image Extends ID2D1Resource
EndInterface 

;- ID2D1Bitmap

DataSection
	IID_ID2D1Bitmap:
	Data.l $A2296057
	Data.w $EA42, $4099
	Data.b $98, $3B, $53, $9F, $B6, $50, $54, $26
EndDataSection


Interface ID2D1Bitmap Extends ID2D1Image
	GetSize(sz.i)
	GetPixelSize(sz.i)
	GetPixelFormat(format.i)
	GetDpi(dpi_x.i, dpi_y.i)
	CopyFromBitmap(dst_point.i, bitmap.i, src_rect.i)
	CopyFromRenderTarget(dst_point.i, render_target.i, src_rect.i)
	CopyFromMemory(dst_rect.i, src_data.i, pitch.l)
EndInterface 


;- D2D1_POINT_2U
Structure D2D1_POINT_2U Align #PB_Structure_AlignC
	x.l
	y.l
EndStructure

;- D2D1_RECT_U
Structure D2D1_RECT_U Align #PB_Structure_AlignC
	left.l
	top.l
	right.l
	bottom.l
EndStructure

;- D2D1_BITMAP_BRUSH_PROPERTIES
Structure D2D1_BITMAP_BRUSH_PROPERTIES Align #PB_Structure_AlignC
	extendModeX.l
	extendModeY.l
	interpolationMode.l
EndStructure

;- Enum D2D1_EXTEND_MODE
#D2D1_EXTEND_MODE_CLAMP = 0
#D2D1_EXTEND_MODE_WRAP = 1
#D2D1_EXTEND_MODE_MIRROR = 2
#D2D1_EXTEND_MODE_FORCE_DWORD = -1

;- Enum D2D1_BITMAP_INTERPOLATION_MODE
#D2D1_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR = 0
#D2D1_BITMAP_INTERPOLATION_MODE_LINEAR = 1
#D2D1_BITMAP_INTERPOLATION_MODE_FORCE_DWORD = -1

;- D2D1_BRUSH_PROPERTIES
Structure D2D1_BRUSH_PROPERTIES Align #PB_Structure_AlignC
	opacity.f
	transform.D2D1_MATRIX_3X2_F
EndStructure

;- ID2D1Brush

DataSection
	IID_ID2D1Brush:
	Data.l $2CD906A8
	Data.w $12E2, $11DC
	Data.b $9F, $ED, $0, $11, $43, $A0, $55, $F9
EndDataSection


Interface ID2D1Brush Extends ID2D1Resource
	SetOpacity(opacity.f)
	SetTransform(transform.i)
	GetOpacity.f()
	GetTransform(transform.i)
EndInterface 

;- ID2D1BitmapBrush

DataSection
	IID_ID2D1BitmapBrush:
	Data.l $2CD906AA
	Data.w $12E2, $11DC
	Data.b $9F, $ED, $0, $11, $43, $A0, $55, $F9
EndDataSection


Interface ID2D1BitmapBrush Extends ID2D1Brush
	SetExtendModeX(mode.l)
	SetExtendModeY(mode.l)
	SetInterpolationMode(mode.l)
	SetBitmap(bitmap.i)
	GetExtendModeX()
	GetExtendModeY()
	GetInterpolationMode()
	GetBitmap(bitmap.i)
EndInterface 


;- D3DCOLORVALUE
Structure D3DCOLORVALUE Align #PB_Structure_AlignC
	r.f
	g.f
	b.f
	a.f
EndStructure

;- ID2D1SolidColorBrush

DataSection
	IID_ID2D1SolidColorBrush:
	Data.l $2CD906A9
	Data.w $12E2, $11DC
	Data.b $9F, $ED, $0, $11, $43, $A0, $55, $F9
EndDataSection


Interface ID2D1SolidColorBrush Extends ID2D1Brush
	SetColor(color.i)
	GetColor(color.i)
EndInterface 

;- D2D1_GRADIENT_STOP
Structure D2D1_GRADIENT_STOP Align #PB_Structure_AlignC
	position.f
	color.D3DCOLORVALUE
EndStructure

;- Enum D2D1_GAMMA
#D2D1_GAMMA_2_2 = 0
#D2D1_GAMMA_1_0 = 1
#D2D1_GAMMA_FORCE_DWORD = -1

;- ID2D1GradientStopCollection

DataSection
	IID_ID2D1GradientStopCollection:
	Data.l $2CD906A7
	Data.w $12E2, $11DC
	Data.b $9F, $ED, $0, $11, $43, $A0, $55, $F9
EndDataSection


Interface ID2D1GradientStopCollection Extends ID2D1Resource
	GetGradientStopCount()
	GetGradientStops(stops.i, stop_count.l)
	GetColorInterpolationGamma()
	GetExtendMode()
EndInterface 

;- D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES
Structure D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES Align #PB_Structure_AlignC
	startPoint.D2D1_POINT_2F
	endPoint.D2D1_POINT_2F
EndStructure

;- ID2D1LinearGradientBrush

DataSection
	IID_ID2D1LinearGradientBrush:
	Data.l $2CD906AB
	Data.w $12E2, $11DC
	Data.b $9F, $ED, $0, $11, $43, $A0, $55, $F9
EndDataSection


Interface ID2D1LinearGradientBrush Extends ID2D1Brush
	SetStartPoint(start_point.q)
	SetEndPoint(end_point.q)
	GetStartPoint(pt.i)
	GetEndPoint(pt.i)
	GetGradientStopCollection(gradient.i)
EndInterface 

;- D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES
Structure D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES Align #PB_Structure_AlignC
	center.D2D1_POINT_2F
	gradientOriginOffset.D2D1_POINT_2F
	radiusX.f
	radiusY.f
EndStructure

;- ID2D1RadialGradientBrush

DataSection
	IID_ID2D1RadialGradientBrush:
	Data.l $2CD906AC
	Data.w $12E2, $11DC
	Data.b $9F, $ED, $0, $11, $43, $A0, $55, $F9
EndDataSection


Interface ID2D1RadialGradientBrush Extends ID2D1Brush
	SetCenter(center.q)
	SetGradientOriginOffset(offset.q)
	SetRadiusX(radius.f)
	SetRadiusY(radius.f)
	GetCenter(pt.i)
	GetGradientOriginOffset(pt.i)
	GetRadiusX.f()
	GetRadiusY.f()
	GetGradientStopCollection(gradient.i)
EndInterface 

;- Enum D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS
#D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS_NONE = 0
#D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS_GDI_COMPATIBLE = 1
#D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS_FORCE_DWORD = -1

;- ID2D1BitmapRenderTarget

DataSection
	IID_ID2D1BitmapRenderTarget:
	Data.l $2CD90695
	Data.w $12E2, $11DC
	Data.b $9F, $ED, $0, $11, $43, $A0, $55, $F9
EndDataSection


Interface ID2D1BitmapRenderTarget Extends ID2D1RenderTarget
	GetBitmap(bitmap.i)
EndInterface 

;- ID2D1Layer

DataSection
	IID_ID2D1Layer:
	Data.l $2CD9069B
	Data.w $12E2, $11DC
	Data.b $9F, $ED, $0, $11, $43, $A0, $55, $F9
EndDataSection


Interface ID2D1Layer Extends ID2D1Resource
	GetSize(sz.i)
EndInterface 

;- ID2D1Mesh

DataSection
	IID_ID2D1Mesh:
	Data.l $2CD906C2
	Data.w $12E2, $11DC
	Data.b $9F, $ED, $0, $11, $43, $A0, $55, $F9
EndDataSection


Interface ID2D1Mesh Extends ID2D1Resource
	Open(sink.i)
EndInterface 

;- Enum D2D1_OPACITY_MASK_CONTENT
#D2D1_OPACITY_MASK_CONTENT_GRAPHICS = 0
#D2D1_OPACITY_MASK_CONTENT_TEXT_NATURAL = 1
#D2D1_OPACITY_MASK_CONTENT_TEXT_GDI_COMPATIBLE = 2
#D2D1_OPACITY_MASK_CONTENT_FORCE_DWORD = -1

;- Enum D2D1_DRAW_TEXT_OPTIONS
#D2D1_DRAW_TEXT_OPTIONS_NO_SNAP = 1
#D2D1_DRAW_TEXT_OPTIONS_CLIP = 2
#D2D1_DRAW_TEXT_OPTIONS_ENABLE_COLOR_FONT = 4
#D2D1_DRAW_TEXT_OPTIONS_DISABLE_COLOR_BITMAP_SNAPPING = 8
#D2D1_DRAW_TEXT_OPTIONS_NONE = 0
#D2D1_DRAW_TEXT_OPTIONS_FORCE_DWORD = -1

;- Enum DWRITE_MEASURING_MODE
#DWRITE_MEASURING_MODE_NATURAL = 0
#DWRITE_MEASURING_MODE_GDI_CLASSIC = 1
#DWRITE_MEASURING_MODE_GDI_NATURAL = 2

;- D2D1_LAYER_PARAMETERS
Structure D2D1_LAYER_PARAMETERS Align #PB_Structure_AlignC
	contentBounds.D2D1_RECT_F
	geometricMask.i
	maskAntialiasMode.l
	maskTransform.D2D1_MATRIX_3X2_F
	opacity.f
	opacityBrush.i
	layerOptions.l
EndStructure

;- Enum D2D1_LAYER_OPTIONS
#D2D1_LAYER_OPTIONS_NONE = 0
#D2D1_LAYER_OPTIONS_INITIALIZE_FOR_CLEARTYPE = 1
#D2D1_LAYER_OPTIONS_FORCE_DWORD = -1

;- D2D1_HWND_RENDER_TARGET_PROPERTIES
Structure D2D1_HWND_RENDER_TARGET_PROPERTIES Align #PB_Structure_AlignC
	hwnd.i
	pixelSize.D2D1_SIZE_U
	presentOptions.l
EndStructure

;- Enum D2D1_PRESENT_OPTIONS
#D2D1_PRESENT_OPTIONS_NONE = 0
#D2D1_PRESENT_OPTIONS_RETAIN_CONTENTS = 1
#D2D1_PRESENT_OPTIONS_IMMEDIATELY = 2
#D2D1_PRESENT_OPTIONS_FORCE_DWORD = -1

;- ID2D1HwndRenderTarget

DataSection
	IID_ID2D1HwndRenderTarget:
	Data.l $2CD90698
	Data.w $12E2, $11DC
	Data.b $9F, $ED, $0, $11, $43, $A0, $55, $F9
EndDataSection


Interface ID2D1HwndRenderTarget Extends ID2D1RenderTarget
	CheckWindowState()
	Resize(size.i)
	GetHwnd()
EndInterface 

;- Enum D2D1_WINDOW_STATE
#D2D1_WINDOW_STATE_NONE = 0
#D2D1_WINDOW_STATE_OCCLUDED = 1
#D2D1_WINDOW_STATE_FORCE_DWORD = -1

;- ID2D1DCRenderTarget

DataSection
	IID_ID2D1DCRenderTarget:
	Data.l $1C51BC64
	Data.w $DE61, $46FD
	Data.b $98, $99, $63, $A5, $D8, $F0, $39, $50
EndDataSection


Interface ID2D1DCRenderTarget Extends ID2D1RenderTarget
	BindDC(dc.i, rect.i)
EndInterface 

;- Enum D2D1_DEBUG_LEVEL
#D2D1_DEBUG_LEVEL_NONE = 0
#D2D1_DEBUG_LEVEL_ERROR = 1
#D2D1_DEBUG_LEVEL_WARNING = 2
#D2D1_DEBUG_LEVEL_INFORMATION = 3
#D2D1_DEBUG_LEVEL_FORCE_DWORD = -1

;- Enum D2D1_FACTORY_TYPE
#D2D1_FACTORY_TYPE_SINGLE_THREADED = 0
#D2D1_FACTORY_TYPE_MULTI_THREADED = 1
#D2D1_FACTORY_TYPE_FORCE_DWORD = 268435455

;- Enum D2D1_DC_INITIALIZE_MODE
#D2D1_DC_INITIALIZE_MODE_COPY = 0
#D2D1_DC_INITIALIZE_MODE_CLEAR = 1
#D2D1_DC_INITIALIZE_MODE_FORCE_DWORD = -1

;- D2D1_FACTORY_OPTIONS
Structure D2D1_FACTORY_OPTIONS Align #PB_Structure_AlignC
	DebugLevel.l
EndStructure

;- ID2D1GdiInteropRenderTarget

DataSection
	IID_ID2D1GdiInteropRenderTarget:
	Data.l $E0DB51C3
	Data.w $6F77, $4BAE
	Data.b $B3, $D5, $E4, $75, $9, $B3, $58, $38
EndDataSection


Interface ID2D1GdiInteropRenderTarget Extends IUnknown
	GetDC(mode.l, dc.i)
	ReleaseDC(update.i)
EndInterface 

;- IMPORT
Import "d2d1.lib"
	D2D1ComputeMaximumScaleFactor_.f(*matrix.D2D1_MATRIX_3X2_F) As "D2D1ComputeMaximumScaleFactor"
	D2D1ConvertColorSpace_(sourceColorSpace.l, destinationColorSpace.l, *color.D2D1_COLOR_F) As "D2D1ConvertColorSpace"
	D2D1CreateDevice_(dxgiDevice.i, creationProperties.i, d2dDevice.i) As "D2D1CreateDevice" 
	D2D1CreateDeviceContext_(dxgiSurface.i, creationProperties.i, d2dDeviceContext.i) As "D2D1CreateDeviceContext"
	D2D1CreateFactory_(factory_type.l, *iid.IID, *factory_options.D2D1_FACTORY_OPTIONS, factory.i) As "D2D1CreateFactory"
	D2D1GetGradientMeshInteriorPointsFromCoonsPatch_(pPoint0.i, pPoint1.i, pPoint2.i, pPoint3.i, pPoint4.i, pPoint5.i, pPoint6.i, pPoint7.i, pPoint8.i, pPoint9.i, pPoint10.i, pPoint11.i, pTensorPoint11.i, pTensorPoint12.i, pTensorPoint21.i, pTensorPoint22.i) As "D2D1GetGradientMeshInteriorPointsFromCoonsPatch"
	D2D1InvertMatrix_(*matrix.D2D1_MATRIX_3X2_F) As "D2D1InvertMatrix"
	D2D1IsMatrixInvertible_(*matrix.D2D1_MATRIX_3X2_F) As "D2D1IsMatrixInvertible"
	D2D1MakeRotateMatrix_(angle.f, *center.D2D1_POINT_2F, *matrix.D2D1_MATRIX_3X2_F) As "D2D1MakeRotateMatrix"
	D2D1MakeSkewMatrix_(angleX.f, angleY.f, *center.D2D1_POINT_2F, *matrix.D2D1_MATRIX_3X2_F) As "D2D1MakeSkewMatrix"
	D2D1SinCos_(angle.f, s.i, c.i) As "D2D1SinCos"
	D2D1Tan_.f(angle.f) As "D2D1Tan"
	D2D1Vec3Length_.f(x.f, y.f, z.f) As "D2D1Vec3Length"
EndImport
