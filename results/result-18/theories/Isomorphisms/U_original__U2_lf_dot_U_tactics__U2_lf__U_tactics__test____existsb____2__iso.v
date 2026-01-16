From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.U_original__U2_lf_dot_U_tactics__U2_lf__U_tactics__existsb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__andb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__false__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso.

Monomorphic Definition imported_Original_LF__DOT__Tactics_LF_Tactics_test__existsb__2 : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Tactics_LF_Tactics_existsb
       (fun x : imported_Original_LF__DOT__Basics_LF_Basics_bool => imported_Original_LF__DOT__Basics_LF_Basics_andb imported_Original_LF__DOT__Basics_LF_Basics_true x)
       (imported_Original_LF__DOT__Poly_LF_Poly_cons imported_Original_LF__DOT__Basics_LF_Basics_true
          (imported_Original_LF__DOT__Poly_LF_Poly_cons imported_Original_LF__DOT__Basics_LF_Basics_true
             (imported_Original_LF__DOT__Poly_LF_Poly_cons imported_Original_LF__DOT__Basics_LF_Basics_false
                (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_Original_LF__DOT__Basics_LF_Basics_bool)))))
    imported_Original_LF__DOT__Basics_LF_Basics_true := Imported.Original_LF__DOT__Tactics_LF_Tactics_test__existsb__2.
Monomorphic Instance Original_LF__DOT__Tactics_LF_Tactics_test__existsb__2_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Tactics_LF_Tactics_existsb_iso (Original.LF_DOT_Basics.LF.Basics.andb Original.LF_DOT_Basics.LF.Basics.true)
          (fun x : imported_Original_LF__DOT__Basics_LF_Basics_bool => imported_Original_LF__DOT__Basics_LF_Basics_andb imported_Original_LF__DOT__Basics_LF_Basics_true x)
          (fun (x1 : Original.LF_DOT_Basics.LF.Basics.bool) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_bool) (hx : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x1 x2) =>
           Original_LF__DOT__Basics_LF_Basics_andb_iso Original_LF__DOT__Basics_LF_Basics_true_iso hx)
          (Original_LF__DOT__Poly_LF_Poly_cons_iso Original_LF__DOT__Basics_LF_Basics_true_iso
             (Original_LF__DOT__Poly_LF_Poly_cons_iso Original_LF__DOT__Basics_LF_Basics_true_iso
                (Original_LF__DOT__Poly_LF_Poly_cons_iso Original_LF__DOT__Basics_LF_Basics_false_iso (Original_LF__DOT__Poly_LF_Poly_nil_iso Original_LF__DOT__Basics_LF_Basics_bool_iso)))))
       Original_LF__DOT__Basics_LF_Basics_true_iso)
    Original.LF_DOT_Tactics.LF.Tactics.test_existsb_2 imported_Original_LF__DOT__Tactics_LF_Tactics_test__existsb__2.
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.test_existsb_2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_test__existsb__2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.test_existsb_2 Original_LF__DOT__Tactics_LF_Tactics_test__existsb__2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.test_existsb_2 Imported.Original_LF__DOT__Tactics_LF_Tactics_test__existsb__2 Original_LF__DOT__Tactics_LF_Tactics_test__existsb__2_iso := {}.