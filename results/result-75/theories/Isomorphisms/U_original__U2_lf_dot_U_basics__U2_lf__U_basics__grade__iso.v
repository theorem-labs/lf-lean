From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__letter__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__modifier__iso.

Monomorphic Definition imported_Original_LF__DOT__Basics_LF_Basics_grade : Type := Imported.Original_LF__DOT__Basics_LF_Basics_grade.

Monomorphic Definition grade_to (g : Original.LF_DOT_Basics.LF.Basics.grade) : imported_Original_LF__DOT__Basics_LF_Basics_grade :=
  match g with
  | Original.LF_DOT_Basics.LF.Basics.Grade l m => 
      Imported.Original_LF__DOT__Basics_LF_Basics_grade_Grade (letter_to l) (modifier_to m)
  end.

Monomorphic Definition grade_from (g : imported_Original_LF__DOT__Basics_LF_Basics_grade) : Original.LF_DOT_Basics.LF.Basics.grade :=
  match g with
  | Imported.Original_LF__DOT__Basics_LF_Basics_grade_Grade l m => 
      Original.LF_DOT_Basics.LF.Basics.Grade (letter_from l) (modifier_from m)
  end.

Monomorphic Lemma grade_to_from : forall x, IsomorphismDefinitions.eq (grade_to (grade_from x)) x.
Proof.
  intros [l m]. simpl.
  destruct l; destruct m; apply IsomorphismDefinitions.eq_refl.
Defined.

Monomorphic Lemma grade_from_to : forall x, IsomorphismDefinitions.eq (grade_from (grade_to x)) x.
Proof.
  intros [l m]. simpl.
  destruct l; destruct m; apply IsomorphismDefinitions.eq_refl.
Defined.

Monomorphic Instance Original_LF__DOT__Basics_LF_Basics_grade_iso : Iso Original.LF_DOT_Basics.LF.Basics.grade imported_Original_LF__DOT__Basics_LF_Basics_grade :=
  Build_Iso grade_to grade_from grade_to_from grade_from_to.

Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.grade := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_grade := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.grade Original_LF__DOT__Basics_LF_Basics_grade_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.grade Imported.Original_LF__DOT__Basics_LF_Basics_grade Original_LF__DOT__Basics_LF_Basics_grade_iso := {}.
