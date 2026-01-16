From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__bexp__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_com : Type := Imported.Original_LF__DOT__Imp_LF_Imp_com.

Fixpoint com_to_imported (c : Original.LF_DOT_Imp.LF.Imp.com) : Imported.Original_LF__DOT__Imp_LF_Imp_com :=
  match c with
  | Original.LF_DOT_Imp.LF.Imp.CSkip => Imported.Original_LF__DOT__Imp_LF_Imp_com_CSkip
  | Original.LF_DOT_Imp.LF.Imp.CAsgn s a => Imported.Original_LF__DOT__Imp_LF_Imp_com_CAsgn (string_to_imported s) (aexp_to_imported a)
  | Original.LF_DOT_Imp.LF.Imp.CSeq c1 c2 => Imported.Original_LF__DOT__Imp_LF_Imp_com_CSeq (com_to_imported c1) (com_to_imported c2)
  | Original.LF_DOT_Imp.LF.Imp.CIf b c1 c2 => Imported.Original_LF__DOT__Imp_LF_Imp_com_CIf (bexp_to_imported b) (com_to_imported c1) (com_to_imported c2)
  | Original.LF_DOT_Imp.LF.Imp.CWhile b c1 => Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile (bexp_to_imported b) (com_to_imported c1)
  end.

Fixpoint imported_to_com (c : Imported.Original_LF__DOT__Imp_LF_Imp_com) : Original.LF_DOT_Imp.LF.Imp.com :=
  match c with
  | Imported.Original_LF__DOT__Imp_LF_Imp_com_CSkip => Original.LF_DOT_Imp.LF.Imp.CSkip
  | Imported.Original_LF__DOT__Imp_LF_Imp_com_CAsgn s a => Original.LF_DOT_Imp.LF.Imp.CAsgn (imported_to_string s) (imported_to_aexp a)
  | Imported.Original_LF__DOT__Imp_LF_Imp_com_CSeq c1 c2 => Original.LF_DOT_Imp.LF.Imp.CSeq (imported_to_com c1) (imported_to_com c2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_com_CIf b c1 c2 => Original.LF_DOT_Imp.LF.Imp.CIf (imported_to_bexp b) (imported_to_com c1) (imported_to_com c2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile b c1 => Original.LF_DOT_Imp.LF.Imp.CWhile (imported_to_bexp b) (imported_to_com c1)
  end.

Lemma com_roundtrip1 : forall c, imported_to_com (com_to_imported c) = c.
Proof.
  fix IH 1. intro c. destruct c; simpl.
  - reflexivity.
  - f_equal. apply string_roundtrip1. apply aexp_roundtrip1.
  - f_equal; apply IH.
  - f_equal. apply bexp_roundtrip1. apply IH. apply IH.
  - f_equal. apply bexp_roundtrip1. apply IH.
Qed.

Lemma com_roundtrip2 : forall c, com_to_imported (imported_to_com c) = c.
Proof.
  fix IH 1. intro c. destruct c; simpl.
  - reflexivity.
  - f_equal. apply string_roundtrip2. apply aexp_roundtrip2.
  - f_equal; apply IH.
  - f_equal. apply bexp_roundtrip2. apply IH. apply IH.
  - f_equal. apply bexp_roundtrip2. apply IH.
Qed.

Instance Original_LF__DOT__Imp_LF_Imp_com_iso : Iso Original.LF_DOT_Imp.LF.Imp.com imported_Original_LF__DOT__Imp_LF_Imp_com.
Proof.
  exists com_to_imported imported_to_com.
  - intro c. rewrite com_roundtrip2. exact IsomorphismDefinitions.eq_refl.
  - intro c. rewrite com_roundtrip1. exact IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.com := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_com := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.com Original_LF__DOT__Imp_LF_Imp_com_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.com Imported.Original_LF__DOT__Imp_LF_Imp_com Original_LF__DOT__Imp_LF_Imp_com_iso := {}.
