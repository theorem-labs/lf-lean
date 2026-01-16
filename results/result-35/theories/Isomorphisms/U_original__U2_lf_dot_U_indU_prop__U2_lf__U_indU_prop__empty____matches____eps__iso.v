From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_emptyU_str__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__exp____match__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__string__iso Isomorphisms.iff__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_empty__matches__eps : forall x : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii,
  imported_iff (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x (imported_Original_LF__DOT__IndProp_LF_IndProp_EmptyStr imported_Ascii_ascii))
    (imported_Corelib_Init_Logic_eq x (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_Ascii_ascii)) := Imported.Original_LF__DOT__IndProp_LF_IndProp_empty__matches__eps.
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_empty__matches__eps_iso : forall (x1 : Original.LF_DOT_IndProp.LF.IndProp.string) (x2 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii)
    (hx : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso Ascii_ascii_iso) x1 x2),
  rel_iso
    (relax_Iso_Ts_Ps
       (iff_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx (Original_LF__DOT__IndProp_LF_IndProp_EmptyStr_iso Ascii_ascii_iso))
          (Corelib_Init_Logic_eq_iso hx (Original_LF__DOT__Poly_LF_Poly_nil_iso Ascii_ascii_iso))))
    (Original.LF_DOT_IndProp.LF.IndProp.empty_matches_eps x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_empty__matches__eps x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.empty_matches_eps := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_empty__matches__eps := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.empty_matches_eps Original_LF__DOT__IndProp_LF_IndProp_empty__matches__eps_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.empty_matches_eps Imported.Original_LF__DOT__IndProp_LF_IndProp_empty__matches__eps Original_LF__DOT__IndProp_LF_IndProp_empty__matches__eps_iso := {}.