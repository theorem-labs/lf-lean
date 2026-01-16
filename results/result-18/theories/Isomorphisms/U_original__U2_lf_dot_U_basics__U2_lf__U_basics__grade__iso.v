From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__letter__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__modifier__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_grade : Type := Imported.Original_LF__DOT__Basics_LF_Basics_grade.

Definition grade_to (g : Original.LF_DOT_Basics.LF.Basics.grade) : imported_Original_LF__DOT__Basics_LF_Basics_grade :=
  match g with
  | Original.LF_DOT_Basics.LF.Basics.Grade l m =>
    Imported.Original_LF__DOT__Basics_LF_Basics_grade_Grade (letter_to l) (modifier_to m)
  end.

Definition grade_from (g : imported_Original_LF__DOT__Basics_LF_Basics_grade) : Original.LF_DOT_Basics.LF.Basics.grade :=
  Original.LF_DOT_Basics.LF.Basics.Grade
    (letter_from (Imported.a____at___U_original__U2_lf_dot_U_basics__U2_lf__U_basics__apply____late____policy__iso__hyg48 g))
    (modifier_from (Imported.a____at___U_original__U2_lf_dot_U_basics__U2_lf__U_basics__apply____late____policy__iso__hyg50 g)).

Lemma grade_to_from_aux : forall (l : Imported.Original_LF__DOT__Basics_LF_Basics_letter) (m : Imported.Original_LF__DOT__Basics_LF_Basics_modifier),
  IsomorphismDefinitions.eq 
    (Imported.Original_LF__DOT__Basics_LF_Basics_grade_Grade (letter_to (letter_from l)) (modifier_to (modifier_from m)))
    (Imported.Original_LF__DOT__Basics_LF_Basics_grade_Grade l m).
Proof.
  intros l m.
  destruct l, m; apply IsomorphismDefinitions.eq_refl.
Qed.

Lemma grade_to_from : forall x, IsomorphismDefinitions.eq (grade_to (grade_from x)) x.
Proof.
  intro x.
  unfold grade_to, grade_from.
  simpl.
  apply grade_to_from_aux.
Qed.

Lemma grade_from_to_aux : forall (l : Original.LF_DOT_Basics.LF.Basics.letter) (m : Original.LF_DOT_Basics.LF.Basics.modifier),
  IsomorphismDefinitions.eq 
    (Original.LF_DOT_Basics.LF.Basics.Grade (letter_from (letter_to l)) (modifier_from (modifier_to m)))
    (Original.LF_DOT_Basics.LF.Basics.Grade l m).
Proof.
  intros l m.
  destruct l, m; apply IsomorphismDefinitions.eq_refl.
Qed.

Lemma grade_from_to : forall x, IsomorphismDefinitions.eq (grade_from (grade_to x)) x.
Proof.
  intro x; destruct x.
  unfold grade_to, grade_from.
  simpl.
  apply grade_from_to_aux.
Qed.

Instance Original_LF__DOT__Basics_LF_Basics_grade_iso : Iso Original.LF_DOT_Basics.LF.Basics.grade imported_Original_LF__DOT__Basics_LF_Basics_grade :=
  {| to := grade_to; from := grade_from; to_from := grade_to_from; from_to := grade_from_to |}.

Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.grade := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_grade := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.grade Original_LF__DOT__Basics_LF_Basics_grade_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.grade Imported.Original_LF__DOT__Basics_LF_Basics_grade Original_LF__DOT__Basics_LF_Basics_grade_iso := {}.