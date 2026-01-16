From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)


From IsomorphismChecker Require Export Isomorphisms.U_string__string__iso Isomorphisms.nat__iso Isomorphisms.option__iso Isomorphisms.prod__iso.

Definition imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_manual__grade__for__ceval__step____ceval__inf : imported_option (imported_prod imported_nat imported_String_string) := Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_manual__grade__for__ceval__step____ceval__inf.

(* The original is None and the imported is also None, so we need to show they correspond *)
Instance Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_manual__grade__for__ceval__step____ceval__inf_iso : rel_iso (option_iso (prod_iso nat_iso String_string_iso)) Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.manual_grade_for_ceval_step__ceval_inf
    imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_manual__grade__for__ceval__step____ceval__inf.
Proof.
  (* Both are None, so we just need to prove eq_refl *)
  constructor.
  unfold imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_manual__grade__for__ceval__step____ceval__inf.
  unfold Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.manual_grade_for_ceval_step__ceval_inf.
  simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.manual_grade_for_ceval_step__ceval_inf := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_manual__grade__for__ceval__step____ceval__inf := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.manual_grade_for_ceval_step__ceval_inf Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_manual__grade__for__ceval__step____ceval__inf_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.manual_grade_for_ceval_step__ceval_inf Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_manual__grade__for__ceval__step____ceval__inf Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_manual__grade__for__ceval__step____ceval__inf_iso := {}.