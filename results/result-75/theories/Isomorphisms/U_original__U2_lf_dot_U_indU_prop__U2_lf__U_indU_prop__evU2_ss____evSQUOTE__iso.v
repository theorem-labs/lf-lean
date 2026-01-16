From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_evU_playground__ev__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_evSS__ev' : forall x : imported_nat, imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev (imported_S (imported_S x)) -> imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev x := Imported.Original_LF__DOT__IndProp_LF_IndProp_evSS__ev'.
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_evSS__ev'_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : Original.LF_DOT_IndProp.LF.IndProp.EvPlayground.ev (S (S x1)))
    (x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev (imported_S (imported_S x2))),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso (S_iso (S_iso hx))) x3 x4 ->
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso hx) (Original.LF_DOT_IndProp.LF.IndProp.evSS_ev' x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_evSS__ev' x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.evSS_ev' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_evSS__ev' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.evSS_ev' Original_LF__DOT__IndProp_LF_IndProp_evSS__ev'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.evSS_ev' Imported.Original_LF__DOT__IndProp_LF_IndProp_evSS__ev' Original_LF__DOT__IndProp_LF_IndProp_evSS__ev'_iso := {}.