From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
From IsomorphismChecker Require Export Isomorphisms.nat__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__bag__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_count : imported_nat -> imported_Original_LF__DOT__Lists_LF_Lists_NatList_bag -> imported_nat := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_count.

(* count is Admitted in Original.v, so we can admit this isomorphism *)
Instance Original_LF__DOT__Lists_LF_Lists_NatList_count_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Lists.LF.Lists.NatList.bag) (x4 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_bag),
  rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_bag_iso x3 x4 ->
  rel_iso nat_iso (Original.LF_DOT_Lists.LF.Lists.NatList.count x1 x3) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_count x2 x4).
Admitted.

Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.count := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_count := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.count Original_LF__DOT__Lists_LF_Lists_NatList_count_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.count Imported.Original_LF__DOT__Lists_LF_Lists_NatList_count Original_LF__DOT__Lists_LF_Lists_NatList_count_iso := {}.
