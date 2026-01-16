From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__filter__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso.

Definition imported_Original_LF__DOT__Tactics_LF_Tactics_filter__exercise : forall (x : Type) (x0 : x -> imported_Original_LF__DOT__Basics_LF_Basics_bool) (x1 : x) (x2 x3 : imported_Original_LF__DOT__Poly_LF_Poly_list x),
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_filter (fun x4 : x => x0 x4) x2) (imported_Original_LF__DOT__Poly_LF_Poly_cons x1 x3) ->
  imported_Corelib_Init_Logic_eq (x0 x1) imported_Original_LF__DOT__Basics_LF_Basics_true := Imported.Original_LF__DOT__Tactics_LF_Tactics_filter__exercise.
Instance Original_LF__DOT__Tactics_LF_Tactics_filter__exercise_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1 -> Original.LF_DOT_Basics.LF.Basics.bool) (x4 : x2 -> imported_Original_LF__DOT__Basics_LF_Basics_bool)
    (hx0 : forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (x3 x5) (x4 x6)) (x5 : x1) (x6 : x2) (hx1 : rel_iso hx x5 x6)
    (x7 : Original.LF_DOT_Poly.LF.Poly.list x1) (x8 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx2 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x7 x8)
    (x9 : Original.LF_DOT_Poly.LF.Poly.list x1) (x10 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx3 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x9 x10)
    (x11 : Original.LF_DOT_Poly.LF.Poly.filter x3 x7 = Original.LF_DOT_Poly.LF.Poly.cons x5 x9)
    (x12 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_filter (fun x : x2 => x4 x) x8) (imported_Original_LF__DOT__Poly_LF_Poly_cons x6 x10)),
  rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Poly_LF_Poly_filter_iso x3 (fun x : x2 => x4 x) (fun (x13 : x1) (x14 : x2) (hx4 : rel_iso hx x13 x14) => hx0 x13 x14 hx4) hx2)
       (Original_LF__DOT__Poly_LF_Poly_cons_iso hx1 hx3))
    x11 x12 ->
  rel_iso (Corelib_Init_Logic_eq_iso (hx0 x5 x6 hx1) Original_LF__DOT__Basics_LF_Basics_true_iso) (Original.LF_DOT_Tactics.LF.Tactics.filter_exercise x1 x3 x5 x7 x9 x11)
    (imported_Original_LF__DOT__Tactics_LF_Tactics_filter__exercise x4 x12).
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.filter_exercise := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_filter__exercise := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.filter_exercise Original_LF__DOT__Tactics_LF_Tactics_filter__exercise_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.filter_exercise Imported.Original_LF__DOT__Tactics_LF_Tactics_filter__exercise Original_LF__DOT__Tactics_LF_Tactics_filter__exercise_iso := {}.