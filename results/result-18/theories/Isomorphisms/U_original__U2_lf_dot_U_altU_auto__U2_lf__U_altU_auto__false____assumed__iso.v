From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_original__U_false__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_false__assumed : imported_Original_False -> imported_Corelib_Init_Logic_eq imported_0 (imported_S imported_0) := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_false__assumed.
Monomorphic Instance Original_LF__DOT__AltAuto_LF_AltAuto_false__assumed_iso : forall (x1 : Original.False) (x2 : imported_Original_False),
  rel_iso Original_False_iso x1 x2 ->
  rel_iso (Corelib_Init_Logic_eq_iso _0_iso (S_iso _0_iso)) (Original.LF_DOT_AltAuto.LF.AltAuto.false_assumed x1) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_false__assumed x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.false_assumed := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_false__assumed := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.false_assumed Original_LF__DOT__AltAuto_LF_AltAuto_false__assumed_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.false_assumed Imported.Original_LF__DOT__AltAuto_LF_AltAuto_false__assumed Original_LF__DOT__AltAuto_LF_AltAuto_false__assumed_iso := {}.