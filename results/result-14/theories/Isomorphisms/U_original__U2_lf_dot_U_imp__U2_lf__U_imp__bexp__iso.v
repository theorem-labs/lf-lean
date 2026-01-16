From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. (* for speed *) *)

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_bexp : Type := Imported.Original_LF__DOT__Imp_LF_Imp_bexp.

(* Convert from Original bexp to Imported bexp *)
Fixpoint bexp_to_imported (b : Original.LF_DOT_Imp.LF.Imp.bexp) : imported_Original_LF__DOT__Imp_LF_Imp_bexp :=
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

(* Convert from Imported bexp to Original bexp *)
Fixpoint imported_to_bexp (b : imported_Original_LF__DOT__Imp_LF_Imp_bexp) : Original.LF_DOT_Imp.LF.Imp.bexp :=
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

Lemma bexp_to_from : forall x : imported_Original_LF__DOT__Imp_LF_Imp_bexp,
  IsomorphismDefinitions.eq (bexp_to_imported (imported_to_bexp x)) x.
Proof.
  fix IH 1.
  intros x. destruct x as [| | a1 a2 | a1 a2 | a1 a2 | a1 a2 | b1 | b1 b2]; simpl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply (f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BEq (aexp_to_from a1) (aexp_to_from a2)).
  - apply (f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BNeq (aexp_to_from a1) (aexp_to_from a2)).
  - apply (f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BLe (aexp_to_from a1) (aexp_to_from a2)).
  - apply (f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BGt (aexp_to_from a1) (aexp_to_from a2)).
  - apply (f_equal Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BNot (IH b1)).
  - apply (f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_bexp_BAnd (IH b1) (IH b2)).
Qed.

Lemma bexp_from_to : forall x : Original.LF_DOT_Imp.LF.Imp.bexp,
  IsomorphismDefinitions.eq (imported_to_bexp (bexp_to_imported x)) x.
Proof.
  fix IH 1. intros x. destruct x as [| | a1 a2 | a1 a2 | a1 a2 | a1 a2 | b1 | b1 b2]; simpl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply (f_equal2 Original.LF_DOT_Imp.LF.Imp.BEq (aexp_from_to a1) (aexp_from_to a2)).
  - apply (f_equal2 Original.LF_DOT_Imp.LF.Imp.BNeq (aexp_from_to a1) (aexp_from_to a2)).
  - apply (f_equal2 Original.LF_DOT_Imp.LF.Imp.BLe (aexp_from_to a1) (aexp_from_to a2)).
  - apply (f_equal2 Original.LF_DOT_Imp.LF.Imp.BGt (aexp_from_to a1) (aexp_from_to a2)).
  - apply (f_equal Original.LF_DOT_Imp.LF.Imp.BNot (IH b1)).
  - apply (f_equal2 Original.LF_DOT_Imp.LF.Imp.BAnd (IH b1) (IH b2)).
Qed.

Instance Original_LF__DOT__Imp_LF_Imp_bexp_iso : Iso Original.LF_DOT_Imp.LF.Imp.bexp imported_Original_LF__DOT__Imp_LF_Imp_bexp := {|
  to := bexp_to_imported;
  from := imported_to_bexp;
  to_from := bexp_to_from;
  from_to := bexp_from_to
|}.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.bexp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_bexp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.bexp Original_LF__DOT__Imp_LF_Imp_bexp_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.bexp Imported.Original_LF__DOT__Imp_LF_Imp_bexp Original_LF__DOT__Imp_LF_Imp_bexp_iso := {}.