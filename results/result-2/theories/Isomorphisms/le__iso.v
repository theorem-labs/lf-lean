From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_le : imported_nat -> imported_nat -> SProp := Imported.le.

(* Convert Datatypes.nat le (Peano.le) to Imported.le *)
Fixpoint le_to_imported (n m : Datatypes.nat) (H : Peano.le n m) {struct H} : Imported.le (nat_to_imported n) (nat_to_imported m).
Proof.
  destruct H.
  - apply Imported.le_le_n.
  - apply Imported.le_le_S. exact (le_to_imported n m H).
Defined.

(* For the reverse direction, we use le_indl to build SInhabited, then sinhabitant *)
(* The imported le is in SProp, so we need to escape using sinhabitant *)
(* Note: After importing Imported, 'nat' refers to Imported.nat and 'le' to Imported.le *)
Definition imported_to_le' : forall (n' m' : Imported.nat) (H : Imported.le n' m'), Peano.le (imported_to_nat n') (imported_to_nat m') :=
  fun n' m' H =>
    sinhabitant (Imported.le_indl n' (fun m'' _ => SInhabited (Peano.le (imported_to_nat n') (imported_to_nat m'')))
      (sinhabits (Peano.le_n _))
      (fun m'' _ IH => sinhabits (Peano.le_S _ _ (sinhabitant IH)))
      m' H).

(* Helper: transport le along equality *)
Definition le_transport {n1 n2 m1 m2 : Datatypes.nat} (Hn : n1 = n2) (Hm : m1 = m2) (H : Peano.le n1 m1) : Peano.le n2 m2 :=
  match Hn in Logic.eq _ n, Hm in Logic.eq _ m return Peano.le n m with
  | Logic.eq_refl, Logic.eq_refl => H
  end.

Instance le_iso : (forall (x1 : Datatypes.nat) (x2 : imported_nat) (_ : @rel_iso Datatypes.nat imported_nat nat_iso x1 x2) (x3 : Datatypes.nat) (x4 : imported_nat) (_ : @rel_iso Datatypes.nat imported_nat nat_iso x3 x4), Iso (Peano.le x1 x3) (imported_le x2 x4)).
Proof.
  intros n1 n2 hn m1 m2 hm.
  destruct hn as [hn]. destruct hm as [hm]. simpl in hn, hm.
  apply eq_of_seq in hn. apply eq_of_seq in hm.
  subst n2 m2.
  unfold imported_le.
  apply relax_Iso_Ps_Ts.
  unshelve refine {|
    to := @le_to_imported n1 m1;
    from := _
  |}.
  - (* from *)
    intro H.
    apply (le_transport (nat_roundtrip n1) (nat_roundtrip m1)).
    pose (n1' := nat_to_imported n1).
    pose (m1' := nat_to_imported m1).
    change (Imported.le n1' m1') in H.
    apply (@imported_to_le' n1' m1' H).
  - intro s. apply IsomorphismDefinitions.eq_refl.
  - intro p. apply seq_of_peq. apply Stdlib.Logic.ProofIrrelevance.proof_irrelevance.
Defined.

Instance: KnownConstant Peano.le := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.le := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Peano.le le_iso := {}.
Instance: IsoStatementProofBetween Peano.le Imported.le le_iso := {}.
