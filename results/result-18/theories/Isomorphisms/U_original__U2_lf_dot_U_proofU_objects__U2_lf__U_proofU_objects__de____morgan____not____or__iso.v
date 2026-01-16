From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_logic__not__iso Isomorphisms.and__iso Isomorphisms.or__iso.

Monomorphic Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_de__morgan__not__or : forall x x0 : SProp, (imported_or x x0 -> imported_False) -> imported_and (x -> imported_False) (x0 -> imported_False) := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_de__morgan__not__or.
Monomorphic Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_de__morgan__not__or_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : ~ (x1 \/ x3)) (x6 : imported_or x2 x4 -> imported_False),
  (forall (x7 : x1 \/ x3) (x8 : imported_or x2 x4), rel_iso (relax_Iso_Ts_Ps (or_iso hx hx0)) x7 x8 -> rel_iso (relax_Iso_Ts_Ps False_iso) (x5 x7) (x6 x8)) ->
  rel_iso (relax_Iso_Ts_Ps (and_iso (IsoArrow hx False_iso) (IsoArrow hx0 False_iso))) (Original.LF_DOT_ProofObjects.LF.ProofObjects.de_morgan_not_or x1 x3 x5)
    (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_de__morgan__not__or x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.de_morgan_not_or := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_de__morgan__not__or := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.de_morgan_not_or Original_LF__DOT__ProofObjects_LF_ProofObjects_de__morgan__not__or_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.de_morgan_not_or Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_de__morgan__not__or Original_LF__DOT__ProofObjects_LF_ProofObjects_de__morgan__not__or_iso := {}.