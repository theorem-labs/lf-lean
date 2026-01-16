From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__apply____late____policy__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool____rec__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__lower____grade__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__ltb__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__Basics_LF_Basics_apply__late__policy__unfold : forall (x : imported_nat) (x0 : imported_Original_LF__DOT__Basics_LF_Basics_grade),
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_apply__late__policy x x0)
    (imported_Original_LF__DOT__Basics_LF_Basics_bool__rec (fun _ : imported_Original_LF__DOT__Basics_LF_Basics_bool => imported_Original_LF__DOT__Basics_LF_Basics_grade) x0
       (imported_Original_LF__DOT__Basics_LF_Basics_bool__rec (fun _ : imported_Original_LF__DOT__Basics_LF_Basics_bool => imported_Original_LF__DOT__Basics_LF_Basics_grade)
          (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade x0)
          (imported_Original_LF__DOT__Basics_LF_Basics_bool__rec (fun _ : imported_Original_LF__DOT__Basics_LF_Basics_bool => imported_Original_LF__DOT__Basics_LF_Basics_grade)
             (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade x0))
             (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade x0)))
             (imported_Original_LF__DOT__Basics_LF_Basics_ltb x (imported_S (imported_S (imported_S (iterate1 imported_S 18 imported_0))))))
          (imported_Original_LF__DOT__Basics_LF_Basics_ltb x (imported_S (imported_S (imported_S (iterate1 imported_S 14 imported_0))))))
       (imported_Original_LF__DOT__Basics_LF_Basics_ltb x (imported_S (imported_S (imported_S (iterate1 imported_S 6 imported_0)))))) := Imported.Original_LF__DOT__Basics_LF_Basics_apply__late__policy__unfold.
