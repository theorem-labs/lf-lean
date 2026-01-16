From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_emptyU_set__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__exp____match__iso Isomorphisms.U_original__U_false__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__string__iso Isomorphisms.iff__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_null__matches__none : forall x : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii,
  imported_iff (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x (imported_Original_LF__DOT__IndProp_LF_IndProp_EmptySet imported_Ascii_ascii)) imported_Original_False := Imported.Original_LF__DOT__IndProp_LF_IndProp_null__matches__none.
Instance Original_LF__DOT__IndProp_LF_IndProp_null__matches__none_iso : forall (x1 : Original.LF_DOT_IndProp.LF.IndProp.string) (x2 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii)
    (hx : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso Ascii_ascii_iso) x1 x2),
  rel_iso (relax_Iso_Ts_Ps (iff_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx (Original_LF__DOT__IndProp_LF_IndProp_EmptySet_iso Ascii_ascii_iso)) Original_False_iso))
    (Original.LF_DOT_IndProp.LF.IndProp.null_matches_none x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_null__matches__none x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.null_matches_none := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_null__matches__none := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.null_matches_none Original_LF__DOT__IndProp_LF_IndProp_null__matches__none_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.null_matches_none Imported.Original_LF__DOT__IndProp_LF_IndProp_null__matches__none Original_LF__DOT__IndProp_LF_IndProp_null__matches__none_iso := {}.