From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_div2 : imported_nat -> imported_nat := Imported.Original_LF__DOT__IndProp_LF_IndProp_div2.
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_div2_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> rel_iso nat_iso (Original.LF_DOT_IndProp.LF.IndProp.div2 x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_div2 x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.div2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_div2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.div2 Original_LF__DOT__IndProp_LF_IndProp_div2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.div2 Imported.Original_LF__DOT__IndProp_LF_IndProp_div2 Original_LF__DOT__IndProp_LF_IndProp_div2_iso := {}.