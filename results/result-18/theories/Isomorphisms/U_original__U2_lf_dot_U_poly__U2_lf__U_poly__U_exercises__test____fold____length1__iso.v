From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
#[local] Set Printing Coercions.

From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__U_exercises__fold____length__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.__0__iso Isomorphisms.U_s__iso Isomorphisms.nat__iso.

(* test_fold_length1 : fold_length [4;7;0] = 3 *)

(* Define the numbers we need *)
Definition n0_imp : imported_nat := Imported.nat_O.
Definition n1_imp : imported_nat := Imported.nat_S n0_imp.
Definition n2_imp : imported_nat := Imported.nat_S n1_imp.
Definition n3_imp : imported_nat := Imported.nat_S n2_imp.
Definition n4_imp : imported_nat := Imported.nat_S n3_imp.
Definition n5_imp : imported_nat := Imported.nat_S n4_imp.
Definition n6_imp : imported_nat := Imported.nat_S n5_imp.
Definition n7_imp : imported_nat := Imported.nat_S n6_imp.

(* [4;7;0] *)
Definition list_470 : Imported.Original_LF__DOT__Poly_LF_Poly_list imported_nat :=
  Imported.Original_LF__DOT__Poly_LF_Poly_list_cons _ n4_imp
    (Imported.Original_LF__DOT__Poly_LF_Poly_list_cons _ n7_imp
      (Imported.Original_LF__DOT__Poly_LF_Poly_list_cons _ n0_imp
        (Imported.Original_LF__DOT__Poly_LF_Poly_list_nil _))).

Monomorphic Definition imported_Original_LF__DOT__Poly_LF_Poly_Exercises_test__fold__length1 : 
  imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length
       (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S (imported_S (imported_S imported_0))))
          (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S (imported_S (imported_S (imported_S (imported_S (imported_S imported_0)))))))
             (imported_Original_LF__DOT__Poly_LF_Poly_cons imported_0 (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat)))))
    (imported_S (imported_S (imported_S imported_0))) := Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_test__fold__length1.

Axiom Original_LF__DOT__Poly_LF_Poly_Exercises_test__fold__length1_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Poly_LF_Poly_Exercises_fold__length_iso
          (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso (S_iso (S_iso _0_iso))))
             (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))))))
                (Original_LF__DOT__Poly_LF_Poly_cons_iso _0_iso (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso)))))
       (S_iso (S_iso (S_iso _0_iso))))
    Original.LF_DOT_Poly.LF.Poly.Exercises.test_fold_length1 imported_Original_LF__DOT__Poly_LF_Poly_Exercises_test__fold__length1.

Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.Exercises.test_fold_length1 := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_test__fold__length1 := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.Exercises.test_fold_length1 Original_LF__DOT__Poly_LF_Poly_Exercises_test__fold__length1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.Exercises.test_fold_length1 Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_test__fold__length1 Original_LF__DOT__Poly_LF_Poly_Exercises_test__fold__length1_iso := {}.
