From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. *)


From IsomorphismChecker Require Export Isomorphisms.nat__iso.
From IsomorphismChecker Require Export Isomorphisms.U_nat__add__iso.

Monomorphic Definition imported_Original_LF__DOT__Basics_LF_Basics_plus : imported_nat -> imported_nat -> imported_nat := Imported.Original_LF__DOT__Basics_LF_Basics_plus.

(* Original.LF_DOT_Basics.LF.Basics.plus is just Nat.add *)
Monomorphic Instance Original_LF__DOT__Basics_LF_Basics_plus_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> rel_iso nat_iso (Original.LF_DOT_Basics.LF.Basics.plus x1 x3) (imported_Original_LF__DOT__Basics_LF_Basics_plus x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  (* Original.LF_DOT_Basics.LF.Basics.plus = Nat.add, 
     and Imported.Original_LF__DOT__Basics_LF_Basics_plus = Imported.Nat_add *)
  change (Original.LF_DOT_Basics.LF.Basics.plus x1 x3) with (Nat.add x1 x3).
  change (imported_Original_LF__DOT__Basics_LF_Basics_plus x2 x4) with (Imported.Nat_add x2 x4).
  apply Nat_add_iso; assumption.
Defined.

Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.plus := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_plus := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.plus Original_LF__DOT__Basics_LF_Basics_plus_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.plus Imported.Original_LF__DOT__Basics_LF_Basics_plus Original_LF__DOT__Basics_LF_Basics_plus_iso := {}.