From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__natprod__iso Isomorphisms.nat__iso.

Monomorphic Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_pair : imported_nat -> imported_nat -> imported_Original_LF__DOT__Lists_LF_Lists_NatList_natprod := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_pair.
Monomorphic Instance Original_LF__DOT__Lists_LF_Lists_NatList_pair_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  forall (x3 : nat) (x4 : imported_nat),
  rel_iso nat_iso x3 x4 ->
  rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natprod_iso (Original.LF_DOT_Lists.LF.Lists.NatList.pair x1 x3) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_pair x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.pair := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_pair := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.pair Original_LF__DOT__Lists_LF_Lists_NatList_pair_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.pair Imported.Original_LF__DOT__Lists_LF_Lists_NatList_pair Original_LF__DOT__Lists_LF_Lists_NatList_pair_iso := {}.