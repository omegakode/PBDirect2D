;Fixed ID2D1SvgElement 
;https://learn.microsoft.com/en-us/answers/questions/61930/wrong-method-sequence-in-id2d1svgelement-api


; <summary>
; Specifies the paint type For an SVG fill Or stroke.
; </summary>
;- Enum D2D1_SVG_PAINT_TYPE
    
    ; <summary>
    ; The fill Or stroke is Not rendered.
    ; </summary>
#D2D1_SVG_PAINT_TYPE_NONE = 0
    
    ; <summary>
    ; A solid color is rendered.
    ; </summary>
#D2D1_SVG_PAINT_TYPE_COLOR = 1
    
    ; <summary>
    ; The current color is rendered.
    ; </summary>
#D2D1_SVG_PAINT_TYPE_CURRENT_COLOR = 2
    
    ; <summary>
    ; A paint server defined by another element in the SVG document is used.
    ; </summary>
#D2D1_SVG_PAINT_TYPE_URI = 3
    
    ; <summary>
    ; A paint server defined by another element in the SVG document is used. If the
    ; paint server reference is invalid fall back to D2D1_SVG_PAINT_TYPE_NONE.
    ; </summary>
#D2D1_SVG_PAINT_TYPE_URI_NONE = 4
    
    ; <summary>
    ; A paint server defined by another element in the SVG document is used. If the
    ; paint server reference is invalid fall back to D2D1_SVG_PAINT_TYPE_COLOR.
    ; </summary>
#D2D1_SVG_PAINT_TYPE_URI_COLOR = 5
    
    ; <summary>
    ; A paint server defined by another element in the SVG document is used. If the
    ; paint server reference is invalid fall back to
    ; D2D1_SVG_PAINT_TYPE_CURRENT_COLOR.
    ; </summary>
#D2D1_SVG_PAINT_TYPE_URI_CURRENT_COLOR = 6
#D2D1_SVG_PAINT_TYPE_FORCE_DWORD = $ffffffff



; <summary>
; Specifies the units for an SVG length.
; </summary>
;- Enum D2D1_SVG_LENGTH_UNITS
    
    ; <summary>
    ; The length is unitless.
    ; </summary>
#D2D1_SVG_LENGTH_UNITS_NUMBER = 0
    
    ; <summary>
    ; The length is a percentage value.
    ; </summary>
#D2D1_SVG_LENGTH_UNITS_PERCENTAGE = 1
#D2D1_SVG_LENGTH_UNITS_FORCE_DWORD = $ffffffff


; <summary>
; Specifies a value for the SVG display property.
; </summary>
;- Enum D2D1_SVG_DISPLAY
    
    ; <summary>
    ; The element uses the default display behavior.
    ; </summary>
#D2D1_SVG_DISPLAY_INLINE = 0
    
    ; <summary>
    ; The element and all children are not rendered directly.
    ; </summary>
#D2D1_SVG_DISPLAY_NONE = 1
#D2D1_SVG_DISPLAY_FORCE_DWORD = $ffffffff


; <summary>
; Specifies a value for the SVG visibility property.
; </summary>
;- Enum D2D1_SVG_VISIBILITY
    
    ; <summary>
    ; The element is visible.
    ; </summary>
#D2D1_SVG_VISIBILITY_VISIBLE = 0
    
    ; <summary>
    ; The element is invisible.
    ; </summary>
#D2D1_SVG_VISIBILITY_HIDDEN = 1
#D2D1_SVG_VISIBILITY_FORCE_DWORD = $ffffffff


; <summary>
; Specifies a value for the SVG overflow property.
; </summary>
;- Enum D2D1_SVG_OVERFLOW
    
    ; <summary>
    ; The element is not clipped to its viewport.
    ; </summary>
#D2D1_SVG_OVERFLOW_VISIBLE = 0
    
    ; <summary>
    ; The element is clipped to its viewport.
    ; </summary>
#D2D1_SVG_OVERFLOW_HIDDEN = 1
#D2D1_SVG_OVERFLOW_FORCE_DWORD = $ffffffff


; <summary>
; Specifies a value for the SVG stroke-linecap property.
; </summary>
;- Enum D2D1_SVG_LINE_CAP
    
    ; <summary>
    ; The property is set to SVG's 'butt' value.
    ; </summary>
#D2D1_SVG_LINE_CAP_BUTT = #D2D1_CAP_STYLE_FLAT
    
    ; <summary>
    ; The property is set to SVG's 'square' value.
    ; </summary>
#D2D1_SVG_LINE_CAP_SQUARE = #D2D1_CAP_STYLE_SQUARE
    
    ; <summary>
    ; The property is set to SVG's 'round' value.
    ; </summary>
#D2D1_SVG_LINE_CAP_ROUND = #D2D1_CAP_STYLE_ROUND
#D2D1_SVG_LINE_CAP_FORCE_DWORD = $ffffffff


; <summary>
; Specifies a value for the SVG stroke-linejoin property.
; </summary>
;- Enum D2D1_SVG_LINE_JOIN

    ; <summary>
    ; The property is set to SVG's 'bevel' value.
    ; </summary>
#D2D1_SVG_LINE_JOIN_BEVEL = #D2D1_LINE_JOIN_BEVEL
    
    ; <summary>
    ; The property is set to SVG's 'miter' value. Note that this is equivalent to
    ; D2D1_LINE_JOIN_MITER_OR_BEVEL not D2D1_LINE_JOIN_MITER.
    ; </summary>
