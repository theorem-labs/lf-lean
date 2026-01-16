From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_logic__not__iso Isomorphisms.U_original__U2_lf_dot_U_altU_auto__U2_lf__U_altU_auto__nor__iso Isomorphisms.iff__iso.

Monomorphic Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_nor__not' : forall x : SProp, imported_iff (imported_Original_LF__DOT__AltAuto_LF_AltAuto_nor x x) (x -> imported_False) := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nor__not'.
Monomorphic Instance Original_LF__DOT__AltAuto_LF_AltAuto_nor__not'_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2),
  rel_iso (relax_Iso_Ts_Ps (iff_iso (Original_LF__DOT__AltAuto_LF_AltAuto_nor_iso hx hx) (IsoArrow hx False_iso))) (Original.LF_DOT_AltAuto.LF.AltAuto.nor_not' x1)
    (imported_Original_LF__DOT__AltAuto_LF_AltAuto_nor__not' x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.nor_not' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nor__not' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.nor_not' Original_LF__DOT__AltAuto_LF_AltAuto_nor__not'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.nor_not' Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nor__not' Original_LF__DOT__AltAuto_LF_AltAuto_nor__not'_iso := {}.