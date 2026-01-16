From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF_Rel_next__nat : imported_nat -> imported_nat -> SProp := Imported.Original_LF_Rel_next__nat.
Instance Original_LF_Rel_next__nat_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 -> forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> Iso (Original.LF.Rel.next_nat x1 x3) (imported_Original_LF_Rel_next__nat x2 x4).
Admitted.
Instance: KnownConstant Original.LF.Rel.next_nat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF_Rel_next__nat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF.Rel.next_nat Original_LF_Rel_next__nat_iso := {}.
Instance: IsoStatementProofBetween Original.LF.Rel.next_nat Imported.Original_LF_Rel_next__nat Original_LF_Rel_next__nat_iso := {}.