From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__doit3times__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__minustwo__iso Isomorphisms.U_s__iso.

Local Definition nine : nat := 9%nat.
Local Definition three : nat := 3%nat.

(* Define imported term to match interface signature *)
Definition imported_Original_LF__DOT__Poly_LF_Poly_test__doit3times :=
  Imported.Original_LF__DOT__Poly_LF_Poly_test__doit3times.

(* Match the exact Iso type from Interface *)
Instance Original_LF__DOT__Poly_LF_Poly_test__doit3times_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (unwrap_sprop
          (Original_LF__DOT__Poly_LF_Poly_doit3times_iso nat_iso 
             Original.LF_DOT_Basics.LF.Basics.minustwo 
             (fun x : imported_nat => imported_Original_LF__DOT__Basics_LF_Basics_minustwo x)
             (fun (x1 : nat) (x2 : imported_nat) (hx : rel_iso_sort nat_iso x1 x2) => 
                {| unwrap_sprop := Original_LF__DOT__Basics_LF_Basics_minustwo_iso (unwrap_sprop hx) |}) 
             9%nat
             (imported_S (imported_S (imported_S (iterate1 imported_S 6%nat imported_0)))) 
             {| unwrap_sprop := S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 6%nat 0%nat imported_0 _0_iso))) |}))
       (S_iso (S_iso (S_iso _0_iso))))
    Original.LF_DOT_Poly.LF.Poly.test_doit3times 
    imported_Original_LF__DOT__Poly_LF_Poly_test__doit3times.
Admitted.

Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.test_doit3times := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_test__doit3times := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.test_doit3times Original_LF__DOT__Poly_LF_Poly_test__doit3times_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.test_doit3times Imported.Original_LF__DOT__Poly_LF_Poly_test__doit3times Original_LF__DOT__Poly_LF_Poly_test__doit3times_iso := {}.
