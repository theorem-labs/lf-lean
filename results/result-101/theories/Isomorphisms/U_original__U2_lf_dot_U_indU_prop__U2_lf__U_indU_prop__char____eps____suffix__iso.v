From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_char__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__exp____match__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.U_ascii__ascii__iso Isomorphisms.iff__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_char__eps__suffix : forall (x : imported_Ascii_ascii) (x0 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii),
  imported_iff (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_cons x x0) (imported_Original_LF__DOT__IndProp_LF_IndProp_Char x))
    (imported_Corelib_Init_Logic_eq x0 (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_Ascii_ascii)) := Imported.Original_LF__DOT__IndProp_LF_IndProp_char__eps__suffix.
Instance Original_LF__DOT__IndProp_LF_IndProp_char__eps__suffix_iso : forall (x1 : Ascii.ascii) (x2 : imported_Ascii_ascii) (hx : rel_iso Ascii_ascii_iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list Ascii.ascii)
    (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii) (hx0 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso Ascii_ascii_iso) x3 x4),
  rel_iso
    {|
      to :=
        iff_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx hx0) (Original_LF__DOT__IndProp_LF_IndProp_Char_iso hx))
          (Corelib_Init_Logic_eq_iso hx0 (Original_LF__DOT__Poly_LF_Poly_nil_iso Ascii_ascii_iso));
      from :=
        from
          (iff_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx hx0) (Original_LF__DOT__IndProp_LF_IndProp_Char_iso hx))
             (Corelib_Init_Logic_eq_iso hx0 (Original_LF__DOT__Poly_LF_Poly_nil_iso Ascii_ascii_iso)));
      to_from :=
        fun
          x : imported_iff (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_cons x2 x4) (imported_Original_LF__DOT__IndProp_LF_IndProp_Char x2))
                (imported_Corelib_Init_Logic_eq x4 (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_Ascii_ascii)) =>
        to_from
          (iff_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx hx0) (Original_LF__DOT__IndProp_LF_IndProp_Char_iso hx))
             (Corelib_Init_Logic_eq_iso hx0 (Original_LF__DOT__Poly_LF_Poly_nil_iso Ascii_ascii_iso)))
          x;
      from_to :=
        fun x : Original.LF_DOT_IndProp.LF.IndProp.exp_match (Original.LF_DOT_Poly.LF.Poly.cons x1 x3) (Original.LF_DOT_IndProp.LF.IndProp.Char x1) <-> x3 = Original.LF_DOT_Poly.LF.Poly.nil =>
        seq_p_of_t
          (from_to
             (iff_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx hx0) (Original_LF__DOT__IndProp_LF_IndProp_Char_iso hx))
                (Corelib_Init_Logic_eq_iso hx0 (Original_LF__DOT__Poly_LF_Poly_nil_iso Ascii_ascii_iso)))
             x)
    |} (Original.LF_DOT_IndProp.LF.IndProp.char_eps_suffix x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_char__eps__suffix x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.char_eps_suffix := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_char__eps__suffix := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.char_eps_suffix Original_LF__DOT__IndProp_LF_IndProp_char__eps__suffix_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.char_eps_suffix Imported.Original_LF__DOT__IndProp_LF_IndProp_char__eps__suffix Original_LF__DOT__IndProp_LF_IndProp_char__eps__suffix_iso := {}.