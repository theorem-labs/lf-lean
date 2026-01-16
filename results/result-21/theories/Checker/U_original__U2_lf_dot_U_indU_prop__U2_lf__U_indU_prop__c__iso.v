From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__c__iso.
From IsomorphismChecker Require Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__c__iso.
From IsomorphismChecker Require Checker.U_ascii__ascii__iso.

Module Type Args <: Interface.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__c__iso.Args := Checker.U_ascii__ascii__iso.Args <+ Checker.U_ascii__ascii__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__c__iso.imported_Original_LF__DOT__IndProp_LF_IndProp_c Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__c__iso.Original_LF__DOT__IndProp_LF_IndProp_c_iso ].

Module Checker (Import args : Args) <: Interface.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__c__iso.Interface args
  with Definition imported_Original_LF__DOT__IndProp_LF_IndProp_c := Imported.Original_LF__DOT__IndProp_LF_IndProp_c.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_c := Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__c__iso.imported_Original_LF__DOT__IndProp_LF_IndProp_c.
Definition Original_LF__DOT__IndProp_LF_IndProp_c_iso := Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__c__iso.Original_LF__DOT__IndProp_LF_IndProp_c_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Original_LF__DOT__IndProp_LF_IndProp_c_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.