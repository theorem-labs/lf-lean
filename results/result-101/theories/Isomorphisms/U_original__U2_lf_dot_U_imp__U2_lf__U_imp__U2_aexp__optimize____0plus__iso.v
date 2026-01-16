From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__aexp__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus : imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp -> imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus.
Instance Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.AExp.aexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_AExp_aexp_iso x1 x2 ->
  rel_iso Original_LF__DOT__Imp_LF_Imp_AExp_aexp_iso (Original.LF_DOT_Imp.LF.Imp.AExp.optimize_0plus x1) (imported_Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.optimize_0plus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.optimize_0plus Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.optimize_0plus Imported.Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus_iso := {}.