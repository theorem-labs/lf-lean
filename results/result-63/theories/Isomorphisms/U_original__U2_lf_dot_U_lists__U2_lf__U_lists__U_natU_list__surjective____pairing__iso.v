From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__fst__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__pair__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__snd__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_surjective__pairing : forall x : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natprod,
  imported_Corelib_Init_Logic_eq x
    (imported_Original_LF__DOT__Lists_LF_Lists_NatList_pair (imported_Original_LF__DOT__Lists_LF_Lists_NatList_fst x) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_snd x)) := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_surjective__pairing.
Instance Original_LF__DOT__Lists_LF_Lists_NatList_surjective__pairing_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.NatList.natprod) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natprod)
    (hx : rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natprod_iso x1 x2),
  rel_iso
    (Corelib_Init_Logic_eq_iso hx (Original_LF__DOT__Lists_LF_Lists_NatList_pair_iso (Original_LF__DOT__Lists_LF_Lists_NatList_fst_iso hx) (Original_LF__DOT__Lists_LF_Lists_NatList_snd_iso hx)))
    (Original.LF_DOT_Lists.LF.Lists.NatList.surjective_pairing x1) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_surjective__pairing x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.surjective_pairing := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_surjective__pairing := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.surjective_pairing Original_LF__DOT__Lists_LF_Lists_NatList_surjective__pairing_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.surjective_pairing Imported.Original_LF__DOT__Lists_LF_Lists_NatList_surjective__pairing Original_LF__DOT__Lists_LF_Lists_NatList_surjective__pairing_iso := {}.