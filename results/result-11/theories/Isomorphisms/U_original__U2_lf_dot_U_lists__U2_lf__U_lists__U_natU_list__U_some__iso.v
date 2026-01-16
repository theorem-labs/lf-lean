From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__natoption__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_Some : imported_nat -> imported_Original_LF__DOT__Lists_LF_Lists_NatList_natoption := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_Some.
Instance Original_LF__DOT__Lists_LF_Lists_NatList_Some_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 -> rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natoption_iso (Original.LF_DOT_Lists.LF.Lists.NatList.Some x1) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_Some x2).
Proof.
  intros x1 x2 H.
  destruct H as [H]. simpl in H.
  constructor. unfold Original_LF__DOT__Lists_LF_Lists_NatList_natoption_iso, imported_Original_LF__DOT__Lists_LF_Lists_NatList_Some.
  simpl.
  apply f_equal. exact H.
Defined.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.Some := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_Some := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.Some Original_LF__DOT__Lists_LF_Lists_NatList_Some_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.Some Imported.Original_LF__DOT__Lists_LF_Lists_NatList_Some Original_LF__DOT__Lists_LF_Lists_NatList_Some_iso := {}.