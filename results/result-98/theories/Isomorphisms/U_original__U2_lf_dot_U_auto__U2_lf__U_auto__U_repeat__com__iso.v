From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. *) (* for speed *)

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__bexp__iso.

Definition imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com : Type := Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com.

(* Convert from Original com to Imported com *)
Fixpoint com_to_imported (c : Original.LF_DOT_Auto.LF.Auto.Repeat.com) : imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com :=
  match c with
  | Original.LF_DOT_Auto.LF.Auto.Repeat.CSkip => Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com_CSkip
  | Original.LF_DOT_Auto.LF.Auto.Repeat.CAsgn s a => Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com_CAsgn (to String_string_iso s) (aexp_to_imported a)
  | Original.LF_DOT_Auto.LF.Auto.Repeat.CSeq c1 c2 => Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com_CSeq (com_to_imported c1) (com_to_imported c2)
  | Original.LF_DOT_Auto.LF.Auto.Repeat.CIf b c1 c2 => Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com_CIf (bexp_to_imported b) (com_to_imported c1) (com_to_imported c2)
  | Original.LF_DOT_Auto.LF.Auto.Repeat.CWhile b c => Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com_CWhile (bexp_to_imported b) (com_to_imported c)
  | Original.LF_DOT_Auto.LF.Auto.Repeat.CRepeat c b => Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com_CRepeat (com_to_imported c) (bexp_to_imported b)
  end.

(* Convert from Imported com to Original com *)
Fixpoint com_from_imported (c : imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com) : Original.LF_DOT_Auto.LF.Auto.Repeat.com :=
  match c with
  | Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com_CSkip => Original.LF_DOT_Auto.LF.Auto.Repeat.CSkip
  | Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com_CAsgn s a => Original.LF_DOT_Auto.LF.Auto.Repeat.CAsgn (from String_string_iso s) (imported_to_aexp a)
  | Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com_CSeq c1 c2 => Original.LF_DOT_Auto.LF.Auto.Repeat.CSeq (com_from_imported c1) (com_from_imported c2)
  | Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com_CIf b c1 c2 => Original.LF_DOT_Auto.LF.Auto.Repeat.CIf (imported_to_bexp b) (com_from_imported c1) (com_from_imported c2)
  | Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com_CWhile b c => Original.LF_DOT_Auto.LF.Auto.Repeat.CWhile (imported_to_bexp b) (com_from_imported c)
  | Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com_CRepeat c b => Original.LF_DOT_Auto.LF.Auto.Repeat.CRepeat (com_from_imported c) (imported_to_bexp b)
  end.

Lemma com_to_from : forall x, IsomorphismDefinitions.eq (com_to_imported (com_from_imported x)) x.
Proof.
  fix IH 1.
  destruct x; simpl;
  [apply IsomorphismDefinitions.eq_refl |
   apply f_equal2; [apply (to_from String_string_iso) | apply aexp_to_from] |
   apply f_equal2; apply IH |
   apply f_equal3; [apply bexp_to_from | apply IH | apply IH] |
   apply f_equal2; [apply bexp_to_from | apply IH] |
   apply f_equal2; [apply IH | apply bexp_to_from]].
Defined.

Lemma com_from_to : forall x, IsomorphismDefinitions.eq (com_from_imported (com_to_imported x)) x.
Proof.
  fix IH 1.
  destruct x; simpl;
  [apply IsomorphismDefinitions.eq_refl |
   apply f_equal2; [apply (from_to String_string_iso) | apply aexp_from_to] |
   apply f_equal2; apply IH |
   apply f_equal3; [apply bexp_from_to | apply IH | apply IH] |
   apply f_equal2; [apply bexp_from_to | apply IH] |
   apply f_equal2; [apply IH | apply bexp_from_to]].
Defined.

Instance Original_LF__DOT__Auto_LF_Auto_Repeat_com_iso : Iso Original.LF_DOT_Auto.LF.Auto.Repeat.com imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com :=
  Build_Iso com_to_imported com_from_imported com_to_from com_from_to.

Instance: KnownConstant Original.LF_DOT_Auto.LF.Auto.Repeat.com := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Auto.LF.Auto.Repeat.com Original_LF__DOT__Auto_LF_Auto_Repeat_com_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Auto.LF.Auto.Repeat.com Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com Original_LF__DOT__Auto_LF_Auto_Repeat_com_iso := {}.