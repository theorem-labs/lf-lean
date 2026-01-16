From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Import Stdlib.Logic.ProofIrrelevance.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


Definition imported_or : SProp -> SProp -> SProp := Imported.or.

(* Helper functions for the iso *)
Definition or_to (x1 x3 : Prop) (x2 x4 : SProp) (iso1 : Iso x1 x2) (iso2 : Iso x3 x4)
  : x1 \/ x3 -> Imported.or x2 x4 :=
  fun p => match p with
           | or_introl a => Imported.or_inl x2 x4 (to iso1 a)
           | or_intror b => Imported.or_inr x2 x4 (to iso2 b)
           end.

Definition or_from (x1 x3 : Prop) (x2 x4 : SProp) (iso1 : Iso x1 x2) (iso2 : Iso x3 x4)
  : Imported.or x2 x4 -> x1 \/ x3 :=
  fun m => sinhabitant (Imported.or_indl x2 x4 (fun _ => SInhabited (x1 \/ x3)) 
    (fun a => sinhabits (or_introl (from iso1 a)))
    (fun b => sinhabits (or_intror (from iso2 b)))
    m).

Instance or_iso : (forall (x1 : Prop) (x2 : SProp) (_ : Iso x1 x2) (x3 : Prop) (x4 : SProp) (_ : Iso x3 x4), Iso (x1 \/ x3) (imported_or x2 x4)).
Proof.
  intros x1 x2 iso1 x3 x4 iso2.
  refine {| to := or_to iso1 iso2;
            from := or_from iso1 iso2 |}.
  (* to_from: need to show to(from x) = x *)
  { intro x. apply IsomorphismDefinitions.eq_refl. }
  (* from_to: need to show from(to x) = x *)
  { intro x.
    apply seq_of_peq_t.
    apply (proof_irrelevance (x1 \/ x3)). }
Defined.

Instance: KnownConstant Logic.or := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.or := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Logic.or or_iso := {}.
Instance: IsoStatementProofBetween Logic.or Imported.or or_iso := {}.
