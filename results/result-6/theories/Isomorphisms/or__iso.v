From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



Definition imported_or : SProp -> SProp -> SProp := Imported.or.

(* Build the 'to' function *)
Definition or_to (x1 : Prop) (x2 : SProp) (H1 : Iso x1 x2) 
                 (x3 : Prop) (x4 : SProp) (H2 : Iso x3 x4)
  : Corelib.Init.Logic.or x1 x3 -> imported_or x2 x4 :=
  fun p => match p with
  | or_introl a => Imported.or_inl x2 x4 (to H1 a)
  | or_intror b => Imported.or_inr x2 x4 (to H2 b)
  end.

(* Build the 'from' function using SInhabited/sinhabitant trick *)
Definition or_from_sin (x1 : Prop) (x2 : SProp) (H1 : Iso x1 x2) 
                   (x3 : Prop) (x4 : SProp) (H2 : Iso x3 x4)
  : imported_or x2 x4 -> SInhabited (Corelib.Init.Logic.or x1 x3) :=
  fun p => match p with
  | Imported.or_inl _ _ h => sinhabits (or_introl (from H1 h))
  | Imported.or_inr _ _ h => sinhabits (or_intror (from H2 h))
  end.

Definition or_from (x1 : Prop) (x2 : SProp) (H1 : Iso x1 x2) 
                   (x3 : Prop) (x4 : SProp) (H2 : Iso x3 x4)
  : imported_or x2 x4 -> Corelib.Init.Logic.or x1 x3 :=
  fun p => sinhabitant (or_from_sin H1 H2 p).

Instance or_iso : (forall (x1 : Prop) (x2 : SProp) 
                          (H1 : Iso x1 x2) (x3 : Prop) (x4 : SProp) (H2 : Iso x3 x4),
   Iso (Corelib.Init.Logic.or x1 x3) (imported_or x2 x4)).
Proof.
  intros x1 x2 H1 x3 x4 H2.
  unshelve eapply Build_Iso.
  - exact (or_to H1 H2).
  - exact (or_from H1 H2).
  - intro h. apply IsomorphismDefinitions.eq_refl.
  - intro p. destruct p as [a | b].
    + unfold or_from, or_to, or_from_sin. simpl.
      set (lhs := sinhabitant (sinhabits (@or_introl x1 x3 (from H1 (to H1 a))))).
      set (rhs := @or_introl x1 x3 a).
      pose proof (Stdlib.Logic.ProofIrrelevance.proof_irrelevance (x1 \/ x3) lhs rhs) as PIrr.
      exact (match PIrr in (_ = r) return (IsomorphismDefinitions.eq lhs r) with
             | Logic.eq_refl => IsomorphismDefinitions.eq_refl
             end).
    + unfold or_from, or_to, or_from_sin. simpl.
      set (lhs := sinhabitant (sinhabits (@or_intror x1 x3 (from H2 (to H2 b))))).
      set (rhs := @or_intror x1 x3 b).
      pose proof (Stdlib.Logic.ProofIrrelevance.proof_irrelevance (x1 \/ x3) lhs rhs) as PIrr.
      exact (match PIrr in (_ = r) return (IsomorphismDefinitions.eq lhs r) with
             | Logic.eq_refl => IsomorphismDefinitions.eq_refl
             end).
Defined.
Instance: KnownConstant Corelib.Init.Logic.or := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.or := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Corelib.Init.Logic.or or_iso := {}.
Instance: IsoStatementProofBetween Corelib.Init.Logic.or Imported.or or_iso := {}.
