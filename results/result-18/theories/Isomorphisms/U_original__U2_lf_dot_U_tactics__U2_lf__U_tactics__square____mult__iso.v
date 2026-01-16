From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_nat__mul__iso Isomorphisms.U_original__U2_lf_dot_U_tactics__U2_lf__U_tactics__square__iso.

Monomorphic Definition imported_Original_LF__DOT__Tactics_LF_Tactics_square__mult : forall x x0 : imported_nat,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Tactics_LF_Tactics_square (imported_Nat_mul x x0))
    (imported_Nat_mul (imported_Original_LF__DOT__Tactics_LF_Tactics_square x) (imported_Original_LF__DOT__Tactics_LF_Tactics_square x0)) := Imported.Original_LF__DOT__Tactics_LF_Tactics_square__mult.
Monomorphic Instance Original_LF__DOT__Tactics_LF_Tactics_square__mult_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4),
  rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Tactics_LF_Tactics_square_iso (Nat_mul_iso hx hx0))
       (Nat_mul_iso (Original_LF__DOT__Tactics_LF_Tactics_square_iso hx) (Original_LF__DOT__Tactics_LF_Tactics_square_iso hx0)))
    (Original.LF_DOT_Tactics.LF.Tactics.square_mult x1 x3) (imported_Original_LF__DOT__Tactics_LF_Tactics_square__mult x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.square_mult := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_square__mult := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.square_mult Original_LF__DOT__Tactics_LF_Tactics_square__mult_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.square_mult Imported.Original_LF__DOT__Tactics_LF_Tactics_square__mult Original_LF__DOT__Tactics_LF_Tactics_square__mult_iso := {}.