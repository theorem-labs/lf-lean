From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_nat__add__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_evU_playground__ev__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_ev5__nonsense : imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev (imported_S (imported_S (imported_S (iterate1 imported_S (2)%nat imported_0)))) ->
  imported_Corelib_Init_Logic_eq (imported_Nat_add (imported_S (imported_S imported_0)) (imported_S (imported_S imported_0))) (imported_S (imported_S (imported_S (iterate1 imported_S (6)%nat imported_0)))) := Imported.Original_LF__DOT__IndProp_LF_IndProp_ev5__nonsense.
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_ev5__nonsense_iso : forall (x1 : Original.LF_DOT_IndProp.LF.IndProp.EvPlayground.ev 5)
    (x2 : imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev (imported_S (imported_S (imported_S (iterate1 imported_S (2)%nat imported_0))))),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso (2)%nat (0)%nat imported_0 _0_iso))))) x1 x2 ->
  rel_iso (Corelib_Init_Logic_eq_iso (Nat_add_iso (S_iso (S_iso _0_iso)) (S_iso (S_iso _0_iso))) (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso (6)%nat (0)%nat imported_0 _0_iso)))))
    (Original.LF_DOT_IndProp.LF.IndProp.ev5_nonsense x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_ev5__nonsense x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.ev5_nonsense := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_ev5__nonsense := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.ev5_nonsense Original_LF__DOT__IndProp_LF_IndProp_ev5__nonsense_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.ev5_nonsense Imported.Original_LF__DOT__IndProp_LF_IndProp_ev5__nonsense Original_LF__DOT__IndProp_LF_IndProp_ev5__nonsense_iso := {}.