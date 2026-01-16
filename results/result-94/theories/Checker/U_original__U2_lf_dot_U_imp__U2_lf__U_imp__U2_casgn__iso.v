From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_casgn__iso.
From IsomorphismChecker Require Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_casgn__iso.
From IsomorphismChecker Require Checker.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso Checker.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__com__iso Checker.U_string__string__iso.

Module Type Args <: Interface.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_casgn__iso.Args := Checker.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso.Checker <+ Checker.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__com__iso.Checker <+ Checker.U_string__string__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_casgn__iso.imported_Original_LF__DOT__Imp_LF_Imp_CAsgn Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_casgn__iso.Original_LF__DOT__Imp_LF_Imp_CAsgn_iso ].

Module Checker (Import args : Args) <: Interface.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_casgn__iso.Interface args
  with Definition imported_Original_LF__DOT__Imp_LF_Imp_CAsgn := Imported.Original_LF__DOT__Imp_LF_Imp_CAsgn.

Definition imported_Original_LF__DOT__Imp_LF_Imp_CAsgn := Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_casgn__iso.imported_Original_LF__DOT__Imp_LF_Imp_CAsgn.
Definition Original_LF__DOT__Imp_LF_Imp_CAsgn_iso := Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_casgn__iso.Original_LF__DOT__Imp_LF_Imp_CAsgn_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Original_LF__DOT__Imp_LF_Imp_CAsgn_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.