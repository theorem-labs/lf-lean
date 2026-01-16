From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.U_original__U2_lf_dot_U_tactics__U2_lf__U_tactics__forallb__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__even__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__false__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__Tactics_LF_Tactics_test__forallb__3 : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Tactics_LF_Tactics_forallb (fun x : imported_nat => imported_Original_LF__DOT__Basics_LF_Basics_even x)
       (imported_Original_LF__DOT__Poly_LF_Poly_cons imported_0
          (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S imported_0))
             (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S (imported_S (iterate1 imported_S 1 imported_0))))
                (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S (imported_S (iterate1 imported_S 2 imported_0)))) (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat))))))
    imported_Original_LF__DOT__Basics_LF_Basics_false := Imported.Original_LF__DOT__Tactics_LF_Tactics_test__forallb__3.
Monomorphic Instance Original_LF__DOT__Tactics_LF_Tactics_test__forallb__3_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Tactics_LF_Tactics_forallb_iso Original.LF_DOT_Basics.LF.Basics.even (fun x : imported_nat => imported_Original_LF__DOT__Basics_LF_Basics_even x)
          (fun (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) => Original_LF__DOT__Basics_LF_Basics_even_iso hx)
          (Original_LF__DOT__Poly_LF_Poly_cons_iso _0_iso
             (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso _0_iso))
                (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso (S O) O imported_0 _0_iso))))
                   (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso (S (S O)) O imported_0 _0_iso)))) (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso))))))
       Original_LF__DOT__Basics_LF_Basics_false_iso)
    Original.LF_DOT_Tactics.LF.Tactics.test_forallb_3 imported_Original_LF__DOT__Tactics_LF_Tactics_test__forallb__3.
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.test_forallb_3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_test__forallb__3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.test_forallb_3 Original_LF__DOT__Tactics_LF_Tactics_test__forallb__3_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.test_forallb_3 Imported.Original_LF__DOT__Tactics_LF_Tactics_test__forallb__3 Original_LF__DOT__Tactics_LF_Tactics_test__forallb__3_iso := {}.