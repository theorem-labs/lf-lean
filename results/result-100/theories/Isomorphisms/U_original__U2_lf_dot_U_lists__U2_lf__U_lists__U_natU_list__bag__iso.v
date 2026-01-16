From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__natlist__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_bag : Type := imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist.
Instance Original_LF__DOT__Lists_LF_Lists_NatList_bag_iso : Iso Original.LF_DOT_Lists.LF.Lists.NatList.bag imported_Original_LF__DOT__Lists_LF_Lists_NatList_bag
  := Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso.

Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.bag := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_bag := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.bag Original_LF__DOT__Lists_LF_Lists_NatList_bag_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.bag Imported.Original_LF__DOT__Lists_LF_Lists_NatList_bag Original_LF__DOT__Lists_LF_Lists_NatList_bag_iso := {}.