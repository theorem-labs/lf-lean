From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_nat__add__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_plus__O__n'' : forall x : imported_nat, imported_Corelib_Init_Logic_eq (imported_Nat_add imported_0 x) x := Imported.Original_LF__DOT__Basics_LF_Basics_plus__O__n''.
Instance Original_LF__DOT__Basics_LF_Basics_plus__O__n''_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso (Corelib_Init_Logic_eq_iso (Nat_add_iso _0_iso hx) hx) (Original.LF_DOT_Basics.LF.Basics.plus_O_n'' x1) (imported_Original_LF__DOT__Basics_LF_Basics_plus__O__n'' x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.plus_O_n'' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_plus__O__n'' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.plus_O_n'' Original_LF__DOT__Basics_LF_Basics_plus__O__n''_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.plus_O_n'' Imported.Original_LF__DOT__Basics_LF_Basics_plus__O__n'' Original_LF__DOT__Basics_LF_Basics_plus__O__n''_iso := {}.