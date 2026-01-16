From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__pair__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__split__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__false__iso Isomorphisms.U_s__iso.

(* Define imported test_split *)
Definition imported_Original_LF__DOT__Poly_LF_Poly_test__split := Imported.Original_LF__DOT__Poly_LF_Poly_test__split.

(* Since test_split is admitted in Original.v, we axiomatize the isomorphism *)
Axiom Original_LF__DOT__Poly_LF_Poly_test__split_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Poly_LF_Poly_split_iso
          (Original_LF__DOT__Poly_LF_Poly_cons_iso (Original_LF__DOT__Poly_LF_Poly_pair_iso (S_iso _0_iso) Original_LF__DOT__Basics_LF_Basics_false_iso)
             (Original_LF__DOT__Poly_LF_Poly_cons_iso (Original_LF__DOT__Poly_LF_Poly_pair_iso (S_iso (S_iso _0_iso)) Original_LF__DOT__Basics_LF_Basics_false_iso)
                (Original_LF__DOT__Poly_LF_Poly_nil_iso (Original_LF__DOT__Poly_LF_Poly_prod_iso nat_iso Original_LF__DOT__Basics_LF_Basics_bool_iso)))))
       (Original_LF__DOT__Poly_LF_Poly_pair_iso
          (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso _0_iso) (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso _0_iso)) (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso)))
          (Original_LF__DOT__Poly_LF_Poly_cons_iso Original_LF__DOT__Basics_LF_Basics_false_iso
             (Original_LF__DOT__Poly_LF_Poly_cons_iso Original_LF__DOT__Basics_LF_Basics_false_iso (Original_LF__DOT__Poly_LF_Poly_nil_iso Original_LF__DOT__Basics_LF_Basics_bool_iso)))))
    Original.LF_DOT_Poly.LF.Poly.test_split imported_Original_LF__DOT__Poly_LF_Poly_test__split.
Existing Instance Original_LF__DOT__Poly_LF_Poly_test__split_iso.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.test_split := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_test__split := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.test_split Original_LF__DOT__Poly_LF_Poly_test__split_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.test_split Imported.Original_LF__DOT__Poly_LF_Poly_test__split Original_LF__DOT__Poly_LF_Poly_test__split_iso := {}.