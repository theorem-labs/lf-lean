From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_Toy : Type := Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_Toy.
Monomorphic Instance Original_LF__DOT__IndPrinciples_LF_IndPrinciples_Toy_iso : Iso Original.LF_DOT_IndPrinciples.LF.IndPrinciples.Toy imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_Toy.
Admitted.
Instance: KnownConstant Original.LF_DOT_IndPrinciples.LF.IndPrinciples.Toy := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_Toy := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndPrinciples.LF.IndPrinciples.Toy Original_LF__DOT__IndPrinciples_LF_IndPrinciples_Toy_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndPrinciples.LF.IndPrinciples.Toy Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_Toy Original_LF__DOT__IndPrinciples_LF_IndPrinciples_Toy_iso := {}.