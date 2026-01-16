From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* (* Typeclasses Opaque rel_iso. *) *) *) (* for speed *)


Definition imported_ex : forall x : Type, (x -> SProp) -> SProp := Imported.ex.

(* Helper: Convert Imported.ex to SInhabited of a Prop existential - this is valid in SProp *)
Definition imported_ex_to_sinhabited {x1 x2 : Type} (hx : Iso x1 x2) (P : x1 -> Prop) (Q : x2 -> SProp)
  (H_pred_iso : forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> Iso (P x5) (Q x6))
  (Hex : Imported.ex x2 Q) : SInhabited (exists y : x1, P y).
Proof.
  destruct Hex as [w Hw].
  apply sinhabits.
  exists (from hx w).
  assert (Hrel : rel_iso hx (from hx w) w) by (simpl; apply (to_from hx w)).
  pose proof (H_pred_iso (from hx w) w Hrel) as Hiso_pred.
  exact (from Hiso_pred Hw).
Defined.

(* Helper functions for the isomorphism *)
Definition ex_to_imported_ex {x1 x2 : Type} (hx : Iso x1 x2) (P : x1 -> Prop) (Q : x2 -> SProp)
  (H_pred_iso : forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> Iso (P x5) (Q x6))
  (Hex : exists y, P y) : Imported.ex x2 Q :=
  match Hex with
  | ex_intro _ w Hw => 
      let Hrel : rel_iso hx w (to hx w) := IsomorphismDefinitions.eq_refl in
      let Hiso_pred := H_pred_iso w (to hx w) Hrel in
      Imported.ex_intro _ _ (to hx w) (to Hiso_pred Hw)
  end.

Definition imported_ex_to_ex {x1 x2 : Type} (hx : Iso x1 x2) (P : x1 -> Prop) (Q : x2 -> SProp)
  (H_pred_iso : forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> Iso (P x5) (Q x6))
  (Hex : Imported.ex x2 Q) : exists y, P y :=
  sinhabitant (@imported_ex_to_sinhabited x1 x2 hx P Q H_pred_iso Hex).

(* Build the isomorphism - use relax_Iso_Ps_Ts to fix universe issues *)
Instance ex_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1 -> Prop) (x4 : x2 -> SProp), (forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> Iso (x3 x5) (x4 x6)) -> Iso (exists y, x3 y) (imported_ex x4).
Proof.
  intros x1 x2 hx P Q H_pred_iso.
  unfold imported_ex.
  apply relax_Iso_Ps_Ts.
  refine {|
    to := @ex_to_imported_ex x1 x2 hx P Q H_pred_iso;
    from := @imported_ex_to_ex x1 x2 hx P Q H_pred_iso;
    to_from := _;
    from_to := _
  |}.
  - (* to_from: SProp codomain, trivial *)
    intro s.
    apply IsomorphismDefinitions.eq_refl.
  - (* from_to: Prop domain - use proof irrelevance *)
    intro p.
    exact (seq_of_peq (Stdlib.Logic.ProofIrrelevance.proof_irrelevance _ _ _)).
Defined.

Instance: KnownConstant ex := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.ex := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor ex ex_iso := {}.
Instance: IsoStatementProofBetween ex Imported.ex ex_iso := {}.