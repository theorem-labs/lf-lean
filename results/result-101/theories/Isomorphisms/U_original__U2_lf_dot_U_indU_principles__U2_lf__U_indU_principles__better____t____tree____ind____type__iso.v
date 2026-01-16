From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_better__t__tree__ind__type : SProp := Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_better__t__tree__ind__type.
Instance Original_LF__DOT__IndPrinciples_LF_IndPrinciples_better__t__tree__ind__type_iso : Iso Original.LF_DOT_IndPrinciples.LF.IndPrinciples.better_t_tree_ind_type imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_better__t__tree__ind__type.
Admitted.
Instance: KnownConstant Original.LF_DOT_IndPrinciples.LF.IndPrinciples.better_t_tree_ind_type := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_better__t__tree__ind__type := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndPrinciples.LF.IndPrinciples.better_t_tree_ind_type Original_LF__DOT__IndPrinciples_LF_IndPrinciples_better__t__tree__ind__type_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndPrinciples.LF.IndPrinciples.better_t_tree_ind_type Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_better__t__tree__ind__type Original_LF__DOT__IndPrinciples_LF_IndPrinciples_better__t__tree__ind__type_iso := {}.