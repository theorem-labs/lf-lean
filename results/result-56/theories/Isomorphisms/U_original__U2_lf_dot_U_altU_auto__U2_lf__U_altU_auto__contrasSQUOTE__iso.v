From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_logic__not__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_contras' : forall x : SProp, x -> (x -> imported_False) -> imported_Corelib_Init_Logic_eq imported_0 (imported_S imported_0) := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_contras'.
Monomorphic Instance Original_LF__DOT__AltAuto_LF_AltAuto_contras'_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : x1) (x4 : x2),
  rel_iso hx x3 x4 ->
  forall (x5 : ~ x1) (x6 : x2 -> imported_False),
  (forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> rel_iso False_iso (x5 x7) (x6 x8)) ->
  rel_iso (Corelib_Init_Logic_eq_iso _0_iso (S_iso _0_iso)) (Original.LF_DOT_AltAuto.LF.AltAuto.contras' x1 x3 x5) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_contras' x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.contras' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_contras' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.contras' Original_LF__DOT__AltAuto_LF_AltAuto_contras'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.contras' Imported.Original_LF__DOT__AltAuto_LF_AltAuto_contras' Original_LF__DOT__AltAuto_LF_AltAuto_contras'_iso := {}.