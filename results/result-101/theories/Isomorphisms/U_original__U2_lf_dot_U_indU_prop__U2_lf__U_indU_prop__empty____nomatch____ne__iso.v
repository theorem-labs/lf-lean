From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_emptyU_str__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__exp____match__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_ascii__ascii__iso Isomorphisms.U_original__U_false__iso Isomorphisms.iff__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_empty__nomatch__ne : forall (x : imported_Ascii_ascii) (x0 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii),
  imported_iff
    (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_cons x x0) (imported_Original_LF__DOT__IndProp_LF_IndProp_EmptyStr imported_Ascii_ascii))
    imported_Original_False := Imported.Original_LF__DOT__IndProp_LF_IndProp_empty__nomatch__ne.
Instance Original_LF__DOT__IndProp_LF_IndProp_empty__nomatch__ne_iso : forall (x1 : Ascii.ascii) (x2 : imported_Ascii_ascii) (hx : rel_iso Ascii_ascii_iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list Ascii.ascii)
    (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii) (hx0 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso Ascii_ascii_iso) x3 x4),
  rel_iso
    {|
      to :=
        iff_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx hx0) (Original_LF__DOT__IndProp_LF_IndProp_EmptyStr_iso Ascii_ascii_iso))
          Original_False_iso;
      from :=
        from
          (iff_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx hx0) (Original_LF__DOT__IndProp_LF_IndProp_EmptyStr_iso Ascii_ascii_iso))
             Original_False_iso);
      to_from :=
        fun
          x : imported_iff
                (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_cons x2 x4)
                   (imported_Original_LF__DOT__IndProp_LF_IndProp_EmptyStr imported_Ascii_ascii))
                imported_Original_False =>
        to_from
          (iff_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx hx0) (Original_LF__DOT__IndProp_LF_IndProp_EmptyStr_iso Ascii_ascii_iso))
             Original_False_iso)
          x;
      from_to :=
        fun x : Original.LF_DOT_IndProp.LF.IndProp.exp_match (Original.LF_DOT_Poly.LF.Poly.cons x1 x3) Original.LF_DOT_IndProp.LF.IndProp.EmptyStr <-> Original.False =>
        seq_p_of_t
          (from_to
             (iff_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx hx0) (Original_LF__DOT__IndProp_LF_IndProp_EmptyStr_iso Ascii_ascii_iso))
                Original_False_iso)
             x)
    |} (Original.LF_DOT_IndProp.LF.IndProp.empty_nomatch_ne x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_empty__nomatch__ne x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.empty_nomatch_ne := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_empty__nomatch__ne := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.empty_nomatch_ne Original_LF__DOT__IndProp_LF_IndProp_empty__nomatch__ne_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.empty_nomatch_ne Imported.Original_LF__DOT__IndProp_LF_IndProp_empty__nomatch__ne Original_LF__DOT__IndProp_LF_IndProp_empty__nomatch__ne_iso := {}.