#D2D1_SVG_LINE_JOIN_MITER = #D2D1_LINE_JOIN_MITER_OR_BEVEL
    
    ; <summary>
    ; \ The property is set to SVG's 'round' value.
    ; </summary>
#D2D1_SVG_LINE_JOIN_ROUND = #D2D1_LINE_JOIN_ROUND
#D2D1_SVG_LINE_JOIN_FORCE_DWORD = $ffffffff


; <summary>
; The alignment portion of the SVG preserveAspectRatio attribute.
; </summary>
;- Enum D2D1_SVG_ASPECT_ALIGN

    
    ; <summary>
    ; The alignment is set to SVG's 'none' value.
    ; </summary>
#D2D1_SVG_ASPECT_ALIGN_NONE = 0
    
    ; <summary>
    ; The alignment is set to SVG's 'xMinYMin' value.
    ; </summary>
#D2D1_SVG_ASPECT_ALIGN_X_MIN_Y_MIN = 1
    
    ; <summary>
    ; The alignment is set to SVG's 'xMidYMin' value.
    ; </summary>
#D2D1_SVG_ASPECT_ALIGN_X_MID_Y_MIN = 2
    
    ; <summary>
    ; The alignment is set to SVG's 'xMaxYMin' value.
    ; </summary>
#D2D1_SVG_ASPECT_ALIGN_X_MAX_Y_MIN = 3
    
    ; <summary>
    ; The alignment is set to SVG's 'xMinYMid' value.
    ; </summary>
#D2D1_SVG_ASPECT_ALIGN_X_MIN_Y_MID = 4
    
    ; <summary>
    ; The alignment is set to SVG's 'xMidYMid' value.
    ; </summary>
#D2D1_SVG_ASPECT_ALIGN_X_MID_Y_MID = 5
    
    ; <summary>
    ; The alignment is set to SVG's 'xMaxYMid' value.
    ; </summary>
#D2D1_SVG_ASPECT_ALIGN_X_MAX_Y_MID = 6
    
    ; <summary>
    ; The alignment is set to SVG's 'xMinYMax' value.
    ; </summary>
#D2D1_SVG_ASPECT_ALIGN_X_MIN_Y_MAX = 7
    
    ; <summary>
    ; The alignment is set to SVG's 'xMidYMax' value.
    ; </summary>
#D2D1_SVG_ASPECT_ALIGN_X_MID_Y_MAX = 8
    
    ; <summary>
    ; The alignment is set to SVG's 'xMaxYMax' value.
    ; </summary>
#D2D1_SVG_ASPECT_ALIGN_X_MAX_Y_MAX = 9
#D2D1_SVG_ASPECT_ALIGN_FORCE_DWORD = $ffffffff


; <summary>
; The meetOrSlice portion of the SVG preserveAspectRatio attribute.
; </summary>
;- Enum D2D1_SVG_ASPECT_SCALING
    
    ; <summary>
    ; Scale the viewBox up as much as possible such that the entire viewBox is visible
    ; within the viewport.
    ; </summary>
#D2D1_SVG_ASPECT_SCALING_MEET = 0
    
    ; <summary>
    ; Scale the viewBox down as much as possible such that the entire viewport is
    ; covered by the viewBox.
    ; </summary>
#D2D1_SVG_ASPECT_SCALING_SLICE = 1
#D2D1_SVG_ASPECT_SCALING_FORCE_DWORD = $ffffffff


; <summary>
; Represents a path commmand. Each command may reference floats from the segment
; data. Commands ending in _ABSOLUTE interpret data as absolute coordinate.
; Commands ending in _RELATIVE interpret data as being relative to the previous
; point.
; </summary>
;- Enum D2D1_SVG_PATH_COMMAND
    
    ; <summary>
    ; Closes the current subpath. Uses no segment data.
    ; </summary>
#D2D1_SVG_PATH_COMMAND_CLOSE_PATH = 0
    
    ; <summary>
    ; Starts a new subpath at the coordinate (x y). Uses 2 floats of segment data.
    ; </summary>
#D2D1_SVG_PATH_COMMAND_MOVE_ABSOLUTE = 1
    
    ; <summary>
    ; Starts a new subpath at the coordinate (x y). Uses 2 floats of segment data.
    ; </summary>
#D2D1_SVG_PATH_COMMAND_MOVE_RELATIVE = 2
    
    ; <summary>
    ; Draws a line to the coordinate (x y). Uses 2 floats of segment data.
    ; </summary>
#D2D1_SVG_PATH_COMMAND_LINE_ABSOLUTE = 3
    
    ; <summary>
    ; Draws a line to the coordinate (x y). Uses 2 floats of segment data.
    ; </summary>
#D2D1_SVG_PATH_COMMAND_LINE_RELATIVE = 4
    
    ; <summary>
    ; Draws a cubic Bezier curve (x1 y1 x2 y2 x y). The curve ends at (x y) and is
    ; defined by the two control points (x1 y1) and (x2 y2). Uses 6 floats of
    ; segment data.
    ; </summary>
#D2D1_SVG_PATH_COMMAND_CUBIC_ABSOLUTE = 5
    
    ; <summary>
    ; Draws a cubic Bezier curve (x1 y1 x2 y2 x y). The curve ends at (x y) and is
    ; defined by the two control points (x1 y1) and (x2 y2). Uses 6 floats of
    ; segment data.
    ; </summary>
