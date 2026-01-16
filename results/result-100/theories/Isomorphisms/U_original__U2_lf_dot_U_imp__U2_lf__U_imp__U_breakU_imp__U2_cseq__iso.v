From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_breakU_imp__com__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_CSeq : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com -> imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com -> imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com := Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_CSeq.
Instance Original_LF__DOT__Imp_LF_Imp_BreakImp_CSeq_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.BreakImp.com) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com),
  rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Imp.LF.Imp.BreakImp.com) (x4 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com),
  rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso x3 x4 ->
  rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso (Original.LF_DOT_Imp.LF.Imp.BreakImp.CSeq x1 x3) (imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_CSeq x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.BreakImp.CSeq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_CSeq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.BreakImp.CSeq Original_LF__DOT__Imp_LF_Imp_BreakImp_CSeq_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.BreakImp.CSeq Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_CSeq Original_LF__DOT__Imp_LF_Imp_BreakImp_CSeq_iso := {}.