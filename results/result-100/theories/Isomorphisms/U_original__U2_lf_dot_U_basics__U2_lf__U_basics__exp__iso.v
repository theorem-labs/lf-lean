From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_exp : imported_nat -> imported_nat -> imported_nat := Imported.Original_LF__DOT__Basics_LF_Basics_exp.
Instance Original_LF__DOT__Basics_LF_Basics_exp_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> rel_iso nat_iso (Original.LF_DOT_Basics.LF.Basics.exp x1 x3) (imported_Original_LF__DOT__Basics_LF_Basics_exp x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.exp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_exp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.exp Original_LF__DOT__Basics_LF_Basics_exp_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.exp Imported.Original_LF__DOT__Basics_LF_Basics_exp Original_LF__DOT__Basics_LF_Basics_exp_iso := {}.