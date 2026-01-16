From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__Lists_LF_Lists_id : Type := Imported.Original_LF__DOT__Lists_LF_Lists_id.
Instance Original_LF__DOT__Lists_LF_Lists_id_iso : Iso Original.LF_DOT_Lists.LF.Lists.id imported_Original_LF__DOT__Lists_LF_Lists_id.
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.id := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_id := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.id Original_LF__DOT__Lists_LF_Lists_id_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.id Imported.Original_LF__DOT__Lists_LF_Lists_id Original_LF__DOT__Lists_LF_Lists_id_iso := {}.