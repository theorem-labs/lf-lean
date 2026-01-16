From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Unset Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.iff__iso Isomorphisms.or__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_or__assoc : forall x x0 x1 : SProp, imported_iff (imported_or x (imported_or x0 x1)) (imported_or (imported_or x x0) x1) := Imported.Original_LF__DOT__Logic_LF_Logic_or__assoc.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_or__assoc_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : Prop) (x6 : SProp) (hx1 : Iso x5 x6),
  rel_iso (relax_Iso_Ts_Ps (iff_iso (or_iso hx (or_iso hx0 hx1)) (or_iso (or_iso hx hx0) hx1))) (Original.LF_DOT_Logic.LF.Logic.or_assoc x1 x3 x5)
    (imported_Original_LF__DOT__Logic_LF_Logic_or__assoc x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.or_assoc := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_or__assoc := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.or_assoc Original_LF__DOT__Logic_LF_Logic_or__assoc_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.or_assoc Imported.Original_LF__DOT__Logic_LF_Logic_or__assoc Original_LF__DOT__Logic_LF_Logic_or__assoc_iso := {}.