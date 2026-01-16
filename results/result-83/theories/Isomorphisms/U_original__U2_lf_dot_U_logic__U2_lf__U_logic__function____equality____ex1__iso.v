From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_nat__add__iso Isomorphisms.U_nat__pred__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_function__equality__ex1 : imported_Corelib_Init_Logic_eq (fun x2 : imported_nat => imported_Nat_add (imported_S (imported_S (imported_S imported_0))) x2)
    (fun x2 : imported_nat => imported_Nat_add (imported_Nat_pred (imported_S (imported_S (imported_S (iterate1 imported_S (1)%nat imported_0))))) x2) := Imported.Original_LF__DOT__Logic_LF_Logic_function__equality__ex1.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_function__equality__ex1_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (IsoFunND (fun x : nat => 3 + x) (fun x2 : imported_nat => imported_Nat_add (imported_S (imported_S (imported_S imported_0))) x2)
          (fun (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) => Nat_add_iso (S_iso (S_iso (S_iso _0_iso))) hx))
       (IsoFunND (fun x : nat => Nat.pred 4 + x) (fun x2 : imported_nat => imported_Nat_add (imported_Nat_pred (imported_S (imported_S (imported_S (iterate1 imported_S (1)%nat imported_0))))) x2)
          (fun (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) => Nat_add_iso (Nat_pred_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso (1)%nat (0)%nat imported_0 _0_iso))))) hx)))
    Original.LF_DOT_Logic.LF.Logic.function_equality_ex1 imported_Original_LF__DOT__Logic_LF_Logic_function__equality__ex1.
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.function_equality_ex1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_function__equality__ex1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.function_equality_ex1 Original_LF__DOT__Logic_LF_Logic_function__equality__ex1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.function_equality_ex1 Imported.Original_LF__DOT__Logic_LF_Logic_function__equality__ex1 Original_LF__DOT__Logic_LF_Logic_function__equality__ex1_iso := {}.