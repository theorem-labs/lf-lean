From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__Imp_LF_Imp_sinstr : Type := Imported.Original_LF__DOT__Imp_LF_Imp_sinstr.
Monomorphic Instance Original_LF__DOT__Imp_LF_Imp_sinstr_iso : Iso Original.LF_DOT_Imp.LF.Imp.sinstr imported_Original_LF__DOT__Imp_LF_Imp_sinstr.
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.sinstr := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_sinstr := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.sinstr Original_LF__DOT__Imp_LF_Imp_sinstr_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.sinstr Imported.Original_LF__DOT__Imp_LF_Imp_sinstr Original_LF__DOT__Imp_LF_Imp_sinstr_iso := {}.