From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
From Stdlib Require Import ProofIrrelevance.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* (* Typeclasses Opaque rel_iso. *) *) (* for speed *)

From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_le := Imported.Original_LF__DOT__IndProp_LF_IndProp_le.
Definition original_le := Original.LF_DOT_IndProp.LF.IndProp.le.

(* Convert from original le to imported le using fix *)
Definition le_to_imported : forall (n m : nat), original_le n m -> imported_le (nat_to_imported n) (nat_to_imported m).
Proof.
  fix IH 3.
  intros n m H.
  destruct H as [n0 | n0 m0 H0].
  - apply Imported.Original_LF__DOT__IndProp_LF_IndProp_le_le_n.
  - apply Imported.Original_LF__DOT__IndProp_LF_IndProp_le_le_S. apply IH. exact H0.
Defined.

(* For le_from_imported, we cannot directly eliminate the SProp proof.
   However, we can use the fact that:
   1. le is decidable on nat
   2. Both Prop and SProp are proof-irrelevant (the latter definitionally)
   
   The approach: define le_from_imported by recursion on the nat indices,
   NOT on the proof. We construct original_le whenever it holds.
*)

(* leb decides le *)
Fixpoint leb (n m : nat) : bool :=
  match n with
  | O => true
  | S n' => match m with
            | O => false
            | S m' => leb n' m'
            end
  end.

(* Helper lemma *)
Lemma original_le_S_S : forall n m, original_le n m -> original_le (S n) (S m).
Proof.
  intros n m H.
  induction H.
  - apply Original.LF_DOT_IndProp.LF.IndProp.le_n.
  - apply Original.LF_DOT_IndProp.LF.IndProp.le_S. exact IHle.
Qed.

(* leb = true -> original_le *)
Lemma leb_original_le : forall n m, leb n m = true -> original_le n m.
Proof.
  intros n.
  induction n; intros m H.
  - induction m.
    + apply Original.LF_DOT_IndProp.LF.IndProp.le_n.
    + apply Original.LF_DOT_IndProp.LF.IndProp.le_S. apply IHm. reflexivity.
  - destruct m.
    + discriminate H.
    + simpl in H.
      apply original_le_S_S.
      apply IHn.
      exact H.
Qed.

(* leb on Imported.nat *)
Fixpoint imported_leb (n m : Imported.nat) : bool :=
  match n with
  | Imported.nat_O => true
  | Imported.nat_S n' => match m with
                          | Imported.nat_O => false
                          | Imported.nat_S m' => imported_leb n' m'
                          end
  end.

Lemma leb_imported_to_nat : forall n m,
  imported_leb n m = leb (imported_to_nat n) (imported_to_nat m).
Proof.
  induction n; intros m; simpl.
  - reflexivity.
  - destruct m; simpl.
    + reflexivity.
    + apply IHn.
Qed.

Lemma imported_le_from_leb (n m : Imported.nat) :
  imported_leb n m = true -> original_le (imported_to_nat n) (imported_to_nat m).
Proof.
  intros H.
  rewrite leb_imported_to_nat in H.
  apply leb_original_le. exact H.
Qed.

