From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_altU_auto__U2_lf__U_altU_auto__nor__iso Isomorphisms.iff__iso.

Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_nor__comm : forall x x0 : SProp, imported_iff (imported_Original_LF__DOT__AltAuto_LF_AltAuto_nor x x0) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_nor x0 x) := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nor__comm.
Instance Original_LF__DOT__AltAuto_LF_AltAuto_nor__comm_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4),
  rel_iso
    {|
      to := iff_iso (Original_LF__DOT__AltAuto_LF_AltAuto_nor_iso hx hx0) (Original_LF__DOT__AltAuto_LF_AltAuto_nor_iso hx0 hx);
      from := from (iff_iso (Original_LF__DOT__AltAuto_LF_AltAuto_nor_iso hx hx0) (Original_LF__DOT__AltAuto_LF_AltAuto_nor_iso hx0 hx));
      to_from :=
        fun x : imported_iff (imported_Original_LF__DOT__AltAuto_LF_AltAuto_nor x2 x4) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_nor x4 x2) =>
        to_from (iff_iso (Original_LF__DOT__AltAuto_LF_AltAuto_nor_iso hx hx0) (Original_LF__DOT__AltAuto_LF_AltAuto_nor_iso hx0 hx)) x;
      from_to :=
        fun x : Original.LF_DOT_AltAuto.LF.AltAuto.nor x1 x3 <-> Original.LF_DOT_AltAuto.LF.AltAuto.nor x3 x1 =>
        seq_p_of_t (from_to (iff_iso (Original_LF__DOT__AltAuto_LF_AltAuto_nor_iso hx hx0) (Original_LF__DOT__AltAuto_LF_AltAuto_nor_iso hx0 hx)) x)
    |} (Original.LF_DOT_AltAuto.LF.AltAuto.nor_comm x1 x3) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_nor__comm x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.nor_comm := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nor__comm := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.nor_comm Original_LF__DOT__AltAuto_LF_AltAuto_nor__comm_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.nor_comm Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nor__comm Original_LF__DOT__AltAuto_LF_AltAuto_nor__comm_iso := {}.