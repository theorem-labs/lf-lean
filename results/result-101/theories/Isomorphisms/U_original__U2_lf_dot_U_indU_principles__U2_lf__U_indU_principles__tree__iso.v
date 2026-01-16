From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_tree : Type -> Type := Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_tree.
Instance Original_LF__DOT__IndPrinciples_LF_IndPrinciples_tree_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso (Original.LF_DOT_IndPrinciples.LF.IndPrinciples.tree x1) (imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_tree x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndPrinciples.LF.IndPrinciples.tree := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_tree := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndPrinciples.LF.IndPrinciples.tree Original_LF__DOT__IndPrinciples_LF_IndPrinciples_tree_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndPrinciples.LF.IndPrinciples.tree Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_tree Original_LF__DOT__IndPrinciples_LF_IndPrinciples_tree_iso := {}.