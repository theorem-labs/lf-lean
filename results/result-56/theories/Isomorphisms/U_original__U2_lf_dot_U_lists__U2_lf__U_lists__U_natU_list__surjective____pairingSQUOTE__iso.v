From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__fst__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__pair__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__snd__iso.

Monomorphic Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_surjective__pairing' : forall x x0 : imported_nat,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Lists_LF_Lists_NatList_pair x x0)
    (imported_Original_LF__DOT__Lists_LF_Lists_NatList_pair (imported_Original_LF__DOT__Lists_LF_Lists_NatList_fst (imported_Original_LF__DOT__Lists_LF_Lists_NatList_pair x x0))
       (imported_Original_LF__DOT__Lists_LF_Lists_NatList_snd (imported_Original_LF__DOT__Lists_LF_Lists_NatList_pair x x0))) := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_surjective__pairing'.
Monomorphic Instance Original_LF__DOT__Lists_LF_Lists_NatList_surjective__pairing'_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4),
  rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Lists_LF_Lists_NatList_pair_iso hx hx0)
       (Original_LF__DOT__Lists_LF_Lists_NatList_pair_iso (Original_LF__DOT__Lists_LF_Lists_NatList_fst_iso (Original_LF__DOT__Lists_LF_Lists_NatList_pair_iso hx hx0))
          (Original_LF__DOT__Lists_LF_Lists_NatList_snd_iso (Original_LF__DOT__Lists_LF_Lists_NatList_pair_iso hx hx0))))
    (Original.LF_DOT_Lists.LF.Lists.NatList.surjective_pairing' x1 x3) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_surjective__pairing' x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.surjective_pairing' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_surjective__pairing' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.surjective_pairing' Original_LF__DOT__Lists_LF_Lists_NatList_surjective__pairing'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.surjective_pairing' Imported.Original_LF__DOT__Lists_LF_Lists_NatList_surjective__pairing' Original_LF__DOT__Lists_LF_Lists_NatList_surjective__pairing'_iso := {}.