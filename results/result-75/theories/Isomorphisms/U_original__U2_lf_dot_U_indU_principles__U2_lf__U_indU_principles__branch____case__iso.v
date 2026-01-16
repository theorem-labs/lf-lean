From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_principles__U2_lf__U_indU_principles__booltree____property____type__iso.

Monomorphic Definition imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_branch__case : (imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree -> SProp) -> SProp := Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_branch__case.
Monomorphic Instance Original_LF__DOT__IndPrinciples_LF_IndPrinciples_branch__case_iso : forall (x1 : Original.LF_DOT_IndPrinciples.LF.IndPrinciples.booltree_property_type) (x2 : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree -> SProp),
  (forall (x3 : Original.LF_DOT_IndPrinciples.LF.IndPrinciples.booltree) (x4 : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree),
   rel_iso Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree_iso x3 x4 -> Iso (x1 x3) (x2 x4)) ->
  Iso (Original.LF_DOT_IndPrinciples.LF.IndPrinciples.branch_case x1) (imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_branch__case x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndPrinciples.LF.IndPrinciples.branch_case := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_branch__case := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndPrinciples.LF.IndPrinciples.branch_case Original_LF__DOT__IndPrinciples_LF_IndPrinciples_branch__case_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndPrinciples.LF.IndPrinciples.branch_case Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_branch__case Original_LF__DOT__IndPrinciples_LF_IndPrinciples_branch__case_iso := {}.