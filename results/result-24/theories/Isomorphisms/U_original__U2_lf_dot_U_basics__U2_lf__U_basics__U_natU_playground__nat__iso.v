From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat : Type := Imported.Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat.

(* Define conversion functions *)
Fixpoint NatPlayground_to (n : Original.LF_DOT_Basics.LF.Basics.NatPlayground.nat) : imported_Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat :=
  match n with
  | Original.LF_DOT_Basics.LF.Basics.NatPlayground.O => Imported.Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat_O
  | Original.LF_DOT_Basics.LF.Basics.NatPlayground.S n' => Imported.Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat_S (NatPlayground_to n')
  end.

Fixpoint NatPlayground_from (n : imported_Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat) : Original.LF_DOT_Basics.LF.Basics.NatPlayground.nat :=
  match n with
  | Imported.Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat_O => Original.LF_DOT_Basics.LF.Basics.NatPlayground.O
  | Imported.Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat_S n' => Original.LF_DOT_Basics.LF.Basics.NatPlayground.S (NatPlayground_from n')
  end.

Lemma NatPlayground_to_from : forall n, NatPlayground_to (NatPlayground_from n) = n.
Proof.
  intro n.
  induction n as [| n' IH] using Imported.Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat_ind.
  - reflexivity.
  - simpl. f_equal. exact IH.
Qed.

Lemma NatPlayground_from_to : forall n, NatPlayground_from (NatPlayground_to n) = n.
Proof.
  intro n.
  induction n as [| n' IH].
  - reflexivity.
  - simpl. f_equal. exact IH.
Qed.

Monomorphic Instance Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat_iso : Iso Original.LF_DOT_Basics.LF.Basics.NatPlayground.nat imported_Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat.
Proof.
  exact {| to := NatPlayground_to;
           from := NatPlayground_from;
           to_from := fun n => seq_of_eq (NatPlayground_to_from n);
           from_to := fun n => seq_of_eq (NatPlayground_from_to n) |}.
Defined.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.NatPlayground.nat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.NatPlayground.nat Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.NatPlayground.nat Imported.Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat_iso := {}.