From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


Definition imported_nat : Type := Imported.nat.

(* Convert from Rocq nat to Imported.nat *)
Fixpoint nat_to_imported (n : Datatypes.nat) : imported_nat :=
  match n with
  | O => Imported.nat_O
  | Datatypes.S n' => Imported.nat_S (nat_to_imported n')
  end.

(* Convert from Imported.nat to Rocq nat *)
Definition imported_to_nat : imported_nat -> Datatypes.nat :=
  Imported.nat_recl (fun _ => Datatypes.nat) O (fun _ r => Datatypes.S r).

(* Proof that to_from holds *)
Lemma nat_to_from : forall x : imported_nat, 
  IsomorphismDefinitions.eq (nat_to_imported (imported_to_nat x)) x.
Proof.
  apply (Imported.nat_indl (fun x => IsomorphismDefinitions.eq (nat_to_imported (imported_to_nat x)) x)).
  - apply IsomorphismDefinitions.eq_refl.
  - intros n IH. simpl.
    apply (f_equal Imported.nat_S IH).
Qed.

(* Proof that from_to holds *)
Lemma nat_from_to : forall x : Datatypes.nat,
  IsomorphismDefinitions.eq (imported_to_nat (nat_to_imported x)) x.
Proof.
  fix IH 1. intros x. destruct x.
  - apply IsomorphismDefinitions.eq_refl.
  - simpl. apply (f_equal Datatypes.S (IH x)).
Qed.

Instance nat_iso : Iso Datatypes.nat imported_nat := {|
  to := nat_to_imported;
  from := imported_to_nat;
  to_from := nat_to_from;
  from_to := nat_from_to
|}.

Instance: KnownConstant Datatypes.nat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.nat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Datatypes.nat nat_iso := {}.
Instance: IsoStatementProofBetween Datatypes.nat Imported.nat nat_iso := {}.