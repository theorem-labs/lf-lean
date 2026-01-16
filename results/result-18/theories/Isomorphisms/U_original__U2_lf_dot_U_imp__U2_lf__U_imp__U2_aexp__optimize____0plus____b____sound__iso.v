From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__beval__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__optimize____0plus____b__iso.

Monomorphic Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus__b__sound : forall x : imported_Original_LF__DOT__Imp_LF_Imp_AExp_bexp,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Imp_LF_Imp_AExp_beval (imported_Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus__b x))
    (imported_Original_LF__DOT__Imp_LF_Imp_AExp_beval x) := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus__b__sound.
Monomorphic Instance Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus__b__sound_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.AExp.bexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_AExp_bexp) (hx : rel_iso Original_LF__DOT__Imp_LF_Imp_AExp_bexp_iso x1 x2),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Imp_LF_Imp_AExp_beval_iso (Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus__b_iso hx)) (Original_LF__DOT__Imp_LF_Imp_AExp_beval_iso hx))
    (Original.LF_DOT_Imp.LF.Imp.AExp.optimize_0plus_b_sound x1) (imported_Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus__b__sound x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.optimize_0plus_b_sound := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus__b__sound := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.optimize_0plus_b_sound Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus__b__sound_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.optimize_0plus_b_sound Imported.Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus__b__sound Original_LF__DOT__Imp_LF_Imp_AExp_optimize__0plus__b__sound_iso := {}.