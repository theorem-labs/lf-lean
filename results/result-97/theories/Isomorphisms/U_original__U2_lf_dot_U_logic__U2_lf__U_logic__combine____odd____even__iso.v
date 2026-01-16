From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_combine__odd__even : (imported_nat -> SProp) -> (imported_nat -> SProp) -> imported_nat -> SProp := Imported.Original_LF__DOT__Logic_LF_Logic_combine__odd__even.
Instance Original_LF__DOT__Logic_LF_Logic_combine__odd__even_iso : forall (x1 : nat -> Prop) (x2 : imported_nat -> SProp),
  (forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> Iso (x1 x3) (x2 x4)) ->
  forall (x3 : nat -> Prop) (x4 : imported_nat -> SProp),
  (forall (x5 : nat) (x6 : imported_nat), rel_iso nat_iso x5 x6 -> Iso (x3 x5) (x4 x6)) ->
  forall (x5 : nat) (x6 : imported_nat),
  rel_iso nat_iso x5 x6 -> Iso (Original.LF_DOT_Logic.LF.Logic.combine_odd_even x1 x3 x5) (imported_Original_LF__DOT__Logic_LF_Logic_combine__odd__even x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.combine_odd_even := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_combine__odd__even := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.combine_odd_even Original_LF__DOT__Logic_LF_Logic_combine__odd__even_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.combine_odd_even Imported.Original_LF__DOT__Logic_LF_Logic_combine__odd__even Original_LF__DOT__Logic_LF_Logic_combine__odd__even_iso := {}.