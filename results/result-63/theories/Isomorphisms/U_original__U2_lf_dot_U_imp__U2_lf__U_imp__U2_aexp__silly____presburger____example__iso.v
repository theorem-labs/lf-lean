From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_peanoU_nat__U_nat__add__iso Isomorphisms.U_s__iso Isomorphisms.and__iso Isomorphisms.le__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_silly__presburger__example : forall x x0 x1 x2 : imported_nat,
  imported_and (imported_le (imported_PeanoNat_Nat_add x x0) (imported_PeanoNat_Nat_add x0 x1))
    (imported_Corelib_Init_Logic_eq (imported_PeanoNat_Nat_add x1 (imported_S (imported_S (imported_S imported_0)))) (imported_PeanoNat_Nat_add x2 (imported_S (imported_S (imported_S imported_0))))) ->
  imported_le x x2 := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_silly__presburger__example.
Instance Original_LF__DOT__Imp_LF_Imp_AExp_silly__presburger__example_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6)
    (x7 : nat) (x8 : imported_nat) (hx2 : rel_iso nat_iso x7 x8) (x9 : x1 + x3 <= x3 + x5 /\ x5 + 3 = x7 + 3)
    (x10 : imported_and (imported_le (imported_PeanoNat_Nat_add x2 x4) (imported_PeanoNat_Nat_add x4 x6))
             (imported_Corelib_Init_Logic_eq (imported_PeanoNat_Nat_add x6 (imported_S (imported_S (imported_S imported_0))))
                (imported_PeanoNat_Nat_add x8 (imported_S (imported_S (imported_S imported_0)))))),
  rel_iso
    {|
      to :=
        and_iso (le_iso (PeanoNat_Nat_add_iso hx hx0) (PeanoNat_Nat_add_iso hx0 hx1))
          (Corelib_Init_Logic_eq_iso (PeanoNat_Nat_add_iso hx1 (S_iso (S_iso (S_iso _0_iso)))) (PeanoNat_Nat_add_iso hx2 (S_iso (S_iso (S_iso _0_iso)))));
      from :=
        from
          (and_iso (le_iso (PeanoNat_Nat_add_iso hx hx0) (PeanoNat_Nat_add_iso hx0 hx1))
             (Corelib_Init_Logic_eq_iso (PeanoNat_Nat_add_iso hx1 (S_iso (S_iso (S_iso _0_iso)))) (PeanoNat_Nat_add_iso hx2 (S_iso (S_iso (S_iso _0_iso))))));
      to_from :=
        fun
          x : imported_and (imported_le (imported_PeanoNat_Nat_add x2 x4) (imported_PeanoNat_Nat_add x4 x6))
                (imported_Corelib_Init_Logic_eq (imported_PeanoNat_Nat_add x6 (imported_S (imported_S (imported_S imported_0))))
                   (imported_PeanoNat_Nat_add x8 (imported_S (imported_S (imported_S imported_0))))) =>
        to_from
          (and_iso (le_iso (PeanoNat_Nat_add_iso hx hx0) (PeanoNat_Nat_add_iso hx0 hx1))
             (Corelib_Init_Logic_eq_iso (PeanoNat_Nat_add_iso hx1 (S_iso (S_iso (S_iso _0_iso)))) (PeanoNat_Nat_add_iso hx2 (S_iso (S_iso (S_iso _0_iso))))))
          x;
      from_to :=
        fun x : x1 + x3 <= x3 + x5 /\ x5 + 3 = x7 + 3 =>
        seq_p_of_t
          (from_to
             (and_iso (le_iso (PeanoNat_Nat_add_iso hx hx0) (PeanoNat_Nat_add_iso hx0 hx1))
                (Corelib_Init_Logic_eq_iso (PeanoNat_Nat_add_iso hx1 (S_iso (S_iso (S_iso _0_iso)))) (PeanoNat_Nat_add_iso hx2 (S_iso (S_iso (S_iso _0_iso))))))
             x)
    |} x9 x10 ->
  rel_iso
    {| to := le_iso hx hx2; from := from (le_iso hx hx2); to_from := fun x : imported_le x2 x8 => to_from (le_iso hx hx2) x; from_to := fun x : x1 <= x7 => seq_p_of_t (from_to (le_iso hx hx2) x) |}
    (Original.LF_DOT_Imp.LF.Imp.AExp.silly_presburger_example x1 x3 x5 x7 x9) (imported_Original_LF__DOT__Imp_LF_Imp_AExp_silly__presburger__example x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.silly_presburger_example := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_silly__presburger__example := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.silly_presburger_example Original_LF__DOT__Imp_LF_Imp_AExp_silly__presburger__example_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.silly_presburger_example Imported.Original_LF__DOT__Imp_LF_Imp_AExp_silly__presburger__example Original_LF__DOT__Imp_LF_Imp_AExp_silly__presburger__example_iso := {}.