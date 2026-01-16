From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__natprod__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_swap__pair : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natprod -> imported_Original_LF__DOT__Lists_LF_Lists_NatList_natprod := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_swap__pair.
Instance Original_LF__DOT__Lists_LF_Lists_NatList_swap__pair_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.NatList.natprod) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natprod),
  rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natprod_iso x1 x2 ->
  rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natprod_iso (Original.LF_DOT_Lists.LF.Lists.NatList.swap_pair x1) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_swap__pair x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.swap_pair := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_swap__pair := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.swap_pair Original_LF__DOT__Lists_LF_Lists_NatList_swap__pair_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.swap_pair Imported.Original_LF__DOT__Lists_LF_Lists_NatList_swap__pair Original_LF__DOT__Lists_LF_Lists_NatList_swap__pair_iso := {}.