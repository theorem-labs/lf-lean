From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq. From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism. #[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__natprod__iso Isomorphisms.nat__iso.
Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_snd := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_snd.
Instance Original_LF__DOT__Lists_LF_Lists_NatList_snd_iso : forall x1 x2, rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natprod_iso x1 x2 -> rel_iso nat_iso (Original.LF_DOT_Lists.LF.Lists.NatList.snd x1) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_snd x2). Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.snd := {}. Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_snd := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.snd Original_LF__DOT__Lists_LF_Lists_NatList_snd_iso := {}. Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.snd Imported.Original_LF__DOT__Lists_LF_Lists_NatList_snd Original_LF__DOT__Lists_LF_Lists_NatList_snd_iso := {}.
