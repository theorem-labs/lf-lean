From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_nat__add__iso Isomorphisms.U_nat__mul__iso Isomorphisms.le__iso.

Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_trans__example2 : forall x x0 x1 x2 : imported_nat, imported_le x (imported_Nat_add x0 (imported_Nat_mul x0 x1)) -> imported_le (imported_Nat_add x0 (imported_Nat_mul x0 x1)) x2 -> imported_le x x2 := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_trans__example2.
Instance Original_LF__DOT__AltAuto_LF_AltAuto_trans__example2_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6)
    (x7 : nat) (x8 : imported_nat) (hx2 : rel_iso nat_iso x7 x8) (x9 : x1 <= x3 + x3 * x5) (x10 : imported_le x2 (imported_Nat_add x4 (imported_Nat_mul x4 x6))),
  rel_iso (le_iso hx (Nat_add_iso hx0 (Nat_mul_iso hx0 hx1))) x9 x10 ->
  forall (x11 : x3 + x3 * x5 <= x7) (x12 : imported_le (imported_Nat_add x4 (imported_Nat_mul x4 x6)) x8),
  rel_iso (le_iso (Nat_add_iso hx0 (Nat_mul_iso hx0 hx1)) hx2) x11 x12 ->
  rel_iso (le_iso hx hx2) (Original.LF_DOT_AltAuto.LF.AltAuto.trans_example2 x1 x3 x5 x7 x9 x11) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_trans__example2 x10 x12).
Admitted.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.trans_example2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_trans__example2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.trans_example2 Original_LF__DOT__AltAuto_LF_AltAuto_trans__example2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.trans_example2 Imported.Original_LF__DOT__AltAuto_LF_AltAuto_trans__example2 Original_LF__DOT__AltAuto_LF_AltAuto_trans__example2_iso := {}.