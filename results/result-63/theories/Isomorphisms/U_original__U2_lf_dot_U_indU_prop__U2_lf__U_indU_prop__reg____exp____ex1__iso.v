From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_char__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__exp____match__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.__0__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp__ex1 : imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S imported_0) (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat))
    (imported_Original_LF__DOT__IndProp_LF_IndProp_Char (imported_S imported_0)) := Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp__ex1.
Instance Original_LF__DOT__IndProp_LF_IndProp_reg__exp__ex1_iso : rel_iso
    (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso _0_iso) (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso))
       (Original_LF__DOT__IndProp_LF_IndProp_Char_iso (S_iso _0_iso)))
    Original.LF_DOT_IndProp.LF.IndProp.reg_exp_ex1 imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp__ex1.
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.reg_exp_ex1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp__ex1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.reg_exp_ex1 Original_LF__DOT__IndProp_LF_IndProp_reg__exp__ex1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.reg_exp_ex1 Imported.Original_LF__DOT__IndProp_LF_IndProp_reg__exp__ex1 Original_LF__DOT__IndProp_LF_IndProp_reg__exp__ex1_iso := {}.