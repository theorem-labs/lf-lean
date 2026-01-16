From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)


From Stdlib Require Import ProofIrrelevance.

Definition imported_iff : SProp -> SProp -> SProp := Imported.iff.

(* Build an Iso between (x1 <-> x3) and (imported_iff x2 x4) *)
(* imported_iff x2 x4 = PandType (x2 -> x4) (x4 -> x2) *)
Instance iff_iso : forall (x1 : Prop) (x2 : SProp), Iso x1 x2 -> forall (x3 : Prop) (x4 : SProp), Iso x3 x4 -> Iso (x1 <-> x3) (imported_iff x2 x4).
Proof.
  intros x1 x2 hx x3 x4 hx0.
  unfold imported_iff, Imported.iff.
  unshelve econstructor.
  - (* to : (x1 <-> x3) -> PandType (x2 -> x4) (x4 -> x2) *)
    intros [H1 H2].
    exact (Imported.PandType_conj _ _ (fun a => hx0.(to) (H1 (hx.(from) a))) (fun b => hx.(to) (H2 (hx0.(from) b)))).
  - (* from : PandType (x2 -> x4) (x4 -> x2) -> (x1 <-> x3) *)
    intros H.
    destruct H as [mp mpr].
    split.
    + intros a. exact (hx0.(from) (mp (hx.(to) a))).
    + intros b. exact (hx.(from) (mpr (hx0.(to) b))).
  - (* to_from *)
    intros x.
    (* Since PandType is in SProp, this is trivial by proof irrelevance *)
    apply IsomorphismDefinitions.eq_refl.
  - (* from_to *)
    intros x.
    (* x1 <-> x3 is in Prop, so we use proof_irrelevance *)
    destruct x as [H1 H2].
    assert (H1' : forall (p q : x1 <-> x3), IsomorphismDefinitions.eq p q).
    { intros p q.
      assert (Heq : p = q) by (apply proof_irrelevance).
      rewrite Heq. apply IsomorphismDefinitions.eq_refl. }
    apply H1'.
Defined.
Instance: KnownConstant iff := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.iff := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor iff iff_iso := {}.
Instance: IsoStatementProofBetween iff Imported.iff iff_iso := {}.
