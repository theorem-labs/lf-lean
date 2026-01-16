From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__natlist__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_countoddmembers : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist -> imported_nat := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_countoddmembers.
Instance Original_LF__DOT__Lists_LF_Lists_NatList_countoddmembers_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist),
  rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x1 x2 ->
  rel_iso nat_iso (Original.LF_DOT_Lists.LF.Lists.NatList.countoddmembers x1) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_countoddmembers x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.countoddmembers := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_countoddmembers := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.countoddmembers Original_LF__DOT__Lists_LF_Lists_NatList_countoddmembers_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.countoddmembers Imported.Original_LF__DOT__Lists_LF_Lists_NatList_countoddmembers Original_LF__DOT__Lists_LF_Lists_NatList_countoddmembers_iso := {}.