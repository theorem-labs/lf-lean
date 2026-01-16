From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__natlist__iso Isomorphisms.nat__iso.

Monomorphic Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_hd : imported_nat -> imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist -> imported_nat := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_hd.
Monomorphic Instance Original_LF__DOT__Lists_LF_Lists_NatList_hd_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x4 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist),
  rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x3 x4 -> rel_iso nat_iso (Original.LF_DOT_Lists.LF.Lists.NatList.hd x1 x3) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_hd x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.hd := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_hd := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.hd Original_LF__DOT__Lists_LF_Lists_NatList_hd_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.hd Imported.Original_LF__DOT__Lists_LF_Lists_NatList_hd Original_LF__DOT__Lists_LF_Lists_NatList_hd_iso := {}.