From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com : Type := Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_com.
Instance Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso : Iso Original.LF_DOT_Imp.LF.Imp.BreakImp.com imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com.
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.BreakImp.com := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_com := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.BreakImp.com Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.BreakImp.com Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_com Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso := {}.