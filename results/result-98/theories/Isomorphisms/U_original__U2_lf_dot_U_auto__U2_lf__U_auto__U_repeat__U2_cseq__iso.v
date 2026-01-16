From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. *) (* for speed *)

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_auto__U2_lf__U_auto__U_repeat__com__iso.

Definition imported_Original_LF__DOT__Auto_LF_Auto_Repeat_CSeq : imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com -> imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com -> imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com := Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com_CSeq.
Instance Original_LF__DOT__Auto_LF_Auto_Repeat_CSeq_iso : forall (x1 : Original.LF_DOT_Auto.LF.Auto.Repeat.com) (x2 : imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com),
  rel_iso Original_LF__DOT__Auto_LF_Auto_Repeat_com_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Auto.LF.Auto.Repeat.com) (x4 : imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com),
  rel_iso Original_LF__DOT__Auto_LF_Auto_Repeat_com_iso x3 x4 ->
  rel_iso Original_LF__DOT__Auto_LF_Auto_Repeat_com_iso (Original.LF_DOT_Auto.LF.Auto.Repeat.CSeq x1 x3) (imported_Original_LF__DOT__Auto_LF_Auto_Repeat_CSeq x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  destruct H12 as [H12]. destruct H34 as [H34]. simpl in H12, H34.
  constructor. simpl.
  unfold imported_Original_LF__DOT__Auto_LF_Auto_Repeat_CSeq.
  apply f_equal2; [exact H12 | exact H34].
Defined.
Instance: KnownConstant Original.LF_DOT_Auto.LF.Auto.Repeat.CSeq := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com_CSeq := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Auto.LF.Auto.Repeat.CSeq Original_LF__DOT__Auto_LF_Auto_Repeat_CSeq_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Auto.LF.Auto.Repeat.CSeq Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com_CSeq Original_LF__DOT__Auto_LF_Auto_Repeat_CSeq_iso := {}.