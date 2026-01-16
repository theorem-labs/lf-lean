From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_breakU_imp__com__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_CBreak : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com := Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_CBreak.
Instance Original_LF__DOT__Imp_LF_Imp_BreakImp_CBreak_iso : rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso Original.LF_DOT_Imp.LF.Imp.BreakImp.CBreak imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_CBreak.
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.BreakImp.CBreak := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_CBreak := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.BreakImp.CBreak Original_LF__DOT__Imp_LF_Imp_BreakImp_CBreak_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.BreakImp.CBreak Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_CBreak Original_LF__DOT__Imp_LF_Imp_BreakImp_CBreak_iso := {}.