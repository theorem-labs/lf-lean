From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_logic__not__iso Isomorphisms.and__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_contradiction__implies__anything : forall x x0 : SProp, imported_and x (x -> imported_False) -> x0 := Imported.Original_LF__DOT__Logic_LF_Logic_contradiction__implies__anything.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_contradiction__implies__anything_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : x1 /\ ~ x1) (x6 : imported_and x2 (x2 -> imported_False)),
  rel_iso (relax_Iso_Ts_Ps (and_iso hx (IsoArrow hx False_iso))) x5 x6 ->
  rel_iso hx0 (Original.LF_DOT_Logic.LF.Logic.contradiction_implies_anything x1 x3 x5) (imported_Original_LF__DOT__Logic_LF_Logic_contradiction__implies__anything x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.contradiction_implies_anything := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_contradiction__implies__anything := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.contradiction_implies_anything Original_LF__DOT__Logic_LF_Logic_contradiction__implies__anything_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.contradiction_implies_anything Imported.Original_LF__DOT__Logic_LF_Logic_contradiction__implies__anything Original_LF__DOT__Logic_LF_Logic_contradiction__implies__anything_iso := {}.