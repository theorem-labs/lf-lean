From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__total____map__iso Isomorphisms.U_string__string__iso.

Definition imported_Original_LF__DOT__Maps_LF_Maps_t__empty (A : Type) (v : A) : imported_Original_LF__DOT__Maps_LF_Maps_total__map A := Imported.Original_LF__DOT__Maps_LF_Maps_t__empty A v.

Instance Original_LF__DOT__Maps_LF_Maps_t__empty_iso : forall (A1 A2 : Type) (IA : Iso A1 A2)
  (x1 : A1) (x2 : A2) (H : rel_iso IA x1 x2)
  (x3 : String.string) (x4 : imported_String_string) (Hx : rel_iso String_string_iso x3 x4),
  rel_iso IA (Original.LF_DOT_Maps.LF.Maps.t_empty x1 x3) (Imported.Original_LF__DOT__Maps_LF_Maps_t__empty A2 x2 x4).
Proof.
  intros A1 A2 IA x1 x2 H x3 x4 Hx.
  unfold Imported.Original_LF__DOT__Maps_LF_Maps_t__empty.
  unfold Original.LF_DOT_Maps.LF.Maps.t_empty.
  exact H.
Defined.

Instance: KnownConstant (@Original.LF_DOT_Maps.LF.Maps.t_empty) := {}.
Instance: KnownConstant (@Imported.Original_LF__DOT__Maps_LF_Maps_t__empty) := {}.
Instance: IsoStatementProofFor (@Original.LF_DOT_Maps.LF.Maps.t_empty) Original_LF__DOT__Maps_LF_Maps_t__empty_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Maps.LF.Maps.t_empty) (@imported_Original_LF__DOT__Maps_LF_Maps_t__empty) Original_LF__DOT__Maps_LF_Maps_t__empty_iso := {}.
