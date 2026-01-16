From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* Typeclasses Opaque rel_iso. *) *) (* for speed *)

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__letter__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__modifier__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_grade : Type := Imported.Original_LF__DOT__Basics_LF_Basics_grade.

Definition grade_to (g : Original.LF_DOT_Basics.LF.Basics.grade) : imported_Original_LF__DOT__Basics_LF_Basics_grade :=
  match g with
  | Original.LF_DOT_Basics.LF.Basics.Grade l m => 
      Imported.Original_LF__DOT__Basics_LF_Basics_grade_Grade (letter_to l) (modifier_to m)
  end.

Definition grade_from (g : imported_Original_LF__DOT__Basics_LF_Basics_grade) : Original.LF_DOT_Basics.LF.Basics.grade :=
  match g with
  | Imported.Original_LF__DOT__Basics_LF_Basics_grade_Grade l m =>
      Original.LF_DOT_Basics.LF.Basics.Grade (letter_from l) (modifier_from m)
  end.

Lemma grade_to_from : forall x, IsomorphismDefinitions.eq (grade_to (grade_from x)) x.
Proof.
  intro x.
  destruct x as [l m].
  unfold grade_to, grade_from. simpl.
  assert (Hl : IsomorphismDefinitions.eq (letter_to (letter_from l)) l) by apply letter_to_from.
  assert (Hm : IsomorphismDefinitions.eq (modifier_to (modifier_from m)) m) by apply modifier_to_from.
  destruct l, m; apply IsomorphismDefinitions.eq_refl.
Qed.

Lemma grade_from_to : forall x, IsomorphismDefinitions.eq (grade_from (grade_to x)) x.
Proof.
  intro x.
  destruct x as [l m].
  unfold grade_to, grade_from. simpl.
  assert (Hl : IsomorphismDefinitions.eq (letter_from (letter_to l)) l) by apply letter_from_to.
  assert (Hm : IsomorphismDefinitions.eq (modifier_from (modifier_to m)) m) by apply modifier_from_to.
  destruct l, m; apply IsomorphismDefinitions.eq_refl.
Qed.

Instance Original_LF__DOT__Basics_LF_Basics_grade_iso : Iso Original.LF_DOT_Basics.LF.Basics.grade imported_Original_LF__DOT__Basics_LF_Basics_grade :=
  Build_Iso grade_to grade_from grade_to_from grade_from_to.

Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.grade := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_grade := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.grade Original_LF__DOT__Basics_LF_Basics_grade_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.grade Imported.Original_LF__DOT__Basics_LF_Basics_grade Original_LF__DOT__Basics_LF_Basics_grade_iso := {}.