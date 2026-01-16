From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.nat__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__natlist__iso.

Monomorphic Definition imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_natlist : Type := Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_natlist.

(* Both types have the same structure: nnil/ncons vs nil/cons *)
Fixpoint indprinciples_to_lists (l : Original.LF_DOT_IndPrinciples.LF.IndPrinciples.natlist) : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_natlist :=
  match l with
  | Original.LF_DOT_IndPrinciples.LF.IndPrinciples.nnil => Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist_nil
  | Original.LF_DOT_IndPrinciples.LF.IndPrinciples.ncons n l' => Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist_cons (nat_to_imported n) (indprinciples_to_lists l')
  end.

Fixpoint lists_to_indprinciples (l : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_natlist) : Original.LF_DOT_IndPrinciples.LF.IndPrinciples.natlist :=
  match l with
  | Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist_nil => Original.LF_DOT_IndPrinciples.LF.IndPrinciples.nnil
  | Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist_cons n l' => Original.LF_DOT_IndPrinciples.LF.IndPrinciples.ncons (imported_to_nat n) (lists_to_indprinciples l')
  end.

Lemma indprinciples_roundtrip1 : forall l : Original.LF_DOT_IndPrinciples.LF.IndPrinciples.natlist, 
  Logic.eq (lists_to_indprinciples (indprinciples_to_lists l)) l.
Proof.
  fix IH 1.
  intros l. destruct l; simpl.
  - reflexivity.
  - apply Logic.f_equal2.
    + apply nat_roundtrip.
    + apply IH.
Defined.

Lemma indprinciples_roundtrip2 : forall l : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_natlist,
  Logic.eq (indprinciples_to_lists (lists_to_indprinciples l)) l.
Proof.
  fix IH 1.
  intros l. destruct l; simpl.
  - reflexivity.
  - apply Logic.f_equal2.
    + apply imported_nat_roundtrip.
    + apply IH.
Defined.

Monomorphic Instance Original_LF__DOT__IndPrinciples_LF_IndPrinciples_natlist_iso : Iso Original.LF_DOT_IndPrinciples.LF.IndPrinciples.natlist imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_natlist.
Proof.
  refine {|
    to := indprinciples_to_lists;
    from := lists_to_indprinciples;
    to_from := _;
    from_to := _
  |}.
  - intros x. apply seq_of_eq. apply indprinciples_roundtrip2.
  - intros x. apply seq_of_eq. apply indprinciples_roundtrip1.
Defined.

Instance: KnownConstant Original.LF_DOT_IndPrinciples.LF.IndPrinciples.natlist := {}.
Instance: KnownConstant Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_natlist := {}.
Instance: IsoStatementProofFor Original.LF_DOT_IndPrinciples.LF.IndPrinciples.natlist Original_LF__DOT__IndPrinciples_LF_IndPrinciples_natlist_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndPrinciples.LF.IndPrinciples.natlist Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_natlist Original_LF__DOT__IndPrinciples_LF_IndPrinciples_natlist_iso := {}.
