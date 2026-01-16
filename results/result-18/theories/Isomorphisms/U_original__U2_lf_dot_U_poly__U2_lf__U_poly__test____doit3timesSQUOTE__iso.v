From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__doit3times__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__false__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__negb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso.

Monomorphic Definition imported_Original_LF__DOT__Poly_LF_Poly_test__doit3times' : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Poly_LF_Poly_doit3times (fun x : imported_Original_LF__DOT__Basics_LF_Basics_bool => imported_Original_LF__DOT__Basics_LF_Basics_negb x)
       imported_Original_LF__DOT__Basics_LF_Basics_true)
    imported_Original_LF__DOT__Basics_LF_Basics_false := Imported.Original_LF__DOT__Poly_LF_Poly_test__doit3times'.
Monomorphic Instance Original_LF__DOT__Poly_LF_Poly_test__doit3times'_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (unwrap_sprop
          (Original_LF__DOT__Poly_LF_Poly_doit3times_iso Original_LF__DOT__Basics_LF_Basics_bool_iso Original.LF_DOT_Basics.LF.Basics.negb
             (fun x : imported_Original_LF__DOT__Basics_LF_Basics_bool => imported_Original_LF__DOT__Basics_LF_Basics_negb x)
             (fun (x1 : Original.LF_DOT_Basics.LF.Basics.bool) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_bool) (hx : rel_iso_sort Original_LF__DOT__Basics_LF_Basics_bool_iso x1 x2) =>
              {| unwrap_sprop := Original_LF__DOT__Basics_LF_Basics_negb_iso (unwrap_sprop hx) |})
             Original.LF_DOT_Basics.LF.Basics.true imported_Original_LF__DOT__Basics_LF_Basics_true {| unwrap_sprop := Original_LF__DOT__Basics_LF_Basics_true_iso |}))
       Original_LF__DOT__Basics_LF_Basics_false_iso)
    Original.LF_DOT_Poly.LF.Poly.test_doit3times' imported_Original_LF__DOT__Poly_LF_Poly_test__doit3times'.
Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.test_doit3times' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_test__doit3times' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.test_doit3times' Original_LF__DOT__Poly_LF_Poly_test__doit3times'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.test_doit3times' Imported.Original_LF__DOT__Poly_LF_Poly_test__doit3times' Original_LF__DOT__Poly_LF_Poly_test__doit3times'_iso := {}.