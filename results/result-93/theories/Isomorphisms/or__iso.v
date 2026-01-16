From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *)


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
Definition or_from (x1 : Prop) (x2 : SProp) (H1 : Iso x1 x2) 
                   (x3 : Prop) (x4 : SProp) (H2 : Iso x3 x4)
  : imported_or x2 x4 -> Corelib.Init.Logic.or x1 x3 :=
  fun p => sinhabitant (match p with
    | Imported.or_inl _ _ h => sinhabits (or_introl (from H1 h))
    | Imported.or_inr _ _ h => sinhabits (or_intror (from H2 h))
    end).

Instance or_iso : (forall (x1 : Prop) (x2 : SProp) (_ : Iso x1 x2) (x3 : Prop) (x4 : SProp) (_ : Iso x3 x4), Iso (Corelib.Init.Logic.or x1 x3) (imported_or x2 x4)).
Proof.
  intros x1 x2 H1 x3 x4 H2.
  refine (Build_Iso (or_to H1 H2) (or_from H1 H2) _ _).
  (* to_from: eq (or_to (or_from p)) p where p : imported_or x2 x4 (SProp) *)
  (* Since imported_or x2 x4 is in SProp, all inhabitants are equal *)
  - intro p. apply IsomorphismDefinitions.eq_refl.
  (* from_to: eq (or_from (or_to p)) p where p : or x1 x3 (Prop) *)
  - intro p. destruct p as [a | b].
    + unfold or_from, or_to. simpl.
      (* Use proof irrelevance to get Prop equality, then convert to SProp eq *)
      set (lhs := sinhabitant (sinhabits (@or_introl x1 x3 (from H1 (to H1 a))))).
      set (rhs := @or_introl x1 x3 a).
      pose proof (Stdlib.Logic.ProofIrrelevance.proof_irrelevance (x1 \/ x3) lhs rhs) as PIrr.
      exact (match PIrr in (_ = r) return (IsomorphismDefinitions.eq lhs r) with
             | Logic.eq_refl => IsomorphismDefinitions.eq_refl
             end).
    + unfold or_from, or_to. simpl.
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