Monomorphic Instance Original_LF__DOT__Basics_LF_Basics_apply__late__policy__unfold_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : Original.LF_DOT_Basics.LF.Basics.grade) (x4 : imported_Original_LF__DOT__Basics_LF_Basics_grade)
    (hx0 : rel_iso Original_LF__DOT__Basics_LF_Basics_grade_iso x3 x4),
  rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_apply__late__policy_iso hx hx0)
       (unwrap_sprop
          (Original_LF__DOT__Basics_LF_Basics_bool__rec_iso (fun _ : Original.LF_DOT_Basics.LF.Basics.bool => Original.LF_DOT_Basics.LF.Basics.grade)
             (fun _ : imported_Original_LF__DOT__Basics_LF_Basics_bool => imported_Original_LF__DOT__Basics_LF_Basics_grade)
             (fun (x5 : Original.LF_DOT_Basics.LF.Basics.bool) (x6 : imported_Original_LF__DOT__Basics_LF_Basics_bool) (_ : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x5 x6) =>
              Original_LF__DOT__Basics_LF_Basics_grade_iso)
             x3 x4 {| unwrap_sprop := hx0 |}
             (if Original.LF_DOT_Basics.LF.Basics.ltb x1 17
              then Original.LF_DOT_Basics.LF.Basics.lower_grade x3
              else
               if Original.LF_DOT_Basics.LF.Basics.ltb x1 21
               then Original.LF_DOT_Basics.LF.Basics.lower_grade (Original.LF_DOT_Basics.LF.Basics.lower_grade x3)
               else Original.LF_DOT_Basics.LF.Basics.lower_grade (Original.LF_DOT_Basics.LF.Basics.lower_grade (Original.LF_DOT_Basics.LF.Basics.lower_grade x3)))
             (imported_Original_LF__DOT__Basics_LF_Basics_bool__rec (fun _ : imported_Original_LF__DOT__Basics_LF_Basics_bool => imported_Original_LF__DOT__Basics_LF_Basics_grade)
                (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade x4)
                (imported_Original_LF__DOT__Basics_LF_Basics_bool__rec (fun _ : imported_Original_LF__DOT__Basics_LF_Basics_bool => imported_Original_LF__DOT__Basics_LF_Basics_grade)
                   (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade x4))
                   (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade x4)))
                   (imported_Original_LF__DOT__Basics_LF_Basics_ltb x2 (imported_S (imported_S (imported_S (iterate1 imported_S 18 imported_0))))))
                (imported_Original_LF__DOT__Basics_LF_Basics_ltb x2 (imported_S (imported_S (imported_S (iterate1 imported_S 14 imported_0))))))
             {|
               unwrap_sprop :=
                 unwrap_sprop
                   (Original_LF__DOT__Basics_LF_Basics_bool__rec_iso (fun _ : Original.LF_DOT_Basics.LF.Basics.bool => Original.LF_DOT_Basics.LF.Basics.grade)
                      (fun _ : imported_Original_LF__DOT__Basics_LF_Basics_bool => imported_Original_LF__DOT__Basics_LF_Basics_grade)
                      (fun (x5 : Original.LF_DOT_Basics.LF.Basics.bool) (x6 : imported_Original_LF__DOT__Basics_LF_Basics_bool) (_ : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x5 x6) =>
                       Original_LF__DOT__Basics_LF_Basics_grade_iso)
                      (Original.LF_DOT_Basics.LF.Basics.lower_grade x3) (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade x4)
                      {| unwrap_sprop := Original_LF__DOT__Basics_LF_Basics_lower__grade_iso hx0 |}
                      (if Original.LF_DOT_Basics.LF.Basics.ltb x1 21
                       then Original.LF_DOT_Basics.LF.Basics.lower_grade (Original.LF_DOT_Basics.LF.Basics.lower_grade x3)
                       else Original.LF_DOT_Basics.LF.Basics.lower_grade (Original.LF_DOT_Basics.LF.Basics.lower_grade (Original.LF_DOT_Basics.LF.Basics.lower_grade x3)))
                      (imported_Original_LF__DOT__Basics_LF_Basics_bool__rec (fun _ : imported_Original_LF__DOT__Basics_LF_Basics_bool => imported_Original_LF__DOT__Basics_LF_Basics_grade)
                         (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade x4))
                         (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade
                            (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade x4)))
                         (imported_Original_LF__DOT__Basics_LF_Basics_ltb x2 (imported_S (imported_S (imported_S (iterate1 imported_S 18 imported_0))))))
                      {|
                        unwrap_sprop :=
                          unwrap_sprop
                            (Original_LF__DOT__Basics_LF_Basics_bool__rec_iso (fun _ : Original.LF_DOT_Basics.LF.Basics.bool => Original.LF_DOT_Basics.LF.Basics.grade)
                               (fun _ : imported_Original_LF__DOT__Basics_LF_Basics_bool => imported_Original_LF__DOT__Basics_LF_Basics_grade)
                               (fun (x5 : Original.LF_DOT_Basics.LF.Basics.bool) (x6 : imported_Original_LF__DOT__Basics_LF_Basics_bool)
                                  (_ : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x5 x6) =>
                                Original_LF__DOT__Basics_LF_Basics_grade_iso)
                               (Original.LF_DOT_Basics.LF.Basics.lower_grade (Original.LF_DOT_Basics.LF.Basics.lower_grade x3))
                               (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade x4))
                               {| unwrap_sprop := Original_LF__DOT__Basics_LF_Basics_lower__grade_iso (Original_LF__DOT__Basics_LF_Basics_lower__grade_iso hx0) |}
                               (Original.LF_DOT_Basics.LF.Basics.lower_grade (Original.LF_DOT_Basics.LF.Basics.lower_grade (Original.LF_DOT_Basics.LF.Basics.lower_grade x3)))
                               (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade
                                  (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade (imported_Original_LF__DOT__Basics_LF_Basics_lower__grade x4)))
                               {|
                                 unwrap_sprop :=
                                   Original_LF__DOT__Basics_LF_Basics_lower__grade_iso (Original_LF__DOT__Basics_LF_Basics_lower__grade_iso (Original_LF__DOT__Basics_LF_Basics_lower__grade_iso hx0))
                               |} (Original_LF__DOT__Basics_LF_Basics_ltb_iso hx (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 18 O imported_0 _0_iso))))))
                      |} (Original_LF__DOT__Basics_LF_Basics_ltb_iso hx (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 14 O imported_0 _0_iso))))))
             |} (Original_LF__DOT__Basics_LF_Basics_ltb_iso hx (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 6 O imported_0 _0_iso))))))))
    (Original.LF_DOT_Basics.LF.Basics.apply_late_policy_unfold x1 x3) (imported_Original_LF__DOT__Basics_LF_Basics_apply__late__policy__unfold x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.apply_late_policy_unfold := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_apply__late__policy__unfold := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.apply_late_policy_unfold Original_LF__DOT__Basics_LF_Basics_apply__late__policy__unfold_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.apply_late_policy_unfold Imported.Original_LF__DOT__Basics_LF_Basics_apply__late__policy__unfold Original_LF__DOT__Basics_LF_Basics_apply__late__policy__unfold_iso := {}.