#D2D1_SVG_PATH_COMMAND_CUBIC_RELATIVE = 6
    
    ; <summary>
    ; Draws a quadratic Bezier curve (x1 y1 x y). The curve ends at (x y) and is
    ; defined by the control point (x1 y1). Uses 4 floats of segment data.
    ; </summary>
#D2D1_SVG_PATH_COMMAND_QUADRADIC_ABSOLUTE = 7
    
    ; <summary>
    ; Draws a quadratic Bezier curve (x1 y1 x y). The curve ends at (x y) and is
    ; defined by the control point (x1 y1). Uses 4 floats of segment data.
    ; </summary>
#D2D1_SVG_PATH_COMMAND_QUADRADIC_RELATIVE = 8
    
    ; <summary>
    ; Draws an elliptical arc (rx ry x-axis-rotation large-arc-flag sweep-flag x y).
    ; The curve ends at (x y) and is defined by the arc parameters. The two flags are
    ; considered set if their values are non-zero. Uses 7 floats of segment data.
    ; </summary>
#D2D1_SVG_PATH_COMMAND_ARC_ABSOLUTE = 9
    
    ; <summary>
    ; Draws an elliptical arc (rx ry x-axis-rotation large-arc-flag sweep-flag x y).
    ; The curve ends at (x y) and is defined by the arc parameters. The two flags are
    ; considered set if their values are non-zero. Uses 7 floats of segment data.
    ; </summary>
#D2D1_SVG_PATH_COMMAND_ARC_RELATIVE = 10
    
    ; <summary>
    ; Draws a horizontal line to the coordinate (x). Uses 1 float of segment data.
    ; </summary>
#D2D1_SVG_PATH_COMMAND_HORIZONTAL_ABSOLUTE = 11
    
    ; <summary>
    ; Draws a horizontal line to the coordinate (x). Uses 1 float of segment data.
    ; </summary>
#D2D1_SVG_PATH_COMMAND_HORIZONTAL_RELATIVE = 12
    
    ; <summary>
    ; Draws a vertical line to the coordinate (y). Uses 1 float of segment data.
    ; </summary>
#D2D1_SVG_PATH_COMMAND_VERTICAL_ABSOLUTE = 13
    
    ; <summary>
    ; Draws a vertical line to the coordinate (y). Uses 1 float of segment data.
    ; </summary>
#D2D1_SVG_PATH_COMMAND_VERTICAL_RELATIVE = 14
    
    ; <summary>
    ; Draws a smooth cubic Bezier curve (x2 y2 x y). The curve ends at (x y) and is
    ; defined by the control point (x2 y2). Uses 4 floats of segment data.
    ; </summary>
#D2D1_SVG_PATH_COMMAND_CUBIC_SMOOTH_ABSOLUTE = 15
    
    ; <summary>
    ; Draws a smooth cubic Bezier curve (x2 y2 x y). The curve ends at (x y) and is
    ; defined by the control point (x2 y2). Uses 4 floats of segment data.
    ; </summary>
#D2D1_SVG_PATH_COMMAND_CUBIC_SMOOTH_RELATIVE = 16
    
    ; <summary>
    ; Draws a smooth quadratic Bezier curve ending at (x y). Uses 2 floats of segment
    ; data.
    ; </summary>
#D2D1_SVG_PATH_COMMAND_QUADRADIC_SMOOTH_ABSOLUTE = 17
    
    ; <summary>
    ; Draws a smooth quadratic Bezier curve ending at (x y). Uses 2 floats of segment
    ; data.
    ; </summary>
#D2D1_SVG_PATH_COMMAND_QUADRADIC_SMOOTH_RELATIVE = 18
#D2D1_SVG_PATH_COMMAND_FORCE_DWORD = $ffffffff


; <summary>
; Defines the coordinate system used for SVG gradient or clipPath elements.
; </summary>
;- Enum D2D1_SVG_UNIT_TYPE
    
    ; <summary>
    ; The property is set to SVG's 'userSpaceOnUse' value.
    ; </summary>
#D2D1_SVG_UNIT_TYPE_USER_SPACE_ON_USE = 0
    
    ; <summary>
    ; The property is set to SVG's 'objectBoundingBox' value.
    ; </summary>
#D2D1_SVG_UNIT_TYPE_OBJECT_BOUNDING_BOX = 1
#D2D1_SVG_UNIT_TYPE_FORCE_DWORD = $ffffffff


; <summary>
; Defines the type of SVG string attribute to set or get.
; </summary>
;- Enum D2D1_SVG_ATTRIBUTE_STRING_TYPE
    
    ; <summary>
    ; The attribute is a string in the same form as it would appear in the SVG XML.
    ; 
    ; Note that when getting values of this type the value returned may not exactly
    ; match the value that was set. Instead the output value is a normalized version
    ; of the value. For example an input color of 'red' may be output as '#FF0000'.
    ; </summary>
#D2D1_SVG_ATTRIBUTE_STRING_TYPE_SVG = 0
    
    ; <summary>
    ; The attribute is an element ID.
    ; </summary>
#D2D1_SVG_ATTRIBUTE_STRING_TYPE_ID = 1
#D2D1_SVG_ATTRIBUTE_STRING_TYPE_FORCE_DWORD = $ffffffff


; <summary>
; Defines the type of SVG POD attribute to set or get.
; </summary>
;- Enum D2D1_SVG_ATTRIBUTE_POD_TYPE
    
    ; <summary>
    ; The attribute is a FLOAT.
    ; </summary>
