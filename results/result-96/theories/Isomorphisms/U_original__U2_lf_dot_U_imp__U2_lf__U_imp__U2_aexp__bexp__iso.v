From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__aexp__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_bexp : Type := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bexp.

Fixpoint bexp_to_imported (b : Original.LF_DOT_Imp.LF.Imp.AExp.bexp) : imported_Original_LF__DOT__Imp_LF_Imp_AExp_bexp :=
  match b with
  | Original.LF_DOT_Imp.LF.Imp.AExp.BTrue => Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bexp_BTrue
  | Original.LF_DOT_Imp.LF.Imp.AExp.BFalse => Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bexp_BFalse
  | Original.LF_DOT_Imp.LF.Imp.AExp.BEq a1 a2 => Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bexp_BEq (aexp_to_imported a1) (aexp_to_imported a2)
  | Original.LF_DOT_Imp.LF.Imp.AExp.BNeq a1 a2 => Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bexp_BNeq (aexp_to_imported a1) (aexp_to_imported a2)
  | Original.LF_DOT_Imp.LF.Imp.AExp.BLe a1 a2 => Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bexp_BLe (aexp_to_imported a1) (aexp_to_imported a2)
  | Original.LF_DOT_Imp.LF.Imp.AExp.BGt a1 a2 => Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bexp_BGt (aexp_to_imported a1) (aexp_to_imported a2)
  | Original.LF_DOT_Imp.LF.Imp.AExp.BNot b1 => Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bexp_BNot (bexp_to_imported b1)
  | Original.LF_DOT_Imp.LF.Imp.AExp.BAnd b1 b2 => Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bexp_BAnd (bexp_to_imported b1) (bexp_to_imported b2)
  end.

Fixpoint imported_to_bexp (b : imported_Original_LF__DOT__Imp_LF_Imp_AExp_bexp) : Original.LF_DOT_Imp.LF.Imp.AExp.bexp :=
  match b with
  | Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bexp_BTrue => Original.LF_DOT_Imp.LF.Imp.AExp.BTrue
  | Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bexp_BFalse => Original.LF_DOT_Imp.LF.Imp.AExp.BFalse
  | Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bexp_BEq a1 a2 => Original.LF_DOT_Imp.LF.Imp.AExp.BEq (imported_to_aexp a1) (imported_to_aexp a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bexp_BNeq a1 a2 => Original.LF_DOT_Imp.LF.Imp.AExp.BNeq (imported_to_aexp a1) (imported_to_aexp a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bexp_BLe a1 a2 => Original.LF_DOT_Imp.LF.Imp.AExp.BLe (imported_to_aexp a1) (imported_to_aexp a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bexp_BGt a1 a2 => Original.LF_DOT_Imp.LF.Imp.AExp.BGt (imported_to_aexp a1) (imported_to_aexp a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bexp_BNot b1 => Original.LF_DOT_Imp.LF.Imp.AExp.BNot (imported_to_bexp b1)
  | Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bexp_BAnd b1 b2 => Original.LF_DOT_Imp.LF.Imp.AExp.BAnd (imported_to_bexp b1) (imported_to_bexp b2)
  end.

(* Lemma for aexp round-trip *)
Lemma aexp_to_from : forall a, IsomorphismDefinitions.eq (aexp_to_imported (imported_to_aexp a)) a.
Proof.
  exact (to_from Original_LF__DOT__Imp_LF_Imp_AExp_aexp_iso).
Defined.

Lemma aexp_from_to : forall a, IsomorphismDefinitions.eq (imported_to_aexp (aexp_to_imported a)) a.
Proof.
  exact (from_to Original_LF__DOT__Imp_LF_Imp_AExp_aexp_iso).
Defined.

Instance Original_LF__DOT__Imp_LF_Imp_AExp_bexp_iso : Iso Original.LF_DOT_Imp.LF.Imp.AExp.bexp imported_Original_LF__DOT__Imp_LF_Imp_AExp_bexp.
Proof.
  unshelve eapply Build_Iso.
  - exact bexp_to_imported.
  - exact imported_to_bexp.
  - intro b. induction b as [| | a1 a2 | a1 a2 | a1 a2 | a1 a2 | b1 IH1 | b1 IH1 b2 IH2].
    + simpl. apply IsomorphismDefinitions.eq_refl.
    + simpl. apply IsomorphismDefinitions.eq_refl.
    + simpl. apply (IsoEq.f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bexp_BEq (aexp_to_from a1) (aexp_to_from a2)).
    + simpl. apply (IsoEq.f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bexp_BNeq (aexp_to_from a1) (aexp_to_from a2)).
    + simpl. apply (IsoEq.f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bexp_BLe (aexp_to_from a1) (aexp_to_from a2)).
    + simpl. apply (IsoEq.f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bexp_BGt (aexp_to_from a1) (aexp_to_from a2)).
    + simpl. apply (IsoEq.f_equal Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bexp_BNot IH1).
    + simpl. apply (IsoEq.f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bexp_BAnd IH1 IH2).
  - intro b. induction b as [| | a1 a2 | a1 a2 | a1 a2 | a1 a2 | b1 IH1 | b1 IH1 b2 IH2].
    + simpl. apply IsomorphismDefinitions.eq_refl.
    + simpl. apply IsomorphismDefinitions.eq_refl.
    + simpl. apply (IsoEq.f_equal2 Original.LF_DOT_Imp.LF.Imp.AExp.BEq (aexp_from_to a1) (aexp_from_to a2)).
    + simpl. apply (IsoEq.f_equal2 Original.LF_DOT_Imp.LF.Imp.AExp.BNeq (aexp_from_to a1) (aexp_from_to a2)).
    + simpl. apply (IsoEq.f_equal2 Original.LF_DOT_Imp.LF.Imp.AExp.BLe (aexp_from_to a1) (aexp_from_to a2)).
    + simpl. apply (IsoEq.f_equal2 Original.LF_DOT_Imp.LF.Imp.AExp.BGt (aexp_from_to a1) (aexp_from_to a2)).
    + simpl. apply (IsoEq.f_equal Original.LF_DOT_Imp.LF.Imp.AExp.BNot IH1).
    + simpl. apply (IsoEq.f_equal2 Original.LF_DOT_Imp.LF.Imp.AExp.BAnd IH1 IH2).
Defined.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.bexp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bexp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.bexp Original_LF__DOT__Imp_LF_Imp_AExp_bexp_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.bexp Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bexp Original_LF__DOT__Imp_LF_Imp_AExp_bexp_iso := {}.