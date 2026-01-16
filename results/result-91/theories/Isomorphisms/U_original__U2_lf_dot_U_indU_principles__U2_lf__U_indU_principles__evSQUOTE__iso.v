From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev' : imported_nat -> SProp := Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev'.

(* Helper: nat_to_imported preserves addition *)
Lemma nat_add_to_imported : forall n m : nat, 
  @Logic.eq _ (nat_to_imported (n + m)) (Imported.PeanoNat_Nat_add (nat_to_imported n) (nat_to_imported m)).
Proof.
  induction n as [|n' IH]; intros m.
  - simpl. apply Logic.eq_refl.
  - simpl. apply (Logic.f_equal Imported.nat_S). apply IH.
Qed.

(* ev' n -> Imported.ev' (nat_to_imported n) *)
Lemma ev'_to_imported : forall n : nat, Original.LF_DOT_IndPrinciples.LF.IndPrinciples.ev' n -> Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev' (nat_to_imported n).
Proof.
  fix IH 2.
  intros n Hev'.
  destruct Hev' as [ | | n' m' Hn' Hm'].
  - apply Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev'_ev'_0.
  - apply Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev'_ev'_2.
  - rewrite (nat_add_to_imported n' m').
    apply Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev'_ev'_sum.
    + apply IH. exact Hn'.
    + apply IH. exact Hm'.
Qed.

(* For the reverse direction: Imported.ev' m -> ev' (imported_to_nat m) *)
(* Since Imported.ev' is in SProp, we can't directly destruct it to produce Prop.
   Instead, we use the fact that ev' n is decidable (same as even n).
   We check if imported_to_nat m is even, and if so, construct the proof.
   If it's odd, we derive a contradiction from Imported.ev' m. *)

(* Check if n is even *)
Fixpoint even_nat (n : nat) : bool :=
  match n with
  | O => true
  | S O => false
  | S (S m) => even_nat m
  end.

(* Build ev' proof from even_nat n = true *)
Fixpoint ev'_of_even (n : nat) : even_nat n = true -> Original.LF_DOT_IndPrinciples.LF.IndPrinciples.ev' n :=
  match n return even_nat n = true -> Original.LF_DOT_IndPrinciples.LF.IndPrinciples.ev' n with
  | O => fun _ => Original.LF_DOT_IndPrinciples.LF.IndPrinciples.ev'_0
  | S O => fun H => match Bool.diff_false_true H with end
  | S (S m) => fun H => 
      Logic.eq_ind (2 + m)
        (fun x => Original.LF_DOT_IndPrinciples.LF.IndPrinciples.ev' x)
        (Original.LF_DOT_IndPrinciples.LF.IndPrinciples.ev'_sum 2 m 
           Original.LF_DOT_IndPrinciples.LF.IndPrinciples.ev'_2 
           (ev'_of_even m H))
        (S (S m))
        Logic.eq_refl
  end.

(* For imported side, check evenness *)
Fixpoint even_imported (m : Imported.nat) : bool :=
  match m with
  | Imported.nat_O => true
  | Imported.nat_S Imported.nat_O => false
  | Imported.nat_S (Imported.nat_S k) => even_imported k
  end.

(* even_nat and even_imported are consistent *)
Lemma even_imported_nat : forall m, @Logic.eq _ (even_imported m) (even_nat (imported_to_nat m)).
Proof.
  fix IH 1.
  intros m.
  destruct m as [|[|m']] using Imported.nat_rec; simpl.
  - apply Logic.eq_refl.
  - apply Logic.eq_refl.
  - exact (IH m').
Qed.

(* SProp unit type *)
Inductive sUnit : SProp := stt : sUnit.

(* Helper to get absurdity from true = false *)
Definition true_ne_false : @Logic.eq _ true false -> Lean.sEmpty :=
  fun H => match H in (Logic.eq _ b) return (if b then sUnit else Lean.sEmpty) with
           | Logic.eq_refl => stt
           end.

(* Helper: even_imported (nat_add n m) = true when both n and m are even *)
(* This computes by reduction *)
Fixpoint even_add_even (n : Imported.nat) : 
  @Logic.eq _ (even_imported n) true ->
  forall m, @Logic.eq _ (even_imported m) true ->
  @Logic.eq _ (even_imported (Imported.PeanoNat_Nat_add n m)) true :=
  match n return @Logic.eq _ (even_imported n) true ->
                 forall m, @Logic.eq _ (even_imported m) true ->
                 @Logic.eq _ (even_imported (Imported.PeanoNat_Nat_add n m)) true with
  | Imported.nat_O => fun _ m Hm => Hm
  | Imported.nat_S Imported.nat_O => fun Hn _ _ => 
      match Bool.diff_false_true Hn with end
  | Imported.nat_S (Imported.nat_S n') => fun Hn m Hm => 
      even_add_even n' Hn m Hm
  end.

(* Transport for SProp-valued functions on bool *)
Definition bool_rect_sprop (P : bool -> SProp) (Htrue : P true) (Hfalse : P false) (b : bool) : P b :=
  match b return P b with
  | true => Htrue
  | false => Hfalse
  end.

Definition eq_rect_sprop (b1 b2 : bool) (H : @Logic.eq _ b1 b2) (P : bool -> SProp) (p : P b1) : P b2 :=
  match H in (Logic.eq _ b) return P b with
  | Logic.eq_refl => p
  end.

(* When even_imported m = false, Imported.ev' m -> sEmpty *)
(* We prove this using SProp elimination (sind) *)
Definition imported_ev'_implies_even : forall m,
  Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev' m ->
  (if even_imported m then sUnit else Lean.sEmpty).
Proof.
  apply (Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev'_sind
    (fun m' _ => if even_imported m' then sUnit else Lean.sEmpty)
    stt  (* ev'_0: even_imported 0 = true *)
    stt  (* ev'_2: even_imported 2 = true *)
  ).
  (* ev'_sum case: given proofs for n' and m', produce proof for n'+m' *)
  (* Arguments: n' m' (proof of ev' n') (IH for n') (proof of ev' m') (IH for m') *)
  intros n' m' Hev'n IHn Hev'm IHm.
  (* IHn : if even_imported n' then sUnit else sEmpty *)
  (* IHm : if even_imported m' then sUnit else sEmpty *)
  (* Goal: if even_imported (nat_add n' m') then sUnit else sEmpty *)
  refine (
    match even_imported n' as b1 
          return @Logic.eq _ (even_imported n') b1 ->
                 (if b1 then sUnit else Lean.sEmpty) -> 
                 (if even_imported m' then sUnit else Lean.sEmpty) ->
                 (if even_imported (Imported.PeanoNat_Nat_add n' m') then sUnit else Lean.sEmpty) with
    | true => fun Hn _ => 
        match even_imported m' as b2 
              return @Logic.eq _ (even_imported m') b2 ->
                     (if b2 then sUnit else Lean.sEmpty) ->
                     (if even_imported (Imported.PeanoNat_Nat_add n' m') then sUnit else Lean.sEmpty) with
        | true => fun Hm _ =>
            (* Both even, show sum is even using transport *)
            @eq_rect_sprop true (even_imported (Imported.PeanoNat_Nat_add n' m'))
                           (Logic.eq_sym (even_add_even n' Hn m' Hm))
                           (fun b => if b then sUnit else Lean.sEmpty) 
                           stt
        | false => fun _ x => Lean.sEmpty_sind _ x
        end Logic.eq_refl
    | false => fun _ x _ => Lean.sEmpty_sind _ x
    end Logic.eq_refl IHn IHm).
Defined.

Definition imported_ev'_false_absurd : forall (m : Imported.nat), 
  @Logic.eq _ (even_imported m) false -> 
  Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev' m -> 
  Lean.sEmpty.
Proof.
  intros m Hf Hev'.
  pose proof (@imported_ev'_implies_even m Hev') as H.
  rewrite Hf in H.
  exact H.
Defined.

(* ev'_from_imported: since the input is SProp, we compute based on evenness *)
Definition ev'_from_imported (m : Imported.nat) 
  (Hev' : Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev' m) : 
  Original.LF_DOT_IndPrinciples.LF.IndPrinciples.ev' (imported_to_nat m).
Proof.
  destruct (even_nat (imported_to_nat m)) eqn:E.
  - exact (ev'_of_even (imported_to_nat m) E).
  - (* odd case: derive contradiction *)
    assert (Hf' : @Logic.eq _ (even_imported m) false).
    { 
      pose proof (even_imported_nat m) as Heq.
      (* Heq : even_imported m = even_nat (imported_to_nat m) *)
      (* E : even_nat (imported_to_nat m) = false *)
      exact (Logic.eq_trans Heq E).
    }
    exfalso.
    apply Lean.sEmpty_rect.
    exact (@imported_ev'_false_absurd m Hf' Hev').
Defined.

Import IsoEq.
Require Import Stdlib.Logic.ProofIrrelevance.

Instance Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev'_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> Iso (Original.LF_DOT_IndPrinciples.LF.IndPrinciples.ev' x1) (imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev' x2).
Proof.
  intros x1 x2 Hrel.
  unfold imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev'.
  unfold rel_iso in Hrel.
  simpl in Hrel.
  destruct Hrel.
  (* Need: imported_to_nat (nat_to_imported x1) = x1 *)
  assert (Hroundtrip : @Logic.eq _ (imported_to_nat (nat_to_imported x1)) x1).
  { clear. induction x1; simpl. apply Logic.eq_refl. apply (Logic.f_equal S). exact IHx1. }
  (* Define the from function with transport *)
  pose (from_fn := fun (Hev' : Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev' (nat_to_imported x1)) =>
    Logic.eq_rect (imported_to_nat (nat_to_imported x1))
                  (fun n => Original.LF_DOT_IndPrinciples.LF.IndPrinciples.ev' n)
                  (@ev'_from_imported (nat_to_imported x1) Hev')
                  x1
                  Hroundtrip).
  refine (@Build_Iso 
           (Original.LF_DOT_IndPrinciples.LF.IndPrinciples.ev' x1)
           (Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev' (nat_to_imported x1))
           (@ev'_to_imported x1)
           from_fn
           (fun _ => IsomorphismDefinitions.eq_refl)
           _).
  (* from_to: need eq (from_fn (ev'_to_imported e)) e *)
  intro e.
  unfold from_fn.
  (* Use proof irrelevance *)
  pose proof (proof_irrelevance _ 
    (Logic.eq_rect (imported_to_nat (nat_to_imported x1))
                   (fun n => Original.LF_DOT_IndPrinciples.LF.IndPrinciples.ev' n)
                   (@ev'_from_imported (nat_to_imported x1) (@ev'_to_imported x1 e))
                   x1 Hroundtrip)
    e) as Hirr.
  destruct Hirr.
  apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_IndPrinciples.LF.IndPrinciples.ev' := {}.
Instance: KnownConstant Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev' := {}.
Instance: IsoStatementProofFor Original.LF_DOT_IndPrinciples.LF.IndPrinciples.ev' Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndPrinciples.LF.IndPrinciples.ev' Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev' Original_LF__DOT__IndPrinciples_LF_IndPrinciples_ev'_iso := {}.
