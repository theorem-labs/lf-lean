From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.


From IsomorphismChecker Require Export Isomorphisms.nat__iso Isomorphisms.U_string__string__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_aexp : Type := Imported.Original_LF__DOT__Imp_LF_Imp_aexp.

Fixpoint aexp_to_imported (a : Original.LF_DOT_Imp.LF.Imp.aexp) : Imported.Original_LF__DOT__Imp_LF_Imp_aexp :=
  match a with
  | Original.LF_DOT_Imp.LF.Imp.ANum n => Imported.Original_LF__DOT__Imp_LF_Imp_aexp_ANum (nat_to_imported n)
  | Original.LF_DOT_Imp.LF.Imp.AId s => Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AId (string_to_imported s)
  | Original.LF_DOT_Imp.LF.Imp.APlus a1 a2 => Imported.Original_LF__DOT__Imp_LF_Imp_aexp_APlus (aexp_to_imported a1) (aexp_to_imported a2)
  | Original.LF_DOT_Imp.LF.Imp.AMinus a1 a2 => Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AMinus (aexp_to_imported a1) (aexp_to_imported a2)
  | Original.LF_DOT_Imp.LF.Imp.AMult a1 a2 => Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AMult (aexp_to_imported a1) (aexp_to_imported a2)
  end.

Fixpoint imported_to_aexp (a : Imported.Original_LF__DOT__Imp_LF_Imp_aexp) : Original.LF_DOT_Imp.LF.Imp.aexp :=
  match a with
  | Imported.Original_LF__DOT__Imp_LF_Imp_aexp_ANum n => Original.LF_DOT_Imp.LF.Imp.ANum (imported_to_nat n)
  | Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AId s => Original.LF_DOT_Imp.LF.Imp.AId (imported_to_string s)
  | Imported.Original_LF__DOT__Imp_LF_Imp_aexp_APlus a1 a2 => Original.LF_DOT_Imp.LF.Imp.APlus (imported_to_aexp a1) (imported_to_aexp a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AMinus a1 a2 => Original.LF_DOT_Imp.LF.Imp.AMinus (imported_to_aexp a1) (imported_to_aexp a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AMult a1 a2 => Original.LF_DOT_Imp.LF.Imp.AMult (imported_to_aexp a1) (imported_to_aexp a2)
  end.

Lemma aexp_roundtrip1 : forall a, imported_to_aexp (aexp_to_imported a) = a.
Proof.
  fix IH 1. intro a. destruct a; simpl.
  - f_equal. apply nat_roundtrip1.
  - f_equal. apply string_roundtrip1.
  - f_equal; apply IH.
  - f_equal; apply IH.
  - f_equal; apply IH.
Qed.

Lemma aexp_roundtrip2 : forall a, aexp_to_imported (imported_to_aexp a) = a.
Proof.
  fix IH 1. intro a. destruct a; simpl.
  - f_equal. apply nat_roundtrip2.
  - f_equal. apply string_roundtrip2.
  - f_equal; apply IH.
  - f_equal; apply IH.
  - f_equal; apply IH.
Qed.

Instance Original_LF__DOT__Imp_LF_Imp_aexp_iso : Iso Original.LF_DOT_Imp.LF.Imp.aexp imported_Original_LF__DOT__Imp_LF_Imp_aexp.
Proof.
  exists aexp_to_imported imported_to_aexp.
  - intro a. rewrite aexp_roundtrip2. exact IsomorphismDefinitions.eq_refl.
  - intro a. rewrite aexp_roundtrip1. exact IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.aexp := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_aexp := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.aexp Original_LF__DOT__Imp_LF_Imp_aexp_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.aexp Imported.Original_LF__DOT__Imp_LF_Imp_aexp Original_LF__DOT__Imp_LF_Imp_aexp_iso := {}.
