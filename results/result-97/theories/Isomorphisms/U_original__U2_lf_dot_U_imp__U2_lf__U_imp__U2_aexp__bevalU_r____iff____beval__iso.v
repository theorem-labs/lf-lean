From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__beval__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aexp__bevalU_r__iso Isomorphisms.iff__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_bevalR__iff__beval : forall (x : imported_Original_LF__DOT__Imp_LF_Imp_AExp_bexp) (x0 : imported_bool),
  imported_iff (imported_Original_LF__DOT__Imp_LF_Imp_AExp_bevalR x x0) (imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Imp_LF_Imp_AExp_beval x) x0) := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bevalR__iff__beval.
Instance Original_LF__DOT__Imp_LF_Imp_AExp_bevalR__iff__beval_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.AExp.bexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_AExp_bexp) (hx : rel_iso Original_LF__DOT__Imp_LF_Imp_AExp_bexp_iso x1 x2) 
    (x3 : bool) (x4 : imported_bool) (hx0 : rel_iso bool_iso x3 x4),
  rel_iso (relax_Iso_Ts_Ps (iff_iso (Original_LF__DOT__Imp_LF_Imp_AExp_bevalR_iso hx hx0) (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Imp_LF_Imp_AExp_beval_iso hx) hx0)))
    (Original.LF_DOT_Imp.LF.Imp.AExp.bevalR_iff_beval x1 x3) (imported_Original_LF__DOT__Imp_LF_Imp_AExp_bevalR__iff__beval x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.bevalR_iff_beval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bevalR__iff__beval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.bevalR_iff_beval Original_LF__DOT__Imp_LF_Imp_AExp_bevalR__iff__beval_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.bevalR_iff_beval Imported.Original_LF__DOT__Imp_LF_Imp_AExp_bevalR__iff__beval Original_LF__DOT__Imp_LF_Imp_AExp_bevalR__iff__beval_iso := {}.