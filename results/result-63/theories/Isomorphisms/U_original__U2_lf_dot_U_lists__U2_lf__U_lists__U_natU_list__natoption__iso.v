From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_natoption : Type := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natoption.
Instance Original_LF__DOT__Lists_LF_Lists_NatList_natoption_iso : Iso Original.LF_DOT_Lists.LF.Lists.NatList.natoption imported_Original_LF__DOT__Lists_LF_Lists_NatList_natoption.
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.natoption := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natoption := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.natoption Original_LF__DOT__Lists_LF_Lists_NatList_natoption_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.natoption Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natoption Original_LF__DOT__Lists_LF_Lists_NatList_natoption_iso := {}.