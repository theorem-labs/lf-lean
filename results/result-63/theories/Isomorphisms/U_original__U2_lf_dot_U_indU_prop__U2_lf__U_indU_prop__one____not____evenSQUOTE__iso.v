From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.__0__iso Isomorphisms.U_logic__not__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_evU_playground__ev__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_one__not__even' : imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev (imported_S imported_0) -> imported_False := Imported.Original_LF__DOT__IndProp_LF_IndProp_one__not__even'.
Instance Original_LF__DOT__IndProp_LF_IndProp_one__not__even'_iso : forall (x1 : Original.LF_DOT_IndProp.LF.IndProp.EvPlayground.ev 1) (x2 : imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev (imported_S imported_0)),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso (S_iso _0_iso)) x1 x2 ->
  rel_iso False_iso (Original.LF_DOT_IndProp.LF.IndProp.one_not_even' x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_one__not__even' x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.one_not_even' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_one__not__even' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.one_not_even' Original_LF__DOT__IndProp_LF_IndProp_one__not__even'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.one_not_even' Imported.Original_LF__DOT__IndProp_LF_IndProp_one__not__even' Original_LF__DOT__IndProp_LF_IndProp_one__not__even'_iso := {}.