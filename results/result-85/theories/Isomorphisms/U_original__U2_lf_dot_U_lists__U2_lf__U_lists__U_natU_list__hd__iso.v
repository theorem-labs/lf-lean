From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__natlist__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_hd : imported_nat -> imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist -> imported_nat := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_hd.

(* Lemma about hd and natlist_to_imported *)
Lemma hd_to_imported : forall (d : nat) (l : Original.LF_DOT_Lists.LF.Lists.NatList.natlist),
  Logic.eq (nat_to_imported (Original.LF_DOT_Lists.LF.Lists.NatList.hd d l)) (Imported.Original_LF__DOT__Lists_LF_Lists_NatList_hd (nat_to_imported d) (natlist_to_imported l)).
Proof.
  intros d l.
  destruct l as [| h t]; simpl.
  - reflexivity.
  - reflexivity.
Qed.

Instance Original_LF__DOT__Lists_LF_Lists_NatList_hd_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x4 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist),
  rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x3 x4 -> rel_iso nat_iso (Original.LF_DOT_Lists.LF.Lists.NatList.hd x1 x3) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_hd x2 x4).
Proof.
  intros x1 x2 Hnat x3 x4 Hlist.
  constructor.
  unfold imported_Original_LF__DOT__Lists_LF_Lists_NatList_hd in *.
  simpl in *.
  (* First rewrite using the lemma *)
  pose proof (hd_to_imported x1 x3) as Hhd.
  apply (IsoEq.eq_trans (IsoEq.seq_of_eq Hhd)).
  (* Now we need: hd (nat_to_imported x1) (natlist_to_imported x3) = hd x2 x4 *)
  apply (IsoEq.f_equal2 Imported.Original_LF__DOT__Lists_LF_Lists_NatList_hd (proj_rel_iso Hnat) (proj_rel_iso Hlist)).
Defined.

Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.hd := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_hd := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.hd Original_LF__DOT__Lists_LF_Lists_NatList_hd_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.hd Imported.Original_LF__DOT__Lists_LF_Lists_NatList_hd Original_LF__DOT__Lists_LF_Lists_NatList_hd_iso := {}.