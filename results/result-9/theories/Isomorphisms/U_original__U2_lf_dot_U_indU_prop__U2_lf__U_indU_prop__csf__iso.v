From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__even__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__div2__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_csf : imported_nat -> imported_nat := Imported.Original_LF__DOT__IndProp_LF_IndProp_csf.

Instance Original_LF__DOT__IndProp_LF_IndProp_csf_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> rel_iso nat_iso (Original.LF_DOT_IndProp.LF.IndProp.csf x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_csf x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.csf := {}.
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_csf := {}.
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.csf Original_LF__DOT__IndProp_LF_IndProp_csf_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.csf Imported.Original_LF__DOT__IndProp_LF_IndProp_csf Original_LF__DOT__IndProp_LF_IndProp_csf_iso := {}.
