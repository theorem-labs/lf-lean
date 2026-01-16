From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_PeanoNat_Nat_add : imported_nat -> imported_nat -> imported_nat := Imported.PeanoNat_Nat_add.
Instance PeanoNat_Nat_add_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> rel_iso nat_iso (x1 + x3) (imported_PeanoNat_Nat_add x2 x4).
Admitted.
Instance: KnownConstant PeanoNat.Nat.add := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.PeanoNat_Nat_add := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor PeanoNat.Nat.add PeanoNat_Nat_add_iso := {}.
Instance: IsoStatementProofBetween PeanoNat.Nat.add Imported.PeanoNat_Nat_add PeanoNat_Nat_add_iso := {}.