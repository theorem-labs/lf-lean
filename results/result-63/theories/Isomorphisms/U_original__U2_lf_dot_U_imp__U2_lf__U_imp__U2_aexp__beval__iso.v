From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__bexp__iso Isomorphisms.bool__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_beval : imported_Original_LF__DOT__Imp_LF_Imp_AExp_bexp -> imported_bool := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_beval.
Instance Original_LF__DOT__Imp_LF_Imp_AExp_beval_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.AExp.bexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_AExp_bexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_AExp_bexp_iso x1 x2 -> rel_iso bool_iso (Original.LF_DOT_Imp.LF.Imp.AExp.beval x1) (imported_Original_LF__DOT__Imp_LF_Imp_AExp_beval x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.beval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_beval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.beval Original_LF__DOT__Imp_LF_Imp_AExp_beval_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.beval Imported.Original_LF__DOT__Imp_LF_Imp_AExp_beval Original_LF__DOT__Imp_LF_Imp_AExp_beval_iso := {}.