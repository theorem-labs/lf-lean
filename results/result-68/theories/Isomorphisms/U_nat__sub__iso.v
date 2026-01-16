From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Monomorphic Definition imported_Nat_sub : imported_nat -> imported_nat -> imported_nat := Imported.Nat_sub.

(* Prove that nat_to_imported preserves subtraction *)
Fixpoint nat_to_imported_sub_compat (n m : nat) {struct n} : 
  nat_to_imported (n - m) = Imported.Nat_sub (nat_to_imported n) (nat_to_imported m) :=
  match n with
  | O => match m with
         | O => Corelib.Init.Logic.eq_refl
         | Datatypes.S _ => Corelib.Init.Logic.eq_refl
         end
  | Datatypes.S n' => match m with
                      | O => Corelib.Init.Logic.eq_refl
                      | Datatypes.S m' => nat_to_imported_sub_compat n' m'
                      end
  end.

Monomorphic Instance Nat_sub_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> rel_iso nat_iso (x1 - x3) (imported_Nat_sub x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  constructor.
  eapply IsoEq.eq_trans.
  - apply seq_of_eq. apply nat_to_imported_sub_compat.
  - apply f_equal2; [exact (proj_rel_iso H12) | exact (proj_rel_iso H34)].
Defined.
Instance: KnownConstant Nat.sub := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Nat_sub := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Nat.sub Nat_sub_iso := {}.
Instance: IsoStatementProofBetween Nat.sub Imported.Nat_sub Nat_sub_iso := {}.