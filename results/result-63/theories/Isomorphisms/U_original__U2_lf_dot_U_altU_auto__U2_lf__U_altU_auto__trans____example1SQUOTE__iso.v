From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.__0__iso Isomorphisms.U_nat__add__iso Isomorphisms.U_nat__mul__iso Isomorphisms.U_s__iso Isomorphisms.le__iso.

Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_trans__example1' : forall x x0 x1 x2 : imported_nat,
  imported_le x (imported_Nat_add x0 (imported_Nat_mul x0 x1)) -> imported_le (imported_Nat_mul (imported_Nat_add (imported_S imported_0) x1) x0) x2 -> imported_le x x2 := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_trans__example1'.
Instance Original_LF__DOT__AltAuto_LF_AltAuto_trans__example1'_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6)
    (x7 : nat) (x8 : imported_nat) (hx2 : rel_iso nat_iso x7 x8) (x9 : x1 <= x3 + x3 * x5) (x10 : imported_le x2 (imported_Nat_add x4 (imported_Nat_mul x4 x6))),
  rel_iso (le_iso hx (Nat_add_iso hx0 (Nat_mul_iso hx0 hx1))) x9 x10 ->
  forall (x11 : (1 + x5) * x3 <= x7) (x12 : imported_le (imported_Nat_mul (imported_Nat_add (imported_S imported_0) x6) x4) x8),
  rel_iso (le_iso (Nat_mul_iso (Nat_add_iso (S_iso _0_iso) hx1) hx0) hx2) x11 x12 ->
  rel_iso (le_iso hx hx2) (Original.LF_DOT_AltAuto.LF.AltAuto.trans_example1' x1 x3 x5 x7 x9 x11) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_trans__example1' x10 x12).
Admitted.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.trans_example1' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_trans__example1' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.trans_example1' Original_LF__DOT__AltAuto_LF_AltAuto_trans__example1'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.trans_example1' Imported.Original_LF__DOT__AltAuto_LF_AltAuto_trans__example1' Original_LF__DOT__AltAuto_LF_AltAuto_trans__example1'_iso := {}.