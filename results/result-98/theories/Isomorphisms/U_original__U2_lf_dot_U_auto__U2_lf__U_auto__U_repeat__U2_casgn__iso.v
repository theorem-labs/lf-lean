From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. *) (* for speed *)

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_auto__U2_lf__U_auto__U_repeat__com__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso Isomorphisms.U_string__string__iso.

Definition imported_Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn : imported_String_string -> imported_Original_LF__DOT__Imp_LF_Imp_aexp -> imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com := Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com_CAsgn.
Instance Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn_iso : forall (x1 : String.string) (x2 : imported_String_string),
  rel_iso String_string_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Imp.LF.Imp.aexp) (x4 : imported_Original_LF__DOT__Imp_LF_Imp_aexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso x3 x4 ->
  rel_iso Original_LF__DOT__Auto_LF_Auto_Repeat_com_iso (Original.LF_DOT_Auto.LF.Auto.Repeat.CAsgn x1 x3) (imported_Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn x2 x4).
Proof.
  intros x1 x2 H1 x3 x4 H2.
  destruct H1 as [H1]. destruct H2 as [H2].
  unfold imported_Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn.
  constructor. simpl.
  apply f_equal2; [exact H1 | exact H2].
Defined.
Instance: KnownConstant Original.LF_DOT_Auto.LF.Auto.Repeat.CAsgn := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com_CAsgn := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Auto.LF.Auto.Repeat.CAsgn Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Auto.LF.Auto.Repeat.CAsgn Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com_CAsgn Original_LF__DOT__Auto_LF_Auto_Repeat_CAsgn_iso := {}.