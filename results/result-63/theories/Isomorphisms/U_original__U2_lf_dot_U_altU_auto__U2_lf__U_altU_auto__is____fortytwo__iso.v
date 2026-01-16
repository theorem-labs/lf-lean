From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_is__fortytwo : imported_nat -> SProp := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_is__fortytwo.
Instance Original_LF__DOT__AltAuto_LF_AltAuto_is__fortytwo_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> Iso (Original.LF_DOT_AltAuto.LF.AltAuto.is_fortytwo x1) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_is__fortytwo x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.is_fortytwo := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_is__fortytwo := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.is_fortytwo Original_LF__DOT__AltAuto_LF_AltAuto_is__fortytwo_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.is_fortytwo Imported.Original_LF__DOT__AltAuto_LF_AltAuto_is__fortytwo Original_LF__DOT__AltAuto_LF_AltAuto_is__fortytwo_iso := {}.