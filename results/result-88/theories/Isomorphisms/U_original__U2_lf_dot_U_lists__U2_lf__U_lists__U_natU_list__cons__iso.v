From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__natlist__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_cons : imported_nat -> imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist -> imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_cons.
Instance Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x4 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist),
  rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x3 x4 ->
  rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso (Original.LF_DOT_Lists.LF.Lists.NatList.cons x1 x3) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_cons x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  constructor. simpl.
  destruct H12 as [H12]. destruct H34 as [H34]. simpl in *.
  apply (f_equal2 Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist_cons H12 H34).
Defined.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.cons := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_cons := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.cons Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.cons Imported.Original_LF__DOT__Lists_LF_Lists_NatList_cons Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso := {}.