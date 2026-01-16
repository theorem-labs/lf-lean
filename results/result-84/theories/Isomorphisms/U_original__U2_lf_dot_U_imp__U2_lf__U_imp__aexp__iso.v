From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
 (* for speed *)

From IsomorphismChecker Require Export Isomorphisms.U_string__string__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_aexp : Type := Imported.Original_LF__DOT__Imp_LF_Imp_aexp.

(* Convert from Original aexp to Imported aexp *)
Fixpoint aexp_to_imported (a : Original.LF_DOT_Imp.LF.Imp.aexp) : imported_Original_LF__DOT__Imp_LF_Imp_aexp :=
  match a with
  | Original.LF_DOT_Imp.LF.Imp.ANum n => Imported.Original_LF__DOT__Imp_LF_Imp_aexp_ANum (to nat_iso n)
  | Original.LF_DOT_Imp.LF.Imp.AId x => Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AId (to String_string_iso x)
  | Original.LF_DOT_Imp.LF.Imp.APlus a1 a2 => Imported.Original_LF__DOT__Imp_LF_Imp_aexp_APlus (aexp_to_imported a1) (aexp_to_imported a2)
  | Original.LF_DOT_Imp.LF.Imp.AMinus a1 a2 => Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AMinus (aexp_to_imported a1) (aexp_to_imported a2)
  | Original.LF_DOT_Imp.LF.Imp.AMult a1 a2 => Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AMult (aexp_to_imported a1) (aexp_to_imported a2)
  end.

(* Convert from Imported aexp to Original aexp *)
Fixpoint imported_to_aexp (a : imported_Original_LF__DOT__Imp_LF_Imp_aexp) : Original.LF_DOT_Imp.LF.Imp.aexp :=
  match a with
  | Imported.Original_LF__DOT__Imp_LF_Imp_aexp_ANum n => Original.LF_DOT_Imp.LF.Imp.ANum (from nat_iso n)
  | Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AId x => Original.LF_DOT_Imp.LF.Imp.AId (from String_string_iso x)
  | Imported.Original_LF__DOT__Imp_LF_Imp_aexp_APlus a1 a2 => Original.LF_DOT_Imp.LF.Imp.APlus (imported_to_aexp a1) (imported_to_aexp a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AMinus a1 a2 => Original.LF_DOT_Imp.LF.Imp.AMinus (imported_to_aexp a1) (imported_to_aexp a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AMult a1 a2 => Original.LF_DOT_Imp.LF.Imp.AMult (imported_to_aexp a1) (imported_to_aexp a2)
  end.

Lemma aexp_to_from : forall x : imported_Original_LF__DOT__Imp_LF_Imp_aexp,
  IsomorphismDefinitions.eq (aexp_to_imported (imported_to_aexp x)) x.
Proof.
  fix IH 1.
  intros x. destruct x as [n0 | s0 | a1 a2 | a1 a2 | a1 a2]; simpl.
  - apply (f_equal Imported.Original_LF__DOT__Imp_LF_Imp_aexp_ANum (to_from nat_iso n0)).
  - apply (f_equal Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AId (to_from String_string_iso s0)).
  - apply (f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_aexp_APlus (IH a1) (IH a2)).
  - apply (f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AMinus (IH a1) (IH a2)).
  - apply (f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AMult (IH a1) (IH a2)).
Qed.

Lemma aexp_from_to : forall x : Original.LF_DOT_Imp.LF.Imp.aexp,
  IsomorphismDefinitions.eq (imported_to_aexp (aexp_to_imported x)) x.
Proof.
  fix IH 1. intros x. destruct x; simpl.
  - apply (f_equal Original.LF_DOT_Imp.LF.Imp.ANum (from_to nat_iso n)).
  - apply (f_equal Original.LF_DOT_Imp.LF.Imp.AId (from_to String_string_iso x)).
  - apply (f_equal2 Original.LF_DOT_Imp.LF.Imp.APlus (IH x1) (IH x2)).
  - apply (f_equal2 Original.LF_DOT_Imp.LF.Imp.AMinus (IH x1) (IH x2)).
  - apply (f_equal2 Original.LF_DOT_Imp.LF.Imp.AMult (IH x1) (IH x2)).
Qed.

Instance Original_LF__DOT__Imp_LF_Imp_aexp_iso : Iso Original.LF_DOT_Imp.LF.Imp.aexp imported_Original_LF__DOT__Imp_LF_Imp_aexp := {|
  to := aexp_to_imported;
  from := imported_to_aexp;
  to_from := aexp_to_from;
  from_to := aexp_from_to
|}.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.aexp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_aexp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.aexp Original_LF__DOT__Imp_LF_Imp_aexp_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.aexp Imported.Original_LF__DOT__Imp_LF_Imp_aexp Original_LF__DOT__Imp_LF_Imp_aexp_iso := {}.