From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_principles__U2_lf__U_indU_principles__t____tree__iso.

Definition imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_reflect : forall x : Type, imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_t__tree x -> imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_t__tree x := (@Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_reflect).
Instance Original_LF__DOT__IndPrinciples_LF_IndPrinciples_reflect_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_IndPrinciples.LF.IndPrinciples.t_tree x1) (x4 : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_t__tree x2),
  rel_iso (Original_LF__DOT__IndPrinciples_LF_IndPrinciples_t__tree_iso hx) x3 x4 ->
  rel_iso (Original_LF__DOT__IndPrinciples_LF_IndPrinciples_t__tree_iso hx) (Original.LF_DOT_IndPrinciples.LF.IndPrinciples.reflect x3)
    (imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_reflect x4).
Admitted.
Instance: KnownConstant (@Original.LF_DOT_IndPrinciples.LF.IndPrinciples.reflect) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_reflect) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_IndPrinciples.LF.IndPrinciples.reflect) Original_LF__DOT__IndPrinciples_LF_IndPrinciples_reflect_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_IndPrinciples.LF.IndPrinciples.reflect) (@Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_reflect) Original_LF__DOT__IndPrinciples_LF_IndPrinciples_reflect_iso := {}.