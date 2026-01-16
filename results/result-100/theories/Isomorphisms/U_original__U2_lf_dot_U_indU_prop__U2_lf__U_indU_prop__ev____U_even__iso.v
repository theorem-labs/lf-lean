From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_evU_playground__ev__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__U_even__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_ev__Even : forall x : imported_nat, imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev x -> imported_Original_LF__DOT__Logic_LF_Logic_Even x := Imported.Original_LF__DOT__IndProp_LF_IndProp_ev__Even.
Instance Original_LF__DOT__IndProp_LF_IndProp_ev__Even_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : Original.LF_DOT_IndProp.LF.IndProp.EvPlayground.ev x1)
    (x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev x2),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso hx) x3 x4 ->
  rel_iso (Original_LF__DOT__Logic_LF_Logic_Even_iso hx) (Original.LF_DOT_IndProp.LF.IndProp.ev_Even x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_ev__Even x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.ev_Even := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_ev__Even := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.ev_Even Original_LF__DOT__IndProp_LF_IndProp_ev__Even_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.ev_Even Imported.Original_LF__DOT__IndProp_LF_IndProp_ev__Even Original_LF__DOT__IndProp_LF_IndProp_ev__Even_iso := {}.