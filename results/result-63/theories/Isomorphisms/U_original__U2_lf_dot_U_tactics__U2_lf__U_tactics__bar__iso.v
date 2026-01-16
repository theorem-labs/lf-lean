From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Tactics_LF_Tactics_bar : imported_nat -> imported_nat := Imported.Original_LF__DOT__Tactics_LF_Tactics_bar.
Instance Original_LF__DOT__Tactics_LF_Tactics_bar_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> rel_iso nat_iso (Original.LF_DOT_Tactics.LF.Tactics.bar x1) (imported_Original_LF__DOT__Tactics_LF_Tactics_bar x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.bar := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_bar := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.bar Original_LF__DOT__Tactics_LF_Tactics_bar_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.bar Imported.Original_LF__DOT__Tactics_LF_Tactics_bar Original_LF__DOT__Tactics_LF_Tactics_bar_iso := {}.