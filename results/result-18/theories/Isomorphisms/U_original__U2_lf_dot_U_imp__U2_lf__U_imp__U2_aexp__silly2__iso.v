From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__aeval__iso.

Monomorphic Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_silly2 : forall x : imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp, imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Imp_LF_Imp_AExp_aeval x) (imported_Original_LF__DOT__Imp_LF_Imp_AExp_aeval x) := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_silly2.
Monomorphic Instance Original_LF__DOT__Imp_LF_Imp_AExp_silly2_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.AExp.aexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp) (hx : rel_iso Original_LF__DOT__Imp_LF_Imp_AExp_aexp_iso x1 x2),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Imp_LF_Imp_AExp_aeval_iso hx) (Original_LF__DOT__Imp_LF_Imp_AExp_aeval_iso hx)) (Original.LF_DOT_Imp.LF.Imp.AExp.silly2 x1)
    (imported_Original_LF__DOT__Imp_LF_Imp_AExp_silly2 x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.silly2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_silly2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.silly2 Original_LF__DOT__Imp_LF_Imp_AExp_silly2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.silly2 Imported.Original_LF__DOT__Imp_LF_Imp_AExp_silly2 Original_LF__DOT__Imp_LF_Imp_AExp_silly2_iso := {}.