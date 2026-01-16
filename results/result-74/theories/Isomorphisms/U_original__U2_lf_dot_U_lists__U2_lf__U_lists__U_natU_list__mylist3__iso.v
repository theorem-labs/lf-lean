From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__natlist__iso.

Monomorphic Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_mylist3 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_mylist3.
Monomorphic Instance Original_LF__DOT__Lists_LF_Lists_NatList_mylist3_iso : rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso Original.LF_DOT_Lists.LF.Lists.NatList.mylist3 imported_Original_LF__DOT__Lists_LF_Lists_NatList_mylist3.
Proof.
  constructor.
  unfold imported_Original_LF__DOT__Lists_LF_Lists_NatList_mylist3.
  unfold Original.LF_DOT_Lists.LF.Lists.NatList.mylist3.
  simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.mylist3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_mylist3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.mylist3 Original_LF__DOT__Lists_LF_Lists_NatList_mylist3_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.mylist3 Imported.Original_LF__DOT__Lists_LF_Lists_NatList_mylist3 Original_LF__DOT__Lists_LF_Lists_NatList_mylist3_iso := {}.