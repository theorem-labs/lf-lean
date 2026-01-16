From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_evU_playground__ev__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__U_even__iso Isomorphisms.iff__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_ev__Even__iff : forall x : imported_nat, imported_iff (imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev x) (imported_Original_LF__DOT__Logic_LF_Logic_Even x) := Imported.Original_LF__DOT__IndProp_LF_IndProp_ev__Even__iff.
Instance Original_LF__DOT__IndProp_LF_IndProp_ev__Even__iff_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso
    {|
      to := iff_iso (Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso hx) (Original_LF__DOT__Logic_LF_Logic_Even_iso hx);
      from := from (iff_iso (Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso hx) (Original_LF__DOT__Logic_LF_Logic_Even_iso hx));
      to_from :=
        fun x : imported_iff (imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev x2) (imported_Original_LF__DOT__Logic_LF_Logic_Even x2) =>
        to_from (iff_iso (Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso hx) (Original_LF__DOT__Logic_LF_Logic_Even_iso hx)) x;
      from_to :=
        fun x : Original.LF_DOT_IndProp.LF.IndProp.EvPlayground.ev x1 <-> Original.LF_DOT_Logic.LF.Logic.Even x1 =>
        seq_p_of_t (from_to (iff_iso (Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso hx) (Original_LF__DOT__Logic_LF_Logic_Even_iso hx)) x)
    |} (Original.LF_DOT_IndProp.LF.IndProp.ev_Even_iff x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_ev__Even__iff x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.ev_Even_iff := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_ev__Even__iff := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.ev_Even_iff Original_LF__DOT__IndProp_LF_IndProp_ev__Even__iff_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.ev_Even_iff Imported.Original_LF__DOT__IndProp_LF_IndProp_ev__Even__iff Original_LF__DOT__IndProp_LF_IndProp_ev__Even__iff_iso := {}.