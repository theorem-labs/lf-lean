From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__aeval__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__optimize____0plus__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus__sound : forall x : imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Imp_LF_Imp_AExp_aeval (imported_Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus x)) (imported_Original_LF__DOT__Imp_LF_Imp_AExp_aeval x) := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus__sound.
Instance Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus__sound_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.AExp.aexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp) (hx : rel_iso Original_LF__DOT__Imp_LF_Imp_AExp_aexp_iso x1 x2),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Imp_LF_Imp_AExp_aeval_iso (Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus_iso hx)) (Original_LF__DOT__Imp_LF_Imp_AExp_aeval_iso hx))
    (Original.LF_DOT_Imp.LF.Imp.AExp.optimize_0plus_sound x1) (imported_Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus__sound x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.optimize_0plus_sound := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus__sound := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.optimize_0plus_sound Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus__sound_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.optimize_0plus_sound Imported.Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus__sound Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus__sound_iso := {}.