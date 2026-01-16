From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Local Open Scope nat_scope.

Definition imported_le : imported_nat -> imported_nat -> SProp := Imported.le.

(* Helper lemmas *)
Lemma le_0_l : forall n : nat, Peano.le O n.
Proof. induction n; constructor; auto. Qed.

(* Helper: nat_leb O m = true for all m *)
Lemma nat_le_O (m : Imported.nat) : 
  Imported.nat_leb Imported.nat_O m = Imported.RocqBool_true.
Proof. destruct m; reflexivity. Qed.

(* Helper for discrimination *)
Definition bool_discr (H : Imported.RocqBool_false = Imported.RocqBool_true) : Logic.False :=
  match H in (Corelib.Init.Logic.eq _ b) return (match b with Imported.RocqBool_true => Logic.False | Imported.RocqBool_false => Logic.True end) with
  | Corelib.Init.Logic.eq_refl => Logic.I
  end.

(* Helper: if nat_leb n m = true then nat_leb n (S m) = true *)
Fixpoint nat_le_step (n : Imported.nat) : forall (m : Imported.nat),
  Imported.nat_leb n m = Imported.RocqBool_true -> 
  Imported.nat_leb n (Imported.nat_S m) = Imported.RocqBool_true :=
  match n return forall m, Imported.nat_leb n m = Imported.RocqBool_true -> 
                           Imported.nat_leb n (Imported.nat_S m) = Imported.RocqBool_true with
  | Imported.nat_O => fun m _ => nat_le_O (Imported.nat_S m)
  | Imported.nat_S n' => fun m =>
      match m return Imported.nat_leb (Imported.nat_S n') m = Imported.RocqBool_true ->
                      Imported.nat_leb (Imported.nat_S n') (Imported.nat_S m) = Imported.RocqBool_true with
      | Imported.nat_O => fun H => False_rect _ (bool_discr H)
      | Imported.nat_S m' => fun H => nat_le_step n' m' H
      end
  end.

Definition le_implies_nat_le : forall (n m : nat) (H : Peano.le n m),
  Imported.nat_leb (nat_to_imported n) (nat_to_imported m) = Imported.RocqBool_true.
Proof.
  fix IH 3.
  intros n m H.
  destruct H as [|m' H'].
  - induction n; simpl; [reflexivity | exact IHn].
  - apply nat_le_step. exact (IH n m' H').
Defined.

Definition le_to_imported (n m : nat) (H : Peano.le n m) : 
  Imported.le (nat_to_imported n) (nat_to_imported m).
Proof.
  unfold Imported.le.
  rewrite le_implies_nat_le; [apply Imported.Corelib_Init_Logic_eq_refl | exact H].
Defined.

(* imported_to_le: convert Imported.le to Rocq le *)
Fixpoint nat_le_implies_le (n m : Imported.nat) {struct n} :
  Logic.eq (Imported.nat_leb n m) Imported.RocqBool_true -> Peano.le (imported_to_nat n) (imported_to_nat m).
Proof.
  destruct n, m; intro E; simpl in *.
  - exact (le_n O).
  - apply le_0_l.
  - discriminate E.
  - apply le_n_S. apply nat_le_implies_le. exact E.
Defined.

(* We need a way to extract a proof from the SProp MyEq *)
(* Key: if nat_leb n m = true, we can derive le. Otherwise, we need to exploit impossibility *)

(* Helper: transport along Corelib_Init_Logic_eq into Prop *)
Definition MyEq_transport_Prop {A : Type} {a b : A} (P : A -> Prop) (H : Imported.Corelib_Init_Logic_eq A a b) : P a -> P b :=
  match H with
  | Imported.Corelib_Init_Logic_eq_refl _ _ => fun x => x
  end.

(* Prop-level equality for RocqBool *)
Inductive RocqBool_eq_Prop : Imported.RocqBool -> Imported.RocqBool -> Prop :=
| RocqBool_eq_Prop_refl : forall x, RocqBool_eq_Prop x x.

(* If Corelib_Init_Logic_eq RocqBool x RocqBool_true, then x = RocqBool_true in Prop *)
Definition MyEq_to_Prop_eq (x : Imported.RocqBool) (H : Imported.Corelib_Init_Logic_eq Imported.RocqBool x Imported.RocqBool_true) : 
  RocqBool_eq_Prop x Imported.RocqBool_true :=
  MyEq_transport_Prop (fun y => RocqBool_eq_Prop x y) H (RocqBool_eq_Prop_refl x).

(* From RocqBool_eq_Prop to Logic.eq (Prop equality) *)
Definition RocqBool_eq_Prop_to_Logic_eq (x y : Imported.RocqBool) (H : RocqBool_eq_Prop x y) : Logic.eq x y :=
  match H in RocqBool_eq_Prop a b return Logic.eq a b with
  | RocqBool_eq_Prop_refl z => Logic.eq_refl z
  end.

Definition imported_to_le (n' m' : Imported.nat) (H : Imported.le n' m') : 
  Peano.le (imported_to_nat n') (imported_to_nat m').
Proof.
  unfold Imported.le in H.
  (* H : Corelib_Init_Logic_eq RocqBool (nat_leb n' m') RocqBool_true *)
  assert (H1 : RocqBool_eq_Prop (Imported.nat_leb n' m') Imported.RocqBool_true).
  { apply (@MyEq_to_Prop_eq (Imported.nat_leb n' m')). exact H. }
  assert (E : Logic.eq (Imported.nat_leb n' m') Imported.RocqBool_true).
  { apply (@RocqBool_eq_Prop_to_Logic_eq (Imported.nat_leb n' m') Imported.RocqBool_true). exact H1. }
  apply nat_le_implies_le. exact E.
Defined.

(* Helper to get Prop equality from SProp equality *)
Lemma nat_from_to_prop : forall x : nat, imported_to_nat (nat_to_imported x) = x.
Proof.
  fix IH 1.
  intros x. destruct x.
  - reflexivity.
  - simpl. f_equal. apply IH.
Defined.

(* The isomorphism *)
Instance le_iso : (forall (x1 : nat) (x2 : imported_nat) (_ : @rel_iso nat imported_nat nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (_ : @rel_iso nat imported_nat nat_iso x3 x4), Iso (Peano.le x1 x3) (imported_le x2 x4)).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  destruct H12 as [H12]. destruct H34 as [H34].
  simpl in H12, H34.
  unfold imported_le.
  
  apply IsoEq.eq_of_seq in H12.
  apply IsoEq.eq_of_seq in H34.
  subst x2 x4.
  
  unshelve refine {|
    to := @le_to_imported x1 x3;
    from := fun H => _ 
  |}.
  - pose (@imported_to_le (nat_to_imported x1) (nat_to_imported x3) H) as H'.
    rewrite nat_from_to_prop in H'.
    rewrite nat_from_to_prop in H'.
    exact H'.
  - intro. apply IsomorphismDefinitions.eq_refl.
  - intro x. apply IsoEq.seq_of_eq.
    apply Stdlib.Logic.ProofIrrelevance.proof_irrelevance.
Defined.

Instance: KnownConstant le := {}. 
Instance: KnownConstant Imported.le := {}. 
Instance: IsoStatementProofFor le le_iso := {}.
Instance: IsoStatementProofBetween le Imported.le le_iso := {}.