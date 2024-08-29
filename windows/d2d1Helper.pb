;d2d1Helper.pb

EnableExplicit

Procedure.q D2D1_Point2F(x.f, y.f)
	Protected.q ret
	
	PokeF(@ret, x) : PokeF(@ret + SizeOf(Float), y)
	
	ProcedureReturn ret
EndProcedure