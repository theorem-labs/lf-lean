From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.le__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_le__trans : forall x x0 x1 : imported_nat, imported_le x x0 -> imported_le x0 x1 -> imported_le x x1 := Imported.Original_LF__DOT__IndProp_LF_IndProp_le__trans.
Instance Original_LF__DOT__IndProp_LF_IndProp_le__trans_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6)
    (x7 : x1 <= x3) (x8 : imported_le x2 x4),
  rel_iso (le_iso hx hx0) x7 x8 ->
  forall (x9 : x3 <= x5) (x10 : imported_le x4 x6),
  rel_iso (le_iso hx0 hx1) x9 x10 -> rel_iso (le_iso hx hx1) (Original.LF_DOT_IndProp.LF.IndProp.le_trans x1 x3 x5 x7 x9) (imported_Original_LF__DOT__IndProp_LF_IndProp_le__trans x8 x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.le_trans := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_le__trans := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.le_trans Original_LF__DOT__IndProp_LF_IndProp_le__trans_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.le_trans Imported.Original_LF__DOT__IndProp_LF_IndProp_le__trans Original_LF__DOT__IndProp_LF_IndProp_le__trans_iso := {}.