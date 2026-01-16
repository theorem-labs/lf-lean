From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__nostutter__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.__0__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__1 : imported_Original_LF__DOT__IndProp_LF_IndProp_nostutter
    (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S (imported_S imported_0)))
       (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S imported_0)
          (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S (imported_S (iterate1 imported_S 1 imported_0))))
             (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S imported_0)
                (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S (imported_S (iterate1 imported_S 2 imported_0))))
                   (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S (imported_S (iterate1 imported_S 3 imported_0)))) (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat))))))) := Imported.Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__1.
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__1_iso : rel_iso
    (Original_LF__DOT__IndProp_LF_IndProp_nostutter_iso
       (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso (S_iso _0_iso)))
          (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso _0_iso)
             (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso (S O) O imported_0 _0_iso))))
                (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso _0_iso)
                   (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso (S (S O)) O imported_0 _0_iso))))
                      (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso (S (S (S O))) O imported_0 _0_iso)))) (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso))))))))
    Original.LF_DOT_IndProp.LF.IndProp.test_nostutter_1 imported_Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__1.
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.test_nostutter_1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.test_nostutter_1 Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.test_nostutter_1 Imported.Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__1 Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__1_iso := {}.