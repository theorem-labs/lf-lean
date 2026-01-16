From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__bexp__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com : Type := Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_com.

Fixpoint com_to_imported (c : Original.LF_DOT_Imp.LF.Imp.BreakImp.com) : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com :=
  match c with
  | Original.LF_DOT_Imp.LF.Imp.BreakImp.CSkip => Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_com_CSkip
  | Original.LF_DOT_Imp.LF.Imp.BreakImp.CBreak => Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_com_CBreak
  | Original.LF_DOT_Imp.LF.Imp.BreakImp.CAsgn x a => Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_com_CAsgn (string_to_lean x) (aexp_to_imported a)
  | Original.LF_DOT_Imp.LF.Imp.BreakImp.CSeq c1 c2 => Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_com_CSeq (com_to_imported c1) (com_to_imported c2)
  | Original.LF_DOT_Imp.LF.Imp.BreakImp.CIf b c1 c2 => Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_com_CIf (bexp_to_imported b) (com_to_imported c1) (com_to_imported c2)
  | Original.LF_DOT_Imp.LF.Imp.BreakImp.CWhile b c => Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_com_CWhile (bexp_to_imported b) (com_to_imported c)
  end.

Fixpoint imported_to_com (c : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com) : Original.LF_DOT_Imp.LF.Imp.BreakImp.com :=
  match c with
  | Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_com_CSkip => Original.LF_DOT_Imp.LF.Imp.BreakImp.CSkip
  | Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_com_CBreak => Original.LF_DOT_Imp.LF.Imp.BreakImp.CBreak
  | Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_com_CAsgn x a => Original.LF_DOT_Imp.LF.Imp.BreakImp.CAsgn (lean_to_string x) (imported_to_aexp a)
  | Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_com_CSeq c1 c2 => Original.LF_DOT_Imp.LF.Imp.BreakImp.CSeq (imported_to_com c1) (imported_to_com c2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_com_CIf b c1 c2 => Original.LF_DOT_Imp.LF.Imp.BreakImp.CIf (imported_to_bexp b) (imported_to_com c1) (imported_to_com c2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_com_CWhile b c => Original.LF_DOT_Imp.LF.Imp.BreakImp.CWhile (imported_to_bexp b) (imported_to_com c)
  end.

Lemma com_roundtrip1 : forall c, imported_to_com (com_to_imported c) = c.
Proof.
  induction c; simpl.
  - reflexivity.
  - reflexivity.
  - f_equal. apply string_roundtrip1. apply aexp_roundtrip1.
  - f_equal; [exact IHc1 | exact IHc2].
  - f_equal. apply bexp_roundtrip1. exact IHc1. exact IHc2.
  - f_equal. apply bexp_roundtrip1. exact IHc.
Qed.

Lemma com_roundtrip2 : forall c, com_to_imported (imported_to_com c) = c.
Proof.
  induction c; simpl.
  - reflexivity.
  - reflexivity.
  - f_equal. apply string_roundtrip2. apply aexp_roundtrip2.
  - f_equal; [exact IHc1 | exact IHc2].
  - f_equal. apply bexp_roundtrip2. exact IHc1. exact IHc2.
  - f_equal. apply bexp_roundtrip2. exact IHc.
Qed.

Instance Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso : Iso Original.LF_DOT_Imp.LF.Imp.BreakImp.com imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com.
Proof.
  refine {| to := com_to_imported; from := imported_to_com |}.
  - intro x. pose proof (com_roundtrip2 x) as H. rewrite H. exact IsomorphismDefinitions.eq_refl.
  - intro x. pose proof (com_roundtrip1 x) as H. rewrite H. exact IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.BreakImp.com := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_com := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.BreakImp.com Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.BreakImp.com Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_com Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso := {}.