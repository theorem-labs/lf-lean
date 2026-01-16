From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Monomorphic Definition imported_Original_LF__DOT__Basics_LF_Basics_minustwo : imported_nat -> imported_nat := Imported.Original_LF__DOT__Basics_LF_Basics_minustwo.

Lemma minustwo_commutes : forall (n : nat),
  IsomorphismDefinitions.eq (to nat_iso (Original.LF_DOT_Basics.LF.Basics.minustwo n)) (Imported.Original_LF__DOT__Basics_LF_Basics_minustwo (to nat_iso n)).
Proof.
  intro n.
  destruct n as [| [| n']].
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl. apply IsomorphismDefinitions.eq_refl.
Qed.

Monomorphic Instance Original_LF__DOT__Basics_LF_Basics_minustwo_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> rel_iso nat_iso (Original.LF_DOT_Basics.LF.Basics.minustwo x1) (imported_Original_LF__DOT__Basics_LF_Basics_minustwo x2).
Proof.
  intros x1 x2 H.
  destruct H as [H].
  constructor.
  eapply IsoEq.eq_trans.
  { exact (minustwo_commutes x1). }
  { apply (IsoEq.f_equal Imported.Original_LF__DOT__Basics_LF_Basics_minustwo H). }
Defined.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.minustwo := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_minustwo := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.minustwo Original_LF__DOT__Basics_LF_Basics_minustwo_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.minustwo Imported.Original_LF__DOT__Basics_LF_Basics_minustwo Original_LF__DOT__Basics_LF_Basics_minustwo_iso := {}.