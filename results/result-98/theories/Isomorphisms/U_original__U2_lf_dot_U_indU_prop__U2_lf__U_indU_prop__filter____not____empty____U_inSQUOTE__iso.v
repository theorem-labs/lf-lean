From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__U_in__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__filter__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.U_logic__not__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__eqb__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_filter__not__empty__In' : forall (x : imported_nat) (x0 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat),
  (imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_filter (fun x1 : imported_nat => imported_Original_LF__DOT__Basics_LF_Basics_eqb x x1) x0)
     (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat) ->
   imported_False) ->
  imported_Original_LF__DOT__Logic_LF_Logic_In x x0 := Imported.Original_LF__DOT__IndProp_LF_IndProp_filter__not__empty__In'.
Instance Original_LF__DOT__IndProp_LF_IndProp_filter__not__empty__In'_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list nat) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat)
    (hx0 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso) x3 x4)
    (x5 : Original.LF_DOT_Poly.LF.Poly.filter (fun x : nat => Original.LF_DOT_Basics.LF.Basics.eqb x1 x) x3 <> Original.LF_DOT_Poly.LF.Poly.nil)
    (x6 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_filter (fun x : imported_nat => imported_Original_LF__DOT__Basics_LF_Basics_eqb x2 x) x4)
            (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat) ->
          imported_False),
  (forall (x7 : Original.LF_DOT_Poly.LF.Poly.filter (fun x : nat => Original.LF_DOT_Basics.LF.Basics.eqb x1 x) x3 = Original.LF_DOT_Poly.LF.Poly.nil)
     (x8 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_filter (fun x : imported_nat => imported_Original_LF__DOT__Basics_LF_Basics_eqb x2 x) x4)
             (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat)),
   rel_iso
     (Corelib_Init_Logic_eq_iso
        (Original_LF__DOT__Poly_LF_Poly_filter_iso (fun x : nat => Original.LF_DOT_Basics.LF.Basics.eqb x1 x) (fun x : imported_nat => imported_Original_LF__DOT__Basics_LF_Basics_eqb x2 x)
           (fun (x9 : nat) (x10 : imported_nat) (hx1 : rel_iso nat_iso x9 x10) => Original_LF__DOT__Basics_LF_Basics_eqb_iso hx hx1) hx0)
        (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso))
     x7 x8 ->
   rel_iso False_iso (x5 x7) (x6 x8)) ->
  rel_iso (Original_LF__DOT__Logic_LF_Logic_In_iso hx hx0) (Original.LF_DOT_IndProp.LF.IndProp.filter_not_empty_In' x1 x3 x5)
    (imported_Original_LF__DOT__IndProp_LF_IndProp_filter__not__empty__In' x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.filter_not_empty_In' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_filter__not__empty__In' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.filter_not_empty_In' Original_LF__DOT__IndProp_LF_IndProp_filter__not__empty__In'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.filter_not_empty_In' Imported.Original_LF__DOT__IndProp_LF_IndProp_filter__not__empty__In' Original_LF__DOT__IndProp_LF_IndProp_filter__not__empty__In'_iso := {}.