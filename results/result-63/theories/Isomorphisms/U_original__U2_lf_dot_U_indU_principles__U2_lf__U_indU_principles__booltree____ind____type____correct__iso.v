From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_principles__U2_lf__U_indU_principles__booltree____ind____type__iso.

Definition imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree__ind__type__correct : forall x : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree -> SProp,
  imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_base__case (fun x0 : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree => x x0) ->
  imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_leaf__case (fun x0 : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree => x x0) ->
  imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_branch__case (fun x0 : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree => x x0) ->
  forall x3 : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree, x x3 := Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree__ind__type__correct.
Instance Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree__ind__type__correct_iso : forall (x1 : Original.LF_DOT_IndPrinciples.LF.IndPrinciples.booltree_property_type) (x2 : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree -> SProp)
    (hx : forall (x3 : Original.LF_DOT_IndPrinciples.LF.IndPrinciples.booltree) (x4 : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree),
          rel_iso Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree_iso x3 x4 -> Iso (x1 x3) (x2 x4))
    (x3 : Original.LF_DOT_IndPrinciples.LF.IndPrinciples.base_case x1)
    (x4 : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_base__case (fun x : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree => x2 x)),
  rel_iso
    (Original_LF__DOT__IndPrinciples_LF_IndPrinciples_base__case_iso x1 (fun x : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree => x2 x)
       (fun (x5 : Original.LF_DOT_IndPrinciples.LF.IndPrinciples.booltree) (x6 : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree)
          (hx0 : rel_iso Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree_iso x5 x6) =>
        hx x5 x6 hx0))
    x3 x4 ->
  forall (x5 : Original.LF_DOT_IndPrinciples.LF.IndPrinciples.leaf_case x1)
    (x6 : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_leaf__case (fun x : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree => x2 x)),
  rel_iso
    (Original_LF__DOT__IndPrinciples_LF_IndPrinciples_leaf__case_iso x1 (fun x : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree => x2 x)
       (fun (x7 : Original.LF_DOT_IndPrinciples.LF.IndPrinciples.booltree) (x8 : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree)
          (hx1 : rel_iso Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree_iso x7 x8) =>
        hx x7 x8 hx1))
    x5 x6 ->
  forall (x7 : Original.LF_DOT_IndPrinciples.LF.IndPrinciples.branch_case x1)
    (x8 : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_branch__case (fun x : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree => x2 x)),
  rel_iso
    (Original_LF__DOT__IndPrinciples_LF_IndPrinciples_branch__case_iso x1 (fun x : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree => x2 x)
       (fun (x9 : Original.LF_DOT_IndPrinciples.LF.IndPrinciples.booltree) (x10 : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree)
          (hx2 : rel_iso Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree_iso x9 x10) =>
        hx x9 x10 hx2))
    x7 x8 ->
  forall (x9 : Original.LF_DOT_IndPrinciples.LF.IndPrinciples.booltree) (x10 : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree)
    (hx3 : rel_iso Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree_iso x9 x10),
  rel_iso (hx x9 x10 hx3) (Original.LF_DOT_IndPrinciples.LF.IndPrinciples.booltree_ind_type_correct x1 x3 x5 x7 x9)
    (imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree__ind__type__correct x2 x4 x6 x8 x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndPrinciples.LF.IndPrinciples.booltree_ind_type_correct := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree__ind__type__correct := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndPrinciples.LF.IndPrinciples.booltree_ind_type_correct Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree__ind__type__correct_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndPrinciples.LF.IndPrinciples.booltree_ind_type_correct Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree__ind__type__correct Original_LF__DOT__IndPrinciples_LF_IndPrinciples_booltree__ind__type__correct_iso := {}.