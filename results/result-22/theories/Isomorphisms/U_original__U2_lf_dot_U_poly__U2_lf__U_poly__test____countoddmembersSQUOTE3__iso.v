From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__countoddmembersSQUOTE__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_test__countoddmembers'3 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_countoddmembers' (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat)) imported_0 := Imported.Original_LF__DOT__Poly_LF_Poly_test__countoddmembers'3.

(* The isomorphism for the equality type *)
Definition eq_iso_for_test3 := Corelib_Init_Logic_eq_iso (Original_LF__DOT__Poly_LF_Poly_countoddmembers'_iso (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso)) _0_iso.

(* Since both the original and imported statements are proof-irrelevant (SProp),
   we can prove the isomorphism using proof irrelevance. *)
Instance Original_LF__DOT__Poly_LF_Poly_test__countoddmembers'3_iso : rel_iso
    {|
      to := eq_iso_for_test3;
      from := from eq_iso_for_test3;
      to_from :=
        fun x : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_countoddmembers' (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat)) imported_0 =>
        to_from eq_iso_for_test3 x;
      from_to :=
        fun x : @Corelib.Init.Logic.eq nat (Original.LF_DOT_Poly.LF.Poly.countoddmembers' (@Original.LF_DOT_Poly.LF.Poly.nil nat)) O =>
        seq_p_of_t (from_to eq_iso_for_test3 x)
    |} Original.LF_DOT_Poly.LF.Poly.test_countoddmembers'3 imported_Original_LF__DOT__Poly_LF_Poly_test__countoddmembers'3.
Proof.
  (* rel_iso is eq (to iso original) imported, both are in SProp *)
  simpl.
  (* Both sides are values in SProp, so they're proof-irrelevant equal *)
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.test_countoddmembers'3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_test__countoddmembers'3 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.test_countoddmembers'3 Original_LF__DOT__Poly_LF_Poly_test__countoddmembers'3_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.test_countoddmembers'3 Imported.Original_LF__DOT__Poly_LF_Poly_test__countoddmembers'3 Original_LF__DOT__Poly_LF_Poly_test__countoddmembers'3_iso := {}.