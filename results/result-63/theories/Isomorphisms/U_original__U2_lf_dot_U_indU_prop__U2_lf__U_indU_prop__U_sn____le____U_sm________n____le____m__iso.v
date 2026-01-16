From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_s__iso Isomorphisms.le__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_Sn__le__Sm____n__le__m : forall x x0 : imported_nat, imported_le (imported_S x) (imported_S x0) -> imported_le x x0 := Imported.Original_LF__DOT__IndProp_LF_IndProp_Sn__le__Sm____n__le__m.
Instance Original_LF__DOT__IndProp_LF_IndProp_Sn__le__Sm____n__le__m_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : S x1 <= S x3)
    (x6 : imported_le (imported_S x2) (imported_S x4)),
  rel_iso (le_iso (S_iso hx) (S_iso hx0)) x5 x6 ->
  rel_iso (le_iso hx hx0) (Original.LF_DOT_IndProp.LF.IndProp.Sn_le_Sm__n_le_m x1 x3 x5) (imported_Original_LF__DOT__IndProp_LF_IndProp_Sn__le__Sm____n__le__m x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.Sn_le_Sm__n_le_m := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_Sn__le__Sm____n__le__m := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.Sn_le_Sm__n_le_m Original_LF__DOT__IndProp_LF_IndProp_Sn__le__Sm____n__le__m_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.Sn_le_Sm__n_le_m Imported.Original_LF__DOT__IndProp_LF_IndProp_Sn__le__Sm____n__le__m Original_LF__DOT__IndProp_LF_IndProp_Sn__le__Sm____n__le__m_iso := {}.