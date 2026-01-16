From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso.
From IsomorphismChecker Require Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso.

Module Type Args <: Interface.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso.Args. End Args.

#[global] Strategy -1 [ Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso.imported_Original_LF__DOT__Imp_LF_Imp_aexp Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso.Original_LF__DOT__Imp_LF_Imp_aexp_iso ].

Module Checker (Import args : Args) <: Interface.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso.Interface args
  with Definition imported_Original_LF__DOT__Imp_LF_Imp_aexp := Imported.Original_LF__DOT__Imp_LF_Imp_aexp.

Definition imported_Original_LF__DOT__Imp_LF_Imp_aexp := Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso.imported_Original_LF__DOT__Imp_LF_Imp_aexp.
Definition Original_LF__DOT__Imp_LF_Imp_aexp_iso := Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso.Original_LF__DOT__Imp_LF_Imp_aexp_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Original_LF__DOT__Imp_LF_Imp_aexp_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.