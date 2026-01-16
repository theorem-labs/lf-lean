From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_auto__U2_lf__U_auto__U_repeat__com__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__bexp__iso.

Definition imported_Original_LF__DOT__Auto_LF_Auto_Repeat_CIf : imported_Original_LF__DOT__Imp_LF_Imp_bexp ->
  imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com -> imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com -> imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com := Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_CIf.
Instance Original_LF__DOT__Auto_LF_Auto_Repeat_CIf_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.bexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_bexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_bexp_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Auto.LF.Auto.Repeat.com) (x4 : imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com),
  rel_iso Original_LF__DOT__Auto_LF_Auto_Repeat_com_iso x3 x4 ->
  forall (x5 : Original.LF_DOT_Auto.LF.Auto.Repeat.com) (x6 : imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com),
  rel_iso Original_LF__DOT__Auto_LF_Auto_Repeat_com_iso x5 x6 ->
  rel_iso Original_LF__DOT__Auto_LF_Auto_Repeat_com_iso (Original.LF_DOT_Auto.LF.Auto.Repeat.CIf x1 x3 x5) (imported_Original_LF__DOT__Auto_LF_Auto_Repeat_CIf x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Auto.LF.Auto.Repeat.CIf := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_CIf := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Auto.LF.Auto.Repeat.CIf Original_LF__DOT__Auto_LF_Auto_Repeat_CIf_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Auto.LF.Auto.Repeat.CIf Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_CIf Original_LF__DOT__Auto_LF_Auto_Repeat_CIf_iso := {}.