From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Unset Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_nat__add__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_add__comm3__take2 : forall x x0 x1 : imported_nat, imported_Corelib_Init_Logic_eq (imported_Nat_add x (imported_Nat_add x0 x1)) (imported_Nat_add (imported_Nat_add x1 x0) x) := Imported.Original_LF__DOT__Logic_LF_Logic_add__comm3__take2.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_add__comm3__take2_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6),
  rel_iso (Corelib_Init_Logic_eq_iso (Nat_add_iso hx (Nat_add_iso hx0 hx1)) (Nat_add_iso (Nat_add_iso hx1 hx0) hx)) (Original.LF_DOT_Logic.LF.Logic.add_comm3_take2 x1 x3 x5)
    (imported_Original_LF__DOT__Logic_LF_Logic_add__comm3__take2 x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.add_comm3_take2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_add__comm3__take2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.add_comm3_take2 Original_LF__DOT__Logic_LF_Logic_add__comm3__take2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.add_comm3_take2 Imported.Original_LF__DOT__Logic_LF_Logic_add__comm3__take2 Original_LF__DOT__Logic_LF_Logic_add__comm3__take2_iso := {}.