From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_match__ex3 : forall x : SProp, x -> x := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_match__ex3.
Monomorphic Instance Original_LF__DOT__AltAuto_LF_AltAuto_match__ex3_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : x1) (x4 : x2),
  rel_iso hx x3 x4 -> rel_iso hx (Original.LF_DOT_AltAuto.LF.AltAuto.match_ex3 x1 x3) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_match__ex3 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.match_ex3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_match__ex3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.match_ex3 Original_LF__DOT__AltAuto_LF_AltAuto_match__ex3_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.match_ex3 Imported.Original_LF__DOT__AltAuto_LF_AltAuto_match__ex3 Original_LF__DOT__AltAuto_LF_AltAuto_match__ex3_iso := {}.