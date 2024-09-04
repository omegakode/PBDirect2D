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
