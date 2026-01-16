From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_nat__add__iso Isomorphisms.le__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_plus__le__compat__r : forall x x0 x1 : imported_nat, imported_le x x0 -> imported_le (imported_Nat_add x x1) (imported_Nat_add x0 x1) := Imported.Original_LF__DOT__IndProp_LF_IndProp_plus__le__compat__r.
Instance Original_LF__DOT__IndProp_LF_IndProp_plus__le__compat__r_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6)
    (x7 : x1 <= x3) (x8 : imported_le x2 x4),
  rel_iso (le_iso hx hx0) x7 x8 ->
  rel_iso (le_iso (Nat_add_iso hx hx1) (Nat_add_iso hx0 hx1)) (Original.LF_DOT_IndProp.LF.IndProp.plus_le_compat_r x1 x3 x5 x7)
    (imported_Original_LF__DOT__IndProp_LF_IndProp_plus__le__compat__r x6 x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.plus_le_compat_r := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_plus__le__compat__r := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.plus_le_compat_r Original_LF__DOT__IndProp_LF_IndProp_plus__le__compat__r_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.plus_le_compat_r Imported.Original_LF__DOT__IndProp_LF_IndProp_plus__le__compat__r Original_LF__DOT__IndProp_LF_IndProp_plus__le__compat__r_iso := {}.