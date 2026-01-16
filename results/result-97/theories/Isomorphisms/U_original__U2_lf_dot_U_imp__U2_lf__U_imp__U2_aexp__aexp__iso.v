From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp : Type := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aexp.
Instance Original_LF__DOT__Imp_LF_Imp_AExp_aexp_iso : Iso Original.LF_DOT_Imp.LF.Imp.AExp.aexp imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp.
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.aexp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aexp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.aexp Original_LF__DOT__Imp_LF_Imp_AExp_aexp_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.aexp Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aexp Original_LF__DOT__Imp_LF_Imp_AExp_aexp_iso := {}.