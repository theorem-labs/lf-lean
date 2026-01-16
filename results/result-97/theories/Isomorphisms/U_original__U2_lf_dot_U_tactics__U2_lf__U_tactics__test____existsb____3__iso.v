From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.U_original__U2_lf_dot_U_tactics__U2_lf__U_tactics__existsb__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__odd__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__Tactics_LF_Tactics_test__existsb__3 : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Tactics_LF_Tactics_existsb (fun x : imported_nat => imported_Original_LF__DOT__Basics_LF_Basics_odd x)
       (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S imported_0)
          (imported_Original_LF__DOT__Poly_LF_Poly_cons imported_0
             (imported_Original_LF__DOT__Poly_LF_Poly_cons imported_0
                (imported_Original_LF__DOT__Poly_LF_Poly_cons imported_0
                   (imported_Original_LF__DOT__Poly_LF_Poly_cons imported_0
                      (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S (imported_S imported_0))) (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat))))))))
    imported_Original_LF__DOT__Basics_LF_Basics_true := Imported.Original_LF__DOT__Tactics_LF_Tactics_test__existsb__3.
Instance Original_LF__DOT__Tactics_LF_Tactics_test__existsb__3_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Tactics_LF_Tactics_existsb_iso Original.LF_DOT_Basics.LF.Basics.odd (fun x : imported_nat => imported_Original_LF__DOT__Basics_LF_Basics_odd x)
          (fun (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) => Original_LF__DOT__Basics_LF_Basics_odd_iso hx)
          (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso _0_iso)
             (Original_LF__DOT__Poly_LF_Poly_cons_iso _0_iso
                (Original_LF__DOT__Poly_LF_Poly_cons_iso _0_iso
                   (Original_LF__DOT__Poly_LF_Poly_cons_iso _0_iso
                      (Original_LF__DOT__Poly_LF_Poly_cons_iso _0_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso (S_iso _0_iso))) (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso))))))))
       Original_LF__DOT__Basics_LF_Basics_true_iso)
    Original.LF_DOT_Tactics.LF.Tactics.test_existsb_3 imported_Original_LF__DOT__Tactics_LF_Tactics_test__existsb__3.
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.test_existsb_3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_test__existsb__3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.test_existsb_3 Original_LF__DOT__Tactics_LF_Tactics_test__existsb__3_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.test_existsb_3 Imported.Original_LF__DOT__Tactics_LF_Tactics_test__existsb__3 Original_LF__DOT__Tactics_LF_Tactics_test__existsb__3_iso := {}.