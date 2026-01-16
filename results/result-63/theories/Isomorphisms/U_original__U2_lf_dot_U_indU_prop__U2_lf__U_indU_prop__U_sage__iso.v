From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_person__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_Sage : imported_Original_LF__DOT__IndProp_LF_IndProp_Person := Imported.Original_LF__DOT__IndProp_LF_IndProp_Sage.
Instance Original_LF__DOT__IndProp_LF_IndProp_Sage_iso : rel_iso Original_LF__DOT__IndProp_LF_IndProp_Person_iso Original.LF_DOT_IndProp.LF.IndProp.Sage imported_Original_LF__DOT__IndProp_LF_IndProp_Sage.
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.Sage := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_Sage := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.Sage Original_LF__DOT__IndProp_LF_IndProp_Sage_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.Sage Imported.Original_LF__DOT__IndProp_LF_IndProp_Sage Original_LF__DOT__IndProp_LF_IndProp_Sage_iso := {}.