#D2D1_SVG_ATTRIBUTE_POD_TYPE_FLOAT = 0
    
    ; <summary>
    ; The attribute is a D2D1_COLOR_F.
    ; </summary>
#D2D1_SVG_ATTRIBUTE_POD_TYPE_COLOR = 1
    
    ; <summary>
    ; The attribute is a D2D1_FILL_MODE.
    ; </summary>
#D2D1_SVG_ATTRIBUTE_POD_TYPE_FILL_MODE = 2
    
    ; <summary>
    ; The attribute is a D2D1_SVG_DISPLAY.
    ; </summary>
#D2D1_SVG_ATTRIBUTE_POD_TYPE_DISPLAY = 3
    
    ; <summary>
    ; The attribute is a D2D1_SVG_OVERFLOW.
    ; </summary>
#D2D1_SVG_ATTRIBUTE_POD_TYPE_OVERFLOW = 4
    
    ; <summary>
    ; The attribute is a D2D1_SVG_LINE_CAP.
    ; </summary>
#D2D1_SVG_ATTRIBUTE_POD_TYPE_LINE_CAP = 5
    
    ; <summary>
    ; The attribute is a D2D1_SVG_LINE_JOIN.
    ; </summary>
#D2D1_SVG_ATTRIBUTE_POD_TYPE_LINE_JOIN = 6
    
    ; <summary>
    ; The attribute is a D2D1_SVG_VISIBILITY.
    ; </summary>
#D2D1_SVG_ATTRIBUTE_POD_TYPE_VISIBILITY = 7
    
    ; <summary>
    ; The attribute is a D2D1_MATRIX_3X2_F.
    ; </summary>
#D2D1_SVG_ATTRIBUTE_POD_TYPE_MATRIX = 8
    
    ; <summary>
    ; The attribute is a D2D1_SVG_UNIT_TYPE.
    ; </summary>
#D2D1_SVG_ATTRIBUTE_POD_TYPE_UNIT_TYPE = 9
    
    ; <summary>
    ; The attribute is a D2D1_EXTEND_MODE.
    ; </summary>
#D2D1_SVG_ATTRIBUTE_POD_TYPE_EXTEND_MODE = 10
    
    ; <summary>
    ; The attribute is a D2D1_SVG_PRESERVE_ASPECT_RATIO.
    ; </summary>
#D2D1_SVG_ATTRIBUTE_POD_TYPE_PRESERVE_ASPECT_RATIO = 11
    
    ; <summary>
    ; The attribute is a D2D1_SVG_VIEWBOX.
    ; </summary>
#D2D1_SVG_ATTRIBUTE_POD_TYPE_VIEWBOX = 12
    
    ; <summary>
    ; The attribute is a D2D1_SVG_LENGTH.
    ; </summary>
#D2D1_SVG_ATTRIBUTE_POD_TYPE_LENGTH = 13
#D2D1_SVG_ATTRIBUTE_POD_TYPE_FORCE_DWORD = $ffffffff


; <summary>
; Represents an SVG length.
; </summary>
Structure D2D1_SVG_LENGTH Align #PB_Structure_AlignC
	value.f
	units.l
EndStructure


; <summary>
; Represents all SVG preserveAspectRatio settings.
; </summary>
Structure D2D1_SVG_PRESERVE_ASPECT_RATIO Align #PB_Structure_AlignC
    ; <summary>
    ; Sets the 'defer' portion of the preserveAspectRatio settings. This field only
    ; has an effect on an 'image' element that references another SVG document. As
    ; this is not currently supported, the field has no impact on rendering.
    ; </summary>
    defer.l
    
    ; <summary>
    ; Sets the align portion of the preserveAspectRatio settings.
    ; </summary>
    align.l
    
    ; <summary>
    ; Sets the meetOrSlice portion of the preserveAspectRatio settings.
    ; </summary>
    meetOrSlice.l
EndStructure


; <summary>
; Represents an SVG viewBox.
; </summary>
Structure D2D1_SVG_VIEWBOX Align #PB_Structure_AlignC
    x.f
    y.f
    width.f
    height.f
EndStructure


; <summary>
; Interface describing an SVG attribute.
; </summary>
;- ID2D1SvgAttribute

DataSection
	IID_ID2D1SvgAttribute:
	Data.l $c9cdb0dd
	Data.w $f8c9, $4e70
	Data.b $b7, $c2, $30, $1c, $80, $29, $2c, $5e
EndDataSection

Interface ID2D1SvgAttribute Extends ID2D1Resource
    
    ; <summary>
    ; Returns the element on which this attribute is set. Returns null if the
    ; attribute is not set on any element.
    ; </summary>
    GetElement.l(element.i)
    
    ; <summary>
    ; Creates a clone of this attribute value. On creation, the cloned attribute is
    ; not set on any element.
    ; </summary>
    Clone.l(attribute.i)
EndInterface


; <summary>
; Interface describing an SVG 'fill' or 'stroke' value.
; </summary>
;- ID2D1SvgPaint

DataSection
	IID_ID2D1SvgPaint:
	Data.l $d59bab0a
	Data.w $68a2, $455b
	Data.b $a5, $dc, $9e, $b2, $85, $4e, $24, $90
EndDataSection

