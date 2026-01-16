From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* disabled *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_breakU_imp__com__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__bexp__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_CWhile : imported_Original_LF__DOT__Imp_LF_Imp_bexp -> imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com -> imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com := Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_CWhile.

Instance Original_LF__DOT__Imp_LF_Imp_BreakImp_CWhile_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.bexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_bexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_bexp_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Imp.LF.Imp.BreakImp.com) (x4 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com),
  rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso x3 x4 ->
  rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso (Original.LF_DOT_Imp.LF.Imp.BreakImp.CWhile x1 x3) (imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_CWhile x2 x4).
Proof.
  intros x1 x2 Hx12 x3 x4 Hx34.
  constructor. simpl.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_CWhile.
  destruct Hx12 as [Hx12]. destruct Hx34 as [Hx34]. simpl in *.
  apply (f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_com_CWhile Hx12 Hx34).
Defined.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.BreakImp.CWhile := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_CWhile := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.BreakImp.CWhile Original_LF__DOT__Imp_LF_Imp_BreakImp_CWhile_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.BreakImp.CWhile Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_CWhile Original_LF__DOT__Imp_LF_Imp_BreakImp_CWhile_iso := {}.