(* The key observation: we need to convert imported_le to original_le.
   Since imported_le is in SProp, we cannot destruct it.
   
   BUT: we can use the recursor into SProp to get SOME information.
   Specifically, we can prove in SProp that if imported_le holds,
   then imported_leb = true (using the SProp recursor).
   
   Let's try that approach. *)

(* First, define a version of "leb = true" in SProp *)
Definition imported_leb_true_s (n m : Imported.nat) : SProp :=
  IsomorphismDefinitions.eq (imported_leb n m) true.

(* Prove that imported_leb n n = true *)
Fixpoint imported_leb_refl (n : Imported.nat) : IsomorphismDefinitions.eq (imported_leb n n) true :=
  match n with
  | Imported.nat_O => IsomorphismDefinitions.eq_refl
  | Imported.nat_S n' => imported_leb_refl n'
  end.

(* Prove that imported_leb n m = true -> imported_leb n (S m) = true *)
Definition imported_leb_S : forall n m, 
  IsomorphismDefinitions.eq (imported_leb n m) true -> 
  IsomorphismDefinitions.eq (imported_leb n (Imported.nat_S m)) true.
Proof.
  fix IH 1.
  intros n.
  destruct n as [|n'].
  - intros m _. exact IsomorphismDefinitions.eq_refl.
  - intros m H.
    destruct m as [|m'].
    + (* H : eq false true - impossible case *)
      (* imported_leb (S n') O = false, so H : eq false true *)
      exfalso.
      exact (match H in IsomorphismDefinitions.eq _ b 
             return (if b then True else False) -> False with
             | IsomorphismDefinitions.eq_refl => fun x => x
             end I).
    + exact (IH n' m' H).
Defined.

(* Now prove using the SProp recursor that imported_le implies leb_true_s *)
Definition imported_le_implies_leb_s : forall n m, 
  Imported.Original_LF__DOT__IndProp_LF_IndProp_le n m -> imported_leb_true_s n m.
Proof.
  fix IH 3.
  intros n m H.
  unfold imported_leb_true_s.
  destruct H.
  - (* le_n: show imported_leb n n = true *)
    exact (imported_leb_refl n).
  - (* le_S: show imported_leb n (S m) = true from imported_le n m *)
    apply imported_leb_S.
    apply IH.
    exact H.
Defined.

(* Now we need to get from SProp equality to Prop equality *)
(* We can use the fact that eq A x y is in SProp, but x = y is in Prop *)
(* To go from SProp to Prop, we need something... *)

(* Actually, seq_of_eq goes from Prop (=) to SProp (eq) *)
(* We need the reverse: from SProp eq to Prop = *)
(* This is problematic because SProp can't eliminate to Prop *)

(* New idea: use the SProp eq to transport within SProp, 
   then use the fact that eq ... true is inhabited to conclude something *)

(* Actually, we have: imported_le_implies_leb_s gives us IsomorphismDefinitions.eq (imported_leb n m) true
   We want: imported_leb n m = true (in Prop)
   
   The key insight: imported_leb n m : bool, and bool is decidable
   So we can case split on imported_leb n m:
   - If true: we're done
   - If false: we need to derive a contradiction from eq false true in SProp
*)

Lemma imported_leb_true_from_s (n m : Imported.nat) :
  imported_leb_true_s n m -> imported_leb n m = true.
Proof.
  unfold imported_leb_true_s.
  intro H.
  destruct (imported_leb n m) eqn:E.
  - reflexivity.
  - (* H : eq false true in SProp - we need to derive a contradiction *)
    exfalso.
    (* Use the same discriminate pattern *)
    exact (match H in IsomorphismDefinitions.eq _ b 
           return (if b then True else False) -> False with
           | IsomorphismDefinitions.eq_refl => fun x => x
           end I).
Defined.

(* Now we can define le_from_imported without an extra axiom! *)
Definition le_from_imported (n m : Imported.nat) 
  (H : Imported.Original_LF__DOT__IndProp_LF_IndProp_le n m) : original_le (imported_to_nat n) (imported_to_nat m) :=
  @imported_le_from_leb n m (@imported_leb_true_from_s n m (@imported_le_implies_leb_s n m H)).

(* Now build the Iso *)
Definition imported_Original_LF__DOT__IndProp_LF_IndProp_le : imported_nat -> imported_nat -> SProp := Imported.Original_LF__DOT__IndProp_LF_IndProp_le.

Definition le_iso_to (x1 : nat) (x2 : imported_nat) (Hx1x2 : IsomorphismDefinitions.eq (nat_to_imported x1) x2)
                     (x3 : nat) (x4 : imported_nat) (Hx3x4 : IsomorphismDefinitions.eq (nat_to_imported x3) x4)
                     (Horig : Original.LF_DOT_IndProp.LF.IndProp.le x1 x3) 
                     : Imported.Original_LF__DOT__IndProp_LF_IndProp_le x2 x4 :=
  let Htrans := @le_to_imported x1 x3 Horig in
  @IsoEq.eq_srect _ _ (fun y => Imported.Original_LF__DOT__IndProp_LF_IndProp_le y x4) 
    (@IsoEq.eq_srect _ _ (fun z => Imported.Original_LF__DOT__IndProp_LF_IndProp_le (nat_to_imported x1) z) 
       Htrans _ Hx3x4) 
    _ Hx1x2.

Definition le_iso_from (x1 : nat) (x2 : imported_nat) (Hx1x2 : IsomorphismDefinitions.eq (nat_to_imported x1) x2)
                       (x3 : nat) (x4 : imported_nat) (Hx3x4 : IsomorphismDefinitions.eq (nat_to_imported x3) x4)
                       (Himp : Imported.Original_LF__DOT__IndProp_LF_IndProp_le x2 x4) 
                       : Original.LF_DOT_IndProp.LF.IndProp.le x1 x3 :=
  let step1 := @IsoEq.eq_srect_r _ _ (fun z => Imported.Original_LF__DOT__IndProp_LF_IndProp_le x2 z)
                   Himp _ Hx3x4 in
  let step2 := @IsoEq.eq_srect_r _ _ (fun y => Imported.Original_LF__DOT__IndProp_LF_IndProp_le y (nat_to_imported x3))
                   step1 _ Hx1x2 in
  let Horiginal := @le_from_imported (nat_to_imported x1) (nat_to_imported x3) step2 in
  @IsoEq.eq_srect _ _ (fun y => Original.LF_DOT_IndProp.LF.IndProp.le y x3)
    (@IsoEq.eq_srect _ _ (fun z => Original.LF_DOT_IndProp.LF.IndProp.le (imported_to_nat (nat_to_imported x1)) z)
       Horiginal _ (from_to nat_iso x3))
    _ (from_to nat_iso x1).

Instance Original_LF__DOT__IndProp_LF_IndProp_le_iso : (forall (x1 : nat) (x2 : imported_nat) (_ : @rel_iso nat imported_nat nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (_ : @rel_iso nat imported_nat nat_iso x3 x4),
   Iso (Original.LF_DOT_IndProp.LF.IndProp.le x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_le x2 x4)).
Proof.
  intros x1 x2 Hx1x2 x3 x4 Hx3x4.
  (* (* (* unfold_rel *) in Hx1x2, Hx3x4. *) *)
  unfold imported_Original_LF__DOT__IndProp_LF_IndProp_le.
  exact (@Build_Iso 
           (Original.LF_DOT_IndProp.LF.IndProp.le x1 x3) 
           (Imported.Original_LF__DOT__IndProp_LF_IndProp_le x2 x4)
           (@le_iso_to x1 x2 Hx1x2 x3 x4 Hx3x4)
           (@le_iso_from x1 x2 Hx1x2 x3 x4 Hx3x4)
           (fun _ => IsomorphismDefinitions.eq_refl)  (* SProp is proof-irrelevant *)
           (fun l => seq_of_eq (ProofIrrelevance.proof_irrelevance _ _ l))). (* Prop needs proof_irrelevance *)
Defined.

Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.le := {}. 
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_le := {}. 
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.le Original_LF__DOT__IndProp_LF_IndProp_le_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.le Imported.Original_LF__DOT__IndProp_LF_IndProp_le Original_LF__DOT__IndProp_LF_IndProp_le_iso := {}.