From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_eq : forall x : Type, x -> x -> SProp := (@Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_eq).
Monomorphic Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_eq_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2),
  rel_iso hx x3 x4 -> forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> Iso (Original.LF_DOT_ProofObjects.LF.ProofObjects.eq x3 x5) (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_eq x4 x6).
Admitted.
Instance: KnownConstant (@Original.LF_DOT_ProofObjects.LF.ProofObjects.eq) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_eq) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_ProofObjects.LF.ProofObjects.eq) Original_LF__DOT__ProofObjects_LF_ProofObjects_eq_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_ProofObjects.LF.ProofObjects.eq) (@Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_eq) Original_LF__DOT__ProofObjects_LF_ProofObjects_eq_iso := {}.