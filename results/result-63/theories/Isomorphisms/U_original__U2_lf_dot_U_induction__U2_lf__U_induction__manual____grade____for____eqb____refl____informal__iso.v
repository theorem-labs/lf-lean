From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_string__string__iso Isomorphisms.nat__iso Isomorphisms.option__iso Isomorphisms.prod__iso.

Definition imported_Original_LF__DOT__Induction_LF_Induction_manual__grade__for__eqb__refl__informal : imported_option (imported_prod imported_nat imported_String_string) := Imported.Original_LF__DOT__Induction_LF_Induction_manual__grade__for__eqb__refl__informal.

Instance Original_LF__DOT__Induction_LF_Induction_manual__grade__for__eqb__refl__informal_iso : rel_iso (option_iso (prod_iso nat_iso String_string_iso)) Original.LF_DOT_Induction.LF.Induction.manual_grade_for_eqb_refl_informal
    imported_Original_LF__DOT__Induction_LF_Induction_manual__grade__for__eqb__refl__informal.
Proof.
  (* Both are None, so the isomorphism is trivial *)
  unfold Original.LF_DOT_Induction.LF.Induction.manual_grade_for_eqb_refl_informal.
  unfold imported_Original_LF__DOT__Induction_LF_Induction_manual__grade__for__eqb__refl__informal.
  unfold Imported.Original_LF__DOT__Induction_LF_Induction_manual__grade__for__eqb__refl__informal.
  simpl.
  exact IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.manual_grade_for_eqb_refl_informal := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_manual__grade__for__eqb__refl__informal := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.manual_grade_for_eqb_refl_informal Original_LF__DOT__Induction_LF_Induction_manual__grade__for__eqb__refl__informal_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.manual_grade_for_eqb_refl_informal Imported.Original_LF__DOT__Induction_LF_Induction_manual__grade__for__eqb__refl__informal Original_LF__DOT__Induction_LF_Induction_manual__grade__for__eqb__refl__informal_iso := {}.