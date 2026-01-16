From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



Definition imported_Original_LF__DOT__Basics_LF_Basics_letter : Type := Imported.Original_LF__DOT__Basics_LF_Basics_letter.

Definition letter_to (l : Original.LF_DOT_Basics.LF.Basics.letter) : imported_Original_LF__DOT__Basics_LF_Basics_letter :=
  match l with
  | Original.LF_DOT_Basics.LF.Basics.A => Imported.Original_LF__DOT__Basics_LF_Basics_letter_A
  | Original.LF_DOT_Basics.LF.Basics.B => Imported.Original_LF__DOT__Basics_LF_Basics_letter_B
  | Original.LF_DOT_Basics.LF.Basics.C => Imported.Original_LF__DOT__Basics_LF_Basics_letter_C
  | Original.LF_DOT_Basics.LF.Basics.D => Imported.Original_LF__DOT__Basics_LF_Basics_letter_D
  | Original.LF_DOT_Basics.LF.Basics.F => Imported.Original_LF__DOT__Basics_LF_Basics_letter_F
  end.

Definition letter_from (l : imported_Original_LF__DOT__Basics_LF_Basics_letter) : Original.LF_DOT_Basics.LF.Basics.letter :=
  match l with
  | Imported.Original_LF__DOT__Basics_LF_Basics_letter_A => Original.LF_DOT_Basics.LF.Basics.A
  | Imported.Original_LF__DOT__Basics_LF_Basics_letter_B => Original.LF_DOT_Basics.LF.Basics.B
  | Imported.Original_LF__DOT__Basics_LF_Basics_letter_C => Original.LF_DOT_Basics.LF.Basics.C
  | Imported.Original_LF__DOT__Basics_LF_Basics_letter_D => Original.LF_DOT_Basics.LF.Basics.D
  | Imported.Original_LF__DOT__Basics_LF_Basics_letter_F => Original.LF_DOT_Basics.LF.Basics.F
  end.

Lemma letter_to_from : forall x, IsomorphismDefinitions.eq (letter_to (letter_from x)) x.
Proof.
  intro x; destruct x; apply IsomorphismDefinitions.eq_refl.
Qed.

Lemma letter_from_to : forall x, IsomorphismDefinitions.eq (letter_from (letter_to x)) x.
Proof.
  intro x; destruct x; apply IsomorphismDefinitions.eq_refl.
Qed.

Instance Original_LF__DOT__Basics_LF_Basics_letter_iso : Iso Original.LF_DOT_Basics.LF.Basics.letter imported_Original_LF__DOT__Basics_LF_Basics_letter :=
  {| to := letter_to; from := letter_from; to_from := letter_to_from; from_to := letter_from_to |}.

Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.letter := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_letter := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.letter Original_LF__DOT__Basics_LF_Basics_letter_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.letter Imported.Original_LF__DOT__Basics_LF_Basics_letter Original_LF__DOT__Basics_LF_Basics_letter_iso := {}.