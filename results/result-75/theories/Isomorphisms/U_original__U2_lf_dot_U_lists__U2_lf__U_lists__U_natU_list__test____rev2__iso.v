From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__nil__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__rev__iso.

Monomorphic Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_test__rev2 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Lists_LF_Lists_NatList_rev imported_Original_LF__DOT__Lists_LF_Lists_NatList_nil) imported_Original_LF__DOT__Lists_LF_Lists_NatList_nil := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_test__rev2.
Monomorphic Instance Original_LF__DOT__Lists_LF_Lists_NatList_test__rev2_iso : rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Lists_LF_Lists_NatList_rev_iso Original_LF__DOT__Lists_LF_Lists_NatList_nil_iso) Original_LF__DOT__Lists_LF_Lists_NatList_nil_iso)
    Original.LF_DOT_Lists.LF.Lists.NatList.test_rev2 imported_Original_LF__DOT__Lists_LF_Lists_NatList_test__rev2.
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.test_rev2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_test__rev2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.test_rev2 Original_LF__DOT__Lists_LF_Lists_NatList_test__rev2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.test_rev2 Imported.Original_LF__DOT__Lists_LF_Lists_NatList_test__rev2 Original_LF__DOT__Lists_LF_Lists_NatList_test__rev2_iso := {}.