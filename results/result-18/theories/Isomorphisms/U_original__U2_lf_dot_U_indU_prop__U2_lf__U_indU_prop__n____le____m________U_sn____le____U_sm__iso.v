From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_s__iso Isomorphisms.le__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_n__le__m____Sn__le__Sm : forall x x0 : imported_nat, imported_le x x0 -> imported_le (imported_S x) (imported_S x0) := Imported.Original_LF__DOT__IndProp_LF_IndProp_n__le__m____Sn__le__Sm.
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_n__le__m____Sn__le__Sm_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : x1 <= x3) (x6 : imported_le x2 x4),
  rel_iso (le_iso hx hx0) x5 x6 ->
  rel_iso (le_iso (S_iso hx) (S_iso hx0)) (Original.LF_DOT_IndProp.LF.IndProp.n_le_m__Sn_le_Sm x1 x3 x5) (imported_Original_LF__DOT__IndProp_LF_IndProp_n__le__m____Sn__le__Sm x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.n_le_m__Sn_le_Sm := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_n__le__m____Sn__le__Sm := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.n_le_m__Sn_le_Sm Original_LF__DOT__IndProp_LF_IndProp_n__le__m____Sn__le__Sm_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.n_le_m__Sn_le_Sm Imported.Original_LF__DOT__IndProp_LF_IndProp_n__le__m____Sn__le__Sm Original_LF__DOT__IndProp_LF_IndProp_n__le__m____Sn__le__Sm_iso := {}.