From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(*Typeclasses Opaque rel_iso.*) (* for speed *)


Definition imported_Original_LF__DOT__Basics_LF_Basics_letter : Type := Imported.Original_LF__DOT__Basics_LF_Basics_letter.

Definition Original_LF__DOT__Basics_LF_Basics_A : imported_Original_LF__DOT__Basics_LF_Basics_letter := Imported.Original_LF__DOT__Basics_LF_Basics_A.
Definition Original_LF__DOT__Basics_LF_Basics_B : imported_Original_LF__DOT__Basics_LF_Basics_letter := Imported.Original_LF__DOT__Basics_LF_Basics_B.
Definition Original_LF__DOT__Basics_LF_Basics_C : imported_Original_LF__DOT__Basics_LF_Basics_letter := Imported.Original_LF__DOT__Basics_LF_Basics_C.
Definition Original_LF__DOT__Basics_LF_Basics_D : imported_Original_LF__DOT__Basics_LF_Basics_letter := Imported.Original_LF__DOT__Basics_LF_Basics_D.
Definition Original_LF__DOT__Basics_LF_Basics_F : imported_Original_LF__DOT__Basics_LF_Basics_letter := Imported.Original_LF__DOT__Basics_LF_Basics_F.

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
Proof. destruct x; apply IsomorphismDefinitions.eq_refl. Qed.

Lemma letter_from_to : forall x, IsomorphismDefinitions.eq (letter_from (letter_to x)) x.
Proof. destruct x; apply IsomorphismDefinitions.eq_refl. Qed.

Instance Original_LF__DOT__Basics_LF_Basics_letter_iso : Iso Original.LF_DOT_Basics.LF.Basics.letter imported_Original_LF__DOT__Basics_LF_Basics_letter :=
  Build_Iso letter_to letter_from letter_to_from letter_from_to.

Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.letter := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_letter := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.letter Original_LF__DOT__Basics_LF_Basics_letter_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.letter Imported.Original_LF__DOT__Basics_LF_Basics_letter Original_LF__DOT__Basics_LF_Basics_letter_iso := {}.