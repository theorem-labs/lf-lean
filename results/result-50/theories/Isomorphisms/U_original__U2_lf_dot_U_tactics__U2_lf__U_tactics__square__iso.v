From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.nat__iso.
From IsomorphismChecker Require Export Isomorphisms.U_nat__mul__iso.

Definition imported_Original_LF__DOT__Tactics_LF_Tactics_square : imported_nat -> imported_nat := Imported.Original_LF__DOT__Tactics_LF_Tactics_square.

(* Prove that square commutes with the isomorphism *)
Lemma square_commutes : forall n : nat,
  Logic.eq (nat_to_imported (Original.LF_DOT_Tactics.LF.Tactics.square n)) 
           (Imported.Original_LF__DOT__Tactics_LF_Tactics_square (nat_to_imported n)).
Proof.
  intro n.
  unfold Original.LF_DOT_Tactics.LF.Tactics.square.
  unfold Imported.Original_LF__DOT__Tactics_LF_Tactics_square.
  (* square n = n * n *)
  apply Nat_mul_commutes.
Qed.

Instance Original_LF__DOT__Tactics_LF_Tactics_square_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> rel_iso nat_iso (Original.LF_DOT_Tactics.LF.Tactics.square x1) (imported_Original_LF__DOT__Tactics_LF_Tactics_square x2).
Proof.
  intros x1 x2 Hx.
  destruct Hx as [Hx']. simpl in Hx'.
  constructor. simpl.
  unfold imported_Original_LF__DOT__Tactics_LF_Tactics_square.
  unfold Original.LF_DOT_Tactics.LF.Tactics.square.
  unfold Imported.Original_LF__DOT__Tactics_LF_Tactics_square.
  transitivity (Imported.Nat_mul (nat_to_imported x1) (nat_to_imported x1)).
  - apply seq_of_eq. apply Nat_mul_commutes.
  - apply f_equal2; exact Hx'.
Defined.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.square := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_square := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.square Original_LF__DOT__Tactics_LF_Tactics_square_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.square Imported.Original_LF__DOT__Tactics_LF_Tactics_square Original_LF__DOT__Tactics_LF_Tactics_square_iso := {}.