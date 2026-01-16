From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. *) (* for speed *)

From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_P__m0r : imported_nat -> SProp := Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_P__m0r.

(* Standard lemma for Coq's nat *)
Lemma mul_0_r_standard : forall n : Datatypes.nat, PeanoNat.Nat.mul n Datatypes.O = Datatypes.O.
Proof.
  intro n. induction n; simpl; auto.
Qed.

(* Prove imported_nat_add_0_r *)
Lemma imported_nat_add_0_r : forall n : Imported.nat, 
  Logic.eq (Imported.nat_add n Imported.nat_O) n.
Proof.
  intro n;
  rewrite <- (Isomorphisms.nat__iso.imported_round_trip n);
  generalize (Isomorphisms.nat__iso.imported_to_nat n) as m; clear n; intro m;
  induction m as [|m' IH]; [ reflexivity | ].
  transitivity (Imported.nat_S (Imported.nat_add (Isomorphisms.nat__iso.nat_to_imported m') Imported.nat_O)); [ reflexivity | ].
  refine (Logic.f_equal Imported.nat_S _).
  exact IH.
Qed.

(* Use the exported lemma *)
Lemma Eq_to_eq : forall (A : Type) (x y : A), Imported.Eq A x y -> Logic.eq x y.
Proof. intros A x y H. destruct H. reflexivity. Qed.

Lemma imported_mul_0_r : forall n : Imported.nat, 
  Logic.eq (Imported.nat_mul n Imported.nat_O) Imported.nat_O.
Proof.
  intro n.
  apply Eq_to_eq.
  exact (Imported.nat_mul_0_r n).
Qed.

(* Helper to convert standard equality to SProp equality for Imported.Eq *)
Lemma eq_to_Imported_Eq : forall (A : Type) (x y : A), Logic.eq x y -> Imported.Eq A x y.
Proof.
  intros A x y H.
  destruct H.
  exact (Imported.Eq_refl A x).
Qed.

(* Now we can build the isomorphism *)
Instance Original_LF__DOT__IndPrinciples_LF_IndPrinciples_P__m0r_iso : forall (x1 : Datatypes.nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> Iso (Original.LF_DOT_IndPrinciples.LF.IndPrinciples.P_m0r x1) (imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_P__m0r x2).
Proof.
  intros x1 x2 Hrel.
  unfold Original.LF_DOT_IndPrinciples.LF.IndPrinciples.P_m0r.
  unfold imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_P__m0r.
  unfold Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_P__m0r.
  refine {| to := fun _ => @eq_to_Imported_Eq Imported.nat (Imported.nat_mul x2 Imported.nat_O) Imported.nat_O (imported_mul_0_r x2);
            from := fun _ => mul_0_r_standard x1;
            to_from := fun _ => IsomorphismDefinitions.eq_refl;
            from_to := fun _ => seq_of_eq (Coq.Logic.ProofIrrelevance.proof_irrelevance _ _ _) |}.
Qed.

Instance: KnownConstant Original.LF_DOT_IndPrinciples.LF.IndPrinciples.P_m0r := {}.
Instance: KnownConstant Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_P__m0r := {}.
Instance: IsoStatementProofFor Original.LF_DOT_IndPrinciples.LF.IndPrinciples.P_m0r Original_LF__DOT__IndPrinciples_LF_IndPrinciples_P__m0r_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndPrinciples.LF.IndPrinciples.P_m0r Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_P__m0r Original_LF__DOT__IndPrinciples_LF_IndPrinciples_P__m0r_iso := {}.
