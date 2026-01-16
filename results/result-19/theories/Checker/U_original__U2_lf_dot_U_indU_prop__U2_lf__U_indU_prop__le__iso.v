From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__le__iso.
From IsomorphismChecker Require Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__le__iso.
From IsomorphismChecker Require Checker.nat__iso.

Module Type Args <: Interface.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__le__iso.Args := Checker.nat__iso.Args <+ Checker.nat__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__le__iso.imported_Original_LF__DOT__IndProp_LF_IndProp_le Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__le__iso.Original_LF__DOT__IndProp_LF_IndProp_le_iso ].

Module Checker (Import args : Args) <: Interface.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__le__iso.Interface args
  with Definition imported_Original_LF__DOT__IndProp_LF_IndProp_le := Imported.Original_LF__DOT__IndProp_LF_IndProp_le.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_le := Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__le__iso.imported_Original_LF__DOT__IndProp_LF_IndProp_le.
Definition Original_LF__DOT__IndProp_LF_IndProp_le_iso := Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__le__iso.Original_LF__DOT__IndProp_LF_IndProp_le_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Original_LF__DOT__IndProp_LF_IndProp_le_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.