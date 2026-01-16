From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



Definition imported_nat : Type := Imported.nat.

(* Imported.nat = Lean.Nat which is isomorphic to Coq nat *)
(* We build an explicit isomorphism *)

Fixpoint nat_to_lean_nat (n : nat) : Lean.Nat :=
  match n with
  | O => Lean.Nat_zero
  | S n' => Lean.Nat_succ (nat_to_lean_nat n')
  end.

Fixpoint lean_nat_to_nat (n : Lean.Nat) : nat :=
  match n with
  | Lean.Nat_zero => O
  | Lean.Nat_succ n' => S (lean_nat_to_nat n')
  end.

(* For SProp-based eq, we need to use IsoEq.f_equal *)
Fixpoint lean_nat_to_nat_to_lean (n : Lean.Nat) : IsomorphismDefinitions.eq (nat_to_lean_nat (lean_nat_to_nat n)) n :=
  match n with
  | Lean.Nat_zero => IsomorphismDefinitions.eq_refl
  | Lean.Nat_succ n' => IsoEq.f_equal Lean.Nat_succ (lean_nat_to_nat_to_lean n')
  end.

Fixpoint nat_to_lean_nat_to_nat (n : nat) : IsomorphismDefinitions.eq (lean_nat_to_nat (nat_to_lean_nat n)) n :=
  match n with
  | O => IsomorphismDefinitions.eq_refl
  | S n' => IsoEq.f_equal S (nat_to_lean_nat_to_nat n')
  end.

Instance nat_iso : Iso nat imported_nat.
Proof.
  unfold imported_nat, Imported.nat.
  exact (Build_Iso nat_to_lean_nat lean_nat_to_nat lean_nat_to_nat_to_lean nat_to_lean_nat_to_nat).
Defined.

(* Aliases for use by other modules *)
Definition nat_to_imported := nat_to_lean_nat.
Definition imported_to_nat := lean_nat_to_nat.

Instance: KnownConstant nat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.nat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor nat nat_iso := {}.
Instance: IsoStatementProofBetween nat Imported.nat nat_iso := {}.