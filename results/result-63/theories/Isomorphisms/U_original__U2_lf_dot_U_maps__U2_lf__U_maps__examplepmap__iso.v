From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_string__string__iso Isomorphisms.bool__iso Isomorphisms.option__iso.

Definition imported_Original_LF__DOT__Maps_LF_Maps_examplepmap : imported_String_string -> imported_option imported_bool := Imported.Original_LF__DOT__Maps_LF_Maps_examplepmap.
Instance Original_LF__DOT__Maps_LF_Maps_examplepmap_iso : forall (x1 : String.string) (x2 : imported_String_string),
  rel_iso String_string_iso x1 x2 -> rel_iso (option_iso bool_iso) (Original.LF_DOT_Maps.LF.Maps.examplepmap x1) (imported_Original_LF__DOT__Maps_LF_Maps_examplepmap x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Maps.LF.Maps.examplepmap := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Maps_LF_Maps_examplepmap := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Maps.LF.Maps.examplepmap Original_LF__DOT__Maps_LF_Maps_examplepmap_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Maps.LF.Maps.examplepmap Imported.Original_LF__DOT__Maps_LF_Maps_examplepmap Original_LF__DOT__Maps_LF_Maps_examplepmap_iso := {}.