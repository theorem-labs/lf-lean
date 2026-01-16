From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_Collatz__holds__for : imported_nat -> SProp := Imported.Original_LF__DOT__IndProp_LF_IndProp_Collatz__holds__for.
Instance Original_LF__DOT__IndProp_LF_IndProp_Collatz__holds__for_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> Iso (Original.LF_DOT_IndProp.LF.IndProp.Collatz_holds_for x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_Collatz__holds__for x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.Collatz_holds_for := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_Collatz__holds__for := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.Collatz_holds_for Original_LF__DOT__IndProp_LF_IndProp_Collatz__holds__for_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.Collatz_holds_for Imported.Original_LF__DOT__IndProp_LF_IndProp_Collatz__holds__for Original_LF__DOT__IndProp_LF_IndProp_Collatz__holds__for_iso := {}.