From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
From Stdlib Require Import Logic.ProofIrrelevance.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


Definition imported_or : SProp -> SProp -> SProp := Imported.or.

(* Build an isomorphism between or (Prop) and imported_or (SProp) *)
(* Use sinhabitant to extract from SProp to Prop, and proof irrelevance for the from_to case *)
Instance or_iso : (forall (x1 : Prop) (x2 : SProp) (_ : Iso x1 x2) (x3 : Prop) (x4 : SProp) (_ : Iso x3 x4), Iso (x1 \/ x3) (imported_or x2 x4)).
Proof.
  intros x1 x2 iso1 x3 x4 iso2.
  refine {| to := fun p => match p with
                           | or_introl a => Imported.or_inl x2 x4 (iso1.(to) a)
                           | or_intror b => Imported.or_inr x2 x4 (iso2.(to) b)
                           end;
            from := fun p => sinhabitant (Imported.or_indl x2 x4 (fun _ => SInhabited (x1 \/ x3))
                               (fun a => sinhabits (or_introl (iso1.(from) a)))
                               (fun b => sinhabits (or_intror (iso2.(from) b)))
                               p) |}.
  - intro x.
    apply Imported.or_indl.
    + intro a. simpl. apply IsomorphismDefinitions.eq_refl.
    + intro b. simpl. apply IsomorphismDefinitions.eq_refl.
  - intro x. 
    (* Use proof irrelevance: both sides are proofs of x1 \/ x3, a Prop *)
    exact (seq_of_eq (proof_irrelevance _ _ _)).
Defined.

Instance: KnownConstant Logic.or := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.or := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Logic.or or_iso := {}.
Instance: IsoStatementProofBetween Logic.or Imported.or or_iso := {}.