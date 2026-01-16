From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_time : Type := Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_time.
Instance Original_LF__DOT__IndPrinciples_LF_IndPrinciples_time_iso : Iso Original.LF_DOT_IndPrinciples.LF.IndPrinciples.time imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_time.
Admitted.
Instance: KnownConstant Original.LF_DOT_IndPrinciples.LF.IndPrinciples.time := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_time := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndPrinciples.LF.IndPrinciples.time Original_LF__DOT__IndPrinciples_LF_IndPrinciples_time_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndPrinciples.LF.IndPrinciples.time Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_time Original_LF__DOT__IndPrinciples_LF_IndPrinciples_time_iso := {}.