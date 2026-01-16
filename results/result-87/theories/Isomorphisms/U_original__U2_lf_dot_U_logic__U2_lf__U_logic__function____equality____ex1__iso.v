From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *)


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_nat__add__iso Isomorphisms.U_nat__pred__iso Isomorphisms.U_s__iso.

(* The imported axiom - note that iterate1 imported_S 1 imported_0 = imported_S imported_0 = S(0) = 1 *)
(* So S(S(S(iterate1 S 1 0))) = S(S(S(1))) = 4 which matches *)
Definition imported_Original_LF__DOT__Logic_LF_Logic_function__equality__ex1 : imported_Corelib_Init_Logic_eq (fun x2 : imported_nat => imported_Nat_add (imported_S (imported_S (imported_S imported_0))) x2)
    (fun x2 : imported_nat => imported_Nat_add (imported_Nat_pred (imported_S (imported_S (imported_S (iterate1 imported_S 1 imported_0))))) x2) := Imported.Original_LF__DOT__Logic_LF_Logic_function__equality__ex1.

(* The isomorphism proof *)
Instance Original_LF__DOT__Logic_LF_Logic_function__equality__ex1_iso : @rel_iso ((fun x : nat => 3 + x) = (fun x : nat => Nat.pred 4 + x))
    (@imported_Corelib_Init_Logic_eq (imported_nat -> imported_nat) (fun x2 : imported_nat => imported_Nat_add (imported_S (imported_S (imported_S imported_0))) x2)
       (fun x2 : imported_nat => imported_Nat_add (imported_Nat_pred (imported_S (imported_S (imported_S (@iterate1 imported_nat imported_S 1 imported_0))))) x2))
    (@relax_Iso_Ts_Ps ((fun x : nat => 3 + x) = (fun x : nat => Nat.pred 4 + x))
       (@imported_Corelib_Init_Logic_eq (imported_nat -> imported_nat) (fun x2 : imported_nat => imported_Nat_add (imported_S (imported_S (imported_S imported_0))) x2)
          (fun x2 : imported_nat => imported_Nat_add (imported_Nat_pred (imported_S (imported_S (imported_S (@iterate1 imported_nat imported_S 1 imported_0))))) x2))
       (@Corelib_Init_Logic_eq_iso (nat -> nat) (imported_nat -> imported_nat) (@IsoArrow nat imported_nat nat_iso nat imported_nat nat_iso) (fun x : nat => 3 + x)
          (fun x2 : imported_nat => imported_Nat_add (imported_S (imported_S (imported_S imported_0))) x2)
          (@IsoFunND nat imported_nat nat_iso nat imported_nat nat_iso (fun x : nat => 3 + x) (fun x2 : imported_nat => imported_Nat_add (imported_S (imported_S (imported_S imported_0))) x2)
             (fun (x1 : nat) (x2 : imported_nat) (hx : @rel_iso nat imported_nat nat_iso x1 x2) =>
              @Nat_add_iso 3 (imported_S (imported_S (imported_S imported_0))) (@S_iso 2 (imported_S (imported_S imported_0)) (@S_iso 1 (imported_S imported_0) (@S_iso O imported_0 _0_iso))) x1 x2 hx))
          (fun x : nat => Nat.pred 4 + x) (fun x2 : imported_nat => imported_Nat_add (imported_Nat_pred (imported_S (imported_S (imported_S (@iterate1 imported_nat imported_S 1 imported_0))))) x2)
          (@IsoFunND nat imported_nat nat_iso nat imported_nat nat_iso (fun x : nat => Nat.pred 4 + x)
             (fun x2 : imported_nat => imported_Nat_add (imported_Nat_pred (imported_S (imported_S (imported_S (@iterate1 imported_nat imported_S 1 imported_0))))) x2)
             (fun (x1 : nat) (x2 : imported_nat) (hx : @rel_iso nat imported_nat nat_iso x1 x2) =>
              @Nat_add_iso (Nat.pred 4) (imported_Nat_pred (imported_S (imported_S (imported_S (@iterate1 imported_nat imported_S 1 imported_0)))))
                (@Nat_pred_iso 4 (imported_S (imported_S (imported_S (@iterate1 imported_nat imported_S 1 imported_0))))
                   (@S_iso 3 (imported_S (imported_S (@iterate1 imported_nat imported_S 1 imported_0)))
                      (@S_iso 2 (imported_S (@iterate1 imported_nat imported_S 1 imported_0))
                         (@S_iso 1 (@iterate1 imported_nat imported_S 1 imported_0) (@iterate1D2 nat imported_nat (@rel_iso nat imported_nat nat_iso) S imported_S S_iso 1 O imported_0 _0_iso)))))
                x1 x2 hx))))
    Original.LF_DOT_Logic.LF.Logic.function_equality_ex1 imported_Original_LF__DOT__Logic_LF_Logic_function__equality__ex1.
Proof.
  constructor.
  (* Both sides are in SProp, so eq_refl works by SProp proof irrelevance *)
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.function_equality_ex1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_function__equality__ex1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.function_equality_ex1 Original_LF__DOT__Logic_LF_Logic_function__equality__ex1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.function_equality_ex1 Imported.Original_LF__DOT__Logic_LF_Logic_function__equality__ex1 Original_LF__DOT__Logic_LF_Logic_function__equality__ex1_iso := {}.