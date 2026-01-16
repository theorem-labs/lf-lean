From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_union__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__exp____match__iso Isomorphisms.or__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_MUnion' : forall (x : Type) (x0 : imported_Original_LF__DOT__Poly_LF_Poly_list x) (x1 x2 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x),
  imported_or (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x0 x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x0 x2) ->
  imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x0 (imported_Original_LF__DOT__IndProp_LF_IndProp_Union x1 x2) := Imported.Original_LF__DOT__IndProp_LF_IndProp_MUnion'.
Instance Original_LF__DOT__IndProp_LF_IndProp_MUnion'_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx0 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3 x4) (x5 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) (x6 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2)
    (hx1 : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) x5 x6) (x7 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) (x8 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2)
    (hx2 : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) x7 x8) (x9 : Original.LF_DOT_IndProp.LF.IndProp.exp_match x3 x5 \/ Original.LF_DOT_IndProp.LF.IndProp.exp_match x3 x7)
    (x10 : imported_or (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x4 x6) (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x4 x8)),
  rel_iso
    {|
      to := or_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx0 hx1) (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx0 hx2);
      from := from (or_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx0 hx1) (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx0 hx2));
      to_from :=
        fun x : imported_or (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x4 x6) (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x4 x8) =>
        to_from (or_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx0 hx1) (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx0 hx2)) x;
      from_to :=
        fun x : Original.LF_DOT_IndProp.LF.IndProp.exp_match x3 x5 \/ Original.LF_DOT_IndProp.LF.IndProp.exp_match x3 x7 =>
        seq_p_of_t (from_to (or_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx0 hx1) (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx0 hx2)) x)
    |} x9 x10 ->
  rel_iso
    {|
      to := Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx0 (Original_LF__DOT__IndProp_LF_IndProp_Union_iso hx1 hx2);
      from := from (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx0 (Original_LF__DOT__IndProp_LF_IndProp_Union_iso hx1 hx2));
      to_from :=
        fun x : imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x4 (imported_Original_LF__DOT__IndProp_LF_IndProp_Union x6 x8) =>
        to_from (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx0 (Original_LF__DOT__IndProp_LF_IndProp_Union_iso hx1 hx2)) x;
      from_to :=
        fun x : Original.LF_DOT_IndProp.LF.IndProp.exp_match x3 (Original.LF_DOT_IndProp.LF.IndProp.Union x5 x7) =>
        seq_p_of_t (from_to (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx0 (Original_LF__DOT__IndProp_LF_IndProp_Union_iso hx1 hx2)) x)
    |} (Original.LF_DOT_IndProp.LF.IndProp.MUnion' x1 x3 x5 x7 x9) (imported_Original_LF__DOT__IndProp_LF_IndProp_MUnion' x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.MUnion' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_MUnion' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.MUnion' Original_LF__DOT__IndProp_LF_IndProp_MUnion'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.MUnion' Imported.Original_LF__DOT__IndProp_LF_IndProp_MUnion' Original_LF__DOT__IndProp_LF_IndProp_MUnion'_iso := {}.