From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__pal__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__rev__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_palindrome__converse : forall (x : Type) (x0 : imported_Original_LF__DOT__Poly_LF_Poly_list x),
  imported_Corelib_Init_Logic_eq x0 (imported_Original_LF__DOT__Poly_LF_Poly_rev x0) -> imported_Original_LF__DOT__IndProp_LF_IndProp_pal x0 := (@Imported.Original_LF__DOT__IndProp_LF_IndProp_palindrome__converse).
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_palindrome__converse_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx0 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3 x4) (x5 : x3 = Original.LF_DOT_Poly.LF.Poly.rev x3)
    (x6 : imported_Corelib_Init_Logic_eq x4 (imported_Original_LF__DOT__Poly_LF_Poly_rev x4)),
  rel_iso (Corelib_Init_Logic_eq_iso hx0 (Original_LF__DOT__Poly_LF_Poly_rev_iso hx0)) x5 x6 ->
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_pal_iso hx0) (Original.LF_DOT_IndProp.LF.IndProp.palindrome_converse x3 x5) (imported_Original_LF__DOT__IndProp_LF_IndProp_palindrome__converse x6).
Admitted.
Instance: KnownConstant (@Original.LF_DOT_IndProp.LF.IndProp.palindrome_converse) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__IndProp_LF_IndProp_palindrome__converse) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_IndProp.LF.IndProp.palindrome_converse) Original_LF__DOT__IndProp_LF_IndProp_palindrome__converse_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_IndProp.LF.IndProp.palindrome_converse) (@Imported.Original_LF__DOT__IndProp_LF_IndProp_palindrome__converse) Original_LF__DOT__IndProp_LF_IndProp_palindrome__converse_iso := {}.