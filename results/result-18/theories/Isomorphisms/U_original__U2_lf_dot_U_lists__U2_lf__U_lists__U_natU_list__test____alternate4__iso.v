From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__alternate__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__cons__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__nil__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_test__alternate4 : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Lists_LF_Lists_NatList_alternate imported_Original_LF__DOT__Lists_LF_Lists_NatList_nil
       (imported_Original_LF__DOT__Lists_LF_Lists_NatList_cons (imported_S (imported_S (imported_S (iterate1 imported_S 17 imported_0))))
          (imported_Original_LF__DOT__Lists_LF_Lists_NatList_cons (imported_S (imported_S (imported_S (iterate1 imported_S 27 imported_0)))) imported_Original_LF__DOT__Lists_LF_Lists_NatList_nil)))
    (imported_Original_LF__DOT__Lists_LF_Lists_NatList_cons (imported_S (imported_S (imported_S (iterate1 imported_S 17 imported_0))))
       (imported_Original_LF__DOT__Lists_LF_Lists_NatList_cons (imported_S (imported_S (imported_S (iterate1 imported_S 27 imported_0)))) imported_Original_LF__DOT__Lists_LF_Lists_NatList_nil)) := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_test__alternate4.
Monomorphic Instance Original_LF__DOT__Lists_LF_Lists_NatList_test__alternate4_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Lists_LF_Lists_NatList_alternate_iso Original_LF__DOT__Lists_LF_Lists_NatList_nil_iso
          (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 17 0 imported_0 _0_iso))))
             (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 27 0 imported_0 _0_iso)))) Original_LF__DOT__Lists_LF_Lists_NatList_nil_iso)))
       (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 17 0 imported_0 _0_iso))))
          (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 27 0 imported_0 _0_iso)))) Original_LF__DOT__Lists_LF_Lists_NatList_nil_iso)))
    Original.LF_DOT_Lists.LF.Lists.NatList.test_alternate4 imported_Original_LF__DOT__Lists_LF_Lists_NatList_test__alternate4.
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.test_alternate4 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_test__alternate4 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.test_alternate4 Original_LF__DOT__Lists_LF_Lists_NatList_test__alternate4_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.test_alternate4 Imported.Original_LF__DOT__Lists_LF_Lists_NatList_test__alternate4 Original_LF__DOT__Lists_LF_Lists_NatList_test__alternate4_iso := {}.