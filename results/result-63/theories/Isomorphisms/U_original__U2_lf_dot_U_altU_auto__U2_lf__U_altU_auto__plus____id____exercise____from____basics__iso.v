From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_nat__add__iso.

Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_plus__id__exercise__from__basics : forall x x0 x1 : imported_nat, imported_Corelib_Init_Logic_eq x x0 -> imported_Corelib_Init_Logic_eq x0 x1 -> imported_Corelib_Init_Logic_eq (imported_Nat_add x x0) (imported_Nat_add x0 x1) := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_plus__id__exercise__from__basics.
Instance Original_LF__DOT__AltAuto_LF_AltAuto_plus__id__exercise__from__basics_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6)
    (x7 : x1 = x3) (x8 : imported_Corelib_Init_Logic_eq x2 x4),
  rel_iso (Corelib_Init_Logic_eq_iso hx hx0) x7 x8 ->
  forall (x9 : x3 = x5) (x10 : imported_Corelib_Init_Logic_eq x4 x6),
  rel_iso (Corelib_Init_Logic_eq_iso hx0 hx1) x9 x10 ->
  rel_iso (Corelib_Init_Logic_eq_iso (Nat_add_iso hx hx0) (Nat_add_iso hx0 hx1)) (Original.LF_DOT_AltAuto.LF.AltAuto.plus_id_exercise_from_basics x1 x3 x5 x7 x9)
    (imported_Original_LF__DOT__AltAuto_LF_AltAuto_plus__id__exercise__from__basics x8 x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.plus_id_exercise_from_basics := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_plus__id__exercise__from__basics := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.plus_id_exercise_from_basics Original_LF__DOT__AltAuto_LF_AltAuto_plus__id__exercise__from__basics_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.plus_id_exercise_from_basics Imported.Original_LF__DOT__AltAuto_LF_AltAuto_plus__id__exercise__from__basics Original_LF__DOT__AltAuto_LF_AltAuto_plus__id__exercise__from__basics_iso := {}.