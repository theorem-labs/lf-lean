From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.and__iso.

Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_conj__fact : forall x x0 x1 : SProp, imported_and x x0 -> imported_and x0 x1 -> imported_and x x1 := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_conj__fact.
Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_conj__fact_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : Prop) (x6 : SProp) (hx1 : Iso x5 x6) (x7 : x1 /\ x3) (x8 : imported_and x2 x4),
  rel_iso (and_iso hx hx0) x7 x8 ->
  forall (x9 : x3 /\ x5) (x10 : imported_and x4 x6),
  rel_iso (and_iso hx0 hx1) x9 x10 ->
  rel_iso (and_iso hx hx1) (Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.conj_fact x1 x3 x5 x7 x9) (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_conj__fact x8 x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.conj_fact := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_conj__fact := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.conj_fact Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_conj__fact_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.conj_fact Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_conj__fact Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_conj__fact_iso := {}.