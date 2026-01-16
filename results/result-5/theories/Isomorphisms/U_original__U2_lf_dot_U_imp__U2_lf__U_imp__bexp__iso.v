From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_bexp : Type := Imported.Original_LF__DOT__Imp_LF_Imp_bexp.

Fixpoint bexp_to_imported (b : Original.LF_DOT_Imp.LF.Imp.bexp) : Imported.Original_LF__DOT__Imp_LF_Imp_bexp :=
  match b with
  | Original.LF_DOT_Imp.LF.Imp.BTrue => Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BTrue
  | Original.LF_DOT_Imp.LF.Imp.BFalse => Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BFalse
  | Original.LF_DOT_Imp.LF.Imp.BEq a1 a2 => Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BEq (aexp_to_imported a1) (aexp_to_imported a2)
  | Original.LF_DOT_Imp.LF.Imp.BNeq a1 a2 => Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BNeq (aexp_to_imported a1) (aexp_to_imported a2)
  | Original.LF_DOT_Imp.LF.Imp.BLe a1 a2 => Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BLe (aexp_to_imported a1) (aexp_to_imported a2)
  | Original.LF_DOT_Imp.LF.Imp.BGt a1 a2 => Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BGt (aexp_to_imported a1) (aexp_to_imported a2)
  | Original.LF_DOT_Imp.LF.Imp.BNot b1 => Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BNot (bexp_to_imported b1)
  | Original.LF_DOT_Imp.LF.Imp.BAnd b1 b2 => Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BAnd (bexp_to_imported b1) (bexp_to_imported b2)
  end.

Fixpoint imported_to_bexp (b : Imported.Original_LF__DOT__Imp_LF_Imp_bexp) : Original.LF_DOT_Imp.LF.Imp.bexp :=
  match b with
  | Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BTrue => Original.LF_DOT_Imp.LF.Imp.BTrue
  | Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BFalse => Original.LF_DOT_Imp.LF.Imp.BFalse
  | Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BEq a1 a2 => Original.LF_DOT_Imp.LF.Imp.BEq (imported_to_aexp a1) (imported_to_aexp a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BNeq a1 a2 => Original.LF_DOT_Imp.LF.Imp.BNeq (imported_to_aexp a1) (imported_to_aexp a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BLe a1 a2 => Original.LF_DOT_Imp.LF.Imp.BLe (imported_to_aexp a1) (imported_to_aexp a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BGt a1 a2 => Original.LF_DOT_Imp.LF.Imp.BGt (imported_to_aexp a1) (imported_to_aexp a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BNot b1 => Original.LF_DOT_Imp.LF.Imp.BNot (imported_to_bexp b1)
  | Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BAnd b1 b2 => Original.LF_DOT_Imp.LF.Imp.BAnd (imported_to_bexp b1) (imported_to_bexp b2)
  end.

Lemma bexp_roundtrip1 : forall b, imported_to_bexp (bexp_to_imported b) = b.
Proof.
  fix IH 1. intro b. destruct b; simpl; try reflexivity.
  - f_equal; apply aexp_roundtrip1.
  - f_equal; apply aexp_roundtrip1.
  - f_equal; apply aexp_roundtrip1.
  - f_equal; apply aexp_roundtrip1.
  - f_equal; apply IH.
  - f_equal; apply IH.
Qed.

Lemma bexp_roundtrip2 : forall b, bexp_to_imported (imported_to_bexp b) = b.
Proof.
  fix IH 1. intro b. destruct b; simpl; try reflexivity.
  - f_equal; apply aexp_roundtrip2.
  - f_equal; apply aexp_roundtrip2.
  - f_equal; apply aexp_roundtrip2.
  - f_equal; apply aexp_roundtrip2.
  - f_equal; apply IH.
  - f_equal; apply IH.
Qed.

Instance Original_LF__DOT__Imp_LF_Imp_bexp_iso : Iso Original.LF_DOT_Imp.LF.Imp.bexp imported_Original_LF__DOT__Imp_LF_Imp_bexp.
Proof.
  exists bexp_to_imported imported_to_bexp.
  - intro b. rewrite bexp_roundtrip2. exact IsomorphismDefinitions.eq_refl.
  - intro b. rewrite bexp_roundtrip1. exact IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.bexp := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_bexp := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.bexp Original_LF__DOT__Imp_LF_Imp_bexp_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.bexp Imported.Original_LF__DOT__Imp_LF_Imp_bexp Original_LF__DOT__Imp_LF_Imp_bexp_iso := {}.
