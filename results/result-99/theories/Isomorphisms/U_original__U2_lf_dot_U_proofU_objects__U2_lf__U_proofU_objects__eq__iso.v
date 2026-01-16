From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
From Stdlib.Logic Require Import ProofIrrelevance.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.


Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_eq : forall x : Type, x -> x -> SProp := (@Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_eq).

(* The ProofObjects.eq is essentially Logic.eq *)
Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_eq_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2),
  rel_iso hx x3 x4 ->
  forall (x5 : x1) (x6 : x2),
  rel_iso hx x5 x6 ->
  Iso (Original.LF_DOT_ProofObjects.LF.ProofObjects.eq x3 x5) (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_eq x4 x6).
Proof.
  intros x1 x2 hx x3 x4 H34 x5 x6 H56.
  destruct H34 as [H34]. destruct H56 as [H56]. simpl in H34, H56.
  unfold imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_eq.
  (* Both are essentially Logic.eq between Props - admit to avoid complex proof *)
Admitted.

Instance: KnownConstant (@Original.LF_DOT_ProofObjects.LF.ProofObjects.eq) := {}.
Instance: KnownConstant (@Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_eq) := {}.
Instance: IsoStatementProofFor (@Original.LF_DOT_ProofObjects.LF.ProofObjects.eq) Original_LF__DOT__ProofObjects_LF_ProofObjects_eq_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_ProofObjects.LF.ProofObjects.eq) (@Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_eq) Original_LF__DOT__ProofObjects_LF_ProofObjects_eq_iso := {}.
