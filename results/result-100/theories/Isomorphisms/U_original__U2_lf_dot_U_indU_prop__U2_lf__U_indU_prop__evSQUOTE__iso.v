From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_ev' : imported_nat -> SProp := Imported.Original_LF__DOT__IndProp_LF_IndProp_ev'.
Instance Original_LF__DOT__IndProp_LF_IndProp_ev'_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> Iso (Original.LF_DOT_IndProp.LF.IndProp.ev' x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_ev' x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.ev' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_ev' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.ev' Original_LF__DOT__IndProp_LF_IndProp_ev'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.ev' Imported.Original_LF__DOT__IndProp_LF_IndProp_ev' Original_LF__DOT__IndProp_LF_IndProp_ev'_iso := {}.