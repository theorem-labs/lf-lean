From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__nostutter__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__2 : imported_Original_LF__DOT__IndProp_LF_IndProp_nostutter (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat) := Imported.Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__2.
Instance Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__2_iso : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_nostutter_iso (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso)) Original.LF_DOT_IndProp.LF.IndProp.test_nostutter_2
    imported_Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__2.
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.test_nostutter_2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.test_nostutter_2 Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.test_nostutter_2 Imported.Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__2 Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__2_iso := {}.