From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf__U_rel__relation__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf__U_rel__reflexive__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf__U_rel__symmetric__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf__U_rel__transitive__iso.
From IsomorphismChecker Require Export Isomorphisms.and__iso.

(* Helper: isomorphism between Prop /\ and Lean.And *)
Definition iso_and_to_Lean_And (A B : Prop) (A' B' : SProp) (HA : Iso A A') (HB : Iso B B') : Iso (A /\ B) (Lean.And A' B').
Proof.
  destruct HA as [toA fromA to_fromA from_toA].
  destruct HB as [toB fromB to_fromB from_toB].
  refine (Build_Iso 
    (fun ab : A /\ B => match ab with conj a b => @Lean.And_intro A' B' (toA a) (toB b) end)
    (fun ab : Lean.And A' B' => @conj A B (fromA (@Lean.left A' B' ab)) (fromB (@Lean.right A' B' ab)))
    _
    _).
  - (* to_from *) intro x.
    apply IsomorphismDefinitions.eq_refl.
  - (* from_to *) intro x. destruct x as [a b].
    apply seq_of_eq.
    apply Stdlib.Logic.ProofIrrelevance.proof_irrelevance.
Defined.

Monomorphic Definition imported_Original_LF_Rel_equivalence : forall x : Type, (x -> x -> SProp) -> SProp := (@Imported.Original_LF_Rel_equivalence).

Instance Original_LF_Rel_equivalence_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF.Rel.relation x1) (x4 : x2 -> x2 -> SProp),
  (forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> Iso (x3 x5 x7) (x4 x6 x8)) ->
  Iso (Original.LF.Rel.equivalence x3) (imported_Original_LF_Rel_equivalence x4).
Proof.
  intros x1 x2 hx x3 x4 hx0.
  unfold Original.LF.Rel.equivalence, imported_Original_LF_Rel_equivalence.
  unfold Imported.Original_LF_Rel_equivalence.
  (* Goal: Iso (reflexive x3 /\ symmetric x3 /\ transitive x3) 
              (And (refl x4) (And (symm x4) (trans x4))) *)
  apply iso_and_to_Lean_And.
  - (* reflexive iso *)
    exact (@Original_LF_Rel_reflexive_iso x1 x2 hx x3 x4 hx0).
  - (* symmetric /\ transitive iso to Lean.And *)
    apply iso_and_to_Lean_And.
    + exact (@Original_LF_Rel_symmetric_iso x1 x2 hx x3 x4 hx0).
    + exact (@Original_LF_Rel_transitive_iso x1 x2 hx x3 x4 hx0).
Defined.

Instance: KnownConstant (@Original.LF.Rel.equivalence) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF_Rel_equivalence) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF.Rel.equivalence) Original_LF_Rel_equivalence_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF.Rel.equivalence) (@Imported.Original_LF_Rel_equivalence) Original_LF_Rel_equivalence_iso := {}.
