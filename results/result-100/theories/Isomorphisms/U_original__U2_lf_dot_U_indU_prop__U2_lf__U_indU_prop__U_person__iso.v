From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__IndProp_LF_IndProp_Person : Type := Imported.Original_LF__DOT__IndProp_LF_IndProp_Person.
Instance Original_LF__DOT__IndProp_LF_IndProp_Person_iso : Iso Original.LF_DOT_IndProp.LF.IndProp.Person imported_Original_LF__DOT__IndProp_LF_IndProp_Person.
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.Person := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_Person := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.Person Original_LF__DOT__IndProp_LF_IndProp_Person_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.Person Imported.Original_LF__DOT__IndProp_LF_IndProp_Person Original_LF__DOT__IndProp_LF_IndProp_Person_iso := {}.