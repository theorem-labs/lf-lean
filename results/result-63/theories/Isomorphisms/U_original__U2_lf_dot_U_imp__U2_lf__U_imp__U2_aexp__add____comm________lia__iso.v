From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_peanoU_nat__U_nat__add__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_add__comm____lia : forall x x0 : imported_nat, imported_Corelib_Init_Logic_eq (imported_PeanoNat_Nat_add x x0) (imported_PeanoNat_Nat_add x0 x) := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_add__comm____lia.
Instance Original_LF__DOT__Imp_LF_Imp_AExp_add__comm____lia_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4),
  rel_iso (Corelib_Init_Logic_eq_iso (PeanoNat_Nat_add_iso hx hx0) (PeanoNat_Nat_add_iso hx0 hx)) (Original.LF_DOT_Imp.LF.Imp.AExp.add_comm__lia x1 x3)
    (imported_Original_LF__DOT__Imp_LF_Imp_AExp_add__comm____lia x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.add_comm__lia := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_add__comm____lia := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.add_comm__lia Original_LF__DOT__Imp_LF_Imp_AExp_add__comm____lia_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.add_comm__lia Imported.Original_LF__DOT__Imp_LF_Imp_AExp_add__comm____lia Original_LF__DOT__Imp_LF_Imp_AExp_add__comm____lia_iso := {}.