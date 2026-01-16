From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__partial____map__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____empty__iso.

Definition imported_Original_LF__DOT__Maps_LF_Maps_empty : forall x : Type, imported_String_string -> imported_option x := (@Imported.Original_LF__DOT__Maps_LF_Maps_empty).

Instance Original_LF__DOT__Maps_LF_Maps_empty_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : String.string) (x4 : imported_String_string),
  rel_iso String_string_iso x3 x4 -> rel_iso (option_iso hx) (Original.LF_DOT_Maps.LF.Maps.empty x3) (imported_Original_LF__DOT__Maps_LF_Maps_empty x2 x4).
Proof.
  intros x1 x2 hx x3 x4 Hs.
  (* empty = t_empty None, so we use the t_empty isomorphism *)
  unfold Original.LF_DOT_Maps.LF.Maps.empty, imported_Original_LF__DOT__Maps_LF_Maps_empty, Imported.Original_LF__DOT__Maps_LF_Maps_empty.
  (* Now both sides are t_empty applied to None *)
  constructor; simpl.
  (* The isomorphism between option values: None maps to option_None *)
  unfold option_to_imported.
  reflexivity.
Defined.

Instance: KnownConstant (@Original.LF_DOT_Maps.LF.Maps.empty) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Maps_LF_Maps_empty) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Maps.LF.Maps.empty) Original_LF__DOT__Maps_LF_Maps_empty_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Maps.LF.Maps.empty) (@Imported.Original_LF__DOT__Maps_LF_Maps_empty) Original_LF__DOT__Maps_LF_Maps_empty_iso := {}.