From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Monomorphic Definition imported_Original_LF__DOT__Basics_LF_Basics_minustwo : imported_nat -> imported_nat := Imported.Original_LF__DOT__Basics_LF_Basics_minustwo.

(* Original minustwo: fun n => match n with | S (S n') => n' | _ => 0 end *)
(* Imported minustwo: same structure *)

Lemma minustwo_equiv : forall (x1 : nat),
  nat_to_imported (Original.LF_DOT_Basics.LF.Basics.minustwo x1) = Imported.Original_LF__DOT__Basics_LF_Basics_minustwo (nat_to_imported x1).
Proof.
  intro x1.
  destruct x1 as [|[|n]]; reflexivity.
Qed.

Monomorphic Instance Original_LF__DOT__Basics_LF_Basics_minustwo_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> rel_iso nat_iso (Original.LF_DOT_Basics.LF.Basics.minustwo x1) (imported_Original_LF__DOT__Basics_LF_Basics_minustwo x2).
Proof.
  intros x1 x2 H.
  constructor. simpl in *.
  unfold imported_Original_LF__DOT__Basics_LF_Basics_minustwo.
  eapply eq_trans.
  - apply seq_of_eq. apply minustwo_equiv.
  - apply f_equal. exact H.
Defined.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.minustwo := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_minustwo := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.minustwo Original_LF__DOT__Basics_LF_Basics_minustwo_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.minustwo Imported.Original_LF__DOT__Basics_LF_Basics_minustwo Original_LF__DOT__Basics_LF_Basics_minustwo_iso := {}.
