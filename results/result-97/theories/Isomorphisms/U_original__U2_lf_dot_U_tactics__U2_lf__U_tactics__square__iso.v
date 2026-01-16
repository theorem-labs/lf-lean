From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Tactics_LF_Tactics_square : imported_nat -> imported_nat := Imported.Original_LF__DOT__Tactics_LF_Tactics_square.
Instance Original_LF__DOT__Tactics_LF_Tactics_square_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> rel_iso nat_iso (Original.LF_DOT_Tactics.LF.Tactics.square x1) (imported_Original_LF__DOT__Tactics_LF_Tactics_square x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.square := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_square := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.square Original_LF__DOT__Tactics_LF_Tactics_square_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.square Imported.Original_LF__DOT__Tactics_LF_Tactics_square Original_LF__DOT__Tactics_LF_Tactics_square_iso := {}.