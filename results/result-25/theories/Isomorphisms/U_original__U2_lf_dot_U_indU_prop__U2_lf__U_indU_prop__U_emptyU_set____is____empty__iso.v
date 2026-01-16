From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_emptyU_set__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__exp____match__iso Isomorphisms.U_logic__not__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_EmptySet__is__empty : forall (x : Type) (x0 : imported_Original_LF__DOT__Poly_LF_Poly_list x),
  imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x0 (imported_Original_LF__DOT__IndProp_LF_IndProp_EmptySet x) -> imported_False := Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_EmptySet__is__empty.
Instance Original_LF__DOT__IndProp_LF_IndProp_EmptySet__is__empty_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx0 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3 x4) (x5 : Original.LF_DOT_IndProp.LF.IndProp.exp_match x3 Original.LF_DOT_IndProp.LF.IndProp.EmptySet)
    (x6 : imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x4 (imported_Original_LF__DOT__IndProp_LF_IndProp_EmptySet x2)),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx0 (Original_LF__DOT__IndProp_LF_IndProp_EmptySet_iso hx)) x5 x6 ->
  rel_iso False_iso (Original.LF_DOT_IndProp.LF.IndProp.EmptySet_is_empty x1 x3 x5) (imported_Original_LF__DOT__IndProp_LF_IndProp_EmptySet__is__empty x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.EmptySet_is_empty := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_EmptySet__is__empty := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.EmptySet_is_empty Original_LF__DOT__IndProp_LF_IndProp_EmptySet__is__empty_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.EmptySet_is_empty Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp_EmptySet__is__empty Original_LF__DOT__IndProp_LF_IndProp_EmptySet__is__empty_iso := {}.