From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_true__iso.

Monomorphic Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_match__ex1 : imported_True := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_match__ex1.
Monomorphic Instance Original_LF__DOT__AltAuto_LF_AltAuto_match__ex1_iso : rel_iso True_iso Original.LF_DOT_AltAuto.LF.AltAuto.match_ex1 imported_Original_LF__DOT__AltAuto_LF_AltAuto_match__ex1.
Admitted.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.match_ex1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_match__ex1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.match_ex1 Original_LF__DOT__AltAuto_LF_AltAuto_match__ex1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.match_ex1 Imported.Original_LF__DOT__AltAuto_LF_AltAuto_match__ex1 Original_LF__DOT__AltAuto_LF_AltAuto_match__ex1_iso := {}.