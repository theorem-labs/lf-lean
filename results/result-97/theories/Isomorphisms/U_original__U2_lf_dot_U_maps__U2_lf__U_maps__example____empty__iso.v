From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__total____map__iso Isomorphisms.bool__iso.

Definition imported_Original_LF__DOT__Maps_LF_Maps_example__empty : imported_String_string -> imported_bool := Imported.Original_LF__DOT__Maps_LF_Maps_example__empty.
Instance Original_LF__DOT__Maps_LF_Maps_example__empty_iso : forall (x1 : String.string) (x2 : imported_String_string),
  rel_iso String_string_iso x1 x2 -> rel_iso bool_iso (Original.LF_DOT_Maps.LF.Maps.example_empty x1) (imported_Original_LF__DOT__Maps_LF_Maps_example__empty x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Maps.LF.Maps.example_empty := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Maps_LF_Maps_example__empty := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Maps.LF.Maps.example_empty Original_LF__DOT__Maps_LF_Maps_example__empty_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Maps.LF.Maps.example_empty Imported.Original_LF__DOT__Maps_LF_Maps_example__empty Original_LF__DOT__Maps_LF_Maps_example__empty_iso := {}.