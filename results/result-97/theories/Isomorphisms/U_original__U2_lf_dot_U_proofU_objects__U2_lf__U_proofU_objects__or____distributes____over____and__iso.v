From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.and__iso Isomorphisms.iff__iso Isomorphisms.or__iso.

Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_or__distributes__over__and : forall x x0 x1 : SProp, imported_iff (imported_or x (imported_and x0 x1)) (imported_and (imported_or x x0) (imported_or x x1)) := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_or__distributes__over__and.
Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_or__distributes__over__and_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : Prop) (x6 : SProp) (hx1 : Iso x5 x6),
  rel_iso (relax_Iso_Ts_Ps (iff_iso (or_iso hx (and_iso hx0 hx1)) (and_iso (or_iso hx hx0) (or_iso hx hx1)))) (Original.LF_DOT_ProofObjects.LF.ProofObjects.or_distributes_over_and x1 x3 x5)
    (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_or__distributes__over__and x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.or_distributes_over_and := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_or__distributes__over__and := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.or_distributes_over_and Original_LF__DOT__ProofObjects_LF_ProofObjects_or__distributes__over__and_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.or_distributes_over_and Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_or__distributes__over__and Original_LF__DOT__ProofObjects_LF_ProofObjects_or__distributes__over__and_iso := {}.