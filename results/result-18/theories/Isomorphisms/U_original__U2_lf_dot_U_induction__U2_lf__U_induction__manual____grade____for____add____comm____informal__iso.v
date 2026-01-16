From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_string__string__iso Isomorphisms.nat__iso Isomorphisms.option__iso Isomorphisms.prod__iso.

Monomorphic Definition imported_Original_LF__DOT__Induction_LF_Induction_manual__grade__for__add__comm__informal : imported_option (imported_prod imported_nat imported_String_string) := Imported.Original_LF__DOT__Induction_LF_Induction_manual__grade__for__add__comm__informal.
Monomorphic Instance Original_LF__DOT__Induction_LF_Induction_manual__grade__for__add__comm__informal_iso : rel_iso (option_iso (prod_iso nat_iso String_string_iso)) Original.LF_DOT_Induction.LF.Induction.manual_grade_for_add_comm_informal
    imported_Original_LF__DOT__Induction_LF_Induction_manual__grade__for__add__comm__informal.
Admitted.
Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.manual_grade_for_add_comm_informal := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_manual__grade__for__add__comm__informal := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.manual_grade_for_add_comm_informal Original_LF__DOT__Induction_LF_Induction_manual__grade__for__add__comm__informal_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.manual_grade_for_add_comm_informal Imported.Original_LF__DOT__Induction_LF_Induction_manual__grade__for__add__comm__informal Original_LF__DOT__Induction_LF_Induction_manual__grade__for__add__comm__informal_iso := {}.