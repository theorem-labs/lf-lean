From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.bool__iso Isomorphisms.nat__iso.

Definition imported_PeanoNat_Nat_leb : imported_nat -> imported_nat -> imported_bool := Imported.PeanoNat_Nat_leb.
Instance PeanoNat_Nat_leb_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 -> forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> rel_iso bool_iso (PeanoNat.Nat.leb x1 x3) (imported_PeanoNat_Nat_leb x2 x4).
Admitted.
Instance: KnownConstant PeanoNat.Nat.leb := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.PeanoNat_Nat_leb := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor PeanoNat.Nat.leb PeanoNat_Nat_leb_iso := {}.
Instance: IsoStatementProofBetween PeanoNat.Nat.leb Imported.PeanoNat_Nat_leb PeanoNat_Nat_leb_iso := {}.