From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__com__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__state__iso Isomorphisms.option__iso.

Monomorphic Definition imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step : (imported_String_string -> imported_nat) -> imported_Original_LF__DOT__Imp_LF_Imp_com -> imported_nat -> imported_option (imported_String_string -> imported_nat) := Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step.
Monomorphic Instance Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.state) (x2 : imported_String_string -> imported_nat),
  (forall (x3 : String.string) (x4 : imported_String_string), rel_iso String_string_iso x3 x4 -> rel_iso nat_iso (x1 x3) (x2 x4)) ->
  forall (x3 : Original.LF_DOT_Imp.LF.Imp.com) (x4 : imported_Original_LF__DOT__Imp_LF_Imp_com),
  rel_iso Original_LF__DOT__Imp_LF_Imp_com_iso x3 x4 ->
  forall (x5 : nat) (x6 : imported_nat),
  rel_iso nat_iso x5 x6 ->
  rel_iso (option_iso (IsoArrow String_string_iso nat_iso)) (Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step x1 x3 x5)
    (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step_iso := {}.