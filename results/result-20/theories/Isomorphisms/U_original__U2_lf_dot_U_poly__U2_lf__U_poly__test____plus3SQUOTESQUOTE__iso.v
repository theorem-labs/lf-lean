From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__doit3times__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__plus__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__Poly_LF_Poly_test__plus3'' : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Poly_LF_Poly_doit3times (fun x : imported_nat => imported_Original_LF__DOT__Basics_LF_Basics_plus (imported_S (imported_S (imported_S imported_0))) x) imported_0)
    (imported_S (imported_S (imported_S (iterate1 imported_S 6 imported_0)))) := Imported.Original_LF__DOT__Poly_LF_Poly_test__plus3''.
Monomorphic Instance Original_LF__DOT__Poly_LF_Poly_test__plus3''_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (unwrap_sprop
          (Original_LF__DOT__Poly_LF_Poly_doit3times_iso nat_iso (Original.LF_DOT_Basics.LF.Basics.plus 3)
             (fun x : imported_nat => imported_Original_LF__DOT__Basics_LF_Basics_plus (imported_S (imported_S (imported_S imported_0))) x)
             (fun (x1 : nat) (x2 : imported_nat) (hx : rel_iso_sort nat_iso x1 x2) =>
              {| unwrap_sprop := Original_LF__DOT__Basics_LF_Basics_plus_iso (S_iso (S_iso (S_iso _0_iso))) (unwrap_sprop hx) |})
             0 imported_0 {| unwrap_sprop := _0_iso |}))
       (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso (S (S (S (S (S (S O)))))) O imported_0 _0_iso)))))
    Original.LF_DOT_Poly.LF.Poly.test_plus3'' imported_Original_LF__DOT__Poly_LF_Poly_test__plus3''.
Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.test_plus3'' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_test__plus3'' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.test_plus3'' Original_LF__DOT__Poly_LF_Poly_test__plus3''_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.test_plus3'' Imported.Original_LF__DOT__Poly_LF_Poly_test__plus3'' Original_LF__DOT__Poly_LF_Poly_test__plus3''_iso := {}.