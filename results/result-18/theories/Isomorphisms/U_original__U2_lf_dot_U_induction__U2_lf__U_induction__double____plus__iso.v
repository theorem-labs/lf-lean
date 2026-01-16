From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_nat__add__iso Isomorphisms.U_original__U2_lf_dot_U_induction__U2_lf__U_induction__double__iso.

Monomorphic Definition imported_Original_LF__DOT__Induction_LF_Induction_double__plus : forall x : imported_nat, imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Induction_LF_Induction_double x) (imported_Nat_add x x) := Imported.Original_LF__DOT__Induction_LF_Induction_double__plus.
Monomorphic Instance Original_LF__DOT__Induction_LF_Induction_double__plus_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Induction_LF_Induction_double_iso hx) (Nat_add_iso hx hx)) (Original.LF_DOT_Induction.LF.Induction.double_plus x1)
    (imported_Original_LF__DOT__Induction_LF_Induction_double__plus x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.double_plus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_double__plus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.double_plus Original_LF__DOT__Induction_LF_Induction_double__plus_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.double_plus Imported.Original_LF__DOT__Induction_LF_Induction_double__plus Original_LF__DOT__Induction_LF_Induction_double__plus_iso := {}.