Interface ID2D1SvgPaint Extends ID2D1SvgAttribute
    
    ; <summary>
    ; Sets the paint type.
    ; </summary>
    SetPaintType.l(paintType.l)
    
    ; <summary>
    ; Gets the paint type.
    ; </summary>
    GetPaintType.l()
    
    ; <summary>
    ; Sets the paint color that is used if the paint type is
    ; D2D1_SVG_PAINT_TYPE_COLOR.
    ; </summary>
    SetColor.l(color.i)
    
    ; <summary>
    ; Gets the paint color that is used if the paint type is
    ; D2D1_SVG_PAINT_TYPE_COLOR.
    ; </summary>
    GetColor.l(color.i)
    
    ; <summary>
    ; Sets the element id which acts as the paint server. This id is used if the paint
    ; type is D2D1_SVG_PAINT_TYPE_URI.
    ; </summary>
    SetId.l(id.s)
    
    ; <summary>
    ; Gets the element id which acts as the paint server. This id is used if the paint
    ; type is D2D1_SVG_PAINT_TYPE_URI.
    ; </summary>
    GetId.l(id.i, idCount.l)
    
    ; <summary>
    ; Gets the string length of the element id which acts as the paint server. This id
    ; is used if the paint type is D2D1_SVG_PAINT_TYPE_URI. The returned string length
    ; does not include room for the null terminator.
    ; </summary>
    GetIdLength.l()
 EndInterface


; <summary>
; Interface describing an SVG 'stroke-dasharray' value.
; </summary>
;- ID2D1SvgStrokeDashArray

DataSection
	IID_ID2D1SvgStrokeDashArray:
	Data.l $f1c0ca52
	Data.w $92a3, $4f00
	Data.b $b4, $ce, $f3, $56, $91, $ef, $d9, $d9
EndDataSection

Interface ID2D1SvgStrokeDashArray Extends ID2D1SvgAttribute
    ; <summary>
    ; Removes dashes from the end of the array.
    ; </summary>
    ; <param name="dashesCount">Specifies how many dashes to remove.</param>
    RemoveDashesAtEnd.l(dashesCount.l)
    
    ; <summary>
    ; Updates the array. Existing dashes not updated by this method are preserved. The
    ; array is resized larger if necessary to accomodate the new dashes.
    ; </summary>
    ; <param name="dashes">The dashes array.</param>
    ; <param name="dashesCount">The number of dashes to update.</param>
    ; <param name="startIndex">The index at which to begin updating dashes. Must be
    ; less than or equal to the size of the array.</param>
;  STDMETHOD(UpdateDashes)(
;         _In_reads_(dashesCount) CONST FLOAT *dashes,
;         UINT32 dashesCount,
;         UINT32 startIndex = 0 
;         ) PURE;
    UpdateDashes.l(dashes.i, dashesCount.l, startIndex.l)
    
; STDMETHOD(UpdateDashes)(
;   _In_reads_(dashesCount) CONST D2D1_SVG_LENGTH *dashes,
;   UINT32 dashesCount,
;   UINT32 startIndex = 0 
;   ) PURE;
    UpdateDashes2.l(dashes.i, dashesCount.l, startIndex.l)
 
    
    ; <summary>
    ; Gets dashes from the array.
    ; </summary>
    ; <param name="dashes">Buffer to contain the dashes.</param>
    ; <param name="dashesCount">The element count of buffer.</param>
    ; <param name="startIndex">The index of the first dash to retrieve.</param>
;  STDMETHOD(GetDashes)(
;       _Out_writes_(dashesCount) FLOAT *dashes,
;       UINT32 dashesCount,
;       UINT32 startIndex = 0 
;       ) PURE;
    GetDashes.l(dashes.i, dashesCount.l, startIndex.l)
    
    
; STDMETHOD(GetDashes)(
;     _Out_writes_(dashesCount) D2D1_SVG_LENGTH *dashes,
;     UINT32 dashesCount,
;     UINT32 startIndex = 0 
;     ) PURE;
    GetDashes2.l(dashes.i, dashesCount.l, startIndex.l)

    
    ; <summary>
    ; Gets the number of the dashes in the array.
    ; </summary>
    GetDashesCount.l()
EndInterface


; <summary>
; Interface describing an SVG 'points' value in a 'polyline' or 'polygon' element.
; </summary>
;- ID2D1SvgPointCollection
DataSection
	IID_ID2D1SvgPointCollection:
	Data.l $9dbe4c0d
	Data.w $3572, $4dd9
	Data.b $98, $25, $55, $30, $81, $3b, $b7, $12
EndDataSection

Interface ID2D1SvgPointCollection Extends ID2D1SvgAttribute
    ; <summary>
    ; Removes points from the end of the array.
    ; </summary>
    ; <param name="pointsCount">Specifies how many points to remove.</param>
    RemovePointsAtEnd.l(pointsCount.l)
    
    ; <summary>
    ; Updates the points array. Existing points not updated by this method are
    ; preserved. The array is resized larger if necessary to accomodate the new
    ; points.
    ; </summary>
    ; <param name="points">The points array.</param>
    ; <param name="pointsCount">The number of points to update.</param>
    ; <param name="startIndex">The index at which to begin updating points. Must be
    ; less than or equal to the size of the array.</param>
    UpdatePoints.l(points.i, pointsCount.l, startIndex.l)
    
    ; <summary>
    ; Gets points from the points array.
    ; </summary>
    ; <param name="points">Buffer to contain the points.</param>
    ; <param name="pointsCount">The element count of the buffer.</param>
    ; <param name="startIndex">The index of the first point to retrieve.</param>
    GetPoints.l(points.i, pointsCount.l, startIndex.l)
    
    ; <summary>
    ; Gets the number of points in the array.
    ; </summary>
    GetPointsCount.l()
