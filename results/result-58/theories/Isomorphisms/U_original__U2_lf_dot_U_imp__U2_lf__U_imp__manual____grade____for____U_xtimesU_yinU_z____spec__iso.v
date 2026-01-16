From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_string__string__iso Isomorphisms.nat__iso Isomorphisms.option__iso Isomorphisms.prod__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_manual__grade__for__XtimesYinZ__spec : imported_option (imported_prod imported_nat imported_String_string) := Imported.Original_LF__DOT__Imp_LF_Imp_manual__grade__for__XtimesYinZ__spec.

(* Both are None, so they are equal *)
Instance Original_LF__DOT__Imp_LF_Imp_manual__grade__for__XtimesYinZ__spec_iso : rel_iso (option_iso (prod_iso nat_iso String_string_iso)) Original.LF_DOT_Imp.LF.Imp.manual_grade_for_XtimesYinZ_spec imported_Original_LF__DOT__Imp_LF_Imp_manual__grade__for__XtimesYinZ__spec.
Proof.
  simpl.
  (* Original.LF_DOT_Imp.LF.Imp.manual_grade_for_XtimesYinZ_spec is None *)
  (* imported_Original_LF__DOT__Imp_LF_Imp_manual__grade__for__XtimesYinZ__spec should also be None *)
  unfold Original.LF_DOT_Imp.LF.Imp.manual_grade_for_XtimesYinZ_spec.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_manual__grade__for__XtimesYinZ__spec.
  unfold Imported.Original_LF__DOT__Imp_LF_Imp_manual__grade__for__XtimesYinZ__spec.
  simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.manual_grade_for_XtimesYinZ_spec := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_manual__grade__for__XtimesYinZ__spec := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.manual_grade_for_XtimesYinZ_spec Original_LF__DOT__Imp_LF_Imp_manual__grade__for__XtimesYinZ__spec_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.manual_grade_for_XtimesYinZ_spec Imported.Original_LF__DOT__Imp_LF_Imp_manual__grade__for__XtimesYinZ__spec Original_LF__DOT__Imp_LF_Imp_manual__grade__for__XtimesYinZ__spec_iso := {}.