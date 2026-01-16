From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Induction_LF_Induction_double : imported_nat -> imported_nat := Imported.Original_LF__DOT__Induction_LF_Induction_double.

(* We need IsoEq.f_equal for SProp *)
Lemma nat_S_cong : forall x y : imported_nat, 
  IsomorphismDefinitions.eq x y -> IsomorphismDefinitions.eq (Imported.nat_S x) (Imported.nat_S y).
Proof. intros x y H. destruct H. apply IsomorphismDefinitions.eq_refl. Qed.

(* Prove that double commutes with the isomorphism *)
Lemma double_commutes : forall n : nat,
  IsomorphismDefinitions.eq 
    (nat_to_imported (Original.LF_DOT_Induction.LF.Induction.double n))
    (imported_Original_LF__DOT__Induction_LF_Induction_double (nat_to_imported n)).
Proof.
  fix IH 1.
  intro n. destruct n as [|n'].
  { apply IsomorphismDefinitions.eq_refl. }
  { unfold imported_Original_LF__DOT__Induction_LF_Induction_double.
    simpl Original.LF_DOT_Induction.LF.Induction.double.
    simpl nat_to_imported.
    (* LHS: nat_S (nat_S (nat_to_imported (double n')))
       RHS: Imported.Original... (nat_S (nat_to_imported n')) *)
    (* By IH: nat_to_imported (double n') = Imported.Original... (nat_to_imported n') *)
    pose proof (IH n') as H.
    unfold imported_Original_LF__DOT__Induction_LF_Induction_double in H.
    apply nat_S_cong. apply nat_S_cong. exact H. }
Qed.

Instance Original_LF__DOT__Induction_LF_Induction_double_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> rel_iso nat_iso (Original.LF_DOT_Induction.LF.Induction.double x1) (imported_Original_LF__DOT__Induction_LF_Induction_double x2).
Proof.
  intros x1 x2 H.
  simpl in *. simpl in *.
  (* H : IsomorphismDefinitions.eq (nat_to_imported x1) x2 *)
  pose proof (double_commutes x1) as Hdc.
  unfold imported_Original_LF__DOT__Induction_LF_Induction_double in *.
  destruct H.
  (* Goal : IsomorphismDefinitions.eq (nat_to_imported (double x1)) (Imported... (nat_to_imported x1)) *)
  exact Hdc.
Qed.
Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.double := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_double := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.double Original_LF__DOT__Induction_LF_Induction_double_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.double Imported.Original_LF__DOT__Induction_LF_Induction_double Original_LF__DOT__Induction_LF_Induction_double_iso := {}.