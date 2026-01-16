From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__bexp__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__com__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_CWhile : imported_Original_LF__DOT__Imp_LF_Imp_bexp -> imported_Original_LF__DOT__Imp_LF_Imp_com -> imported_Original_LF__DOT__Imp_LF_Imp_com := Imported.Original_LF__DOT__Imp_LF_Imp_CWhile.
Instance Original_LF__DOT__Imp_LF_Imp_CWhile_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.bexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_bexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_bexp_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Imp.LF.Imp.com) (x4 : imported_Original_LF__DOT__Imp_LF_Imp_com),
  rel_iso Original_LF__DOT__Imp_LF_Imp_com_iso x3 x4 -> rel_iso Original_LF__DOT__Imp_LF_Imp_com_iso (Original.LF_DOT_Imp.LF.Imp.CWhile x1 x3) (imported_Original_LF__DOT__Imp_LF_Imp_CWhile x2 x4).
Proof. 
  intros b1 b2 Hb c1 c2 Hc.
  constructor. simpl.
  apply (f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_com_CWhile).
  - exact (proj_rel_iso Hb).
  - exact (proj_rel_iso Hc).
Defined.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.CWhile := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_CWhile := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.CWhile Original_LF__DOT__Imp_LF_Imp_CWhile_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.CWhile Imported.Original_LF__DOT__Imp_LF_Imp_CWhile Original_LF__DOT__Imp_LF_Imp_CWhile_iso := {}.