From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_logic__not__iso Isomorphisms.nat__iso Isomorphisms.or__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_restricted__excluded__middle__eq : forall x x0 : imported_nat, imported_or (imported_Corelib_Init_Logic_eq x x0) (imported_Corelib_Init_Logic_eq x x0 -> imported_False) := Imported.Original_LF__DOT__Logic_LF_Logic_restricted__excluded__middle__eq.
Instance Original_LF__DOT__Logic_LF_Logic_restricted__excluded__middle__eq_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4),
  rel_iso
    {|
      to := or_iso (Corelib_Init_Logic_eq_iso hx hx0) (IsoArrow (Corelib_Init_Logic_eq_iso hx hx0) False_iso);
      from := from (or_iso (Corelib_Init_Logic_eq_iso hx hx0) (IsoArrow (Corelib_Init_Logic_eq_iso hx hx0) False_iso));
      to_from :=
        fun x : imported_or (imported_Corelib_Init_Logic_eq x2 x4) (imported_Corelib_Init_Logic_eq x2 x4 -> imported_False) =>
        to_from (or_iso (Corelib_Init_Logic_eq_iso hx hx0) (IsoArrow (Corelib_Init_Logic_eq_iso hx hx0) False_iso)) x;
      from_to := fun x : x1 = x3 \/ x1 <> x3 => seq_p_of_t (from_to (or_iso (Corelib_Init_Logic_eq_iso hx hx0) (IsoArrow (Corelib_Init_Logic_eq_iso hx hx0) False_iso)) x)
    |} (Original.LF_DOT_Logic.LF.Logic.restricted_excluded_middle_eq x1 x3) (imported_Original_LF__DOT__Logic_LF_Logic_restricted__excluded__middle__eq x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.restricted_excluded_middle_eq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_restricted__excluded__middle__eq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.restricted_excluded_middle_eq Original_LF__DOT__Logic_LF_Logic_restricted__excluded__middle__eq_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.restricted_excluded_middle_eq Imported.Original_LF__DOT__Logic_LF_Logic_restricted__excluded__middle__eq Original_LF__DOT__Logic_LF_Logic_restricted__excluded__middle__eq_iso := {}.