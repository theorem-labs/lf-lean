From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
 (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_0 : imported_nat := Imported.nat_O.
Instance _0_iso : rel_iso nat_iso (Datatypes.O) imported_0.
Proof.
  apply Build_rel_iso. unfold imported_0.
  simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant (Datatypes.O) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.nat_O := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (Datatypes.O) _0_iso := {}.
Instance: IsoStatementProofBetween (Datatypes.O) Imported.nat_O _0_iso := {}.