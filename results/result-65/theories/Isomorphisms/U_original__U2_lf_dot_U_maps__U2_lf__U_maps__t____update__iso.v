From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(*Typeclasses Opaque rel_iso.*)

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__total____map__iso.

Definition imported_Original_LF__DOT__Maps_LF_Maps_t__update : forall x : Type, (imported_String_string -> x) -> imported_String_string -> x -> imported_String_string -> x := (@Imported.Original_LF__DOT__Maps_LF_Maps_t__update).

Instance Original_LF__DOT__Maps_LF_Maps_t__update_iso : forall (x1 x2 : Type) (hx : IsoOrSortRelaxed x1 x2) (x3 : Original.LF_DOT_Maps.LF.Maps.total_map x1) (x4 : imported_String_string -> x2),
  (forall (x5 : String.string) (x6 : imported_String_string), rel_iso String_string_iso x5 x6 -> rel_iso_sort hx (x3 x5) (x4 x6)) ->
  forall (x5 : String.string) (x6 : imported_String_string),
  rel_iso String_string_iso x5 x6 ->
  forall (x7 : x1) (x8 : x2),
  rel_iso_sort hx x7 x8 ->
  forall (x9 : String.string) (x10 : imported_String_string),
  rel_iso String_string_iso x9 x10 -> rel_iso_sort hx (Original.LF_DOT_Maps.LF.Maps.t_update x3 x5 x7 x9) (imported_Original_LF__DOT__Maps_LF_Maps_t__update x4 x6 x8 x10).
Admitted.

Instance: KnownConstant (@Original.LF_DOT_Maps.LF.Maps.t_update) := {}.
Instance: KnownConstant (@Imported.Original_LF__DOT__Maps_LF_Maps_t__update) := {}.
Instance: IsoStatementProofFor (@Original.LF_DOT_Maps.LF.Maps.t_update) Original_LF__DOT__Maps_LF_Maps_t__update_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Maps.LF.Maps.t_update) (@Imported.Original_LF__DOT__Maps_LF_Maps_t__update) Original_LF__DOT__Maps_LF_Maps_t__update_iso := {}.
