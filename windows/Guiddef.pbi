;Guiddef.pbi

Macro DEFINE_GUID(name, l1, w1, w2, b1, b2, b3, b4, b5, b6, b7, b8)
DataSection
	name:
	Data.l l1
	Data.w w1, w2
	Data.b b1, b2, b3, b4, b5, b6, b7, b8
EndDataSection
EndMacro