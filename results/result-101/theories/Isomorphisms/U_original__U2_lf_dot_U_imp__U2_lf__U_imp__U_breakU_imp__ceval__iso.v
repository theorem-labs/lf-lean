From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_breakU_imp__com__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_breakU_imp__result__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__state__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com ->
  (imported_String_string -> imported_nat) -> imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_result -> (imported_String_string -> imported_nat) -> SProp := Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval.
Instance Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.BreakImp.com) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com),
  rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Imp.LF.Imp.state) (x4 : imported_String_string -> imported_nat),
  (forall (x5 : String.string) (x6 : imported_String_string), rel_iso String_string_iso x5 x6 -> rel_iso nat_iso (x3 x5) (x4 x6)) ->
  forall (x5 : Original.LF_DOT_Imp.LF.Imp.BreakImp.result) (x6 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_result),
  rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_result_iso x5 x6 ->
  forall (x7 : Original.LF_DOT_Imp.LF.Imp.state) (x8 : imported_String_string -> imported_nat),
  (forall (x9 : String.string) (x10 : imported_String_string), rel_iso String_string_iso x9 x10 -> rel_iso nat_iso (x7 x9) (x8 x10)) ->
  Iso (Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval x1 x3 x5 x7) (imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval x2 x4 x6 x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval_iso := {}.