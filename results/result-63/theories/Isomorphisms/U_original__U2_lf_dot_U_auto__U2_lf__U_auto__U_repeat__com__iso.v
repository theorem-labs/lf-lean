From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com : Type := Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com.
Instance Original_LF__DOT__Auto_LF_Auto_Repeat_com_iso : Iso Original.LF_DOT_Auto.LF.Auto.Repeat.com imported_Original_LF__DOT__Auto_LF_Auto_Repeat_com.
Admitted.
Instance: KnownConstant Original.LF_DOT_Auto.LF.Auto.Repeat.com := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Auto.LF.Auto.Repeat.com Original_LF__DOT__Auto_LF_Auto_Repeat_com_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Auto.LF.Auto.Repeat.com Imported.Original_LF__DOT__Auto_LF_Auto_Repeat_com Original_LF__DOT__Auto_LF_Auto_Repeat_com_iso := {}.