From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_S : imported_nat -> imported_nat := Imported.S.
Instance S_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> rel_iso nat_iso (S x1) (imported_S x2).
Proof.
  intros x1 x2 Hrel.
  unfold imported_S.
  constructor. simpl.
  apply (IsoEq.f_equal Imported.nat_S).
  exact (proj_rel_iso Hrel).
Defined.
Instance: KnownConstant S := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.S := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor S S_iso := {}.
Instance: IsoStatementProofBetween S Imported.S S_iso := {}.