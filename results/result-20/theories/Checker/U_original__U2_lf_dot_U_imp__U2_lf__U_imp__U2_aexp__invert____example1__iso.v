From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__invert____example1__iso.
From IsomorphismChecker Require Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__invert____example1__iso.
From IsomorphismChecker Require Checker.U_true__iso Checker.U_corelib__U_init__U_logic__eq__iso Checker.list__iso Checker.cons__iso Checker.nat__iso Checker.nil__iso.

Module Type Args <: Interface.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__invert____example1__iso.Args := Checker.U_true__iso.Checker <+ Checker.U_corelib__U_init__U_logic__eq__iso.Checker <+ Checker.list__iso.Checker <+ Checker.cons__iso.Checker <+ Checker.nat__iso.Checker <+ Checker.nil__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__invert____example1__iso.imported_Original_LF__DOT__Imp_LF_Imp_AExp_invert__example1 Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__invert____example1__iso.Original_LF__DOT__Imp_LF_Imp_AExp_invert__example1_iso ].

Module Checker (Import args : Args) <: Interface.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__invert____example1__iso.Interface args
  with Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_invert__example1 := (@Imported.Original_LF__DOT__Imp_LF_Imp_AExp_invert__example1).

Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_invert__example1 := Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__invert____example1__iso.imported_Original_LF__DOT__Imp_LF_Imp_AExp_invert__example1.
Definition Original_LF__DOT__Imp_LF_Imp_AExp_invert__example1_iso := Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__invert____example1__iso.Original_LF__DOT__Imp_LF_Imp_AExp_invert__example1_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Original_LF__DOT__Imp_LF_Imp_AExp_invert__example1_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.