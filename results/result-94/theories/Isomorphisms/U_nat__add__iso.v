From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Nat_add : imported_nat -> imported_nat -> imported_nat := Imported.Nat_add.

(* Prove that nat_to_imported preserves addition *)
Fixpoint nat_to_imported_add_compat (n m : nat) : 
  nat_to_imported (n + m) = Imported.Nat_add (nat_to_imported n) (nat_to_imported m) :=
  match n with
  | O => Corelib.Init.Logic.eq_refl
  | Datatypes.S n' => match nat_to_imported_add_compat n' m in (_ = r) 
            return (Imported.nat_S (nat_to_imported (n' + m)) = Imported.nat_S r) with
            | Corelib.Init.Logic.eq_refl => Corelib.Init.Logic.eq_refl
            end
  end.

Instance Nat_add_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> rel_iso nat_iso (x1 + x3) (imported_Nat_add x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  destruct H12 as [H12]. destruct H34 as [H34]. simpl in H12, H34.
  constructor; simpl.
  (* H12 : eq (nat_to_imported x1) x2 *)
  (* H34 : eq (nat_to_imported x3) x4 *)
  (* Goal : eq (nat_to_imported (x1 + x3)) (Imported.Nat_add x2 x4) *)
  eapply eq_trans.
  - apply seq_of_eq. apply nat_to_imported_add_compat.
  - apply f_equal2; assumption.
Defined.

Instance: KnownConstant Nat.add := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Nat_add := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Nat.add Nat_add_iso := {}.
Instance: IsoStatementProofBetween Nat.add Imported.Nat_add Nat_add_iso := {}.