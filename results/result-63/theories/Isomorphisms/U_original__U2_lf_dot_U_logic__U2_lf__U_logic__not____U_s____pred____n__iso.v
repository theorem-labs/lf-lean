From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_logic__not__iso Isomorphisms.U_nat__pred__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_not__S__pred__n : (forall x : imported_nat, imported_Corelib_Init_Logic_eq (imported_S (imported_Nat_pred x)) x) -> imported_False := Imported.Original_LF__DOT__Logic_LF_Logic_not__S__pred__n.
Instance Original_LF__DOT__Logic_LF_Logic_not__S__pred__n_iso : forall (x1 : forall n : nat, S (Nat.pred n) = n) (x2 : forall x : imported_nat, imported_Corelib_Init_Logic_eq (imported_S (imported_Nat_pred x)) x),
  (forall (x3 : nat) (x4 : imported_nat) (hx : rel_iso nat_iso x3 x4), rel_iso (Corelib_Init_Logic_eq_iso (S_iso (Nat_pred_iso hx)) hx) (x1 x3) (x2 x4)) ->
  rel_iso False_iso (Original.LF_DOT_Logic.LF.Logic.not_S_pred_n x1) (imported_Original_LF__DOT__Logic_LF_Logic_not__S__pred__n x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.not_S_pred_n := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_not__S__pred__n := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.not_S_pred_n Original_LF__DOT__Logic_LF_Logic_not__S__pred__n_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.not_S_pred_n Imported.Original_LF__DOT__Logic_LF_Logic_not__S__pred__n Original_LF__DOT__Logic_LF_Logic_not__S__pred__n_iso := {}.