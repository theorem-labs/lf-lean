From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. *)

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__com__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__bexp__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_CWhile : imported_Original_LF__DOT__Imp_LF_Imp_bexp -> imported_Original_LF__DOT__Imp_LF_Imp_com -> imported_Original_LF__DOT__Imp_LF_Imp_com :=
  Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile.

Instance Original_LF__DOT__Imp_LF_Imp_CWhile_iso : forall (b : Original.LF_DOT_Imp.LF.Imp.bexp) (b' : imported_Original_LF__DOT__Imp_LF_Imp_bexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_bexp_iso b b' ->
  forall (c : Original.LF_DOT_Imp.LF.Imp.com) (c' : imported_Original_LF__DOT__Imp_LF_Imp_com),
  rel_iso Original_LF__DOT__Imp_LF_Imp_com_iso c c' ->
  rel_iso Original_LF__DOT__Imp_LF_Imp_com_iso (Original.LF_DOT_Imp.LF.Imp.CWhile b c) (imported_Original_LF__DOT__Imp_LF_Imp_CWhile b' c').
Proof.
  intros b b' Hb c c' Hc.
  constructor; simpl in *; simpl in *.
  apply (f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile Hb Hc).
Defined.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.CWhile := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.CWhile Original_LF__DOT__Imp_LF_Imp_CWhile_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.CWhile Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile Original_LF__DOT__Imp_LF_Imp_CWhile_iso := {}.
