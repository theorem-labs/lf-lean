From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export
  Isomorphisms.nat__iso.

Definition imported_S : imported_nat -> imported_nat := Imported.nat_S.
Instance S_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> rel_iso nat_iso (Datatypes.S x1) (imported_S x2).
Proof.
  intros x1 x2 H.
  constructor.
  apply (IsoEq.f_equal Imported.nat_S).
  destruct H. assumption.
Defined.
Instance: KnownConstant Datatypes.S := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.nat_S := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Datatypes.S S_iso := {}.
Instance: IsoStatementProofBetween Datatypes.S Imported.nat_S S_iso := {}.
