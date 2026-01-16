From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(*Typeclasses Opaque rel_iso.*) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_plus : imported_nat -> imported_nat -> imported_nat := Imported.Original_LF__DOT__Basics_LF_Basics_plus.

(* Helper: plus_to_imported commutes *)
Lemma plus_to_imported_compat : forall (n m : nat),
  IsomorphismDefinitions.eq 
    (nat_to_imported (Original.LF_DOT_Basics.LF.Basics.plus n m))
    (Imported.Original_LF__DOT__Basics_LF_Basics_plus (nat_to_imported n) (nat_to_imported m)).
Proof.
  induction n as [|n' IH]; intro m; simpl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply (f_equal Imported.nat_S). apply IH.
Defined.

(* Prove the isomorphism *)
Instance Original_LF__DOT__Basics_LF_Basics_plus_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> rel_iso nat_iso (Original.LF_DOT_Basics.LF.Basics.plus x1 x3) (imported_Original_LF__DOT__Basics_LF_Basics_plus x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  constructor.
  destruct H12 as [H12]. destruct H34 as [H34].
  simpl in *.
  unfold imported_Original_LF__DOT__Basics_LF_Basics_plus.
  eapply eq_trans.
  - apply plus_to_imported_compat.
  - apply f_equal2; assumption.
Defined.

Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.plus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_plus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.plus Original_LF__DOT__Basics_LF_Basics_plus_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.plus Imported.Original_LF__DOT__Basics_LF_Basics_plus Original_LF__DOT__Basics_LF_Basics_plus_iso := {}.