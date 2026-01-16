From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__app__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__nil__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_app__nil__r : forall x : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Lists_LF_Lists_NatList_app x imported_Original_LF__DOT__Lists_LF_Lists_NatList_nil) x := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_app__nil__r.
Instance Original_LF__DOT__Lists_LF_Lists_NatList_app__nil__r_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist)
    (hx : rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x1 x2),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Lists_LF_Lists_NatList_app_iso hx Original_LF__DOT__Lists_LF_Lists_NatList_nil_iso) hx) (Original.LF_DOT_Lists.LF.Lists.NatList.app_nil_r x1)
    (imported_Original_LF__DOT__Lists_LF_Lists_NatList_app__nil__r x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.app_nil_r := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_app__nil__r := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.app_nil_r Original_LF__DOT__Lists_LF_Lists_NatList_app__nil__r_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.app_nil_r Imported.Original_LF__DOT__Lists_LF_Lists_NatList_app__nil__r Original_LF__DOT__Lists_LF_Lists_NatList_app__nil__r_iso := {}.