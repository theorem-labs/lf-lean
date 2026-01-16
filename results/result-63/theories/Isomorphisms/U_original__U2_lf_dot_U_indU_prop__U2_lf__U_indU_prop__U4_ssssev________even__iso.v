From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_evU_playground__ev__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_SSSSev____even : forall x : imported_nat,
  imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev (imported_S (imported_S (imported_S (iterate1 imported_S 1 x)))) -> imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev x := Imported.Original_LF__DOT__IndProp_LF_IndProp_SSSSev____even.
Instance Original_LF__DOT__IndProp_LF_IndProp_SSSSev____even_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : Original.LF_DOT_IndProp.LF.IndProp.EvPlayground.ev (S (S (S (S x1)))))
    (x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev (imported_S (imported_S (imported_S (iterate1 imported_S 1 x2))))),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 1 x1 x2 hx))))) x3 x4 ->
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso hx) (Original.LF_DOT_IndProp.LF.IndProp.SSSSev__even x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_SSSSev____even x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.SSSSev__even := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_SSSSev____even := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.SSSSev__even Original_LF__DOT__IndProp_LF_IndProp_SSSSev____even_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.SSSSev__even Imported.Original_LF__DOT__IndProp_LF_IndProp_SSSSev____even Original_LF__DOT__IndProp_LF_IndProp_SSSSev____even_iso := {}.