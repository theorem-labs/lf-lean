From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
 (* for speed *)

From IsomorphismChecker Require Export Isomorphisms.U_string__string__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aexp__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__bexp__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_com : Type := Imported.Original_LF__DOT__Imp_LF_Imp_com.
Instance Original_LF__DOT__Imp_LF_Imp_com_iso : Iso Original.LF_DOT_Imp.LF.Imp.com imported_Original_LF__DOT__Imp_LF_Imp_com.
Proof.
  exists (fix to_imp (c : Original.LF_DOT_Imp.LF.Imp.com) : imported_Original_LF__DOT__Imp_LF_Imp_com :=
            match c with
            | Original.LF_DOT_Imp.LF.Imp.CSkip => Imported.Original_LF__DOT__Imp_LF_Imp_com_CSkip
            | Original.LF_DOT_Imp.LF.Imp.CAsgn x a => Imported.Original_LF__DOT__Imp_LF_Imp_com_CAsgn (to String_string_iso x) (to Original_LF__DOT__Imp_LF_Imp_aexp_iso a)
            | Original.LF_DOT_Imp.LF.Imp.CSeq c1 c2 => Imported.Original_LF__DOT__Imp_LF_Imp_com_CSeq (to_imp c1) (to_imp c2)
            | Original.LF_DOT_Imp.LF.Imp.CIf b c1 c2 => Imported.Original_LF__DOT__Imp_LF_Imp_com_CIf (to Original_LF__DOT__Imp_LF_Imp_bexp_iso b) (to_imp c1) (to_imp c2)
            | Original.LF_DOT_Imp.LF.Imp.CWhile b c => Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile (to Original_LF__DOT__Imp_LF_Imp_bexp_iso b) (to_imp c)
            end)
         (fix from_imp (c : imported_Original_LF__DOT__Imp_LF_Imp_com) : Original.LF_DOT_Imp.LF.Imp.com :=
            match c with
            | Imported.Original_LF__DOT__Imp_LF_Imp_com_CSkip => Original.LF_DOT_Imp.LF.Imp.CSkip
            | Imported.Original_LF__DOT__Imp_LF_Imp_com_CAsgn x a => Original.LF_DOT_Imp.LF.Imp.CAsgn (from String_string_iso x) (from Original_LF__DOT__Imp_LF_Imp_aexp_iso a)
            | Imported.Original_LF__DOT__Imp_LF_Imp_com_CSeq c1 c2 => Original.LF_DOT_Imp.LF.Imp.CSeq (from_imp c1) (from_imp c2)
            | Imported.Original_LF__DOT__Imp_LF_Imp_com_CIf b c1 c2 => Original.LF_DOT_Imp.LF.Imp.CIf (from Original_LF__DOT__Imp_LF_Imp_bexp_iso b) (from_imp c1) (from_imp c2)
            | Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile b c => Original.LF_DOT_Imp.LF.Imp.CWhile (from Original_LF__DOT__Imp_LF_Imp_bexp_iso b) (from_imp c)
            end).
  - fix IH 1. intros c.
    destruct c as [| x a | c1 c2 | b c1 c2 | b c].
    + apply IsomorphismDefinitions.eq_refl.
    + simpl. apply (f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_com_CAsgn).
      * apply (to_from String_string_iso).
      * apply (to_from Original_LF__DOT__Imp_LF_Imp_aexp_iso).
    + simpl. apply (f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_com_CSeq).
      * apply IH.
      * apply IH.
    + simpl. apply (f_equal3 Imported.Original_LF__DOT__Imp_LF_Imp_com_CIf).
      * apply (to_from Original_LF__DOT__Imp_LF_Imp_bexp_iso).
      * apply IH.
      * apply IH.
    + simpl. apply (f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile).
      * apply (to_from Original_LF__DOT__Imp_LF_Imp_bexp_iso).
      * apply IH.
  - fix IH 1. intros c.
    destruct c as [| x a | c1 c2 | b c1 c2 | b c].
    + apply IsomorphismDefinitions.eq_refl.
    + simpl. apply (f_equal2 Original.LF_DOT_Imp.LF.Imp.CAsgn).
      * apply (from_to String_string_iso).
      * apply (from_to Original_LF__DOT__Imp_LF_Imp_aexp_iso).
    + simpl. apply (f_equal2 Original.LF_DOT_Imp.LF.Imp.CSeq).
      * apply IH.
      * apply IH.
    + simpl. apply (f_equal3 Original.LF_DOT_Imp.LF.Imp.CIf).
      * apply (from_to Original_LF__DOT__Imp_LF_Imp_bexp_iso).
      * apply IH.
      * apply IH.
    + simpl. apply (f_equal2 Original.LF_DOT_Imp.LF.Imp.CWhile).
      * apply (from_to Original_LF__DOT__Imp_LF_Imp_bexp_iso).
      * apply IH.
Defined.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.com := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_com := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.com Original_LF__DOT__Imp_LF_Imp_com_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.com Imported.Original_LF__DOT__Imp_LF_Imp_com Original_LF__DOT__Imp_LF_Imp_com_iso := {}.