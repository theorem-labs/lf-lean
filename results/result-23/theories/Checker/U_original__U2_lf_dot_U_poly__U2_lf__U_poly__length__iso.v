From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__length__iso.
From IsomorphismChecker Require Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__length__iso.
From IsomorphismChecker Require Checker.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Checker.nat__iso.

Module Type Args <: Interface.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__length__iso.Args := Checker.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso.Checker <+ Checker.nat__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__length__iso.imported_Original_LF__DOT__Poly_LF_Poly_length Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__length__iso.Original_LF__DOT__Poly_LF_Poly_length_iso ].

Module Checker (Import args : Args) <: Interface.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__length__iso.Interface args
  with Definition imported_Original_LF__DOT__Poly_LF_Poly_length := (@Imported.Original_LF__DOT__Poly_LF_Poly_length).

Definition imported_Original_LF__DOT__Poly_LF_Poly_length := Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__length__iso.imported_Original_LF__DOT__Poly_LF_Poly_length.
Definition Original_LF__DOT__Poly_LF_Poly_length_iso := Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__length__iso.Original_LF__DOT__Poly_LF_Poly_length_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Original_LF__DOT__Poly_LF_Poly_length_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.