From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Monomorphic Definition imported_Original_LF__DOT__Basics_LF_Basics_factorial : imported_nat -> imported_nat := Imported.Original_LF__DOT__Basics_LF_Basics_factorial.
Monomorphic Instance Original_LF__DOT__Basics_LF_Basics_factorial_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> rel_iso nat_iso (Original.LF_DOT_Basics.LF.Basics.factorial x1) (imported_Original_LF__DOT__Basics_LF_Basics_factorial x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.factorial := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_factorial := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.factorial Original_LF__DOT__Basics_LF_Basics_factorial_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.factorial Imported.Original_LF__DOT__Basics_LF_Basics_factorial Original_LF__DOT__Basics_LF_Basics_factorial_iso := {}.