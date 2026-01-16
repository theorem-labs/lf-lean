From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__com__iso.

Monomorphic Definition imported_Original_LF__DOT__Imp_LF_Imp_subtract__3__from__5__slowly : imported_Original_LF__DOT__Imp_LF_Imp_com := Imported.Original_LF__DOT__Imp_LF_Imp_subtract__3__from__5__slowly.
Monomorphic Instance Original_LF__DOT__Imp_LF_Imp_subtract__3__from__5__slowly_iso : rel_iso Original_LF__DOT__Imp_LF_Imp_com_iso Original.LF_DOT_Imp.LF.Imp.subtract_3_from_5_slowly imported_Original_LF__DOT__Imp_LF_Imp_subtract__3__from__5__slowly.
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.subtract_3_from_5_slowly := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_subtract__3__from__5__slowly := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.subtract_3_from_5_slowly Original_LF__DOT__Imp_LF_Imp_subtract__3__from__5__slowly_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.subtract_3_from_5_slowly Imported.Original_LF__DOT__Imp_LF_Imp_subtract__3__from__5__slowly Original_LF__DOT__Imp_LF_Imp_subtract__3__from__5__slowly_iso := {}.