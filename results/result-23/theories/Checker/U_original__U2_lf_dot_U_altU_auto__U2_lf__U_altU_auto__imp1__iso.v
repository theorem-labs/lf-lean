From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_original__U2_lf_dot_U_altU_auto__U2_lf__U_altU_auto__imp1__iso.
From IsomorphismChecker Require Isomorphisms.U_original__U2_lf_dot_U_altU_auto__U2_lf__U_altU_auto__imp1__iso.

Module Type Args <: Interface.U_original__U2_lf_dot_U_altU_auto__U2_lf__U_altU_auto__imp1__iso.Args. End Args.

#[global] Strategy -1 [ Isomorphisms.U_original__U2_lf_dot_U_altU_auto__U2_lf__U_altU_auto__imp1__iso.imported_Original_LF__DOT__AltAuto_LF_AltAuto_imp1 Isomorphisms.U_original__U2_lf_dot_U_altU_auto__U2_lf__U_altU_auto__imp1__iso.Original_LF__DOT__AltAuto_LF_AltAuto_imp1_iso ].

Module Checker (Import args : Args) <: Interface.U_original__U2_lf_dot_U_altU_auto__U2_lf__U_altU_auto__imp1__iso.Interface args
  with Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_imp1 := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_imp1.

Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_imp1 := Isomorphisms.U_original__U2_lf_dot_U_altU_auto__U2_lf__U_altU_auto__imp1__iso.imported_Original_LF__DOT__AltAuto_LF_AltAuto_imp1.
Definition Original_LF__DOT__AltAuto_LF_AltAuto_imp1_iso := Isomorphisms.U_original__U2_lf_dot_U_altU_auto__U2_lf__U_altU_auto__imp1__iso.Original_LF__DOT__AltAuto_LF_AltAuto_imp1_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Original_LF__DOT__AltAuto_LF_AltAuto_imp1_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.