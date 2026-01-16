From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
 (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF_Rel_next__nat : imported_nat -> imported_nat -> SProp := Imported.Original_LF_Rel_next__nat.

(* Helper definitions for the isomorphism *)
Definition nat_to_imported := to nat_iso.
Definition imported_to_nat := from nat_iso.

(* Forward direction: Original.LF.Rel.next_nat -> Imported.Original_LF_Rel_next__nat *)
Definition next_nat_to_imported' (n1 n2 : Datatypes.nat) (H : Original.LF.Rel.next_nat n1 n2)
  : Imported.Original_LF_Rel_next__nat (nat_to_imported n1) (nat_to_imported n2).
Proof.
  destruct H as [n].
  simpl.
  exact (Imported.Original_LF_Rel_next__nat_nn (nat_to_imported n)).
Defined.

(* Backward direction: Imported.Original_LF_Rel_next__nat -> Original.LF.Rel.next_nat *)
(* Using the recl eliminator which can eliminate into Type *)
Definition next_nat_from_imported' (n1 n2 : Imported.nat) (H : Imported.Original_LF_Rel_next__nat n1 n2)
  : Original.LF.Rel.next_nat (imported_to_nat n1) (imported_to_nat n2) :=
  Imported.Original_LF_Rel_next__nat_recl n1 
    (fun n2' _ => Original.LF.Rel.next_nat (imported_to_nat n1) (imported_to_nat n2'))
    (Original.LF.Rel.nn (imported_to_nat n1))
    n2 H.

(* SProp has built-in proof irrelevance *)
Lemma sprop_irrelevance : forall (P : SProp) (p1 p2 : P), IsomorphismDefinitions.eq p1 p2.
Proof.
  intros. apply IsomorphismDefinitions.eq_refl.
Qed.

(* Proof irrelevance for Prop using the allowed axiom *)
Lemma prop_irrelevance_seq : forall (P : Prop) (p1 p2 : P), IsomorphismDefinitions.eq p1 p2.
Proof.
  intros P p1 p2.
  pose proof (ProofIrrelevance.proof_irrelevance P p1 p2) as H.
  destruct H. apply IsomorphismDefinitions.eq_refl.
Qed.

(* Helper: round-trip lemma *)
Lemma nat_round_trip : forall x : nat, imported_to_nat (nat_to_imported x) = x.
Proof.
  intro x. unfold imported_to_nat, nat_to_imported.
  apply eq_of_seq.
  apply from_to.
Defined.

(* Build the Iso directly *)
Definition next_nat_iso_direct (x1 x3 : nat) : 
  Iso (Original.LF.Rel.next_nat x1 x3)
      (Imported.Original_LF_Rel_next__nat (nat_to_imported x1) (nat_to_imported x3)).
Proof.
  refine {|
    to := fun (H : Original.LF.Rel.next_nat x1 x3) => next_nat_to_imported' H;
    from := fun (H : Imported.Original_LF_Rel_next__nat (nat_to_imported x1) (nat_to_imported x3)) => 
      match nat_round_trip x1 in (Logic.eq _ y1) return Original.LF.Rel.next_nat y1 x3 with
      | Logic.eq_refl =>
        match nat_round_trip x3 in (Logic.eq _ y3) return Original.LF.Rel.next_nat (imported_to_nat (nat_to_imported x1)) y3 with
        | Logic.eq_refl => next_nat_from_imported' H
        end
      end
  |}.
  { intro; apply sprop_irrelevance. }
  { intro; apply prop_irrelevance_seq. }
Defined.

(* Now build the full isomorphism using destruct on the rel_iso equalities *)
Instance Original_LF_Rel_next__nat_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 -> forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> Iso (Original.LF.Rel.next_nat x1 x3) (imported_Original_LF_Rel_next__nat x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  destruct H12 as [H12]. destruct H34 as [H34]. simpl in *.
  unfold imported_Original_LF_Rel_next__nat.
  destruct H12, H34.
  exact (next_nat_iso_direct x1 x3).
Defined.

Instance: KnownConstant Original.LF.Rel.next_nat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF_Rel_next__nat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF.Rel.next_nat Original_LF_Rel_next__nat_iso := {}.
Instance: IsoStatementProofBetween Original.LF.Rel.next_nat Imported.Original_LF_Rel_next__nat Original_LF_Rel_next__nat_iso := {}.