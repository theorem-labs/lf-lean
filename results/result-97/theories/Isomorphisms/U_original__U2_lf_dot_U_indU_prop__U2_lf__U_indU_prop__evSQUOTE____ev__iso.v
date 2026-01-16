From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_evU_playground__ev__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__evSQUOTE__iso Isomorphisms.iff__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_ev'__ev : forall x : imported_nat, imported_iff (imported_Original_LF__DOT__IndProp_LF_IndProp_ev' x) (imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev x) := Imported.Original_LF__DOT__IndProp_LF_IndProp_ev'__ev.
Instance Original_LF__DOT__IndProp_LF_IndProp_ev'__ev_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso (relax_Iso_Ts_Ps (iff_iso (Original_LF__DOT__IndProp_LF_IndProp_ev'_iso hx) (Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso hx))) (Original.LF_DOT_IndProp.LF.IndProp.ev'_ev x1)
    (imported_Original_LF__DOT__IndProp_LF_IndProp_ev'__ev x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.ev'_ev := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_ev'__ev := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.ev'_ev Original_LF__DOT__IndProp_LF_IndProp_ev'__ev_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.ev'_ev Imported.Original_LF__DOT__IndProp_LF_IndProp_ev'__ev Original_LF__DOT__IndProp_LF_IndProp_ev'__ev_iso := {}.