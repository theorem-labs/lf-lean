From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_natlist' : Type := Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_natlist'.
Instance Original_LF__DOT__IndPrinciples_LF_IndPrinciples_natlist'_iso : Iso Original.LF_DOT_IndPrinciples.LF.IndPrinciples.natlist' imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_natlist'.
Admitted.
Instance: KnownConstant Original.LF_DOT_IndPrinciples.LF.IndPrinciples.natlist' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_natlist' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndPrinciples.LF.IndPrinciples.natlist' Original_LF__DOT__IndPrinciples_LF_IndPrinciples_natlist'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndPrinciples.LF.IndPrinciples.natlist' Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_natlist' Original_LF__DOT__IndPrinciples_LF_IndPrinciples_natlist'_iso := {}.