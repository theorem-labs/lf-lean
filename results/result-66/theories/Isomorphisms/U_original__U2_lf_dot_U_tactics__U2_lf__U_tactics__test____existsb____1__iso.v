From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.U_original__U2_lf_dot_U_tactics__U2_lf__U_tactics__existsb__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__eqb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__false__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__Tactics_LF_Tactics_test__existsb__1 : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Tactics_LF_Tactics_existsb
       (fun x : imported_nat => imported_Original_LF__DOT__Basics_LF_Basics_eqb (imported_S (imported_S (imported_S (iterate1 imported_S 2 imported_0)))) x)
       (imported_Original_LF__DOT__Poly_LF_Poly_cons imported_0
          (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S imported_0))
             (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S (imported_S imported_0)))
                (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S (imported_S (iterate1 imported_S 3 imported_0)))) (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat))))))
    imported_Original_LF__DOT__Basics_LF_Basics_false := Imported.Original_LF__DOT__Tactics_LF_Tactics_test__existsb__1.
Monomorphic Instance Original_LF__DOT__Tactics_LF_Tactics_test__existsb__1_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Tactics_LF_Tactics_existsb_iso (Original.LF_DOT_Basics.LF.Basics.eqb 5)
          (fun x : imported_nat => imported_Original_LF__DOT__Basics_LF_Basics_eqb (imported_S (imported_S (imported_S (iterate1 imported_S 2 imported_0)))) x)
          (fun (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) =>
           Original_LF__DOT__Basics_LF_Basics_eqb_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 2%nat 0%nat imported_0 _0_iso)))) hx)
          (Original_LF__DOT__Poly_LF_Poly_cons_iso _0_iso
             (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso _0_iso))
                (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso (S_iso _0_iso)))
                   (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 3%nat 0%nat imported_0 _0_iso)))) (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso))))))
       Original_LF__DOT__Basics_LF_Basics_false_iso)
    Original.LF_DOT_Tactics.LF.Tactics.test_existsb_1 imported_Original_LF__DOT__Tactics_LF_Tactics_test__existsb__1.
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.test_existsb_1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_test__existsb__1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.test_existsb_1 Original_LF__DOT__Tactics_LF_Tactics_test__existsb__1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.test_existsb_1 Imported.Original_LF__DOT__Tactics_LF_Tactics_test__existsb__1 Original_LF__DOT__Tactics_LF_Tactics_test__existsb__1_iso := {}.