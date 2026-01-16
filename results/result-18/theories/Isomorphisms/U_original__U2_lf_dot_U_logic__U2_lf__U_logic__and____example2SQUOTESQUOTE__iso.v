From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_nat__add__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_and__example2'' : forall x x0 : imported_nat, imported_Corelib_Init_Logic_eq x imported_0 -> imported_Corelib_Init_Logic_eq x0 imported_0 -> imported_Corelib_Init_Logic_eq (imported_Nat_add x x0) imported_0 := Imported.Original_LF__DOT__Logic_LF_Logic_and__example2''.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_and__example2''_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : x1 = 0) (x6 : imported_Corelib_Init_Logic_eq x2 imported_0),
  rel_iso (Corelib_Init_Logic_eq_iso hx _0_iso) x5 x6 ->
  forall (x7 : x3 = 0) (x8 : imported_Corelib_Init_Logic_eq x4 imported_0),
  rel_iso (Corelib_Init_Logic_eq_iso hx0 _0_iso) x7 x8 ->
  rel_iso (Corelib_Init_Logic_eq_iso (Nat_add_iso hx hx0) _0_iso) (Original.LF_DOT_Logic.LF.Logic.and_example2'' x1 x3 x5 x7) (imported_Original_LF__DOT__Logic_LF_Logic_and__example2'' x6 x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.and_example2'' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_and__example2'' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.and_example2'' Original_LF__DOT__Logic_LF_Logic_and__example2''_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.and_example2'' Imported.Original_LF__DOT__Logic_LF_Logic_and__example2'' Original_LF__DOT__Logic_LF_Logic_and__example2''_iso := {}.