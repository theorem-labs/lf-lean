From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_char__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__exp____match__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_ascii__ascii__iso Isomorphisms.U_logic__not__iso Isomorphisms.U_original__U_false__iso Isomorphisms.iff__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_char__nomatch__char : forall (x x0 : imported_Ascii_ascii) (x1 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii),
  (imported_Corelib_Init_Logic_eq x0 x -> imported_False) ->
  imported_iff (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_cons x0 x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_Char x))
    imported_Original_False := Imported.Original_LF__DOT__IndProp_LF_IndProp_char__nomatch__char.
Instance Original_LF__DOT__IndProp_LF_IndProp_char__nomatch__char_iso : forall (x1 : Ascii.ascii) (x2 : imported_Ascii_ascii) (hx : rel_iso Ascii_ascii_iso x1 x2) (x3 : Ascii.ascii) (x4 : imported_Ascii_ascii) (hx0 : rel_iso Ascii_ascii_iso x3 x4)
    (x5 : Original.LF_DOT_Poly.LF.Poly.list Ascii.ascii) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii)
    (hx1 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso Ascii_ascii_iso) x5 x6) (x7 : x3 <> x1) (x8 : imported_Corelib_Init_Logic_eq x4 x2 -> imported_False),
  (forall (x9 : x3 = x1) (x10 : imported_Corelib_Init_Logic_eq x4 x2),
   rel_iso
     {|
       to := Corelib_Init_Logic_eq_iso hx0 hx;
       from := from (Corelib_Init_Logic_eq_iso hx0 hx);
       to_from := fun x : imported_Corelib_Init_Logic_eq x4 x2 => to_from (Corelib_Init_Logic_eq_iso hx0 hx) x;
       from_to := fun x : x3 = x1 => seq_p_of_t (from_to (Corelib_Init_Logic_eq_iso hx0 hx) x)
     |} x9 x10 ->
   rel_iso {| to := False_iso; from := from False_iso; to_from := fun x : imported_False => to_from False_iso x; from_to := fun x : False => seq_p_of_t (from_to False_iso x) |} (x7 x9) (x8 x10)) ->
  rel_iso
    {|
      to := iff_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx0 hx1) (Original_LF__DOT__IndProp_LF_IndProp_Char_iso hx)) Original_False_iso;
      from :=
        from (iff_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx0 hx1) (Original_LF__DOT__IndProp_LF_IndProp_Char_iso hx)) Original_False_iso);
      to_from :=
        fun
          x : imported_iff (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_cons x4 x6) (imported_Original_LF__DOT__IndProp_LF_IndProp_Char x2))
                imported_Original_False =>
        to_from (iff_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx0 hx1) (Original_LF__DOT__IndProp_LF_IndProp_Char_iso hx)) Original_False_iso)
          x;
      from_to :=
        fun x : Original.LF_DOT_IndProp.LF.IndProp.exp_match (Original.LF_DOT_Poly.LF.Poly.cons x3 x5) (Original.LF_DOT_IndProp.LF.IndProp.Char x1) <-> Original.False =>
        seq_p_of_t
          (from_to
             (iff_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx0 hx1) (Original_LF__DOT__IndProp_LF_IndProp_Char_iso hx)) Original_False_iso) x)
    |} (Original.LF_DOT_IndProp.LF.IndProp.char_nomatch_char x1 x3 x5 x7) (imported_Original_LF__DOT__IndProp_LF_IndProp_char__nomatch__char x6 x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.char_nomatch_char := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_char__nomatch__char := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.char_nomatch_char Original_LF__DOT__IndProp_LF_IndProp_char__nomatch__char_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.char_nomatch_char Imported.Original_LF__DOT__IndProp_LF_IndProp_char__nomatch__char Original_LF__DOT__IndProp_LF_IndProp_char__nomatch__char_iso := {}.