From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_result : Type := Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_result.
Monomorphic Instance Original_LF__DOT__Imp_LF_Imp_BreakImp_result_iso : Iso Original.LF_DOT_Imp.LF.Imp.BreakImp.result imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_result.
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.BreakImp.result := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_result := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.BreakImp.result Original_LF__DOT__Imp_LF_Imp_BreakImp_result_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.BreakImp.result Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_result Original_LF__DOT__Imp_LF_Imp_BreakImp_result_iso := {}.