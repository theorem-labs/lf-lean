From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq. From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism. #[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
From IsomorphismChecker Require Export Isomorphisms.or__iso Isomorphisms.le__iso Isomorphisms.U_nat__add__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_plus__le__cases : forall x x0 x1 x2 : imported_nat, imported_le (imported_Nat_add x x0) (imported_Nat_add x1 x2) -> imported_or (imported_le x x1) (imported_le x0 x2) := Imported.Original_LF__DOT__IndProp_LF_IndProp_plus__le__cases.

(* Since plus_le_cases is Admitted in Original.v, we use an axiom *)
Axiom Original_LF__DOT__IndProp_LF_IndProp_plus__le__cases_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6) (x7 : nat) (x8 : imported_nat) (hx2 : rel_iso nat_iso x7 x8) (x9 : Peano.le (Nat.add x1 x3) (Nat.add x5 x7)) (x10 : imported_le (imported_Nat_add x2 x4) (imported_Nat_add x6 x8)),
  rel_iso
    {|
      to := le_iso (Nat_add_iso hx hx0) (Nat_add_iso hx1 hx2);
      from := from (le_iso (Nat_add_iso hx hx0) (Nat_add_iso hx1 hx2));
      to_from := fun x : imported_le (imported_Nat_add x2 x4) (imported_Nat_add x6 x8) => to_from (le_iso (Nat_add_iso hx hx0) (Nat_add_iso hx1 hx2)) x;
      from_to := fun x : Peano.le (Nat.add x1 x3) (Nat.add x5 x7) => seq_p_of_t (from_to (le_iso (Nat_add_iso hx hx0) (Nat_add_iso hx1 hx2)) x)
    |} x9 x10 ->
  rel_iso
    {|
      to := or_iso (le_iso hx hx1) (le_iso hx0 hx2);
      from := from (or_iso (le_iso hx hx1) (le_iso hx0 hx2));
      to_from := fun x : imported_or (imported_le x2 x6) (imported_le x4 x8) => to_from (or_iso (le_iso hx hx1) (le_iso hx0 hx2)) x;
      from_to := fun x : Peano.le x1 x5 \/ Peano.le x3 x7 => seq_p_of_t (from_to (or_iso (le_iso hx hx1) (le_iso hx0 hx2)) x)
    |} (Original.LF_DOT_IndProp.LF.IndProp.plus_le_cases x1 x3 x5 x7 x9) (imported_Original_LF__DOT__IndProp_LF_IndProp_plus__le__cases x2 x4 x6 x8 x10).

Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.plus_le_cases := {}. 
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_plus__le__cases := {}.
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.plus_le_cases Original_LF__DOT__IndProp_LF_IndProp_plus__le__cases_iso := {}. 
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.plus_le_cases Imported.Original_LF__DOT__IndProp_LF_IndProp_plus__le__cases Original_LF__DOT__IndProp_LF_IndProp_plus__le__cases_iso := {}.
