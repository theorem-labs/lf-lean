From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_nat__add__iso.

Definition imported_Original_LF__DOT__Induction_LF_Induction_add__assoc'' : forall x x0 x1 : imported_nat, imported_Corelib_Init_Logic_eq (imported_Nat_add x (imported_Nat_add x0 x1)) (imported_Nat_add (imported_Nat_add x x0) x1) := Imported.Original_LF__DOT__Induction_LF_Induction_add__assoc''.
Instance Original_LF__DOT__Induction_LF_Induction_add__assoc''_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6),
  rel_iso (Corelib_Init_Logic_eq_iso (Nat_add_iso hx (Nat_add_iso hx0 hx1)) (Nat_add_iso (Nat_add_iso hx hx0) hx1)) (Original.LF_DOT_Induction.LF.Induction.add_assoc'' x1 x3 x5)
    (imported_Original_LF__DOT__Induction_LF_Induction_add__assoc'' x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.add_assoc'' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_add__assoc'' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.add_assoc'' Original_LF__DOT__Induction_LF_Induction_add__assoc''_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.add_assoc'' Imported.Original_LF__DOT__Induction_LF_Induction_add__assoc'' Original_LF__DOT__Induction_LF_Induction_add__assoc''_iso := {}.