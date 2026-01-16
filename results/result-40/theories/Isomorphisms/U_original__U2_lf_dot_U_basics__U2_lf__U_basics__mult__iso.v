From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__plus__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_mult : imported_nat -> imported_nat -> imported_nat := Imported.Original_LF__DOT__Basics_LF_Basics_mult.

(* Prove that mult and Imported.Original_LF__DOT__Basics_LF_Basics_mult are isomorphic *)
Lemma mult_iso_helper : forall n m : nat,
  IsomorphismDefinitions.eq 
    (nat_to_imported (Original.LF_DOT_Basics.LF.Basics.mult n m))
    (Imported.Original_LF__DOT__Basics_LF_Basics_mult (nat_to_imported n) (nat_to_imported m)).
Proof.
  fix IH 1.
  intros n m.
  destruct n as [|n'].
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl.
    (* mult (S n') m = plus m (mult n' m) *)
    (* Need to show nat_to_imported (plus m (mult n' m)) = 
       Imported.mult (nat_S (nat_to_imported n')) (nat_to_imported m)
       By computation, RHS = Imported.plus (nat_to_imported m) (Imported.mult (nat_to_imported n') (nat_to_imported m)) *)
    change (Imported.Original_LF__DOT__Basics_LF_Basics_mult (Imported.nat_S (nat_to_imported n')) (nat_to_imported m))
      with (Imported.Original_LF__DOT__Basics_LF_Basics_plus (nat_to_imported m) (Imported.Original_LF__DOT__Basics_LF_Basics_mult (nat_to_imported n') (nat_to_imported m))).
    eapply IsoEq.eq_trans.
    + apply plus_iso_helper.
    + apply IsoEq.f_equal2.
      * apply IsomorphismDefinitions.eq_refl.
      * apply IH.
Qed.

Instance Original_LF__DOT__Basics_LF_Basics_mult_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  forall (x3 : nat) (x4 : imported_nat), rel_iso nat_iso x3 x4 -> rel_iso nat_iso (Original.LF_DOT_Basics.LF.Basics.mult x1 x3) (imported_Original_LF__DOT__Basics_LF_Basics_mult x2 x4).
Proof.
  intros x1 x2 H1 x3 x4 H2.
  constructor. simpl.
  unfold imported_Original_LF__DOT__Basics_LF_Basics_mult.
  pose proof (mult_iso_helper x1 x3) as Hmult.
  eapply IsoEq.eq_trans.
  - exact Hmult.
  - apply IsoEq.f_equal2.
    + exact (proj_rel_iso H1).
    + exact (proj_rel_iso H2).
Qed.

Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.mult := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_mult := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.mult Original_LF__DOT__Basics_LF_Basics_mult_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.mult Imported.Original_LF__DOT__Basics_LF_Basics_mult Original_LF__DOT__Basics_LF_Basics_mult_iso := {}.