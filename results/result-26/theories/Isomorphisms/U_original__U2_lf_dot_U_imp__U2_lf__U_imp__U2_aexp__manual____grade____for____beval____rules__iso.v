From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.option__iso Isomorphisms.prod__iso Isomorphisms.nat__iso Isomorphisms.U_string__string__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_manual__grade__for__beval__rules : imported_option (imported_prod imported_nat imported_String_string) := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_manual__grade__for__beval__rules.

Instance Original_LF__DOT__Imp_LF_Imp_AExp_manual__grade__for__beval__rules_iso : rel_iso (option_iso (prod_iso nat_iso String_string_iso)) Original.LF_DOT_Imp.LF.Imp.AExp.manual_grade_for_beval_rules imported_Original_LF__DOT__Imp_LF_Imp_AExp_manual__grade__for__beval__rules.
Proof.
  constructor.
  unfold Original.LF_DOT_Imp.LF.Imp.AExp.manual_grade_for_beval_rules.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_AExp_manual__grade__for__beval__rules.
  simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.manual_grade_for_beval_rules := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_manual__grade__for__beval__rules := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.manual_grade_for_beval_rules Original_LF__DOT__Imp_LF_Imp_AExp_manual__grade__for__beval__rules_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.manual_grade_for_beval_rules Imported.Original_LF__DOT__Imp_LF_Imp_AExp_manual__grade__for__beval__rules Original_LF__DOT__Imp_LF_Imp_AExp_manual__grade__for__beval__rules_iso := {}.
