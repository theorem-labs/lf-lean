From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
 (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__natlist__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_app : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist -> imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist -> imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_app.

(* Helper lemma: app is compatible with conversion *)
Lemma app_compat : forall (l1 l2 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist),
  Logic.eq (Imported.Original_LF__DOT__Lists_LF_Lists_NatList_app (natlist_to_imported l1) (natlist_to_imported l2))
           (natlist_to_imported (Original.LF_DOT_Lists.LF.Lists.NatList.app l1 l2)).
Proof.
  fix IH 1.
  intros l1 l2.
  destruct l1 as [| n t]; simpl.
  - reflexivity.
  - (* Goal: cons (nat_to_imported n) (app (natlist_to_imported t) (natlist_to_imported l2)) 
           = cons (nat_to_imported n) (natlist_to_imported (app t l2)) *)
    apply (Logic.f_equal (Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist_cons (nat_to_imported n))).
    apply IH.
Qed.

Instance Original_LF__DOT__Lists_LF_Lists_NatList_app_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist),
  rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x4 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist),
  rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x3 x4 ->
  rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso (Original.LF_DOT_Lists.LF.Lists.NatList.app x1 x3) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_app x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  destruct H12 as [H12]. destruct H34 as [H34].
  constructor.
  simpl in *.
  unfold imported_Original_LF__DOT__Lists_LF_Lists_NatList_app.
  pose proof (eq_of_seq H12) as E12.
  pose proof (eq_of_seq H34) as E34.
  pose proof (app_compat x1 x3) as Hcompat.
  apply seq_of_eq.
  rewrite <- E12, <- E34.
  symmetry. exact Hcompat.
Defined.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.app := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_app := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.app Original_LF__DOT__Lists_LF_Lists_NatList_app_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.app Imported.Original_LF__DOT__Lists_LF_Lists_NatList_app Original_LF__DOT__Lists_LF_Lists_NatList_app_iso := {}.