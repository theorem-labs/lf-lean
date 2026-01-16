From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__natlist__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_tl : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist -> imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_tl.
Instance Original_LF__DOT__Lists_LF_Lists_NatList_tl_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist),
  rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x1 x2 ->
  rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso (Original.LF_DOT_Lists.LF.Lists.NatList.tl x1) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_tl x2).
Proof.
  intros x1 x2 H.
  destruct H as [H']. simpl in *.
  constructor. simpl.
  unfold imported_Original_LF__DOT__Lists_LF_Lists_NatList_tl.
  pose proof (IsoEq.f_equal Imported.Original_LF__DOT__Lists_LF_Lists_NatList_tl H') as Htl.
  destruct x1 as [| h t]; simpl in *; exact Htl.
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.tl := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_tl := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.tl Original_LF__DOT__Lists_LF_Lists_NatList_tl_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.tl Imported.Original_LF__DOT__Lists_LF_Lists_NatList_tl Original_LF__DOT__Lists_LF_Lists_NatList_tl_iso := {}.