EndInterface


; <summary>
; Interface describing SVG path data. Path data can be set as the 'd' attribute on
; a 'path' element.
; 
; The path data set is factored into two arrays. The segment data array stores all
; numbers and the commands array stores the set of commands. Unlike the string
; data set in the d attribute, each command in this representation uses a fixed
; number of elements in the segment data array. Therefore, the path 'M 0,0 100,0
; 0,100 Z' is represented as: 'M0,0 L100,0 L0,100 Z'. This is split into two
; arrays, with the segment data containing '0,0 100,0 0,100', and the commands
; containing 'M L L Z'.
; </summary>
;- ID2D1SvgPathData
DataSection
	IID_ID2D1SvgPathData:
	Data.l $c095e4f4
	Data.w $bb98, $43d6
	Data.b $97, $45, $4d, $1b, $84, $ec, $98, $88
EndDataSection

Interface ID2D1SvgPathData Extends ID2D1SvgAttribute
    
    ; <summary>
    ; Removes data from the end of the segment data array.
    ; </summary>
    ; <param name="dataCount">Specifies how much data to remove.</param>
    RemoveSegmentDataAtEnd.l(dataCount.l)
    
    ; <summary>
    ; Updates the segment data array. Existing segment data not updated by this method
    ; are preserved. The array is resized larger if necessary to accomodate the new
    ; segment data.
    ; </summary>
    ; <param name="data">The data array.</param>
    ; <param name="dataCount">The number of data to update.</param>
    ; <param name="startIndex">The index at which to begin updating segment data. Must
    ; be less than or equal to the size of the segment data array.</param>
    UpdateSegmentData.l(Dat.i, dataCount.l, startIndex.l)
    
    ; <summary>
    ; Gets data from the segment data array.
    ; </summary>
    ; <param name="data">Buffer to contain the segment data array.</param>
    ; <param name="dataCount">The element count of the buffer.</param>
    ; <param name="startIndex">The index of the first segment data to retrieve.
    ; </param>
    GetSegmentData.l(Dat.i, dataCount.l, startIndex.l)
    
    ; <summary>
    ; Gets the size of the segment data array.
    ; </summary>
    GetSegmentDataCount.l()
    
    ; <summary>
    ; Removes commands from the end of the commands array.
    ; </summary>
    ; <param name="commandsCount">Specifies how many commands to remove.</param>
    RemoveCommandsAtEnd.l(commandsCount.l)
    
    ; <summary>
    ; Updates the commands array. Existing commands not updated by this method are
    ; preserved. The array is resized larger if necessary to accomodate the new
    ; commands.
    ; </summary>
    ; <param name="commands">The commands array.</param>
    ; <param name="commandsCount">The number of commands to update.</param>
    ; <param name="startIndex">The index at which to begin updating commands. Must be
    ; less than or equal to the size of the commands array.</param>
    UpdateCommands.l(commands.i, commandsCount.l, startIndex.l)
    
    ; <summary>
    ; Gets commands from the commands array.
    ; </summary>
    ; <param name="commands">Buffer to contain the commands</param>
    ; <param name="commandsCount">The element count of the buffer.</param>
    ; <param name="startIndex">The index of the first commands to retrieve.</param>
    GetCommands.l(commands.i, commandsCount.l, startIndex.l)
    
    ; <summary>
    ; Gets the size of the commands array.
    ; </summary>
    GetCommandsCount.l()
    
    ; <summary>
    ; Creates a path geometry object representing the path data.
    ; </summary>
    CreatePathGeometry.l(fillMode.l, pathGeometry.i)
EndInterface


; <summary>
; Interface for all SVG elements.
; </summary>
;- ID2D1SvgElement
DataSection
	IID_ID2D1SvgElement:
	Data.l $ac7b67a6
	Data.w $183e, $49c1
	Data.b $a8, $23, $0e, $be, $40, $b0, $db, $29
EndDataSection

