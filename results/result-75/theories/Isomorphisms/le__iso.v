From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Monomorphic Definition imported_le : imported_nat -> imported_nat -> SProp := Imported.le.

(* We need to connect Peano.le (Original le) with the imported le which is defined as
   nat_leb n m = true *)

(* Helper: nat_leb is true implies Peano.le *)
Monomorphic Lemma nat_leb_true_le : forall n m : Datatypes.nat,
  Logic.eq (Imported.nat_leb (nat_to_imported n) (nat_to_imported m)) Imported.RocqBool_true ->
  Peano.le n m.
Proof.
  induction n as [| n' IHn]; intros m H.
  - apply Peano.le_0_n.
  - destruct m as [| m'].
    + simpl in H. discriminate H.
    + simpl in H. apply Peano.le_n_S. apply IHn. apply H.
Qed.

(* Helper: Peano.le implies nat_leb is true *)
Monomorphic Lemma le_nat_leb_true : forall n m : Datatypes.nat,
  Peano.le n m ->
  Logic.eq (Imported.nat_leb (nat_to_imported n) (nat_to_imported m)) Imported.RocqBool_true.
Proof.
  induction n as [| n' IHn]; intros m H.
  - simpl. reflexivity.
  - destruct m as [| m'].
    + inversion H.
    + simpl. apply IHn. apply Peano.le_S_n. exact H.
Qed.

(* Helper: Logic.eq to Imported.Corelib_Init_Logic_eq *)
Monomorphic Lemma logic_eq_to_imported_eq : forall (A : Type) (a b : A),
  Logic.eq a b -> Imported.Corelib_Init_Logic_eq A a b.
Proof.
  intros A a b H. destruct H. apply Imported.Corelib_Init_Logic_eq_refl.
Qed.

(* Helper: Imported.Corelib_Init_Logic_eq to Logic.eq *)
Monomorphic Definition imported_eq_to_logic_eq : forall (A : Type) (a b : A),
  Imported.Corelib_Init_Logic_eq A a b -> Logic.eq a b :=
  fun A a b H => sinhabitant (Imported.Corelib_Init_Logic_eq_indl A a 
    (fun b' _ => SInhabited (Logic.eq a b')) (sinhabits Logic.eq_refl) b H).

Monomorphic Instance le_iso : (forall (x1 : Datatypes.nat) (x2 : imported_nat) (_ : @rel_iso Datatypes.nat imported_nat nat_iso x1 x2) (x3 : Datatypes.nat) (x4 : imported_nat) (_ : @rel_iso Datatypes.nat imported_nat nat_iso x3 x4), Iso (Peano.le x1 x3) (imported_le x2 x4)).
Proof.
  intros n1 n2 hn m1 m2 hm.
  destruct hn as [hn]. destruct hm as [hm]. simpl in hn, hm.
  apply eq_of_seq in hn. apply eq_of_seq in hm.
  subst n2 m2.
  unfold imported_le, Imported.le.
  apply relax_Iso_Ps_Ts.
  unshelve refine {|
    to := _;
    from := _
  |}.
  - (* Peano.le -> Imported.Corelib_Init_Logic_eq (nat_leb ...) true *)
    intro H.
    apply logic_eq_to_imported_eq.
    apply le_nat_leb_true. exact H.
  - (* Imported.Corelib_Init_Logic_eq (nat_leb ...) true -> Peano.le *)
    intro H.
    apply imported_eq_to_logic_eq in H.
    apply nat_leb_true_le. exact H.
  - intro s. apply IsomorphismDefinitions.eq_refl.
  - intro p. apply seq_of_peq. apply Stdlib.Logic.ProofIrrelevance.proof_irrelevance.
Defined.

Instance: KnownConstant Peano.le := {}. 
Instance: KnownConstant Imported.le := {}. 
Instance: IsoStatementProofFor Peano.le le_iso := {}.
Instance: IsoStatementProofBetween Peano.le Imported.le le_iso := {}.
