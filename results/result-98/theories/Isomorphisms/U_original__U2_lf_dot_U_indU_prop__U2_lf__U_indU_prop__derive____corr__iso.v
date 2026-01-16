From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__derive__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__derives__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_derive__corr : forall (x : imported_Ascii_ascii) (x0 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii) (x1 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii),
  imported_iff (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_cons x x1) x0)
    (imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x1 (imported_Original_LF__DOT__IndProp_LF_IndProp_derive x x0)) := Imported.Original_LF__DOT__IndProp_LF_IndProp_derive__corr.
Instance Original_LF__DOT__IndProp_LF_IndProp_derive__corr_iso : forall (x1 : Ascii.ascii) (x2 : imported_Ascii_ascii) (hx : rel_iso Ascii_ascii_iso x1 x2) (x3 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp Ascii.ascii)
    (x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp imported_Ascii_ascii) (hx0 : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso Ascii_ascii_iso) x3 x4)
    (x5 : Original.LF_DOT_Poly.LF.Poly.list Ascii.ascii) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_Ascii_ascii)
    (hx1 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso Ascii_ascii_iso) x5 x6),
  rel_iso
    (relax_Iso_Ts_Ps
       (iff_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx hx1) hx0)
          (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx1 (Original_LF__DOT__IndProp_LF_IndProp_derive_iso hx hx0))))
    (Original.LF_DOT_IndProp.LF.IndProp.derive_corr x1 x3 x5) (imported_Original_LF__DOT__IndProp_LF_IndProp_derive__corr x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.derive_corr := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_derive__corr := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.derive_corr Original_LF__DOT__IndProp_LF_IndProp_derive__corr_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.derive_corr Imported.Original_LF__DOT__IndProp_LF_IndProp_derive__corr Original_LF__DOT__IndProp_LF_IndProp_derive__corr_iso := {}.