From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__test____anon____funSQUOTE__iso.
From IsomorphismChecker Require Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__test____anon____funSQUOTE__iso.
From IsomorphismChecker Require Checker.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__doit3times__iso Checker.U_true__iso Checker.U_corelib__U_init__U_logic__eq__iso Checker.nat__iso Checker.U_nat__mul__iso Checker.U_s__iso Checker.__0__iso.

Module Type Args <: Interface.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__test____anon____funSQUOTE__iso.Args := Checker.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__doit3times__iso.Checker <+ Checker.U_true__iso.Checker <+ Checker.U_corelib__U_init__U_logic__eq__iso.Checker <+ Checker.nat__iso.Checker <+ Checker.U_nat__mul__iso.Checker <+ Checker.U_s__iso.Checker <+ Checker.__0__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__test____anon____funSQUOTE__iso.imported_Original_LF__DOT__Poly_LF_Poly_test__anon__fun' Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__test____anon____funSQUOTE__iso.Original_LF__DOT__Poly_LF_Poly_test__anon__fun'_iso ].

Module Checker (Import args : Args) <: Interface.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__test____anon____funSQUOTE__iso.Interface args
  with Definition imported_Original_LF__DOT__Poly_LF_Poly_test__anon__fun' := Imported.Original_LF__DOT__Poly_LF_Poly_test__anon__fun'.

Definition imported_Original_LF__DOT__Poly_LF_Poly_test__anon__fun' := Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__test____anon____funSQUOTE__iso.imported_Original_LF__DOT__Poly_LF_Poly_test__anon__fun'.
Definition Original_LF__DOT__Poly_LF_Poly_test__anon__fun'_iso := Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__test____anon____funSQUOTE__iso.Original_LF__DOT__Poly_LF_Poly_test__anon__fun'_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Original_LF__DOT__Poly_LF_Poly_test__anon__fun'_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.