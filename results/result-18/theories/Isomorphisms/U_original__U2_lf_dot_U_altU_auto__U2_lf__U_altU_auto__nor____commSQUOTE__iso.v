From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_altU_auto__U2_lf__U_altU_auto__nor__iso Isomorphisms.iff__iso.

Monomorphic Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_nor__comm' : forall x x0 : SProp, imported_iff (imported_Original_LF__DOT__AltAuto_LF_AltAuto_nor x x0) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_nor x0 x) := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nor__comm'.
Monomorphic Instance Original_LF__DOT__AltAuto_LF_AltAuto_nor__comm'_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4),
  rel_iso (relax_Iso_Ts_Ps (iff_iso (Original_LF__DOT__AltAuto_LF_AltAuto_nor_iso hx hx0) (Original_LF__DOT__AltAuto_LF_AltAuto_nor_iso hx0 hx))) (Original.LF_DOT_AltAuto.LF.AltAuto.nor_comm' x1 x3)
    (imported_Original_LF__DOT__AltAuto_LF_AltAuto_nor__comm' x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.nor_comm' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nor__comm' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.nor_comm' Original_LF__DOT__AltAuto_LF_AltAuto_nor__comm'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.nor_comm' Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nor__comm' Original_LF__DOT__AltAuto_LF_AltAuto_nor__comm'_iso := {}.