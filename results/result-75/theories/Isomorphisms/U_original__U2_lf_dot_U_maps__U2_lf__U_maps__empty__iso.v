From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__partial____map__iso.

Monomorphic Definition imported_Original_LF__DOT__Maps_LF_Maps_empty : forall x : Type, imported_String_string -> imported_option x := (@Imported.Original_LF__DOT__Maps_LF_Maps_empty).
Monomorphic Instance Original_LF__DOT__Maps_LF_Maps_empty_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : String.string) (x4 : imported_String_string),
  rel_iso String_string_iso x3 x4 -> rel_iso (option_iso hx) (Original.LF_DOT_Maps.LF.Maps.empty x3) (imported_Original_LF__DOT__Maps_LF_Maps_empty x2 x4).
Admitted.
Instance: KnownConstant (@Original.LF_DOT_Maps.LF.Maps.empty) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Maps_LF_Maps_empty) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Maps.LF.Maps.empty) Original_LF__DOT__Maps_LF_Maps_empty_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Maps.LF.Maps.empty) (@Imported.Original_LF__DOT__Maps_LF_Maps_empty) Original_LF__DOT__Maps_LF_Maps_empty_iso := {}.