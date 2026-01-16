From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_logic__not__iso Isomorphisms.U_original__U2_lf_dot_U_altU_auto__U2_lf__U_altU_auto__nor__iso Isomorphisms.and__iso.

Monomorphic Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_nor__not__and' : forall x x0 : SProp, imported_Original_LF__DOT__AltAuto_LF_AltAuto_nor x x0 -> imported_and x x0 -> imported_False := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nor__not__and'.
Monomorphic Instance Original_LF__DOT__AltAuto_LF_AltAuto_nor__not__and'_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : Original.LF_DOT_AltAuto.LF.AltAuto.nor x1 x3)
    (x6 : imported_Original_LF__DOT__AltAuto_LF_AltAuto_nor x2 x4),
  rel_iso (Original_LF__DOT__AltAuto_LF_AltAuto_nor_iso hx hx0) x5 x6 ->
  forall (x7 : x1 /\ x3) (x8 : imported_and x2 x4),
  rel_iso (and_iso hx hx0) x7 x8 -> rel_iso False_iso (Original.LF_DOT_AltAuto.LF.AltAuto.nor_not_and' x1 x3 x5 x7) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_nor__not__and' x6 x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.nor_not_and' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nor__not__and' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.nor_not_and' Original_LF__DOT__AltAuto_LF_AltAuto_nor__not__and'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.nor_not_and' Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nor__not__and' Original_LF__DOT__AltAuto_LF_AltAuto_nor__not__and'_iso := {}.