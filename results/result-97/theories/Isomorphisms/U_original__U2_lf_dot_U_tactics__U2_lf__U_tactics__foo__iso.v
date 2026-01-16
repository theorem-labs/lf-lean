From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Tactics_LF_Tactics_foo : imported_nat -> imported_nat := Imported.Original_LF__DOT__Tactics_LF_Tactics_foo.

(* Both foo functions ignore their input and return 5 *)
(* Original: fun _ => 5 *)
(* Imported: fun _ => five where five = nat_S (nat_S (nat_S (nat_S (nat_S nat_O)))) *)

(* 5 in standard Coq nat is S (S (S (S (S O)))) *)
(* We need to show that nat_to_imported 5 = Imported.five *)

Definition coq_five : Datatypes.nat := S (S (S (S (S O)))).

Lemma five_iso : rel_iso nat_iso coq_five Imported.five.
Proof.
  constructor. simpl.
  (* nat_to_imported 5 = Imported.five *)
  reflexivity.
Qed.

Instance Original_LF__DOT__Tactics_LF_Tactics_foo_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> rel_iso nat_iso (Original.LF_DOT_Tactics.LF.Tactics.foo x1) (imported_Original_LF__DOT__Tactics_LF_Tactics_foo x2).
Proof.
  intros x1 x2 Hx.
  (* Original.LF_DOT_Tactics.LF.Tactics.foo x1 = 5 *)
  (* imported_Original_LF__DOT__Tactics_LF_Tactics_foo x2 = Imported.five *)
  unfold Original.LF_DOT_Tactics.LF.Tactics.foo.
  unfold imported_Original_LF__DOT__Tactics_LF_Tactics_foo.
  unfold Imported.Original_LF__DOT__Tactics_LF_Tactics_foo.
  apply five_iso.
Qed.

Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.foo := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_foo := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.foo Original_LF__DOT__Tactics_LF_Tactics_foo_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.foo Imported.Original_LF__DOT__Tactics_LF_Tactics_foo Original_LF__DOT__Tactics_LF_Tactics_foo_iso := {}.