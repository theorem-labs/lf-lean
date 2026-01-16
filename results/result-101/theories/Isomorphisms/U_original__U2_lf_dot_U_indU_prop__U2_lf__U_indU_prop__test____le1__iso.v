From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.__0__iso Isomorphisms.U_s__iso Isomorphisms.le__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_test__le1 : imported_le (imported_S (imported_S (imported_S imported_0))) (imported_S (imported_S (imported_S imported_0))) := Imported.Original_LF__DOT__IndProp_LF_IndProp_test__le1.
Instance Original_LF__DOT__IndProp_LF_IndProp_test__le1_iso : rel_iso (le_iso (S_iso (S_iso (S_iso _0_iso))) (S_iso (S_iso (S_iso _0_iso)))) Original.LF_DOT_IndProp.LF.IndProp.test_le1 imported_Original_LF__DOT__IndProp_LF_IndProp_test__le1.
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.test_le1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_test__le1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.test_le1 Original_LF__DOT__IndProp_LF_IndProp_test__le1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.test_le1 Imported.Original_LF__DOT__IndProp_LF_IndProp_test__le1 Original_LF__DOT__IndProp_LF_IndProp_test__le1_iso := {}.