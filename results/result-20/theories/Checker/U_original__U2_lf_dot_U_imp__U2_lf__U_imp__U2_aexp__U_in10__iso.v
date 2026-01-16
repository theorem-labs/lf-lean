From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__U_in10__iso.
From IsomorphismChecker Require Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__U_in10__iso.
From IsomorphismChecker Require Checker.list__iso Checker.U_list__U_in__iso Checker.cons__iso Checker.nat__iso Checker.U_s__iso Checker.__0__iso Checker.nil__iso.

Module Type Args <: Interface.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__U_in10__iso.Args := Checker.list__iso.Checker <+ Checker.U_list__U_in__iso.Checker <+ Checker.cons__iso.Checker <+ Checker.nat__iso.Checker <+ Checker.U_s__iso.Checker <+ Checker.__0__iso.Checker <+ Checker.nil__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__U_in10__iso.imported_Original_LF__DOT__Imp_LF_Imp_AExp_In10 Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__U_in10__iso.Original_LF__DOT__Imp_LF_Imp_AExp_In10_iso ].

Module Checker (Import args : Args) <: Interface.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__U_in10__iso.Interface args
  with Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_In10 := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_In10.

Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_In10 := Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__U_in10__iso.imported_Original_LF__DOT__Imp_LF_Imp_AExp_In10.
Definition Original_LF__DOT__Imp_LF_Imp_AExp_In10_iso := Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__U_in10__iso.Original_LF__DOT__Imp_LF_Imp_AExp_In10_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Original_LF__DOT__Imp_LF_Imp_AExp_In10_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.