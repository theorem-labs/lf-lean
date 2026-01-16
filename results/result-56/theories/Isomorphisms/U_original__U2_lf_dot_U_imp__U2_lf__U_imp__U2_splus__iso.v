From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__sinstr__iso.

Monomorphic Definition imported_Original_LF__DOT__Imp_LF_Imp_SPlus : imported_Original_LF__DOT__Imp_LF_Imp_sinstr := Imported.Original_LF__DOT__Imp_LF_Imp_SPlus.
Monomorphic Instance Original_LF__DOT__Imp_LF_Imp_SPlus_iso : rel_iso Original_LF__DOT__Imp_LF_Imp_sinstr_iso Original.LF_DOT_Imp.LF.Imp.SPlus imported_Original_LF__DOT__Imp_LF_Imp_SPlus.
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.SPlus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_SPlus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.SPlus Original_LF__DOT__Imp_LF_Imp_SPlus_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.SPlus Imported.Original_LF__DOT__Imp_LF_Imp_SPlus Original_LF__DOT__Imp_LF_Imp_SPlus_iso := {}.