From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__letter__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_lower__letter : imported_Original_LF__DOT__Basics_LF_Basics_letter -> imported_Original_LF__DOT__Basics_LF_Basics_letter := Imported.Original_LF__DOT__Basics_LF_Basics_lower__letter.
Instance Original_LF__DOT__Basics_LF_Basics_lower__letter_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.letter) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_letter),
  rel_iso Original_LF__DOT__Basics_LF_Basics_letter_iso x1 x2 ->
  rel_iso Original_LF__DOT__Basics_LF_Basics_letter_iso (Original.LF_DOT_Basics.LF.Basics.lower_letter x1) (imported_Original_LF__DOT__Basics_LF_Basics_lower__letter x2).
Proof.
  intros x1 x2 [H].
  constructor.
  unfold imported_Original_LF__DOT__Basics_LF_Basics_lower__letter.
  destruct H.
  destruct x1; simpl; apply IsomorphismDefinitions.eq_refl.
Qed.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.lower_letter := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_lower__letter := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.lower_letter Original_LF__DOT__Basics_LF_Basics_lower__letter_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.lower_letter Imported.Original_LF__DOT__Basics_LF_Basics_lower__letter Original_LF__DOT__Basics_LF_Basics_lower__letter_iso := {}.