From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Unset Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__U_in__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.__0__iso Isomorphisms.U_logic__not__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_in__not__nil__42__take4 : forall x : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat,
  imported_Original_LF__DOT__Logic_LF_Logic_In (imported_S (imported_S (imported_S (iterate1 imported_S 39 imported_0)))) x ->
  imported_Corelib_Init_Logic_eq x (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat) -> imported_False := Imported.Original_LF__DOT__Logic_LF_Logic_in__not__nil__42__take4.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_in__not__nil__42__take4_iso : forall (x1 : Original.LF_DOT_Poly.LF.Poly.list nat) (x2 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat) (hx : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso) x1 x2)
    (x3 : Original.LF_DOT_Logic.LF.Logic.In 42 x1) (x4 : imported_Original_LF__DOT__Logic_LF_Logic_In (imported_S (imported_S (imported_S (iterate1 imported_S 39 imported_0)))) x2),
  rel_iso (Original_LF__DOT__Logic_LF_Logic_In_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 39 0 imported_0 _0_iso)))) hx) x3 x4 ->
  forall (x5 : x1 = Original.LF_DOT_Poly.LF.Poly.nil) (x6 : imported_Corelib_Init_Logic_eq x2 (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat)),
  rel_iso (Corelib_Init_Logic_eq_iso hx (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso)) x5 x6 ->
  rel_iso False_iso (Original.LF_DOT_Logic.LF.Logic.in_not_nil_42_take4 x1 x3 x5) (imported_Original_LF__DOT__Logic_LF_Logic_in__not__nil__42__take4 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.in_not_nil_42_take4 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_in__not__nil__42__take4 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.in_not_nil_42_take4 Original_LF__DOT__Logic_LF_Logic_in__not__nil__42__take4_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.in_not_nil_42_take4 Imported.Original_LF__DOT__Logic_LF_Logic_in__not__nil__42__take4 Original_LF__DOT__Logic_LF_Logic_in__not__nil__42__take4_iso := {}.