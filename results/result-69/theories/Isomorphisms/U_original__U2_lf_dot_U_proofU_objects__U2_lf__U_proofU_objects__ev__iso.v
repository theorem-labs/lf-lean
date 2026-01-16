From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev : imported_nat -> SProp := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev.

(* We need to prove that Original.ev n (in Prop) is isomorphic to Imported.ev (nat_to_imported n) (in SProp) *)

(* First establish that ev n -> Imported.ev (nat_to_imported n) *)
Lemma ev_to_imported : forall n : nat, Original.LF_DOT_ProofObjects.LF.ProofObjects.ev n -> Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev (nat_to_imported n).
Proof.
  fix IH 2.
  intros n Hev.
  destruct Hev as [ | m Hev'].
  - apply Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev_ev_0.
  - apply Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev_ev_SS.
    apply IH. exact Hev'.
Defined.

(* For the reverse direction: SProp to Prop *)
(* The key is that ev is decidable, and if it's true, we can construct the proof *)
(* If it's false, the SProp type is empty, so the function is vacuously total *)

Fixpoint even_nat (n : nat) : bool :=
  match n with
  | O => true
  | S O => false
  | S (S m) => even_nat m
  end.

Fixpoint ev_of_even (n : nat) : even_nat n = true -> Original.LF_DOT_ProofObjects.LF.ProofObjects.ev n :=
  match n return even_nat n = true -> Original.LF_DOT_ProofObjects.LF.ProofObjects.ev n with
  | O => fun _ => Original.LF_DOT_ProofObjects.LF.ProofObjects.ev_0
  | S O => fun H => match Bool.diff_false_true H with end
  | S (S m) => fun H => Original.LF_DOT_ProofObjects.LF.ProofObjects.ev_SS m (ev_of_even m H)
  end.

(* The from function: since the input is SProp, we can ignore it and just compute *)
(* The trick is to use a "default" value that's computed from the structure of n *)
(* If n is even, we give the correct proof; if n is odd, we can give anything since the SProp is empty *)

(* We use the following approach:
   - If even_nat n = true, return ev_of_even n (eq_refl)
   - If even_nat n = false, we need to return something, but the function will never be called
   - We can "cheat" by returning a bogus proof using an unsafe coercion, 
     or we can use the fact that for an Iso, the from function only needs to be 
     inverse on the image of to.
   
   Actually, looking at the Iso definition, from_to requires:
   forall x : A, eq (from (to x)) x
   
   This is an SProp equality, so it's trivially satisfied.
   
   The key insight: we only need from to be a function. If the domain is empty,
   any function works. We can define from by case analysis on even_nat n.
*)

(* For the odd case, we need to produce ev n from an uninhabited SProp.
   We show that if even_nat n = false, then Imported.ev (nat_to_imported n) -> Lean.sEmpty
   and Lean.sEmpty can be eliminated to Type (and hence Prop) using Lean.sEmpty_rect. *)

(* Define an SProp unit type for use in elimination *)
Inductive sUnit : SProp := stt : sUnit.

Fixpoint even_imported (m : Imported.nat) : bool :=
  match m with
  | Imported.nat_O => true
  | Imported.nat_S Imported.nat_O => false
  | Imported.nat_S (Imported.nat_S k) => even_imported k
  end.

Lemma even_nat_to_imported : forall n, even_nat n = even_imported (nat_to_imported n).
Proof.
  fix IH 1.
  intros n.
  destruct n as [ | [ | m]]; simpl.
  - reflexivity.
  - reflexivity.
  - apply IH.
Defined.

(* Helper to get absurdity from true = false *)
Definition true_ne_false : true = false -> Lean.sEmpty :=
  fun H => match H in (_ = b) return (if b then sUnit else Lean.sEmpty) with
           | Logic.eq_refl => stt
           end.

(* When even_imported m = false, Imported.ev m should give us Lean.sEmpty *)
Lemma imported_ev_false_absurd : forall (m : Imported.nat), 
  even_imported m = false -> 
  Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev m -> 
  Lean.sEmpty.
Proof.
  fix IH 1.
  intros m Hf Hev.
  destruct m as [ | [ | k]].
  - (* m = 0, even_imported 0 = true *)
    exact (true_ne_false Hf).
  - (* m = 1, even_imported 1 = false, have Hev : Imported.ev 1 *)
    (* Use elimination to SProp with sEmpty at index 1, sUnit elsewhere *)
    exact (Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev_sind
        (fun m' _ => match m' return SProp with Imported.nat_S Imported.nat_O => Lean.sEmpty | _ => sUnit end)
        stt
        (fun _ _ _ => stt)
        (Imported.nat_S Imported.nat_O)
        Hev).
  - (* m = S (S k), even_imported (S (S k)) = even_imported k = false *)
    (* Use elimination to extract the sub-proof and recurse *)
    simpl in Hf.
    exact (Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev_sind
        (fun m' _ => match m' return SProp with 
          | Imported.nat_S (Imported.nat_S k') => 
              (even_imported k' = false -> Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev k' -> Lean.sEmpty) -> 
              even_imported k' = false -> Lean.sEmpty
          | _ => sUnit 
          end)
        stt
        (fun k' Hev' _ IH' Hf' => IH' Hf' Hev')
        (Imported.nat_S (Imported.nat_S k))
        Hev
        (IH k)
        Hf).
Defined.

(* Now we can define ev_from_imported *)
(* Lean.sEmpty_rect can eliminate sEmpty to Type, which includes Prop *)
Definition ev_from_imported (n : nat) (Hev : Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev (nat_to_imported n)) : Original.LF_DOT_ProofObjects.LF.ProofObjects.ev n.
Proof.
  destruct (even_nat n) eqn:E.
  - exact (ev_of_even n E).
  - (* even_nat n = false, derive contradiction *)
    assert (Hf' : even_imported (nat_to_imported n) = false).
    { rewrite <- even_nat_to_imported. exact E. }
    apply Lean.sEmpty_rect.
    apply imported_ev_false_absurd with (m := nat_to_imported n).
    + exact Hf'.
    + exact Hev.
Defined.

Require Import Stdlib.Logic.ProofIrrelevance.

Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_ev_iso : (forall (x1 : nat) (x2 : imported_nat) (_ : @rel_iso nat imported_nat nat_iso x1 x2),
   Iso (Original.LF_DOT_ProofObjects.LF.ProofObjects.ev x1) (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev x2)).
Proof.
  intros x1 x2 Hrel.
  unfold imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev.
  unfold rel_iso in Hrel.
  simpl in Hrel.
  destruct Hrel.
  refine (@Build_Iso 
           (Original.LF_DOT_ProofObjects.LF.ProofObjects.ev x1)
           (Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev (nat_to_imported x1))
           (@ev_to_imported x1)
           (@ev_from_imported x1)
           (fun _ => IsomorphismDefinitions.eq_refl)
           _).
  (* from_to: need eq (ev_from_imported (ev_to_imported e)) e *)
  intro e.
  (* Use proof irrelevance: both are proofs of ev x1 *)
  pose proof (proof_irrelevance _ (@ev_from_imported x1 (@ev_to_imported x1 e)) e) as H.
  destruct H.
  apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.ev := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.ev Original_LF__DOT__ProofObjects_LF_ProofObjects_ev_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.ev Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_ev Original_LF__DOT__ProofObjects_LF_ProofObjects_ev_iso := {}.