Interface ID2D1SvgElement Extends ID2D1Resource
    ; <summary>
    ; Gets the document that contains this element. Returns null if the element has
    ; been removed from the tree.
    ; </summary>
    GetDocument.l(document.i)
    
    ; <summary>
    ; Gets the tag name.
    ; </summary>
    GetTagName.l(name.i, nameCount.l)
    
    ; <summary>
    ; Gets the string length of the tag name. The returned string length does not
    ; include room for the null terminator.
    ; </summary>
    GetTagNameLength.l()
    
    ; <summary>
    ; Returns TRUE if this element represents text content, e.g. the content of a
    ; 'title' or 'desc' element. Text content does not have a tag name.
    ; </summary>
    IsTextContent.l()
    
    ; <summary>
    ; Gets the parent element.
    ; </summary>
    GetParent.l(parent.i)
        
    
    ; <summary>
    ; Returns whether this element has children.
    ; </summary>
    HasChildren.l()
    
    ; <summary>
    ; Gets the first child of this element.
    ; </summary>
    GetFirstChild.l(child.i) 
       
    
    ; <summary>
    ; Gets the last child of this element.
    ; </summary>
    GetLastChild.l(child.i) 
       
    
    ; <summary>
    ; Gets the previous sibling of the referenceChild element.
    ; </summary>
    ; <param name="referenceChild">The referenceChild must be an immediate child of
    ; this element.</param>
    ; <param name="previousChild">The output previousChild element will be non-null if
    ; the referenceChild has a previous sibling. If the referenceChild is the first
    ; child, the output is null.</param>
    GetPreviousChild.l(referenceChild.i, previousChild.i)
        
    
    ; <summary>
    ; Gets the next sibling of the referenceChild element.
    ; </summary>
    ; <param name="referenceChild">The referenceChild must be an immediate child of
    ; this element.</param>
    ; <param name="nextChild">The output nextChild element will be non-null if the
    ; referenceChild has a next sibling. If the referenceChild is the last child, the
    ; output is null.</param>
    GetNextChild.l(referenceChild.i, nextChild.i)
     
    
    ; <summary>
    ; Inserts newChild as a child of this element, before the referenceChild element.
    ; If the newChild element already has a parent, it is removed from this parent as
    ; part of the insertion. Returns an error if this element cannot accept children
    ; of the type of newChild. Returns an error if the newChild is an ancestor of this
    ; element.
    ; </summary>
    ; <param name="newChild">The element to be inserted.</param>
    ; <param name="referenceChild">The element that the child should be inserted
    ; before. If referenceChild is null, the newChild is placed as the last child. If
    ; referenceChild is non-null, it must be an immediate child of this element.
    ; </param>
    InsertChildBefore.l(newChild.i, referenceChild.i)
    
    ; <summary>
    ; Appends newChild to the list of children. If the newChild element already has a
    ; parent, it is removed from this parent as part of the append operation. Returns
    ; an error if this element cannot accept children of the type of newChild. Returns
    ; an error if the newChild is an ancestor of this element.
    ; </summary>
    ; <param name="newChild">The element to be appended.</param>
    AppendChild.l(newChild.i)
       
    
    ; <summary>
    ; Replaces the oldChild element with the newChild. This operation removes the
    ; oldChild from the tree. If the newChild element already has a parent, it is
    ; removed from this parent as part of the replace operation. Returns an error if
    ; this element cannot accept children of the type of newChild. Returns an error if
    ; the newChild is an ancestor of this element.
    ; </summary>
    ; <param name="newChild">The element to be inserted.</param>
    ; <param name="oldChild">The child element to be replaced. The oldChild element
    ; must be an immediate child of this element.</param>
    ReplaceChild.l(newChild.i, oldChild.i)
    
    ; <summary>
    ; Removes the oldChild from the tree. Children of oldChild remain children of
    ; oldChild.
    ; </summary>
    ; <param name="oldChild">The child element to be removed. The oldChild element
    ; must be an immediate child of this element.</param>
    RemoveChild.l(oldChild.i)
    
    ; <summary>
    ; Creates an element from a tag name. The element is appended to the list of
    ; children. Returns an error if this element cannot accept children of the
    ; specified type.
    ; </summary>
    ; <param name="tagName">The tag name of the new child. An empty string is
    ; interpreted to be a text content element.</param>
    ; <param name="newChild">The new child element.</param>
    CreateChild.l(tagName.s, newChild.i)
    
    ; <summary>
    ; Returns true if the attribute is explicitly set on the element or if it is
    ; present within an inline style. Returns FALSE if the attribute is not a valid
    ; attribute on this element.
    ; </summary>
    ; <param name="name">The name of the attribute.</param>
    ; <param name="inherited">Outputs whether the attribute is set to the 'inherit'
    ; value.</param>
    IsAttributeSpecified.l(name.s, inherited.i)
    
    ; <summary>
    ; Returns the number of specified attributes on this element. Attributes are only
    ; considered specified if they are explicitly set on the element or present within
    ; an inline style. Properties that receive their value through CSS inheritance are
    ; not considered specified. An attribute can become specified if it is set through
    ; a method call. It can become unspecified if it is removed via RemoveAttribute.
    ; </summary>
    GetSpecifiedAttributeCount.l()
    
    ; <summary>
    ; Gets the name of the specified attribute at the given index.
    ; </summary>
    ; <param name="index">The specified index of the attribute.</param>
    ; <param name="name">Outputs the name of the attribute.</param>
    ; <param name="inherited">Outputs whether the attribute is set to the 'inherit'
    ; value.</param>
    GetSpecifiedAttributeName.l(index.l, name.i, nameCount.l, inherited.i)
    
    ; <summary>
    ; Gets the string length of the name of the specified attribute at the given
    ; index. The output string length does not include room for the null terminator.
    ; </summary>
    ; <param name="index">The specified index of the attribute.</param>
    ; <param name="nameLength">Outputs the string length of the name of the specified
    ; attribute.</param>
    ; <param name="inherited">Outputs whether the attribute is set to the 'inherit'
    ; value.</param>
    GetSpecifiedAttributeNameLength.l(index.l, nameLength.i, inherited.i)
    
    ; <summary>
    ; Removes the attribute from this element. Also removes this attribute from within
    ; an inline style if present. Returns an error if the attribute name is not valid
    ; on this element.
    ; </summary>
    RemoveAttribute.l(name.s)
    
    ; <summary>
    ; Sets the value of a text content element.
    ; </summary>
    SetTextValue.l(name.s, nameCount.l)
    
    ; <summary>
    ; Gets the value of a text content element.
    ; </summary>
    GetTextValue.l(name.i, nameCount.l)
    
    ; <summary>
    ; Gets the length of the text content value. The returned string length does not
    ; include room for the null terminator.
    ; </summary>
    GetTextValueLength.l()
    
    
