From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__aeval__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__aevalU_r__iso Isomorphisms.iff__iso.

Monomorphic Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__iff__aeval' : forall (x : imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp) (x0 : imported_nat),
  imported_iff (imported_Original_LF__DOT__Imp_LF_Imp_AExp_aevalR x x0) (imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Imp_LF_Imp_AExp_aeval x) x0) := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__iff__aeval'.
Monomorphic Instance Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__iff__aeval'_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.AExp.aexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp) (hx : rel_iso Original_LF__DOT__Imp_LF_Imp_AExp_aexp_iso x1 x2) 
    (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4),
  rel_iso (relax_Iso_Ts_Ps (iff_iso (Original_LF__DOT__Imp_LF_Imp_AExp_aevalR_iso hx hx0) (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Imp_LF_Imp_AExp_aeval_iso hx) hx0)))
    (Original.LF_DOT_Imp.LF.Imp.AExp.aevalR_iff_aeval' x1 x3) (imported_Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__iff__aeval' x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.aevalR_iff_aeval' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__iff__aeval' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.aevalR_iff_aeval' Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__iff__aeval'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.aevalR_iff_aeval' Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__iff__aeval' Original_LF__DOT__Imp_LF_Imp_AExp_aevalR__iff__aeval'_iso := {}.