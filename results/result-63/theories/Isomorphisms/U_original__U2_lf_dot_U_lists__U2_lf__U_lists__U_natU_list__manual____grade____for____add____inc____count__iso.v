From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_string__string__iso Isomorphisms.nat__iso Isomorphisms.option__iso Isomorphisms.prod__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_manual__grade__for__add__inc__count : imported_option (imported_prod imported_nat imported_String_string) := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_manual__grade__for__add__inc__count.
Instance Original_LF__DOT__Lists_LF_Lists_NatList_manual__grade__for__add__inc__count_iso : rel_iso (option_iso (prod_iso nat_iso String_string_iso)) Original.LF_DOT_Lists.LF.Lists.NatList.manual_grade_for_add_inc_count
    imported_Original_LF__DOT__Lists_LF_Lists_NatList_manual__grade__for__add__inc__count.
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.manual_grade_for_add_inc_count := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_manual__grade__for__add__inc__count := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.manual_grade_for_add_inc_count Original_LF__DOT__Lists_LF_Lists_NatList_manual__grade__for__add__inc__count_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.manual_grade_for_add_inc_count Imported.Original_LF__DOT__Lists_LF_Lists_NatList_manual__grade__for__add__inc__count Original_LF__DOT__Lists_LF_Lists_NatList_manual__grade__for__add__inc__count_iso := {}.