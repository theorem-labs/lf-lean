From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__bexp__iso.

Monomorphic Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_BAnd : imported_Original_LF__DOT__Imp_LF_Imp_AExp_bexp -> imported_Original_LF__DOT__Imp_LF_Imp_AExp_bexp -> imported_Original_LF__DOT__Imp_LF_Imp_AExp_bexp := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_BAnd.
Monomorphic Instance Original_LF__DOT__Imp_LF_Imp_AExp_BAnd_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.AExp.bexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_AExp_bexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_AExp_bexp_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Imp.LF.Imp.AExp.bexp) (x4 : imported_Original_LF__DOT__Imp_LF_Imp_AExp_bexp),
  rel_iso Original_LF__DOT__Imp_LF_Imp_AExp_bexp_iso x3 x4 ->
  rel_iso Original_LF__DOT__Imp_LF_Imp_AExp_bexp_iso (Original.LF_DOT_Imp.LF.Imp.AExp.BAnd x1 x3) (imported_Original_LF__DOT__Imp_LF_Imp_AExp_BAnd x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.BAnd := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_BAnd := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.BAnd Original_LF__DOT__Imp_LF_Imp_AExp_BAnd_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.BAnd Imported.Original_LF__DOT__Imp_LF_Imp_AExp_BAnd Original_LF__DOT__Imp_LF_Imp_AExp_BAnd_iso := {}.