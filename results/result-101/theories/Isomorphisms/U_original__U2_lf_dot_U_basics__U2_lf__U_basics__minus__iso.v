From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_minus : imported_nat -> imported_nat -> imported_nat := Imported.Original_LF__DOT__Basics_LF_Basics_minus.
Instance Original_LF__DOT__Basics_LF_Basics_minus_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> rel_iso nat_iso (Original.LF_DOT_Basics.LF.Basics.minus x1 x3) (imported_Original_LF__DOT__Basics_LF_Basics_minus x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.minus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_minus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.minus Original_LF__DOT__Basics_LF_Basics_minus_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.minus Imported.Original_LF__DOT__Basics_LF_Basics_minus Original_LF__DOT__Basics_LF_Basics_minus_iso := {}.