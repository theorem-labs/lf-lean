From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.and__iso.

Monomorphic Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_proj1'' : forall x x0 : SProp, imported_and x x0 -> x := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_proj1''.
Monomorphic Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_proj1''_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : x1 /\ x3) (x6 : imported_and x2 x4),
  rel_iso (and_iso hx hx0) x5 x6 -> rel_iso hx (Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.proj1'' x1 x3 x5) (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_proj1'' x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.proj1'' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_proj1'' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.proj1'' Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_proj1''_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.proj1'' Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_proj1'' Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_proj1''_iso := {}.