From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb : Type := Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb.
Instance Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb_iso : Iso Original.LF_DOT_IndPrinciples.LF.IndPrinciples.rgb imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb.
Admitted.
Instance: KnownConstant Original.LF_DOT_IndPrinciples.LF.IndPrinciples.rgb := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndPrinciples.LF.IndPrinciples.rgb Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndPrinciples.LF.IndPrinciples.rgb Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb Original_LF__DOT__IndPrinciples_LF_IndPrinciples_rgb_iso := {}.