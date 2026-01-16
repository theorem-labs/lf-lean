From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__com__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_plus2 : imported_Original_LF__DOT__Imp_LF_Imp_com := Imported.Original_LF__DOT__Imp_LF_Imp_plus2.
Instance Original_LF__DOT__Imp_LF_Imp_plus2_iso : rel_iso Original_LF__DOT__Imp_LF_Imp_com_iso Original.LF_DOT_Imp.LF.Imp.plus2 imported_Original_LF__DOT__Imp_LF_Imp_plus2.
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.plus2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_plus2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.plus2 Original_LF__DOT__Imp_LF_Imp_plus2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.plus2 Imported.Original_LF__DOT__Imp_LF_Imp_plus2 Original_LF__DOT__Imp_LF_Imp_plus2_iso := {}.