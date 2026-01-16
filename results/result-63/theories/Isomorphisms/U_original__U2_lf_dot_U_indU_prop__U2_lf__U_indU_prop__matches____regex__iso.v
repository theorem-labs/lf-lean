From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__exp____match__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__reflect__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__string__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_matches__regex : (imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii -> imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii -> imported_Original_LF__DOT__Basics_LF_Basics_bool) ->
  SProp := fun
    x : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii ->
        imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii -> imported_Original_LF__DOT__Basics_LF_Basics_bool =>
  forall (a' : imported_Original_LF__DOT__IndProp_LF_IndProp_string) (a'0 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii),
  imported_Original_LF__DOT__IndProp_LF_IndProp_reflect (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match a' a'0) (x a' a'0).
Instance Original_LF__DOT__IndProp_LF_IndProp_matches__regex_iso : forall (x1 : Original.LF_DOT_IndProp.LF.IndProp.string -> Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii -> Original.LF_DOT_Basics.LF.Basics.bool)
    (x2 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii ->
          imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii -> imported_Original_LF__DOT__Basics_LF_Basics_bool),
  (forall (x3 : Original.LF_DOT_IndProp.LF.IndProp.string) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii),
   rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso Ascii_ascii_iso) x3 x4 ->
   forall (x5 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii) (x6 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii),
   rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso Ascii_ascii_iso) x5 x6 -> rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (x1 x3 x5) (x2 x4 x6)) ->
  Iso (Original.LF_DOT_IndProp.LF.IndProp.matches_regex x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_matches__regex x2)
  := fun (x1 : Original.LF_DOT_IndProp.LF.IndProp.string -> Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii -> Original.LF_DOT_Basics.LF.Basics.bool)
    (x2 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii ->
          imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii -> imported_Original_LF__DOT__Basics_LF_Basics_bool)
    (hx : forall (x3 : Original.LF_DOT_IndProp.LF.IndProp.string) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii),
          rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso Ascii_ascii_iso) x3 x4 ->
          forall (x5 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii) (x6 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii),
          rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso Ascii_ascii_iso) x5 x6 -> rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (x1 x3 x5) (x2 x4 x6)) =>
  IsoForall
    (fun a : Original.LF_DOT_IndProp.LF.IndProp.string =>
     forall re : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii, Original.LF_DOT_IndProp.LF.IndProp.reflect (Original.LF_DOT_IndProp.LF.IndProp.exp_match a re) (x1 a re))
    (fun x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_string =>
     forall a' : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii,
     imported_Original_LF__DOT__IndProp_LF_IndProp_reflect (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x4 a') (x2 x4 a'))
    (fun (x3 : Original.LF_DOT_IndProp.LF.IndProp.string) (x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_string) (hx0 : rel_iso Original_LF__DOT__IndProp_LF_IndProp_string_iso x3 x4) =>
     IsoForall (fun a : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii => Original.LF_DOT_IndProp.LF.IndProp.reflect (Original.LF_DOT_IndProp.LF.IndProp.exp_match x3 a) (x1 x3 a))
       (fun x6 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii =>
        imported_Original_LF__DOT__IndProp_LF_IndProp_reflect (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x4 x6) (x2 x4 x6))
       (fun (x5 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii) (x6 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii)
          (hx1 : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso Ascii_ascii_iso) x5 x6) =>
        {|
          to := Original_LF__DOT__IndProp_LF_IndProp_reflect_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx0 hx1) (hx x3 x4 hx0 x5 x6 hx1);
          from := from (Original_LF__DOT__IndProp_LF_IndProp_reflect_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx0 hx1) (hx x3 x4 hx0 x5 x6 hx1));
          to_from :=
            fun x : imported_Original_LF__DOT__IndProp_LF_IndProp_reflect (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x4 x6) (x2 x4 x6) =>
            to_from (Original_LF__DOT__IndProp_LF_IndProp_reflect_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx0 hx1) (hx x3 x4 hx0 x5 x6 hx1)) x;
          from_to :=
            fun x : Original.LF_DOT_IndProp.LF.IndProp.reflect (Original.LF_DOT_IndProp.LF.IndProp.exp_match x3 x5) (x1 x3 x5) =>
            seq_p_of_t (from_to (Original_LF__DOT__IndProp_LF_IndProp_reflect_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx0 hx1) (hx x3 x4 hx0 x5 x6 hx1)) x)
        |})).

Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.matches_regex := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_matches__regex := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.matches_regex Original_LF__DOT__IndProp_LF_IndProp_matches__regex_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.matches_regex Imported.Original_LF__DOT__IndProp_LF_IndProp_matches__regex Original_LF__DOT__IndProp_LF_IndProp_matches__regex_iso := {}.