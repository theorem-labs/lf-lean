From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_some__iso.
From IsomorphismChecker Require Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_some__iso.
From IsomorphismChecker Require Checker.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__option__iso.

Module Type Args <: Interface.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_some__iso.Args := Checker.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__option__iso.Args <+ Checker.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__option__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_some__iso.imported_Original_LF__DOT__Poly_LF_Poly_Some Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_some__iso.Original_LF__DOT__Poly_LF_Poly_Some_iso ].

Module Checker (Import args : Args) <: Interface.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_some__iso.Interface args
  with Definition imported_Original_LF__DOT__Poly_LF_Poly_Some := (@Imported.Original_LF__DOT__Poly_LF_Poly_Some).

Definition imported_Original_LF__DOT__Poly_LF_Poly_Some := Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_some__iso.imported_Original_LF__DOT__Poly_LF_Poly_Some.
Definition Original_LF__DOT__Poly_LF_Poly_Some_iso := Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_some__iso.Original_LF__DOT__Poly_LF_Poly_Some_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Original_LF__DOT__Poly_LF_Poly_Some_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.