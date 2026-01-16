From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_nat__add__iso.

Definition imported_Original_LF__DOT__Induction_LF_Induction_add__0__r : forall x : imported_nat, imported_Corelib_Init_Logic_eq (imported_Nat_add x imported_0) x := Imported.Original_LF__DOT__Induction_LF_Induction_add__0__r.
Instance Original_LF__DOT__Induction_LF_Induction_add__0__r_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso (Corelib_Init_Logic_eq_iso (Nat_add_iso hx _0_iso) hx) (Original.LF_DOT_Induction.LF.Induction.add_0_r x1) (imported_Original_LF__DOT__Induction_LF_Induction_add__0__r x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.add_0_r := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_add__0__r := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.add_0_r Original_LF__DOT__Induction_LF_Induction_add__0__r_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.add_0_r Imported.Original_LF__DOT__Induction_LF_Induction_add__0__r Original_LF__DOT__Induction_LF_Induction_add__0__r_iso := {}.