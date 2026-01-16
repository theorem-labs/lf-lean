From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__eqblist__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_eqblist__refl : forall x : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist,
  imported_Corelib_Init_Logic_eq imported_Original_LF__DOT__Basics_LF_Basics_true (imported_Original_LF__DOT__Lists_LF_Lists_NatList_eqblist x x) := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_eqblist__refl.
Instance Original_LF__DOT__Lists_LF_Lists_NatList_eqblist__refl_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist)
    (hx : rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x1 x2),
  rel_iso (Corelib_Init_Logic_eq_iso Original_LF__DOT__Basics_LF_Basics_true_iso (Original_LF__DOT__Lists_LF_Lists_NatList_eqblist_iso hx hx)) (Original.LF_DOT_Lists.LF.Lists.NatList.eqblist_refl x1)
    (imported_Original_LF__DOT__Lists_LF_Lists_NatList_eqblist__refl x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.eqblist_refl := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_eqblist__refl := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.eqblist_refl Original_LF__DOT__Lists_LF_Lists_NatList_eqblist__refl_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.eqblist_refl Imported.Original_LF__DOT__Lists_LF_Lists_NatList_eqblist__refl Original_LF__DOT__Lists_LF_Lists_NatList_eqblist__refl_iso := {}.