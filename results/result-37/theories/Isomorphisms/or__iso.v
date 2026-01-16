From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

Definition imported_or : SProp -> SProp -> SProp := Imported.or.

(* Build the 'to' function *)
Definition or_to (x1 : Prop) (x2 : SProp) (H1 : Iso x1 x2) 
                 (x3 : Prop) (x4 : SProp) (H2 : Iso x3 x4)
  : Corelib.Init.Logic.or x1 x3 -> imported_or x2 x4 :=
  fun p => match p with
  | or_introl a => Imported.or_or_introl x2 x4 (to H1 a)
  | or_intror b => Imported.or_or_intror x2 x4 (to H2 b)
  end.

(* Build the 'from' function using SInhabited/sinhabitant trick *)
Definition or_from_sinhabited (x1 : Prop) (x2 : SProp) (H1 : Iso x1 x2) 
                   (x3 : Prop) (x4 : SProp) (H2 : Iso x3 x4)
  : imported_or x2 x4 -> SInhabited (Corelib.Init.Logic.or x1 x3).
Proof.
  intro p.
  unfold imported_or in p.
  apply (Imported.or_indl x2 x4 (fun _ => SInhabited (Corelib.Init.Logic.or x1 x3))).
  - intro h. apply sinhabits. apply or_introl. exact (from H1 h).
  - intro h. apply sinhabits. apply or_intror. exact (from H2 h).
  - exact p.
Defined.

Definition or_from (x1 : Prop) (x2 : SProp) (H1 : Iso x1 x2) 
                   (x3 : Prop) (x4 : SProp) (H2 : Iso x3 x4)
  : imported_or x2 x4 -> Corelib.Init.Logic.or x1 x3 :=
  fun p => sinhabitant (or_from_sinhabited H1 H2 p).

#[local] Unset Universe Polymorphism.
Instance or_iso : forall (x1 : Prop) (x2 : SProp), Iso x1 x2 -> forall (x3 : Prop) (x4 : SProp), Iso x3 x4 -> Iso (x1 \/ x3) (imported_or x2 x4).
Proof.
  intros x1 x2 H1 x3 x4 H2.
  unshelve refine {|
    to := or_to H1 H2;
    from := or_from H1 H2
  |}.
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

Instance: KnownConstant Corelib.Init.Logic.or := {}.
Instance: KnownConstant Imported.or := {}.
Instance: IsoStatementProofFor Corelib.Init.Logic.or or_iso := {}.
Instance: IsoStatementProofBetween Corelib.Init.Logic.or Imported.or or_iso := {}.
