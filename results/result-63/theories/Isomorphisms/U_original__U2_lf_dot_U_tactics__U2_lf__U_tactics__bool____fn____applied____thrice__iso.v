From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso.

Definition imported_Original_LF__DOT__Tactics_LF_Tactics_bool__fn__applied__thrice : forall (x : imported_Original_LF__DOT__Basics_LF_Basics_bool -> imported_Original_LF__DOT__Basics_LF_Basics_bool) (x0 : imported_Original_LF__DOT__Basics_LF_Basics_bool),
  imported_Corelib_Init_Logic_eq (x (x (x x0))) (x x0) := Imported.Original_LF__DOT__Tactics_LF_Tactics_bool__fn__applied__thrice.
Instance Original_LF__DOT__Tactics_LF_Tactics_bool__fn__applied__thrice_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.bool -> Original.LF_DOT_Basics.LF.Basics.bool)
    (x2 : imported_Original_LF__DOT__Basics_LF_Basics_bool -> imported_Original_LF__DOT__Basics_LF_Basics_bool)
    (hx : forall (x3 : Original.LF_DOT_Basics.LF.Basics.bool) (x4 : imported_Original_LF__DOT__Basics_LF_Basics_bool),
          rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x3 x4 -> rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (x1 x3) (x2 x4))
    (x3 : Original.LF_DOT_Basics.LF.Basics.bool) (x4 : imported_Original_LF__DOT__Basics_LF_Basics_bool) (hx0 : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x3 x4),
  rel_iso (Corelib_Init_Logic_eq_iso (hx (x1 (x1 x3)) (x2 (x2 x4)) (hx (x1 x3) (x2 x4) (hx x3 x4 hx0))) (hx x3 x4 hx0)) (Original.LF_DOT_Tactics.LF.Tactics.bool_fn_applied_thrice x1 x3)
    (imported_Original_LF__DOT__Tactics_LF_Tactics_bool__fn__applied__thrice x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.bool_fn_applied_thrice := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_bool__fn__applied__thrice := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.bool_fn_applied_thrice Original_LF__DOT__Tactics_LF_Tactics_bool__fn__applied__thrice_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.bool_fn_applied_thrice Imported.Original_LF__DOT__Tactics_LF_Tactics_bool__fn__applied__thrice Original_LF__DOT__Tactics_LF_Tactics_bool__fn__applied__thrice_iso := {}.