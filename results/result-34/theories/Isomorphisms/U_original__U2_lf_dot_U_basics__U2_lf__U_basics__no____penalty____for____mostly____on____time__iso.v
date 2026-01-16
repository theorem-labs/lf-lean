From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(*Typeclasses Opaque rel_iso.*) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__apply____late____policy__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__ltb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_no__penalty__for__mostly__on__time : forall (x : imported_nat) (x0 : imported_Original_LF__DOT__Basics_LF_Basics_grade),
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_ltb x (imported_S (imported_S (imported_S (iterate1 imported_S 6 imported_0)))))
    imported_Original_LF__DOT__Basics_LF_Basics_true ->
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_apply__late__policy x x0) x0 := Imported.Original_LF__DOT__Basics_LF_Basics_no__penalty__for__mostly__on__time.
Instance Original_LF__DOT__Basics_LF_Basics_no__penalty__for__mostly__on__time_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : Original.LF_DOT_Basics.LF.Basics.grade) (x4 : imported_Original_LF__DOT__Basics_LF_Basics_grade)
    (hx0 : rel_iso Original_LF__DOT__Basics_LF_Basics_grade_iso x3 x4) (x5 : Original.LF_DOT_Basics.LF.Basics.ltb x1 9 = Original.LF_DOT_Basics.LF.Basics.true)
    (x6 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_ltb x2 (imported_S (imported_S (imported_S (iterate1 imported_S 6 imported_0)))))
            imported_Original_LF__DOT__Basics_LF_Basics_true),
  rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_ltb_iso hx (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 6 O imported_0 _0_iso)))))
       Original_LF__DOT__Basics_LF_Basics_true_iso)
    x5 x6 ->
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_apply__late__policy_iso hx hx0) hx0)
    (Original.LF_DOT_Basics.LF.Basics.no_penalty_for_mostly_on_time x1 x3 x5) (imported_Original_LF__DOT__Basics_LF_Basics_no__penalty__for__mostly__on__time x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.no_penalty_for_mostly_on_time := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_no__penalty__for__mostly__on__time := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.no_penalty_for_mostly_on_time Original_LF__DOT__Basics_LF_Basics_no__penalty__for__mostly__on__time_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.no_penalty_for_mostly_on_time Imported.Original_LF__DOT__Basics_LF_Basics_no__penalty__for__mostly__on__time Original_LF__DOT__Basics_LF_Basics_no__penalty__for__mostly__on__time_iso := {}.