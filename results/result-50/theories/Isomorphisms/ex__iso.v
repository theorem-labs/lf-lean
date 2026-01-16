From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


Definition imported_ex : forall x : Type, (x -> SProp) -> SProp := Imported.ex.

(* Helper: proof irrelevance for exists expressed in SProp eq *)
Lemma ex_proof_irrel {A : Type} {P : A -> Prop} (p q : exists y, P y) : IsomorphismDefinitions.eq p q.
Proof.
  pose proof (Stdlib.Logic.ProofIrrelevance.proof_irrelevance _ p q) as H.
  destruct H. exact (IsomorphismDefinitions.eq_refl _).
Defined.

Instance ex_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1 -> Prop) (x4 : x2 -> SProp), (forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> Iso (x3 x5) (x4 x6)) -> Iso (exists y, x3 y) (imported_ex x4).
Proof.
  intros x1 x2 hx x3 x4 Hpred.
  unshelve eapply Build_Iso.
  - (* to: (exists y : x1, x3 y) -> imported_ex x4 *)
    intro Hex.
    destruct Hex as [w Hw].
    apply (Imported.ex_intro x2 x4 (to hx w)).
    pose proof (Hpred w (to hx w) (IsomorphismDefinitions.eq_refl _)) as Hiso.
    exact (to Hiso Hw).
  - (* from: imported_ex x4 -> (exists y : x1, x3 y) *)
    intro Hex.
    (* Use sinhabitant to extract from SInhabited *)
    apply sinhabitant.
    (* Build SInhabited (exists y, x3 y) from imported_ex x4 *)
    refine (Imported.ex_indl x2 x4 (fun _ => SInhabited (exists y : x1, x3 y)) _ Hex).
    intros w Hw.
    apply sinhabits.
    exists (from hx w).
    pose proof (Hpred (from hx w) w) as Hiso.
    pose proof (to_from hx w) as Hrel.
    specialize (Hiso Hrel).
    exact (from Hiso Hw).
  - (* to_from: target is SProp, so trivially equal *)
    intro x.
    apply IsomorphismDefinitions.eq_refl.
  - (* from_to: use proof irrelevance for Prop existentials *)
    intro x.
    apply ex_proof_irrel.
Defined.
Instance: KnownConstant ex := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.ex := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor ex ex_iso := {}.
Instance: IsoStatementProofBetween ex Imported.ex ex_iso := {}.