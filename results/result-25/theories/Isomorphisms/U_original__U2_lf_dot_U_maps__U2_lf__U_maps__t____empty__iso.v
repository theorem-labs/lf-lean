From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__total____map__iso.

Definition imported_Original_LF__DOT__Maps_LF_Maps_t__empty : forall x : Type, x -> imported_String_string -> x := (@Imported.Original_LF__DOT__Maps_LF_Maps_t__empty).

Instance Original_LF__DOT__Maps_LF_Maps_t__empty_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2),
  rel_iso hx x3 x4 ->
  forall (x5 : String.string) (x6 : imported_String_string),
  rel_iso String_string_iso x5 x6 -> rel_iso hx (Original.LF_DOT_Maps.LF.Maps.t_empty x3 x5) (imported_Original_LF__DOT__Maps_LF_Maps_t__empty x4 x6).
Proof.
  intros x1 x2 hx x3 x4 Hx x5 x6 Hs.
  (* t_empty v _ = v and imported version is also fun _ => v *)
  unfold Original.LF_DOT_Maps.LF.Maps.t_empty, imported_Original_LF__DOT__Maps_LF_Maps_t__empty, Imported.Original_LF__DOT__Maps_LF_Maps_t__empty.
  exact Hx.
Defined.

Instance: KnownConstant (@Original.LF_DOT_Maps.LF.Maps.t_empty) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Maps_LF_Maps_t__empty) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Maps.LF.Maps.t_empty) Original_LF__DOT__Maps_LF_Maps_t__empty_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Maps.LF.Maps.t_empty) (@Imported.Original_LF__DOT__Maps_LF_Maps_t__empty) Original_LF__DOT__Maps_LF_Maps_t__empty_iso := {}.