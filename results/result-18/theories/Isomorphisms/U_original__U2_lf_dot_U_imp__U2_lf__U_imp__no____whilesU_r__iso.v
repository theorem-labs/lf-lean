From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__com__iso.

Monomorphic Definition imported_Original_LF__DOT__Imp_LF_Imp_no__whilesR : imported_Original_LF__DOT__Imp_LF_Imp_com -> SProp := Imported.Original_LF__DOT__Imp_LF_Imp_no__whilesR.
Monomorphic Instance Original_LF__DOT__Imp_LF_Imp_no__whilesR_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.com) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_com),
  rel_iso Original_LF__DOT__Imp_LF_Imp_com_iso x1 x2 -> Iso (Original.LF_DOT_Imp.LF.Imp.no_whilesR x1) (imported_Original_LF__DOT__Imp_LF_Imp_no__whilesR x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.no_whilesR := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_no__whilesR := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.no_whilesR Original_LF__DOT__Imp_LF_Imp_no__whilesR_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.no_whilesR Imported.Original_LF__DOT__Imp_LF_Imp_no__whilesR Original_LF__DOT__Imp_LF_Imp_no__whilesR_iso := {}.