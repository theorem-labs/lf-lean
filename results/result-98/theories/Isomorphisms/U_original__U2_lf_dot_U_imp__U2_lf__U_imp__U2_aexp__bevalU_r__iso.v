From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__bexp__iso Isomorphisms.bool__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_bevalR : imported_Original_LF__DOT__Imp_LF_Imp_AExp_bexp -> imported_bool -> SProp := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bevalR.
Instance Original_LF__DOT__Imp_LF_Imp_AExp_bevalR_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.AExp.bexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_AExp_bexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_AExp_bexp_iso x1 x2 ->
  forall (x3 : bool) (x4 : imported_bool), rel_iso bool_iso x3 x4 -> Iso (Original.LF_DOT_Imp.LF.Imp.AExp.bevalR x1 x3) (imported_Original_LF__DOT__Imp_LF_Imp_AExp_bevalR x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.bevalR := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bevalR := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.bevalR Original_LF__DOT__Imp_LF_Imp_AExp_bevalR_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.bevalR Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bevalR Original_LF__DOT__Imp_LF_Imp_AExp_bevalR_iso := {}.