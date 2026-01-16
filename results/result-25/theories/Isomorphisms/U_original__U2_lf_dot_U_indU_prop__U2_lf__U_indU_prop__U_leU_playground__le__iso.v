From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. *) (* for speed *)

From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le : imported_nat -> imported_nat -> SProp := Imported.Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le.

(* Forward direction: Original.le n m -> Imported.le (nat_iso n) (nat_iso m) *)
#[local] Unset Implicit Arguments.
Fixpoint le_to_imported (n : Datatypes.nat) (m : Datatypes.nat) (H : Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le n m) {struct H}
  : Imported.Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le (IsomorphismDefinitions.to nat_iso n) (IsomorphismDefinitions.to nat_iso m) :=
  match H with
  | Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le_n n' => 
      Imported.Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le_le_n (IsomorphismDefinitions.to nat_iso n')
  | Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le_S n' m' H' => 
      (* le_S takes: implicit n, explicit m, explicit proof *)
      @Imported.Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le_le_S 
        (IsomorphismDefinitions.to nat_iso n') 
        (IsomorphismDefinitions.to nat_iso m') 
        (le_to_imported n' m' H')
  end.
#[local] Set Implicit Arguments.

(* Backward direction: Imported.le -> SInhabited (Original.le) *)
(* Since the target SInhabited is SProp, we can eliminate from SProp to SProp *)
#[local] Unset Implicit Arguments.
Fixpoint le_backward_aux (n m : imported_nat) 
  (H : Imported.Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le n m)
  : SInhabited (Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le (IsomorphismDefinitions.from nat_iso n) (IsomorphismDefinitions.from nat_iso m)).
Proof.
  destruct H as [ | m' H'].
  - (* le_n case *)
    apply sinhabits.
    apply Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le_n.
  - (* le_S case *)
    apply sinhabits.
    apply Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le_S.
    apply sinhabitant.
    apply (le_backward_aux n m' H').
Defined.
#[local] Set Implicit Arguments.

(* Build the iso for the specific case where x2 = to x1, x4 = to x3 *)
Definition le_iso_core (x1 x3 : Datatypes.nat) :
  Iso (Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le x1 x3) 
      (Imported.Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le (IsomorphismDefinitions.to nat_iso x1) (IsomorphismDefinitions.to nat_iso x3)).
Proof.
  unshelve econstructor.
  - (* to : Original.le x1 x3 -> Imported.le (to x1) (to x3) *)
    exact (le_to_imported x1 x3).
  - (* from : Imported.le (to x1) (to x3) -> Original.le x1 x3 *)
    intro H.
    apply sinhabitant.
    pose proof (le_backward_aux (IsomorphismDefinitions.to nat_iso x1) (IsomorphismDefinitions.to nat_iso x3) H) as H'.
    (* H' : SInhabited (Original.le (from (to x1)) (from (to x3))) *)
    (* = SInhabited (Original.le x1 x3) by from_to *)
    revert H'.
    rewrite (eq_of_seq (IsomorphismDefinitions.from_to nat_iso x1)).
    rewrite (eq_of_seq (IsomorphismDefinitions.from_to nat_iso x3)).
    exact (fun x => x).
  - (* to_from : to (from x) = x - this is SProp so definitional irrelevance applies *)
    intro x.
    reflexivity.
  - (* from_to : from (to x) = x *)
    intro x.
    apply seq_of_peq_t.
    apply ProofIrrelevance.proof_irrelevance. (* Prop proof irrelevance *)
Defined.

Instance Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le_iso : (forall (x1 : Datatypes.nat) (x2 : imported_nat) (_ : @rel_iso Datatypes.nat imported_nat nat_iso x1 x2) (x3 : Datatypes.nat) (x4 : imported_nat) (_ : @rel_iso Datatypes.nat imported_nat nat_iso x3 x4),
   Iso (Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le x2 x4)).
Proof.
  intros x1 x2 Hx1x2 x3 x4 Hx3x4.
  simpl in *.
  unfold imported_Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le.
  (* Hx1x2 : to nat_iso x1 = x2 *)
  (* Hx3x4 : to nat_iso x3 = x4 *)
  (* We need to transport le_iso_core along these equalities *)
  pose proof (le_iso_core x1 x3) as iso.
  (* iso : Iso (Original.le x1 x3) (Imported.le (to x1) (to x3)) *)
  (* We need: Iso (Original.le x1 x3) (Imported.le x2 x4) *)
  (* Use the equalities Hx1x2 and Hx3x4 to rewrite *)
  revert iso.
  rewrite <- (eq_of_seq Hx1x2).
  rewrite <- (eq_of_seq Hx3x4).
  exact (fun x => x).
Defined.

Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le := {}. 
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le := {}. 
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le Imported.Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le_iso := {}.