From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.


Definition imported_nat : Type := Imported.nat.

(* Conversion functions between nat and Imported.nat *)
Fixpoint nat_to_imported (n : nat) : Imported.nat :=
  match n with
  | O => Imported.nat_O
  | S m => Imported.nat_S (nat_to_imported m)
  end.

Fixpoint imported_to_nat (n : Imported.nat) : nat :=
  match n with
  | Imported.nat_O => O
  | Imported.nat_S m => S (imported_to_nat m)
  end.

(* Prove round-trip properties using SProp eq *)
Lemma to_from_nat : forall n : Imported.nat, IsomorphismDefinitions.eq (nat_to_imported (imported_to_nat n)) n.
Proof.
  fix IH 1.
  intros n.
  destruct n as [|m].
  - apply IsomorphismDefinitions.eq_refl.
  - simpl. apply f_equal. apply IH.
Defined.

Lemma from_to_nat : forall n : nat, IsomorphismDefinitions.eq (imported_to_nat (nat_to_imported n)) n.
Proof.
  fix IH 1.
  intros n.
  destruct n as [|m].
  - apply IsomorphismDefinitions.eq_refl.
  - simpl. apply f_equal. apply IH.
Defined.

Instance nat_iso : Iso nat imported_nat :=
  Build_Iso nat_to_imported imported_to_nat to_from_nat from_to_nat.

(* Additional Logic.eq roundtrip lemmas for use in other files *)
Lemma nat_roundtrip : forall n : nat, Logic.eq (imported_to_nat (nat_to_imported n)) n.
Proof.
  fix IH 1.
  intros n. destruct n as [|m].
  - reflexivity.
  - simpl. apply Logic.f_equal. apply IH.
Qed.

Lemma imported_nat_roundtrip : forall n : Imported.nat, Logic.eq (nat_to_imported (imported_to_nat n)) n.
Proof.
  fix IH 1.
  intros n. destruct n as [|m].
  - reflexivity.
  - simpl. apply Logic.f_equal. apply IH.
Qed.

Instance: KnownConstant nat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.nat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor nat nat_iso := {}.
Instance: IsoStatementProofBetween nat Imported.nat nat_iso := {}.
