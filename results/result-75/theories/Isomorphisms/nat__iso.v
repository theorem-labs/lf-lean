From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


Monomorphic Definition imported_nat : Type := Imported.nat.

Fixpoint nat_to_imported (n : nat) : imported_nat :=
  match n with
  | O => Imported.nat_O
  | Datatypes.S n' => Imported.nat_S (nat_to_imported n')
  end.

Fixpoint imported_to_nat (n : imported_nat) : nat :=
  match n with
  | Imported.nat_O => O
  | Imported.nat_S n' => Datatypes.S (imported_to_nat n')
  end.

Monomorphic Lemma nat_to_from : forall x : imported_nat, IsomorphismDefinitions.eq (nat_to_imported (imported_to_nat x)) x.
Proof.
  fix IH 1.
  intros x. destruct x.
  - apply IsomorphismDefinitions.eq_refl.
  - simpl. apply IsoEq.f_equal. apply IH.
Defined.

Monomorphic Lemma nat_from_to : forall x : nat, IsomorphismDefinitions.eq (imported_to_nat (nat_to_imported x)) x.
Proof.
  fix IH 1.
  intros x. destruct x.
  - apply IsomorphismDefinitions.eq_refl.
  - simpl. apply IsoEq.f_equal. apply IH.
Defined.

(* Logic.eq versions for use in other proofs *)
Monomorphic Lemma nat_roundtrip : forall x : nat, Logic.eq (imported_to_nat (nat_to_imported x)) x.
Proof.
  fix IH 1.
  intros x. destruct x.
  - reflexivity.
  - simpl. apply Logic.f_equal. apply IH.
Qed.

Monomorphic Lemma imported_nat_roundtrip : forall x : Imported.nat, Logic.eq (nat_to_imported (imported_to_nat x)) x.
Proof.
  fix IH 1.
  intros x. destruct x.
  - reflexivity.
  - simpl. apply Logic.f_equal. apply IH.
Qed.

Monomorphic Instance nat_iso : Iso nat imported_nat :=
  Build_Iso nat_to_imported imported_to_nat nat_to_from nat_from_to.

Instance: KnownConstant nat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.nat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor nat nat_iso := {}.
Instance: IsoStatementProofBetween nat Imported.nat nat_iso := {}.