From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_nat__add__iso Isomorphisms.and__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_plus__is__O : forall x x0 : imported_nat,
  imported_Corelib_Init_Logic_eq (imported_Nat_add x x0) imported_0 -> imported_and (imported_Corelib_Init_Logic_eq x imported_0) (imported_Corelib_Init_Logic_eq x0 imported_0) := Imported.Original_LF__DOT__Logic_LF_Logic_plus__is__O.
Instance Original_LF__DOT__Logic_LF_Logic_plus__is__O_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : x1 + x3 = 0)
    (x6 : imported_Corelib_Init_Logic_eq (imported_Nat_add x2 x4) imported_0),
  rel_iso
    {|
      to := Corelib_Init_Logic_eq_iso (Nat_add_iso hx hx0) _0_iso;
      from := from (Corelib_Init_Logic_eq_iso (Nat_add_iso hx hx0) _0_iso);
      to_from := fun x : imported_Corelib_Init_Logic_eq (imported_Nat_add x2 x4) imported_0 => to_from (Corelib_Init_Logic_eq_iso (Nat_add_iso hx hx0) _0_iso) x;
      from_to := fun x : x1 + x3 = 0 => seq_p_of_t (from_to (Corelib_Init_Logic_eq_iso (Nat_add_iso hx hx0) _0_iso) x)
    |} x5 x6 ->
  rel_iso
    {|
      to := and_iso (Corelib_Init_Logic_eq_iso hx _0_iso) (Corelib_Init_Logic_eq_iso hx0 _0_iso);
      from := from (and_iso (Corelib_Init_Logic_eq_iso hx _0_iso) (Corelib_Init_Logic_eq_iso hx0 _0_iso));
      to_from :=
        fun x : imported_and (imported_Corelib_Init_Logic_eq x2 imported_0) (imported_Corelib_Init_Logic_eq x4 imported_0) =>
        to_from (and_iso (Corelib_Init_Logic_eq_iso hx _0_iso) (Corelib_Init_Logic_eq_iso hx0 _0_iso)) x;
      from_to := fun x : x1 = 0 /\ x3 = 0 => seq_p_of_t (from_to (and_iso (Corelib_Init_Logic_eq_iso hx _0_iso) (Corelib_Init_Logic_eq_iso hx0 _0_iso)) x)
    |} (Original.LF_DOT_Logic.LF.Logic.plus_is_O x1 x3 x5) (imported_Original_LF__DOT__Logic_LF_Logic_plus__is__O x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.plus_is_O := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_plus__is__O := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.plus_is_O Original_LF__DOT__Logic_LF_Logic_plus__is__O_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.plus_is_O Imported.Original_LF__DOT__Logic_LF_Logic_plus__is__O Original_LF__DOT__Logic_LF_Logic_plus__is__O_iso := {}.