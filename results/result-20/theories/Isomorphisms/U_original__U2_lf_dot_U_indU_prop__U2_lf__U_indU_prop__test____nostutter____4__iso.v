From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__nostutter__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__not__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__4 : imported_Original_LF__DOT__IndProp_LF_IndProp_nostutter
    (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S (imported_S imported_0)))
       (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S imported_0)
          (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S imported_0)
             (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S (imported_S (iterate1 imported_S 1 imported_0)))) (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat))))) ->
  imported_Original_False := Imported.Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__4.
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__4_iso : forall
    (x1 : Original.LF_DOT_IndProp.LF.IndProp.nostutter
            (Original.LF_DOT_Poly.LF.Poly.cons 3 (Original.LF_DOT_Poly.LF.Poly.cons 1 (Original.LF_DOT_Poly.LF.Poly.cons 1 (Original.LF_DOT_Poly.LF.Poly.cons 4 Original.LF_DOT_Poly.LF.Poly.nil)))))
    (x2 : imported_Original_LF__DOT__IndProp_LF_IndProp_nostutter
            (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S (imported_S imported_0)))
               (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S imported_0)
                  (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S imported_0)
                     (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S (imported_S (iterate1 imported_S 1 imported_0)))) (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat)))))),
  rel_iso
    (Original_LF__DOT__IndProp_LF_IndProp_nostutter_iso
       (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso (S_iso _0_iso)))
          (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso _0_iso)
             (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso _0_iso)
                (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso (S O) O imported_0 _0_iso)))) (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso))))))
    x1 x2 ->
  rel_iso Original_False_iso (Original.LF_DOT_IndProp.LF.IndProp.test_nostutter_4 x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__4 x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.test_nostutter_4 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__4 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.test_nostutter_4 Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__4_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.test_nostutter_4 Imported.Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__4 Original_LF__DOT__IndProp_LF_IndProp_test__nostutter__4_iso := {}.