From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.prod__iso.

Definition imported_pair : forall x x0 : Type, x -> x0 -> imported_prod x x0 := (@Imported.pair).
Instance pair_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 x4 : Type) (hx0 : Iso x3 x4) (x5 : x1) (x6 : x2),
  rel_iso hx x5 x6 -> forall (x7 : x3) (x8 : x4), rel_iso hx0 x7 x8 -> rel_iso (prod_iso hx hx0) (x5, x7) (imported_pair x6 x8).
Admitted.
Instance: KnownConstant (@pair) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.pair) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@pair) pair_iso := {}.
Instance: IsoStatementProofBetween (@pair) (@Imported.pair) pair_iso := {}.