From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Nat_pred : imported_nat -> imported_nat := Imported.nat_pred.
Instance Nat_pred_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> rel_iso nat_iso (Nat.pred x1) (imported_Nat_pred x2).
Admitted.
Instance: KnownConstant Nat.pred := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.nat_pred := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Nat.pred Nat_pred_iso := {}.
Instance: IsoStatementProofBetween Nat.pred Imported.nat_pred Nat_pred_iso := {}.