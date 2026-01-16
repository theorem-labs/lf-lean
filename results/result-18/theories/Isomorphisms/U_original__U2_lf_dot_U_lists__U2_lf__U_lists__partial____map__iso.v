From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__Lists_LF_Lists_partial__map : Type := Imported.Original_LF__DOT__Lists_LF_Lists_partial__map.
Monomorphic Instance Original_LF__DOT__Lists_LF_Lists_partial__map_iso : Iso Original.LF_DOT_Lists.LF.Lists.partial_map imported_Original_LF__DOT__Lists_LF_Lists_partial__map.
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.partial_map := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_partial__map := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.partial_map Original_LF__DOT__Lists_LF_Lists_partial__map_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.partial_map Imported.Original_LF__DOT__Lists_LF_Lists_partial__map Original_LF__DOT__Lists_LF_Lists_partial__map_iso := {}.