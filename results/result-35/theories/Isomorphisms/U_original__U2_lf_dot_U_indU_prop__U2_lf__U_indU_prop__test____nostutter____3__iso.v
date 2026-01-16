From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__nostutter__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.__0__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__3 : imported_Original_LF__DOT__IndProp_LF_IndProp_nostutter
    (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S (imported_S (iterate1 imported_S 2 imported_0)))) (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat)) := Imported.Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__3.
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__3_iso : rel_iso
    (Original_LF__DOT__IndProp_LF_IndProp_nostutter_iso
       (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 2 0 imported_0 _0_iso)))) (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso)))
    Original.LF_DOT_IndProp.LF.IndProp.test_nostutter_3 imported_Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__3.
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.test_nostutter_3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.test_nostutter_3 Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__3_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.test_nostutter_3 Imported.Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__3 Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__3_iso := {}.