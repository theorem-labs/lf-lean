From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree : Type := Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree.
Instance Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree_iso : Iso Original.LF_DOT_IndPrinciples.LF.IndPrinciples.booltree imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree.
Admitted.
Instance: KnownConstant Original.LF_DOT_IndPrinciples.LF.IndPrinciples.booltree := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndPrinciples.LF.IndPrinciples.booltree Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndPrinciples.LF.IndPrinciples.booltree Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree_iso := {}.