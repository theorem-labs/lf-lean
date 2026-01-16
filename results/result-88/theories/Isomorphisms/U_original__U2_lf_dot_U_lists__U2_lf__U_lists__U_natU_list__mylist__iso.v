From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__natlist__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_mylist : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_mylist.
Instance Original_LF__DOT__Lists_LF_Lists_NatList_mylist_iso : rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso Original.LF_DOT_Lists.LF.Lists.NatList.mylist imported_Original_LF__DOT__Lists_LF_Lists_NatList_mylist.
Proof.
  constructor.
  unfold imported_Original_LF__DOT__Lists_LF_Lists_NatList_mylist.
  unfold Imported.Original_LF__DOT__Lists_LF_Lists_NatList_mylist.
  unfold Imported.Original_LF__DOT__Lists_LF_Lists_NatList_cons.
  unfold Imported.Original_LF__DOT__Lists_LF_Lists_NatList_nil.
  unfold Original.LF_DOT_Lists.LF.Lists.NatList.mylist.
  simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.mylist := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_mylist := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.mylist Original_LF__DOT__Lists_LF_Lists_NatList_mylist_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.mylist Imported.Original_LF__DOT__Lists_LF_Lists_NatList_mylist Original_LF__DOT__Lists_LF_Lists_NatList_mylist_iso := {}.
