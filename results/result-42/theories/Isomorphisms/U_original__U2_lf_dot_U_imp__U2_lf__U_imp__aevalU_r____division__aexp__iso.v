From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
From IsomorphismChecker Require Export Isomorphisms.nat__iso.
(* Print Imported. *)



Definition imported_Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp : Type := Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp.

Fixpoint aexp_to_imported (e : Original.LF_DOT_Imp.LF.Imp.aevalR_division.aexp) : imported_Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp :=
  match e with
  | Original.LF_DOT_Imp.LF.Imp.aevalR_division.ANum n => 
      Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp_ANum (nat_to_imported n)
  | Original.LF_DOT_Imp.LF.Imp.aevalR_division.APlus a1 a2 => 
      Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp_APlus (aexp_to_imported a1) (aexp_to_imported a2)
  | Original.LF_DOT_Imp.LF.Imp.aevalR_division.AMinus a1 a2 => 
      Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp_AMinus (aexp_to_imported a1) (aexp_to_imported a2)
  | Original.LF_DOT_Imp.LF.Imp.aevalR_division.AMult a1 a2 => 
      Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp_AMult (aexp_to_imported a1) (aexp_to_imported a2)
  | Original.LF_DOT_Imp.LF.Imp.aevalR_division.ADiv a1 a2 => 
      Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp_ADiv (aexp_to_imported a1) (aexp_to_imported a2)
  end.

Fixpoint aexp_from_imported (e : imported_Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp) : Original.LF_DOT_Imp.LF.Imp.aevalR_division.aexp :=
  match e with
  | Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp_ANum n => 
      Original.LF_DOT_Imp.LF.Imp.aevalR_division.ANum (nat_from_imported n)
  | Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp_APlus a1 a2 => 
      Original.LF_DOT_Imp.LF.Imp.aevalR_division.APlus (aexp_from_imported a1) (aexp_from_imported a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp_AMinus a1 a2 => 
      Original.LF_DOT_Imp.LF.Imp.aevalR_division.AMinus (aexp_from_imported a1) (aexp_from_imported a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp_AMult a1 a2 => 
      Original.LF_DOT_Imp.LF.Imp.aevalR_division.AMult (aexp_from_imported a1) (aexp_from_imported a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp_ADiv a1 a2 => 
      Original.LF_DOT_Imp.LF.Imp.aevalR_division.ADiv (aexp_from_imported a1) (aexp_from_imported a2)
  end.

Lemma aexp_to_from : forall x : imported_Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp, 
    IsomorphismDefinitions.eq (aexp_to_imported (aexp_from_imported x)) x.
Proof.
  fix IH 1.
  intros x. destruct x.
  - simpl. apply IsoEq.f_equal. apply nat_to_from.
  - simpl. apply IsoEq.f_equal2; apply IH.
  - simpl. apply IsoEq.f_equal2; apply IH.
  - simpl. apply IsoEq.f_equal2; apply IH.
  - simpl. apply IsoEq.f_equal2; apply IH.
Qed.

Lemma aexp_from_to : forall x : Original.LF_DOT_Imp.LF.Imp.aevalR_division.aexp, 
    IsomorphismDefinitions.eq (aexp_from_imported (aexp_to_imported x)) x.
Proof.
  fix IH 1.
  intros x. destruct x.
  - simpl. apply IsoEq.f_equal. apply nat_from_to.
  - simpl. apply IsoEq.f_equal2; apply IH.
  - simpl. apply IsoEq.f_equal2; apply IH.
  - simpl. apply IsoEq.f_equal2; apply IH.
  - simpl. apply IsoEq.f_equal2; apply IH.
Qed.

Instance Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp_iso : Iso Original.LF_DOT_Imp.LF.Imp.aevalR_division.aexp imported_Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp :=
  Build_Iso aexp_to_imported aexp_from_imported aexp_to_from aexp_from_to.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.aevalR_division.aexp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.aevalR_division.aexp Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.aevalR_division.aexp Imported.Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp Original_LF__DOT__Imp_LF_Imp_aevalR__division_aexp_iso := {}.