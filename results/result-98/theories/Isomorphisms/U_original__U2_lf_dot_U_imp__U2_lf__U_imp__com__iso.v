From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. *)
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__bexp__iso.
From IsomorphismChecker Require Export Isomorphisms.U_string__string__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_com : Type := Imported.Original_LF__DOT__Imp_LF_Imp_com.

Fixpoint com_to_imported (c : Original.LF_DOT_Imp.LF.Imp.com) : imported_Original_LF__DOT__Imp_LF_Imp_com :=
  match c with
  | Original.LF_DOT_Imp.LF.Imp.CSkip => Imported.Original_LF__DOT__Imp_LF_Imp_com_CSkip
  | Original.LF_DOT_Imp.LF.Imp.CAsgn x a => Imported.Original_LF__DOT__Imp_LF_Imp_com_CAsgn (to String_string_iso x) (aexp_to_imported a)
  | Original.LF_DOT_Imp.LF.Imp.CSeq c1 c2 => Imported.Original_LF__DOT__Imp_LF_Imp_com_CSeq (com_to_imported c1) (com_to_imported c2)
  | Original.LF_DOT_Imp.LF.Imp.CIf b c1 c2 => Imported.Original_LF__DOT__Imp_LF_Imp_com_CIf (bexp_to_imported b) (com_to_imported c1) (com_to_imported c2)
  | Original.LF_DOT_Imp.LF.Imp.CWhile b c1 => Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile (bexp_to_imported b) (com_to_imported c1)
  end.

Fixpoint imported_to_com (c : imported_Original_LF__DOT__Imp_LF_Imp_com) : Original.LF_DOT_Imp.LF.Imp.com :=
  match c with
  | Imported.Original_LF__DOT__Imp_LF_Imp_com_CSkip => Original.LF_DOT_Imp.LF.Imp.CSkip
  | Imported.Original_LF__DOT__Imp_LF_Imp_com_CAsgn x a => Original.LF_DOT_Imp.LF.Imp.CAsgn (from String_string_iso x) (imported_to_aexp a)
  | Imported.Original_LF__DOT__Imp_LF_Imp_com_CSeq c1 c2 => Original.LF_DOT_Imp.LF.Imp.CSeq (imported_to_com c1) (imported_to_com c2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_com_CIf b c1 c2 => Original.LF_DOT_Imp.LF.Imp.CIf (imported_to_bexp b) (imported_to_com c1) (imported_to_com c2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile b c1 => Original.LF_DOT_Imp.LF.Imp.CWhile (imported_to_bexp b) (imported_to_com c1)
  end.

Lemma com_to_from : forall c : imported_Original_LF__DOT__Imp_LF_Imp_com,
  IsomorphismDefinitions.eq (com_to_imported (imported_to_com c)) c.
Proof.
  fix IH 1.
  intros c. destruct c as [| x a | c1 c2 | b c1 c2 | b c1]; simpl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply (f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_com_CAsgn (to_from String_string_iso x) (aexp_to_from a)).
  - apply (f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_com_CSeq (IH c1) (IH c2)).
  - apply (f_equal3 Imported.Original_LF__DOT__Imp_LF_Imp_com_CIf (bexp_to_from b) (IH c1) (IH c2)).
  - apply (f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile (bexp_to_from b) (IH c1)).
Defined.

Lemma com_from_to : forall c : Original.LF_DOT_Imp.LF.Imp.com,
  IsomorphismDefinitions.eq (imported_to_com (com_to_imported c)) c.
Proof.
  fix IH 1.
  intros c. destruct c as [| x a | c1 c2 | b c1 c2 | b c1]; simpl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply (f_equal2 Original.LF_DOT_Imp.LF.Imp.CAsgn (from_to String_string_iso x) (aexp_from_to a)).
  - apply (f_equal2 Original.LF_DOT_Imp.LF.Imp.CSeq (IH c1) (IH c2)).
  - apply (f_equal3 Original.LF_DOT_Imp.LF.Imp.CIf (bexp_from_to b) (IH c1) (IH c2)).
  - apply (f_equal2 Original.LF_DOT_Imp.LF.Imp.CWhile (bexp_from_to b) (IH c1)).
Defined.

Instance Original_LF__DOT__Imp_LF_Imp_com_iso : Iso Original.LF_DOT_Imp.LF.Imp.com imported_Original_LF__DOT__Imp_LF_Imp_com := {|
  to := com_to_imported;
  from := imported_to_com;
  to_from := com_to_from;
  from_to := com_from_to
|}.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.com := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_com := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.com Original_LF__DOT__Imp_LF_Imp_com_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.com Imported.Original_LF__DOT__Imp_LF_Imp_com Original_LF__DOT__Imp_LF_Imp_com_iso := {}.