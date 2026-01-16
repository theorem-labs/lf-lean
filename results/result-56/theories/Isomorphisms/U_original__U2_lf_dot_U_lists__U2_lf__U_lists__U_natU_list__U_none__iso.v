From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__natoption__iso.

Monomorphic Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_None : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natoption := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_None.
Monomorphic Instance Original_LF__DOT__Lists_LF_Lists_NatList_None_iso : rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natoption_iso Original.LF_DOT_Lists.LF.Lists.NatList.None imported_Original_LF__DOT__Lists_LF_Lists_NatList_None.
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.None := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_None := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.None Original_LF__DOT__Lists_LF_Lists_NatList_None_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.None Imported.Original_LF__DOT__Lists_LF_Lists_NatList_None Original_LF__DOT__Lists_LF_Lists_NatList_None_iso := {}.