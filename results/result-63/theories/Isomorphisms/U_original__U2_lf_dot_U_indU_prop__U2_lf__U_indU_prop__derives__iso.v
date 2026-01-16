From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__is____der__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_derives : (imported_Ascii_ascii -> imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii -> imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii) -> SProp := fun x : imported_Ascii_ascii -> imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii -> imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii =>
  forall (a' : imported_Ascii_ascii) (a'0 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii) (a'1 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii),
  imported_iff (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_cons a' a'1) a'0)
    (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match a'1 (x a' a'0)).
Instance Original_LF__DOT__IndProp_LF_IndProp_derives_iso : forall (x1 : Ascii.ascii -> Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii -> Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii)
    (x2 : imported_Ascii_ascii -> imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii -> imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii),
  (forall (x3 : Ascii.ascii) (x4 : imported_Ascii_ascii),
   rel_iso Ascii_ascii_iso x3 x4 ->
   forall (x5 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii) (x6 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii),
   rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso Ascii_ascii_iso) x5 x6 -> rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso Ascii_ascii_iso) (x1 x3 x5) (x2 x4 x6)) ->
  Iso (Original.LF_DOT_IndProp.LF.IndProp.derives x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_derives x2)
  := fun (x1 : Ascii.ascii -> Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii -> Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii)
    (x2 : imported_Ascii_ascii -> imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii -> imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii)
    (hx : forall (x3 : Ascii.ascii) (x4 : imported_Ascii_ascii),
          rel_iso Ascii_ascii_iso x3 x4 ->
          forall (x5 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii) (x6 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii),
          rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso Ascii_ascii_iso) x5 x6 -> rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso Ascii_ascii_iso) (x1 x3 x5) (x2 x4 x6)) =>
  IsoForall (fun a : Ascii.ascii => forall re : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii, Original.LF_DOT_IndProp.LF.IndProp.is_der re a (x1 a re))
    (fun x4 : imported_Ascii_ascii =>
     forall (a' : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii) (a'0 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii),
     imported_iff (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_cons x4 a'0) a')
       (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match a'0 (x2 x4 a')))
    (fun (x3 : Ascii.ascii) (x4 : imported_Ascii_ascii) (hx0 : rel_iso Ascii_ascii_iso x3 x4) =>
     IsoForall (fun a : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii => Original.LF_DOT_IndProp.LF.IndProp.is_der a x3 (x1 x3 a))
       (fun x6 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii =>
        forall a' : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii,
        imported_iff (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_cons x4 a') x6)
          (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match a' (x2 x4 x6)))
       (fun (x5 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii) (x6 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii)
          (hx1 : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso Ascii_ascii_iso) x5 x6) =>
        IsoForall
          (fun a : Original.LF_DOT_Poly.LF.Poly.list Ascii.ascii =>
           Original.LF_DOT_IndProp.LF.IndProp.exp_match (Original.LF_DOT_Poly.LF.Poly.cons x3 a) x5 <-> Original.LF_DOT_IndProp.LF.IndProp.exp_match a (x1 x3 x5))
          (fun x8 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii =>
           imported_iff (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_cons x4 x8) x6)
             (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x8 (x2 x4 x6)))
          (fun (x7 : Original.LF_DOT_Poly.LF.Poly.list Ascii.ascii) (x8 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii)
             (hx2 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso Ascii_ascii_iso) x7 x8) =>
           {|
             to :=
               iff_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx0 hx2) hx1)
                 (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx2 (hx x3 x4 hx0 x5 x6 hx1));
             from :=
               from
                 (iff_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx0 hx2) hx1)
                    (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx2 (hx x3 x4 hx0 x5 x6 hx1)));
             to_from :=
               fun
                 x : imported_iff (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_cons x4 x8) x6)
                       (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x8 (x2 x4 x6)) =>
               to_from
                 (iff_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx0 hx2) hx1)
                    (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx2 (hx x3 x4 hx0 x5 x6 hx1)))
                 x;
             from_to :=
               fun x : Original.LF_DOT_IndProp.LF.IndProp.exp_match (Original.LF_DOT_Poly.LF.Poly.cons x3 x7) x5 <-> Original.LF_DOT_IndProp.LF.IndProp.exp_match x7 (x1 x3 x5) =>
               seq_p_of_t
                 (from_to
                    (iff_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx0 hx2) hx1)
                       (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx2 (hx x3 x4 hx0 x5 x6 hx1)))
                    x)
           |}))).

Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.derives := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_derives := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.derives Original_LF__DOT__IndProp_LF_IndProp_derives_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.derives Imported.Original_LF__DOT__IndProp_LF_IndProp_derives Original_LF__DOT__IndProp_LF_IndProp_derives_iso := {}.