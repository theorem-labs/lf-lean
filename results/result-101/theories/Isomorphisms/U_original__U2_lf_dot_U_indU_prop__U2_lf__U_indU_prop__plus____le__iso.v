From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_nat__add__iso Isomorphisms.and__iso Isomorphisms.le__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_plus__le : forall x x0 x1 : imported_nat, imported_le (imported_Nat_add x x0) x1 -> imported_and (imported_le x x1) (imported_le x0 x1) := Imported.Original_LF__DOT__IndProp_LF_IndProp_plus__le.
Instance Original_LF__DOT__IndProp_LF_IndProp_plus__le_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6)
    (x7 : x1 + x3 <= x5) (x8 : imported_le (imported_Nat_add x2 x4) x6),
  rel_iso
    {|
      to := le_iso (Nat_add_iso hx hx0) hx1;
      from := from (le_iso (Nat_add_iso hx hx0) hx1);
      to_from := fun x : imported_le (imported_Nat_add x2 x4) x6 => to_from (le_iso (Nat_add_iso hx hx0) hx1) x;
      from_to := fun x : x1 + x3 <= x5 => seq_p_of_t (from_to (le_iso (Nat_add_iso hx hx0) hx1) x)
    |} x7 x8 ->
  rel_iso
    {|
      to := and_iso (le_iso hx hx1) (le_iso hx0 hx1);
      from := from (and_iso (le_iso hx hx1) (le_iso hx0 hx1));
      to_from := fun x : imported_and (imported_le x2 x6) (imported_le x4 x6) => to_from (and_iso (le_iso hx hx1) (le_iso hx0 hx1)) x;
      from_to := fun x : x1 <= x5 /\ x3 <= x5 => seq_p_of_t (from_to (and_iso (le_iso hx hx1) (le_iso hx0 hx1)) x)
    |} (Original.LF_DOT_IndProp.LF.IndProp.plus_le x1 x3 x5 x7) (imported_Original_LF__DOT__IndProp_LF_IndProp_plus__le x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.plus_le := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_plus__le := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.plus_le Original_LF__DOT__IndProp_LF_IndProp_plus__le_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.plus_le Imported.Original_LF__DOT__IndProp_LF_IndProp_plus__le Original_LF__DOT__IndProp_LF_IndProp_plus__le_iso := {}.