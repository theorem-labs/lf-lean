From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__fst__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__pair__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__snd__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__swap____pair__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_snd__fst__is__swap : forall x : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natprod,
  imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Lists_LF_Lists_NatList_pair (imported_Original_LF__DOT__Lists_LF_Lists_NatList_snd x) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_fst x))
    (imported_Original_LF__DOT__Lists_LF_Lists_NatList_swap__pair x) := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_snd__fst__is__swap.
Instance Original_LF__DOT__Lists_LF_Lists_NatList_snd__fst__is__swap_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.NatList.natprod) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natprod)
    (hx : rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natprod_iso x1 x2),
  rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Lists_LF_Lists_NatList_pair_iso (Original_LF__DOT__Lists_LF_Lists_NatList_snd_iso hx) (Original_LF__DOT__Lists_LF_Lists_NatList_fst_iso hx))
       (Original_LF__DOT__Lists_LF_Lists_NatList_swap__pair_iso hx))
    (Original.LF_DOT_Lists.LF.Lists.NatList.snd_fst_is_swap x1) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_snd__fst__is__swap x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.snd_fst_is_swap := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_snd__fst__is__swap := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.snd_fst_is_swap Original_LF__DOT__Lists_LF_Lists_NatList_snd__fst__is__swap_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.snd_fst_is_swap Imported.Original_LF__DOT__Lists_LF_Lists_NatList_snd__fst__is__swap Original_LF__DOT__Lists_LF_Lists_NatList_snd__fst__is__swap_iso := {}.