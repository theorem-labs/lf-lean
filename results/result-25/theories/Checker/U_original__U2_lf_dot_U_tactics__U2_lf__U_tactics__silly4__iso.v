From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_original__U2_lf_dot_U_tactics__U2_lf__U_tactics__silly4__iso.
From IsomorphismChecker Require Isomorphisms.U_original__U2_lf_dot_U_tactics__U2_lf__U_tactics__silly4__iso.
From IsomorphismChecker Require Checker.U_true__iso Checker.U_corelib__U_init__U_logic__eq__iso Checker.nat__iso.

Module Type Args <: Interface.U_original__U2_lf_dot_U_tactics__U2_lf__U_tactics__silly4__iso.Args := Checker.U_true__iso.Checker <+ Checker.U_corelib__U_init__U_logic__eq__iso.Checker <+ Checker.nat__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_original__U2_lf_dot_U_tactics__U2_lf__U_tactics__silly4__iso.imported_Original_LF__DOT__Tactics_LF_Tactics_silly4 Isomorphisms.U_original__U2_lf_dot_U_tactics__U2_lf__U_tactics__silly4__iso.Original_LF__DOT__Tactics_LF_Tactics_silly4_iso ].

Module Checker (Import args : Args) <: Interface.U_original__U2_lf_dot_U_tactics__U2_lf__U_tactics__silly4__iso.Interface args
  with Definition imported_Original_LF__DOT__Tactics_LF_Tactics_silly4 := Imported.Original_LF__DOT__Tactics_LF_Tactics_silly4.

Definition imported_Original_LF__DOT__Tactics_LF_Tactics_silly4 := Isomorphisms.U_original__U2_lf_dot_U_tactics__U2_lf__U_tactics__silly4__iso.imported_Original_LF__DOT__Tactics_LF_Tactics_silly4.
Definition Original_LF__DOT__Tactics_LF_Tactics_silly4_iso := Isomorphisms.U_original__U2_lf_dot_U_tactics__U2_lf__U_tactics__silly4__iso.Original_LF__DOT__Tactics_LF_Tactics_silly4_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Original_LF__DOT__Tactics_LF_Tactics_silly4_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.