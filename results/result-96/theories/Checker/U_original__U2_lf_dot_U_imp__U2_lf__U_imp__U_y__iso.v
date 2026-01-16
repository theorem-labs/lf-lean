From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_y__iso.
From IsomorphismChecker Require Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_y__iso.
From IsomorphismChecker Require Checker.U_string__string__iso.

Module Type Args <: Interface.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_y__iso.Args := Checker.U_string__string__iso.Args <+ Checker.U_string__string__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_y__iso.imported_Original_LF__DOT__Imp_LF_Imp_Y Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_y__iso.Original_LF__DOT__Imp_LF_Imp_Y_iso ].

Module Checker (Import args : Args) <: Interface.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_y__iso.Interface args
  with Definition imported_Original_LF__DOT__Imp_LF_Imp_Y := Imported.Original_LF__DOT__Imp_LF_Imp_Y.

Definition imported_Original_LF__DOT__Imp_LF_Imp_Y := Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_y__iso.imported_Original_LF__DOT__Imp_LF_Imp_Y.
Definition Original_LF__DOT__Imp_LF_Imp_Y_iso := Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_y__iso.Original_LF__DOT__Imp_LF_Imp_Y_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Original_LF__DOT__Imp_LF_Imp_Y_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.