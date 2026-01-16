From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__U_in__iso Isomorphisms.__0__iso Isomorphisms.U_logic__not__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__count__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_eqbP__practice : forall (x : imported_nat) (x0 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat),
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__IndProp_LF_IndProp_count x x0) imported_0 -> imported_Original_LF__DOT__Logic_LF_Logic_In x x0 -> imported_False := Imported.Original_LF__DOT__IndProp_LF_IndProp_eqbP__practice.
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_eqbP__practice_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list nat) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat)
    (hx0 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso) x3 x4) (x5 : Original.LF_DOT_IndProp.LF.IndProp.count x1 x3 = 0)
    (x6 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__IndProp_LF_IndProp_count x2 x4) imported_0),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__IndProp_LF_IndProp_count_iso hx hx0) _0_iso) x5 x6 ->
  forall (x7 : Original.LF_DOT_Logic.LF.Logic.In x1 x3) (x8 : imported_Original_LF__DOT__Logic_LF_Logic_In x2 x4),
  rel_iso (Original_LF__DOT__Logic_LF_Logic_In_iso hx hx0) x7 x8 ->
  rel_iso False_iso (Original.LF_DOT_IndProp.LF.IndProp.eqbP_practice x1 x3 x5 x7) (imported_Original_LF__DOT__IndProp_LF_IndProp_eqbP__practice x6 x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.eqbP_practice := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_eqbP__practice := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.eqbP_practice Original_LF__DOT__IndProp_LF_IndProp_eqbP__practice_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.eqbP_practice Imported.Original_LF__DOT__IndProp_LF_IndProp_eqbP__practice Original_LF__DOT__IndProp_LF_IndProp_eqbP__practice_iso := {}.