;- FIXED SEQUENCE
; STDMETHOD(SetAttributeValue)(
;             _In_ PCWSTR name,
;             _In_ ID2D1SvgAttribute *value 
;             ) PURE;
	SetAttributeValue.l(name.s, value.i)
	
; STDMETHOD(SetAttributeValue)(
;     _In_ PCWSTR name,
;     D2D1_SVG_ATTRIBUTE_POD_TYPE type,
;     _In_reads_bytes_(valueSizeInBytes) CONST void *value,
;     UINT32 valueSizeInBytes 
;     ) PURE;

	SetAttributeValue2.l(name.s, type.l, value.i, valueSizeInBytes.l)


; STDMETHOD(SetAttributeValue)(
;     _In_ PCWSTR name,
;     D2D1_SVG_ATTRIBUTE_STRING_TYPE type,
;     _In_ PCWSTR value 
;     ) PURE;

	SetAttributeValue3.l(name.s, type.l, value.s)

            
; STDMETHOD(GetAttributeValue)(
;     _In_ PCWSTR name,
;     _In_ REFIID riid,
;     _COM_Outptr_result_maybenull_ void **value 
;     ) PURE;

	GetAttributeValue.l(name.s, riid.i, value.i)

; STDMETHOD(GetAttributeValue)(
;     _In_ PCWSTR name,
;     D2D1_SVG_ATTRIBUTE_POD_TYPE type,
;     _Out_writes_bytes_(valueSizeInBytes) void *value,
;     UINT32 valueSizeInBytes 
;     ) PURE;
  
	GetAttributeValue2.l(name.s, type.l, value.i, valueSizeInBytes.l)
         
; STDMETHOD(GetAttributeValue)(
;     _In_ PCWSTR name,
;     D2D1_SVG_ATTRIBUTE_STRING_TYPE type,
;     _Out_writes_(valueCount) PWSTR value,
;     UINT32 valueCount 
;     ) PURE;

	GetAttributeValue3.l(name.s, type.l, value.i, valueCount.l)
   
; STDMETHOD(GetAttributeValueLength)(
;     _In_ PCWSTR name,
;     D2D1_SVG_ATTRIBUTE_STRING_TYPE type,
;     _Out_ UINT32 *valueLength 
;     ) PURE;

	GetAttributeValueLength.l(name.s, type.l, valueLength.i)
EndInterface


;- ID2D1SvgDocument
DataSection
	IID_ID2D1SvgDocument:
	Data.l $86b88e4d
	Data.w $afa4, $4d7b
	Data.b $88, $e4, $68, $a5, $1c, $4a, $0a, $ec
EndDataSection

Interface ID2D1SvgDocument Extends ID2D1Resource
    ; <summary>
    ; Sets the size of the initial viewport.
    ; </summary>
    SetViewportSize.l(viewportSize.q)
    
    ; <summary>
    ; Returns the size of the initial viewport.
    ; </summary>
    GetViewportSize.i(size.i)
    
    ; <summary>
    ; Sets the root element of the document. The root element must be an 'svg'
    ; element. If the element already exists within an svg tree, it is first removed.
    ; </summary>
    SetRoot.l(root.i)
    
    ; <summary>
    ; Gets the root element of the document.
    ; </summary>
    GetRoot.l(root.i)
      
    ; <summary>
    ; Gets the SVG element with the specified ID. If the element cannot be found, the
    ; returned element will be null.
    ; </summary>
    FindElementById.l(id.s, svgElement.i)
    
    ; <summary>
    ; Serializes an element and its subtree to XML. The output XML is encoded as
    ; UTF-8.
    ; </summary>
    ; <param name="outputXmlStream">An output stream to contain the SVG XML subtree.
    ; </param>
    ; <param name="subtree">The root of the subtree. If null, the entire document is
    ; serialized.</param>
    Serialize.l(outputXmlStream.i, subtree.i)
        
    ; <summary>
    ; Deserializes a subtree from the stream. The stream must have only one root
    ; element, but that root element need not be an 'svg' element. The output element
    ; is not inserted into this document tree.
    ; </summary>
    ; <param name="inputXmlStream">An input stream containing the SVG XML subtree.
    ; </param>
    ; <param name="subtree">The root of the subtree.</param>
    Deserialize.l(inputXmlStream.l, subtree.i)
    
    ; <summary>
    ; Creates a paint object which can be used to set the 'fill' or 'stroke'
    ; properties.
    ; </summary>
    ; <param name="color">The color used if the paintType is
    ; D2D1_SVG_PAINT_TYPE_COLOR.</param>
    ; <param name="id">The element id which acts as the paint server. This id is used
    ; if the paint type is D2D1_SVG_PAINT_TYPE_URI.</param>
    CreatePaint.l(paintType.l, color.i, id.s, paint.i)
    
    ; <summary>
    ; Creates a dash array object which can be used to set the 'stroke-dasharray'
    ; property.
    ; </summary>
    CreateStrokeDashArray.l(dashes.i, dashesCount.l, strokeDashArray.i)
    
    ; <summary>
    ; Creates a points object which can be used to set a 'points' attribute on a
    ; 'polygon' or 'polyline' element.
    ; </summary>
    CreatePointCollection.l(points.i, pointsCount.l, pointCollection.i)
    
    ; <summary>
    ; Creates a path data object which can be used to set a 'd' attribute on a 'path'
    ; element.
    ; </summary>
    CreatePathData.l(segmentData.i, segmentDataCount.l, commands.i, commandsCount.l, pathData.i)
 EndInterface



