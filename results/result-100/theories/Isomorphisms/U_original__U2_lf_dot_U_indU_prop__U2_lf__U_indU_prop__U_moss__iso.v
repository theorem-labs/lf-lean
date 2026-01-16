From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_person__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_Moss : imported_Original_LF__DOT__IndProp_LF_IndProp_Person := Imported.Original_LF__DOT__IndProp_LF_IndProp_Moss.
Instance Original_LF__DOT__IndProp_LF_IndProp_Moss_iso : rel_iso Original_LF__DOT__IndProp_LF_IndProp_Person_iso Original.LF_DOT_IndProp.LF.IndProp.Moss imported_Original_LF__DOT__IndProp_LF_IndProp_Moss.
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.Moss := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_Moss := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.Moss Original_LF__DOT__IndProp_LF_IndProp_Moss_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.Moss Imported.Original_LF__DOT__IndProp_LF_IndProp_Moss Original_LF__DOT__IndProp_LF_IndProp_Moss_iso := {}.