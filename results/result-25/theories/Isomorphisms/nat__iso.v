From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. (* for speed *) *)


Definition imported_nat : Type := Imported.nat.

(* Forward and backward conversions between nat and Imported.nat *)
Fixpoint nat_to_imported (n : nat) : Imported.nat :=
  match n with
  | O => Imported.nat_O
  | Datatypes.S n' => Imported.nat_S (nat_to_imported n')
  end.

Fixpoint imported_to_nat (n : Imported.nat) : nat :=
  match n with
  | Imported.nat_O => O
  | Imported.nat_S n' => Datatypes.S (imported_to_nat n')
  end.

Lemma nat_roundtrip : forall n : nat, Logic.eq (imported_to_nat (nat_to_imported n)) n.
Proof.
  fix IH 1.
  intros n. destruct n as [| n']; simpl.
  - reflexivity.
  - apply Logic.f_equal. apply IH.
Qed.

Lemma imported_nat_roundtrip : forall n : Imported.nat, Logic.eq (nat_to_imported (imported_to_nat n)) n.
Proof.
  fix IH 1.
  intros n. destruct n as [| n']; simpl.
  - reflexivity.
  - apply Logic.f_equal. apply IH.
Qed.

Instance nat_iso : Iso nat imported_nat.
Proof.
  refine {|
    to := nat_to_imported;
    from := imported_to_nat;
    to_from := _;
    from_to := _
  |}.
  - intros n. apply seq_of_eq. apply imported_nat_roundtrip.
  - intros n. apply seq_of_eq. apply nat_roundtrip.
Defined.

Instance: KnownConstant nat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.nat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor nat nat_iso := {}.
Instance: IsoStatementProofBetween nat Imported.nat nat_iso := {}.