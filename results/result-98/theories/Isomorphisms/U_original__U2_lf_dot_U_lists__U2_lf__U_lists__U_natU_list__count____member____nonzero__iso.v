From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__leb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__cons__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__count__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_count__member__nonzero : forall x : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist,
  imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Basics_LF_Basics_leb (imported_S imported_0)
       (imported_Original_LF__DOT__Lists_LF_Lists_NatList_count (imported_S imported_0) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_cons (imported_S imported_0) x)))
    imported_Original_LF__DOT__Basics_LF_Basics_true := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_count__member__nonzero.
Instance Original_LF__DOT__Lists_LF_Lists_NatList_count__member__nonzero_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.NatList.bag) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist) (hx : rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x1 x2),
  rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Basics_LF_Basics_leb_iso (S_iso _0_iso)
          (Original_LF__DOT__Lists_LF_Lists_NatList_count_iso (S_iso _0_iso) (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso (S_iso _0_iso) hx)))
       Original_LF__DOT__Basics_LF_Basics_true_iso)
    (Original.LF_DOT_Lists.LF.Lists.NatList.count_member_nonzero x1) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_count__member__nonzero x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.count_member_nonzero := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_count__member__nonzero := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.count_member_nonzero Original_LF__DOT__Lists_LF_Lists_NatList_count__member__nonzero_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.count_member_nonzero Imported.Original_LF__DOT__Lists_LF_Lists_NatList_count__member__nonzero Original_LF__DOT__Lists_LF_Lists_NatList_count__member__nonzero_iso := {}.