From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_some__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nth____error__iso Isomorphisms.__0__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_test__nth__error2 : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Poly_LF_Poly_nth__error
       (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S imported_0) (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat))
          (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S imported_0)) (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat))
             (imported_Original_LF__DOT__Poly_LF_Poly_nil (imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat))))
       (imported_S imported_0))
    (imported_Original_LF__DOT__Poly_LF_Poly_Some (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S imported_0)) (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat))) := Imported.Original_LF__DOT__Poly_LF_Poly_test__nth__error2.
Instance Original_LF__DOT__Poly_LF_Poly_test__nth__error2_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Poly_LF_Poly_nth__error_iso
          (Original_LF__DOT__Poly_LF_Poly_cons_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso _0_iso) (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso))
             (Original_LF__DOT__Poly_LF_Poly_cons_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso _0_iso)) (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso))
                (Original_LF__DOT__Poly_LF_Poly_nil_iso (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso))))
          (S_iso _0_iso))
       (Original_LF__DOT__Poly_LF_Poly_Some_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso _0_iso)) (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso))))
    Original.LF_DOT_Poly.LF.Poly.test_nth_error2 imported_Original_LF__DOT__Poly_LF_Poly_test__nth__error2.
Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.test_nth_error2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_test__nth__error2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.test_nth_error2 Original_LF__DOT__Poly_LF_Poly_test__nth__error2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.test_nth_error2 Imported.Original_LF__DOT__Poly_LF_Poly_test__nth__error2 Original_LF__DOT__Poly_LF_Poly_test__nth__error2_iso := {}.