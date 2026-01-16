From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__U_f__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__U_grade__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__U_lt__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__U_minus__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__grade____comparison__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__lower____grade__iso.

Monomorphic Definition imported_Original_LF__DOT__Basics_LF_Basics_lower__grade__lowers : forall x : imported_Original_LF__DOT__Basics_LF_Basics_grade,
  imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Basics_LF_Basics_grade__comparison
       (imported_Original_LF__DOT__Basics_LF_Basics_Grade imported_Original_LF__DOT__Basics_LF_Basics_F imported_Original_LF__DOT__Basics_LF_Basics_Minus) x)
    imported_Original_LF__DOT__Basics_LF_Basics_Lt ->
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_grade__comparison (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade x) x)
    imported_Original_LF__DOT__Basics_LF_Basics_Lt := Imported.Original_LF__DOT__Basics_LF_Basics_lower__grade__lowers.
Monomorphic Instance Original_LF__DOT__Basics_LF_Basics_lower__grade__lowers_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.grade) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_grade) (hx : rel_iso Original_LF__DOT__Basics_LF_Basics_grade_iso x1 x2)
    (x3 : Original.LF_DOT_Basics.LF.Basics.grade_comparison (Original.LF_DOT_Basics.LF.Basics.Grade Original.LF_DOT_Basics.LF.Basics.F Original.LF_DOT_Basics.LF.Basics.Minus) x1 =
          Original.LF_DOT_Basics.LF.Basics.Lt)
    (x4 : imported_Corelib_Init_Logic_eq
            (imported_Original_LF__DOT__Basics_LF_Basics_grade__comparison
               (imported_Original_LF__DOT__Basics_LF_Basics_Grade imported_Original_LF__DOT__Basics_LF_Basics_F imported_Original_LF__DOT__Basics_LF_Basics_Minus) x2)
            imported_Original_LF__DOT__Basics_LF_Basics_Lt),
  rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Basics_LF_Basics_grade__comparison_iso (Original_LF__DOT__Basics_LF_Basics_Grade_iso Original_LF__DOT__Basics_LF_Basics_F_iso Original_LF__DOT__Basics_LF_Basics_Minus_iso)
          hx)
       Original_LF__DOT__Basics_LF_Basics_Lt_iso)
    x3 x4 ->
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_grade__comparison_iso (Original_LF__DOT__Basics_LF_Basics_lower__grade_iso hx) hx) Original_LF__DOT__Basics_LF_Basics_Lt_iso)
    (Original.LF_DOT_Basics.LF.Basics.lower_grade_lowers x1 x3) (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade__lowers x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.lower_grade_lowers := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_lower__grade__lowers := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.lower_grade_lowers Original_LF__DOT__Basics_LF_Basics_lower__grade__lowers_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.lower_grade_lowers Imported.Original_LF__DOT__Basics_LF_Basics_lower__grade__lowers Original_LF__DOT__Basics_LF_Basics_lower__grade__lowers_iso := {}.