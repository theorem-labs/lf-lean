From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__false__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__eqb____id__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__find__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__update__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_update__neq : forall (x : imported_Original_LF__DOT__Lists_LF_Lists_partial__map) (x0 x1 : imported_Original_LF__DOT__Lists_LF_Lists_id) (x2 : imported_nat),
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Lists_LF_Lists_eqb__id x0 x1) imported_Original_LF__DOT__Basics_LF_Basics_false ->
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Lists_LF_Lists_find x0 (imported_Original_LF__DOT__Lists_LF_Lists_update x x1 x2)) (imported_Original_LF__DOT__Lists_LF_Lists_find x0 x) := Imported.Original_LF__DOT__Lists_LF_Lists_update__neq.
Instance Original_LF__DOT__Lists_LF_Lists_update__neq_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.partial_map) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_partial__map) (hx : rel_iso Original_LF__DOT__Lists_LF_Lists_partial__map_iso x1 x2)
    (x3 : Original.LF_DOT_Lists.LF.Lists.id) (x4 : imported_Original_LF__DOT__Lists_LF_Lists_id) (hx0 : rel_iso Original_LF__DOT__Lists_LF_Lists_id_iso x3 x4) (x5 : Original.LF_DOT_Lists.LF.Lists.id)
    (x6 : imported_Original_LF__DOT__Lists_LF_Lists_id) (hx1 : rel_iso Original_LF__DOT__Lists_LF_Lists_id_iso x5 x6) (x7 : nat) (x8 : imported_nat) (hx2 : rel_iso nat_iso x7 x8)
    (x9 : Original.LF_DOT_Lists.LF.Lists.eqb_id x3 x5 = Original.LF_DOT_Basics.LF.Basics.false)
    (x10 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Lists_LF_Lists_eqb__id x4 x6) imported_Original_LF__DOT__Basics_LF_Basics_false),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Lists_LF_Lists_eqb__id_iso hx0 hx1) Original_LF__DOT__Basics_LF_Basics_false_iso) x9 x10 ->
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Lists_LF_Lists_find_iso hx0 (Original_LF__DOT__Lists_LF_Lists_update_iso hx hx1 hx2)) (Original_LF__DOT__Lists_LF_Lists_find_iso hx0 hx))
    (Original.LF_DOT_Lists.LF.Lists.update_neq x1 x3 x5 x7 x9) (imported_Original_LF__DOT__Lists_LF_Lists_update__neq x2 x8 x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.update_neq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_update__neq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.update_neq Original_LF__DOT__Lists_LF_Lists_update__neq_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.update_neq Imported.Original_LF__DOT__Lists_LF_Lists_update__neq Original_LF__DOT__Lists_LF_Lists_update__neq_iso := {}.