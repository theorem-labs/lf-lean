From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.and__iso.

Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_and__assoc : forall x x0 x1 : SProp, imported_and x (imported_and x0 x1) -> imported_and (imported_and x x0) x1 := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_and__assoc.
Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_and__assoc_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : Prop) (x6 : SProp) (hx1 : Iso x5 x6) (x7 : x1 /\ x3 /\ x5)
    (x8 : imported_and x2 (imported_and x4 x6)),
  rel_iso (relax_Iso_Ts_Ps (and_iso hx (and_iso hx0 hx1))) x7 x8 ->
  rel_iso (relax_Iso_Ts_Ps (and_iso (and_iso hx hx0) hx1)) (Original.LF_DOT_ProofObjects.LF.ProofObjects.and_assoc x1 x3 x5 x7) (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_and__assoc x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.and_assoc := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_and__assoc := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.and_assoc Original_LF__DOT__ProofObjects_LF_ProofObjects_and__assoc_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.and_assoc Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_and__assoc Original_LF__DOT__ProofObjects_LF_ProofObjects_and__assoc_iso := {}.