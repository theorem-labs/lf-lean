From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__bexp__iso.

Monomorphic Definition imported_Original_LF__DOT__Imp_LF_Imp_BTrue : imported_Original_LF__DOT__Imp_LF_Imp_bexp := Imported.Original_LF__DOT__Imp_LF_Imp_BTrue.
Monomorphic Instance Original_LF__DOT__Imp_LF_Imp_BTrue_iso : rel_iso Original_LF__DOT__Imp_LF_Imp_bexp_iso Original.LF_DOT_Imp.LF.Imp.BTrue imported_Original_LF__DOT__Imp_LF_Imp_BTrue.
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.BTrue := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_BTrue := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.BTrue Original_LF__DOT__Imp_LF_Imp_BTrue_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.BTrue Imported.Original_LF__DOT__Imp_LF_Imp_BTrue Original_LF__DOT__Imp_LF_Imp_BTrue_iso := {}.