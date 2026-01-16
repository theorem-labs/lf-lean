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

(* Helper definitions to make the code cleaner *)
Definition double_orig := Original.LF_DOT_Induction.LF.Induction.double.
Definition double_imp := Imported.Original_LF__DOT__Induction_LF_Induction_double.

(* Prove a helper lemma for the imported double unfolding via vm_compute *)
Definition imported_double_S (n : Imported.nat) : 
  double_imp (Imported.nat_S n) = Imported.nat_S (Imported.nat_S (double_imp n)) :=
  match n return double_imp (Imported.nat_S n) = Imported.nat_S (Imported.nat_S (double_imp n)) with
  | Imported.nat_O => Coq.Init.Logic.eq_refl
  | Imported.nat_S _ => Coq.Init.Logic.eq_refl
  end.

(* Prove that double is isomorphic by direct fixpoint definition *)
Fixpoint double_iso_lemma (n : Datatypes.nat) : 
  nat_to_imported (double_orig n) = double_imp (nat_to_imported n) :=
  match n return nat_to_imported (double_orig n) = double_imp (nat_to_imported n) with
  | O => Coq.Init.Logic.eq_refl
  | S n' => 
    match imported_double_S (nat_to_imported n') in (_ = rhs)
      return Imported.nat_S (Imported.nat_S (nat_to_imported (double_orig n'))) = rhs
    with
    | Coq.Init.Logic.eq_refl =>
      match double_iso_lemma n' in (_ = m) 
        return Imported.nat_S (Imported.nat_S (nat_to_imported (double_orig n'))) = 
               Imported.nat_S (Imported.nat_S m) 
      with
      | Coq.Init.Logic.eq_refl => Coq.Init.Logic.eq_refl
      end
    end
  end.

Instance Original_LF__DOT__Induction_LF_Induction_double_iso : forall (x1 : nat) (x2 : imported_nat), rel_iso nat_iso x1 x2 -> rel_iso nat_iso (Original.LF_DOT_Induction.LF.Induction.double x1) (imported_Original_LF__DOT__Induction_LF_Induction_double x2).
Proof.
  intros x1 x2 Hx.
  unfold rel_iso in *.
  simpl in *.
  unfold imported_Original_LF__DOT__Induction_LF_Induction_double.
  (* Hx : IsomorphismDefinitions.eq (nat_to_imported x1) x2 *)
  (* Goal : IsomorphismDefinitions.eq (nat_to_imported (double x1)) (double_imp x2) *)
  (* We prove via double_iso_lemma and Hx *)
  apply (eq_trans (seq_of_eq (double_iso_lemma x1))).
  apply f_equal.
  exact Hx.
Qed.

Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.double := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_double := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.double Original_LF__DOT__Induction_LF_Induction_double_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.double Imported.Original_LF__DOT__Induction_LF_Induction_double Original_LF__DOT__Induction_LF_Induction_double_iso := {}.