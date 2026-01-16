From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_string__string__iso.

(* total_map A = string -> A, imported_total_map A = String_string -> A *)
Definition imported_Original_LF__DOT__Maps_LF_Maps_total__map : Type -> Type := Imported.Original_LF__DOT__Maps_LF_Maps_total__map.

Instance Original_LF__DOT__Maps_LF_Maps_total__map_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso (Original.LF_DOT_Maps.LF.Maps.total_map x1) (imported_Original_LF__DOT__Maps_LF_Maps_total__map x2)
  := fun (x1 x2 : Type) (hx : Iso x1 x2) => IsoArrow String_string_iso hx.

Instance: KnownConstant Original.LF_DOT_Maps.LF.Maps.total_map := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Maps_LF_Maps_total__map := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Maps.LF.Maps.total_map Original_LF__DOT__Maps_LF_Maps_total__map_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Maps.LF.Maps.total_map Imported.Original_LF__DOT__Maps_LF_Maps_total__map Original_LF__DOT__Maps_LF_Maps_total__map_iso := {}.