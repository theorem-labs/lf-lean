From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_nat__add__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_plus__id__example : forall x x0 : imported_nat, imported_Corelib_Init_Logic_eq x x0 -> imported_Corelib_Init_Logic_eq (imported_Nat_add x x) (imported_Nat_add x0 x0) := Imported.Original_LF__DOT__Basics_LF_Basics_plus__id__example.
Instance Original_LF__DOT__Basics_LF_Basics_plus__id__example_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : x1 = x3) (x6 : imported_Corelib_Init_Logic_eq x2 x4),
  rel_iso (Corelib_Init_Logic_eq_iso hx hx0) x5 x6 ->
  rel_iso (Corelib_Init_Logic_eq_iso (Nat_add_iso hx hx) (Nat_add_iso hx0 hx0)) (Original.LF_DOT_Basics.LF.Basics.plus_id_example x1 x3 x5)
    (imported_Original_LF__DOT__Basics_LF_Basics_plus__id__example x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.plus_id_example := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_plus__id__example := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.plus_id_example Original_LF__DOT__Basics_LF_Basics_plus__id__example_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.plus_id_example Imported.Original_LF__DOT__Basics_LF_Basics_plus__id__example Original_LF__DOT__Basics_LF_Basics_plus__id__example_iso := {}.