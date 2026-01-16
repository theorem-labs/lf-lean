From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* Typeclasses Opaque rel_iso. *) *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_even : imported_nat -> imported_Original_LF__DOT__Basics_LF_Basics_bool := Imported.Original_LF__DOT__Basics_LF_Basics_even.

(* Define the to function for bool explicitly *)
Definition bool_to_imported (b : Original.LF_DOT_Basics.LF.Basics.bool) : imported_Original_LF__DOT__Basics_LF_Basics_bool :=
  match b with
  | Original.LF_DOT_Basics.LF.Basics.true => Imported.Original_LF__DOT__Basics_LF_Basics_bool_true
  | Original.LF_DOT_Basics.LF.Basics.false => Imported.Original_LF__DOT__Basics_LF_Basics_bool_false
  end.

(* Key lemma: to(even n) = even(to n) *)
Fixpoint even_commutes_with_to (n : nat) {struct n} :
  bool_to_imported (Original.LF_DOT_Basics.LF.Basics.even n) = 
  Imported.Original_LF__DOT__Basics_LF_Basics_even (nat_to_imported n) :=
  match n return bool_to_imported (Original.LF_DOT_Basics.LF.Basics.even n) = 
                 Imported.Original_LF__DOT__Basics_LF_Basics_even (nat_to_imported n) with
  | O => Logic.eq_refl
  | Datatypes.S O => Logic.eq_refl
  | Datatypes.S (Datatypes.S n') => even_commutes_with_to n'
  end.

Instance Original_LF__DOT__Basics_LF_Basics_even_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 -> rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (Original.LF_DOT_Basics.LF.Basics.even x1) (imported_Original_LF__DOT__Basics_LF_Basics_even x2).
Proof.
  intros x1 x2 [H]. constructor. unfold imported_Original_LF__DOT__Basics_LF_Basics_even.
  simpl to.
  transitivity (bool_to_imported (Original.LF_DOT_Basics.LF.Basics.even x1)).
  { destruct (Original.LF_DOT_Basics.LF.Basics.even x1); reflexivity. }
  rewrite even_commutes_with_to.
  apply (IsoEq.f_equal Imported.Original_LF__DOT__Basics_LF_Basics_even H).
Defined.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.even := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_even := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.even Original_LF__DOT__Basics_LF_Basics_even_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.even Imported.Original_LF__DOT__Basics_LF_Basics_even Original_LF__DOT__Basics_LF_Basics_even_iso := {}.