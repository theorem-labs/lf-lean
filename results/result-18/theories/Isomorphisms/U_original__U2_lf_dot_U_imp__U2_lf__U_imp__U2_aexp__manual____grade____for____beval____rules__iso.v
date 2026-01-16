From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_string__string__iso Isomorphisms.nat__iso Isomorphisms.option__iso Isomorphisms.prod__iso.

Monomorphic Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_manual__grade__for__beval__rules : imported_option (imported_prod imported_nat imported_String_string) := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_manual__grade__for__beval__rules.
Monomorphic Instance Original_LF__DOT__Imp_LF_Imp_AExp_manual__grade__for__beval__rules_iso : rel_iso (option_iso (prod_iso nat_iso String_string_iso)) Original.LF_DOT_Imp.LF.Imp.AExp.manual_grade_for_beval_rules imported_Original_LF__DOT__Imp_LF_Imp_AExp_manual__grade__for__beval__rules.
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.manual_grade_for_beval_rules := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_manual__grade__for__beval__rules := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.manual_grade_for_beval_rules Original_LF__DOT__Imp_LF_Imp_AExp_manual__grade__for__beval__rules_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.manual_grade_for_beval_rules Imported.Original_LF__DOT__Imp_LF_Imp_AExp_manual__grade__for__beval__rules Original_LF__DOT__Imp_LF_Imp_AExp_manual__grade__for__beval__rules_iso := {}.