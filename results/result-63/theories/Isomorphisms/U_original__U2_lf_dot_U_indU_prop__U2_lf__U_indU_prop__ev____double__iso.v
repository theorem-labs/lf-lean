From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_evU_playground__ev__iso Isomorphisms.U_original__U2_lf_dot_U_induction__U2_lf__U_induction__double__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_ev__double : forall x : imported_nat, imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev (imported_Original_LF__DOT__Induction_LF_Induction_double x) := Imported.Original_LF__DOT__IndProp_LF_IndProp_ev__double.
Instance Original_LF__DOT__IndProp_LF_IndProp_ev__double_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso (Original_LF__DOT__Induction_LF_Induction_double_iso hx)) (Original.LF_DOT_IndProp.LF.IndProp.ev_double x1)
    (imported_Original_LF__DOT__IndProp_LF_IndProp_ev__double x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.ev_double := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_ev__double := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.ev_double Original_LF__DOT__IndProp_LF_IndProp_ev__double_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.ev_double Imported.Original_LF__DOT__IndProp_LF_IndProp_ev__double Original_LF__DOT__IndProp_LF_IndProp_ev__double_iso := {}.