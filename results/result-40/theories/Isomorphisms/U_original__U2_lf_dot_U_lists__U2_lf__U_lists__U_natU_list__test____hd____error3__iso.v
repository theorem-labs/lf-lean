From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__U_some__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__cons__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__hd____error__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__nil__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_test__hd__error3 : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Lists_LF_Lists_NatList_hd__error
       (imported_Original_LF__DOT__Lists_LF_Lists_NatList_cons (imported_S (imported_S (imported_S (iterate1 imported_S 2 imported_0))))
          (imported_Original_LF__DOT__Lists_LF_Lists_NatList_cons (imported_S (imported_S (imported_S (iterate1 imported_S 3 imported_0)))) imported_Original_LF__DOT__Lists_LF_Lists_NatList_nil)))
    (imported_Original_LF__DOT__Lists_LF_Lists_NatList_Some (imported_S (imported_S (imported_S (iterate1 imported_S 2 imported_0))))) := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_test__hd__error3.
Monomorphic Instance Original_LF__DOT__Lists_LF_Lists_NatList_test__hd__error3_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Lists_LF_Lists_NatList_hd__error_iso
          (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 2 O imported_0 _0_iso))))
             (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 3 O imported_0 _0_iso)))) Original_LF__DOT__Lists_LF_Lists_NatList_nil_iso)))
       (Original_LF__DOT__Lists_LF_Lists_NatList_Some_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 2 O imported_0 _0_iso))))))
    Original.LF_DOT_Lists.LF.Lists.NatList.test_hd_error3 imported_Original_LF__DOT__Lists_LF_Lists_NatList_test__hd__error3.
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.test_hd_error3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_test__hd__error3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.test_hd_error3 Original_LF__DOT__Lists_LF_Lists_NatList_test__hd__error3_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.test_hd_error3 Imported.Original_LF__DOT__Lists_LF_Lists_NatList_test__hd__error3 Original_LF__DOT__Lists_LF_Lists_NatList_test__hd__error3_iso := {}.