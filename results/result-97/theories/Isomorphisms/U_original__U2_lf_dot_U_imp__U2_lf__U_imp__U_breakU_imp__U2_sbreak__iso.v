From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_breakU_imp__result__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_SBreak : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_result := Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_SBreak.
Instance Original_LF__DOT__Imp_LF_Imp_BreakImp_SBreak_iso : rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_result_iso Original.LF_DOT_Imp.LF.Imp.BreakImp.SBreak imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_SBreak.
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.BreakImp.SBreak := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_SBreak := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.BreakImp.SBreak Original_LF__DOT__Imp_LF_Imp_BreakImp_SBreak_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.BreakImp.SBreak Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_SBreak Original_LF__DOT__Imp_LF_Imp_BreakImp_SBreak_iso := {}.