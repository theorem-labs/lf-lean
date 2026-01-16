From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__com__iso Isomorphisms.bool__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_no__whiles : imported_Original_LF__DOT__Imp_LF_Imp_com -> imported_bool := Imported.Original_LF__DOT__Imp_LF_Imp_no__whiles.
Instance Original_LF__DOT__Imp_LF_Imp_no__whiles_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.com) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_com),
  rel_iso Original_LF__DOT__Imp_LF_Imp_com_iso x1 x2 -> rel_iso bool_iso (Original.LF_DOT_Imp.LF.Imp.no_whiles x1) (imported_Original_LF__DOT__Imp_LF_Imp_no__whiles x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.no_whiles := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_no__whiles := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.no_whiles Original_LF__DOT__Imp_LF_Imp_no__whiles_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.no_whiles Imported.Original_LF__DOT__Imp_LF_Imp_no__whiles Original_LF__DOT__Imp_LF_Imp_no__whiles_iso := {}.