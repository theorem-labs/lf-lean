From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* Typeclasses Opaque rel_iso. *) *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__reg____exp__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match : forall x : Type, imported_Original_LF__DOT__Poly_LF_Poly_list x -> imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x -> SProp := (@Imported.Original_LF__DOT__IndProp_LF_IndProp_exp__match).

Instance Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso : (forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
     (_ : @rel_iso (Original.LF_DOT_Poly.LF.Poly.list x1) (imported_Original_LF__DOT__Poly_LF_Poly_list x2) (@Original_LF__DOT__Poly_LF_Poly_list_iso x1 x2 hx) x3 x4)
     (x5 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) (x6 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2)
     (_ : @rel_iso (Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2) (@Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso x1 x2 hx) x5 x6),
   Iso (@Original.LF_DOT_IndProp.LF.IndProp.exp_match x1 x3 x5) (@imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x2 x4 x6)).
Admitted.
Instance: KnownConstant (@Original.LF_DOT_IndProp.LF.IndProp.exp_match) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__IndProp_LF_IndProp_exp__match) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_IndProp.LF.IndProp.exp_match) Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_IndProp.LF.IndProp.exp_match) (@Imported.Original_LF__DOT__IndProp_LF_IndProp_exp__match) Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso := {}.