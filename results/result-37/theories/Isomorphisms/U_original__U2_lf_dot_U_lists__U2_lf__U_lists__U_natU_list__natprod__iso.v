From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_natprod := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natprod.

Instance Original_LF__DOT__Lists_LF_Lists_NatList_natprod_iso : Iso Original.LF_DOT_Lists.LF.Lists.NatList.natprod imported_Original_LF__DOT__Lists_LF_Lists_NatList_natprod.
Admitted.

Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.natprod := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natprod := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.natprod Original_LF__DOT__Lists_LF_Lists_NatList_natprod_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.natprod Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natprod Original_LF__DOT__Lists_LF_Lists_NatList_natprod_iso := {}.
