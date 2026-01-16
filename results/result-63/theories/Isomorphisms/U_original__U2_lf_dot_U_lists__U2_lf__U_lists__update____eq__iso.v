From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__U_some__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__find__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__update__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_update__eq : forall (x : imported_Original_LF__DOT__Lists_LF_Lists_partial__map) (x0 : imported_Original_LF__DOT__Lists_LF_Lists_id) (x1 : imported_nat),
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Lists_LF_Lists_find x0 (imported_Original_LF__DOT__Lists_LF_Lists_update x x0 x1))
    (imported_Original_LF__DOT__Lists_LF_Lists_NatList_Some x1) := Imported.Original_LF__DOT__Lists_LF_Lists_update__eq.
Instance Original_LF__DOT__Lists_LF_Lists_update__eq_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.partial_map) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_partial__map) (hx : rel_iso Original_LF__DOT__Lists_LF_Lists_partial__map_iso x1 x2)
    (x3 : Original.LF_DOT_Lists.LF.Lists.id) (x4 : imported_Original_LF__DOT__Lists_LF_Lists_id) (hx0 : rel_iso Original_LF__DOT__Lists_LF_Lists_id_iso x3 x4) (x5 : nat) (x6 : imported_nat)
    (hx1 : rel_iso nat_iso x5 x6),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Lists_LF_Lists_find_iso hx0 (Original_LF__DOT__Lists_LF_Lists_update_iso hx hx0 hx1)) (Original_LF__DOT__Lists_LF_Lists_NatList_Some_iso hx1))
    (Original.LF_DOT_Lists.LF.Lists.update_eq x1 x3 x5) (imported_Original_LF__DOT__Lists_LF_Lists_update__eq x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.update_eq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_update__eq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.update_eq Original_LF__DOT__Lists_LF_Lists_update__eq_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.update_eq Imported.Original_LF__DOT__Lists_LF_Lists_update__eq Original_LF__DOT__Lists_LF_Lists_update__eq_iso := {}.