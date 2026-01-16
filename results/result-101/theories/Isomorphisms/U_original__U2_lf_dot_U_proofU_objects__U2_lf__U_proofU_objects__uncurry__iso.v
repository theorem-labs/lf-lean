From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.and__iso.

Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_uncurry : forall x x0 x1 : SProp, (x -> x0 -> x1) -> imported_and x x0 -> x1 := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_uncurry.
Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_uncurry_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : Prop) (x6 : SProp) (hx1 : Iso x5 x6) (x7 : x1 -> x3 -> x5) (x8 : x2 -> x4 -> x6),
  (forall (x9 : x1) (x10 : x2), rel_iso hx x9 x10 -> forall (x11 : x3) (x12 : x4), rel_iso hx0 x11 x12 -> rel_iso hx1 (x7 x9 x11) (x8 x10 x12)) ->
  forall (x9 : x1 /\ x3) (x10 : imported_and x2 x4),
  rel_iso (and_iso hx hx0) x9 x10 -> rel_iso hx1 (Original.LF_DOT_ProofObjects.LF.ProofObjects.uncurry x1 x3 x5 x7 x9) (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_uncurry x8 x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.uncurry := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_uncurry := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.uncurry Original_LF__DOT__ProofObjects_LF_ProofObjects_uncurry_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.uncurry Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_uncurry Original_LF__DOT__ProofObjects_LF_ProofObjects_uncurry_iso := {}.