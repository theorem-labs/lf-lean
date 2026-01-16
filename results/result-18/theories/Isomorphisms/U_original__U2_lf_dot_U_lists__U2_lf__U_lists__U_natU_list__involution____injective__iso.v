From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.nat__iso.

Monomorphic Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_involution__injective : forall x : imported_nat -> imported_nat,
  (forall x0 : imported_nat, imported_Corelib_Init_Logic_eq x0 (x (x x0))) -> forall x1 x2 : imported_nat, imported_Corelib_Init_Logic_eq (x x1) (x x2) -> imported_Corelib_Init_Logic_eq x1 x2 := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_involution__injective.
Monomorphic Instance Original_LF__DOT__Lists_LF_Lists_NatList_involution__injective_iso : forall (x1 : nat -> nat) (x2 : imported_nat -> imported_nat) (hx : forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> rel_iso nat_iso (x1 x3) (x2 x4))
    (x3 : forall n : nat, n = x1 (x1 n)) (x4 : forall x : imported_nat, imported_Corelib_Init_Logic_eq x (x2 (x2 x))),
  (forall (x5 : nat) (x6 : imported_nat) (hx0 : rel_iso nat_iso x5 x6), rel_iso (Corelib_Init_Logic_eq_iso hx0 (hx (x1 x5) (x2 x6) (hx x5 x6 hx0))) (x3 x5) (x4 x6)) ->
  forall (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6) (x7 : nat) (x8 : imported_nat) (hx2 : rel_iso nat_iso x7 x8) (x9 : x1 x5 = x1 x7)
    (x10 : imported_Corelib_Init_Logic_eq (x2 x6) (x2 x8)),
  rel_iso (Corelib_Init_Logic_eq_iso (hx x5 x6 hx1) (hx x7 x8 hx2)) x9 x10 ->
  rel_iso (Corelib_Init_Logic_eq_iso hx1 hx2) (Original.LF_DOT_Lists.LF.Lists.NatList.involution_injective x1 x3 x5 x7 x9)
    (imported_Original_LF__DOT__Lists_LF_Lists_NatList_involution__injective x2 x4 x6 x8 x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.involution_injective := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_involution__injective := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.involution_injective Original_LF__DOT__Lists_LF_Lists_NatList_involution__injective_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.involution_injective Imported.Original_LF__DOT__Lists_LF_Lists_NatList_involution__injective Original_LF__DOT__Lists_LF_Lists_NatList_involution__injective_iso := {}.