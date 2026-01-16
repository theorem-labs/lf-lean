From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__rev__iso Isomorphisms.__0__iso Isomorphisms.U_s__iso.

(* test_rev1 is an admitted axiom in Original.v, so we use the corresponding axiom from Imported *)
Definition imported_Original_LF__DOT__Poly_LF_Poly_test__rev1 : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Poly_LF_Poly_rev
       (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S imported_0)
          (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S imported_0)) (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat))))
    (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S imported_0))
       (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S imported_0) (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat))) := Imported.Original_LF__DOT__Poly_LF_Poly_test__rev1.

From IsomorphismChecker Require Export Isomorphisms.nat__iso.

(* The instance proves rel_iso which is eq (to iso x) y 
   Since both values are in SProp, they're equal by proof irrelevance *)
Instance Original_LF__DOT__Poly_LF_Poly_test__rev1_iso : rel_iso
    (relax_Iso_Ts_Ps
       (Corelib_Init_Logic_eq_iso
          (Original_LF__DOT__Poly_LF_Poly_rev_iso
             (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso _0_iso) (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso _0_iso)) (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso))))
          (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso _0_iso)) (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso _0_iso) (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso)))))
    Original.LF_DOT_Poly.LF.Poly.test_rev1 imported_Original_LF__DOT__Poly_LF_Poly_test__rev1.
Proof.
  constructor. unfold imported_Original_LF__DOT__Poly_LF_Poly_test__rev1.
  (* Both are in SProp, use proof irrelevance *)
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.test_rev1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant imported_Original_LF__DOT__Poly_LF_Poly_test__rev1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.test_rev1 Original_LF__DOT__Poly_LF_Poly_test__rev1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.test_rev1 imported_Original_LF__DOT__Poly_LF_Poly_test__rev1 Original_LF__DOT__Poly_LF_Poly_test__rev1_iso := {}.