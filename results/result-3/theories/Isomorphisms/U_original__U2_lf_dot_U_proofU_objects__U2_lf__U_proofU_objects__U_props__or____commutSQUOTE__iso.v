From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_proofU_objects__U2_lf__U_proofU_objects__U_props__or__iso.

Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or__commut' : forall x x0 : SProp, imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or x x0 -> imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or x0 x := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or__commut'.

(* rel_iso (Iso P Q) x y  means  to x = y  in SProp.
   Since SProp has proof-irrelevant equality, we just need to show that
   the 'to' function of the isomorphism applied to the result on the left
   equals the result on the right. This follows because both sides produce
   values in the same SProp type. *)
Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or__commut'_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.or x1 x3)
    (x6 : imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or x2 x4),
  rel_iso (Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or_iso hx hx0) x5 x6 ->
  rel_iso (Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or_iso hx0 hx) (Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.or_commut' x1 x3 x5)
    (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or__commut' x6).
Proof.
  intros x1 x2 hx x3 x4 hx0 x5 x6 Hrel.
  (* Both sides produce values in SProp, so they're equal by proof irrelevance in SProp *)
  unfold rel_iso, or_to.
  simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.or_commut' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or__commut' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.or_commut' Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or__commut'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.or_commut' Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or__commut' Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or__commut'_iso := {}.