From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_leb : imported_nat -> imported_nat -> imported_Original_LF__DOT__Basics_LF_Basics_bool := Imported.Original_LF__DOT__Basics_LF_Basics_leb.

(* Helper: bool_to_imported is the 'to' function of the bool isomorphism *)
Definition bool_to_imported := to Original_LF__DOT__Basics_LF_Basics_bool_iso.

(* We need to prove that leb is preserved by the isomorphism *)
(* First, let's prove a computational equivalence *)
Lemma leb_equiv : forall (n m : nat),
  bool_to_imported (Original.LF_DOT_Basics.LF.Basics.leb n m) =
  Imported.Original_LF__DOT__Basics_LF_Basics_leb (nat_to_imported n) (nat_to_imported m).
Proof.
  fix IHn 1.
  intros n m.
  destruct n as [|n']; simpl.
  - (* n = 0 *)
    reflexivity.
  - (* n = S n' *)
    destruct m as [|m']; simpl.
    + (* m = 0 *)
      reflexivity.
    + (* m = S m' *)
      apply IHn.
Defined.

Instance Original_LF__DOT__Basics_LF_Basics_leb_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  forall (x3 : nat) (x4 : imported_nat),
  rel_iso nat_iso x3 x4 -> rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (Original.LF_DOT_Basics.LF.Basics.leb x1 x3) (imported_Original_LF__DOT__Basics_LF_Basics_leb x2 x4).
Proof.
  intros x1 x2 H12 x3 x4 H34.
  constructor. simpl.
  (* H12 : rel_iso nat_iso x1 x2, i.e., nat_to_imported x1 = x2 *)
  (* H34 : rel_iso nat_iso x3 x4, i.e., nat_to_imported x3 = x4 *)
  pose proof (proj_rel_iso H12) as Heq12.
  pose proof (proj_rel_iso H34) as Heq34.
  simpl in Heq12, Heq34.
  eapply eq_trans.
  - apply seq_of_eq. apply leb_equiv.
  - unfold imported_Original_LF__DOT__Basics_LF_Basics_leb.
    apply f_equal2; [exact Heq12 | exact Heq34].
Defined.

Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.leb := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_leb := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.leb Original_LF__DOT__Basics_LF_Basics_leb_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.leb Imported.Original_LF__DOT__Basics_LF_Basics_leb Original_LF__DOT__Basics_LF_Basics_leb_iso := {}.