From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__natlist__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_length : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist -> imported_nat := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_length.

(* Lemma: imported length equals the conversion of original length *)
Lemma length_compat : forall (l : Original.LF_DOT_Lists.LF.Lists.NatList.natlist),
  Logic.eq (Imported.Original_LF__DOT__Lists_LF_Lists_NatList_length (natlist_to_imported l))
           (nat_to_imported (Original.LF_DOT_Lists.LF.Lists.NatList.length l)).
Proof.
  fix IH 1.
  intros l. destruct l as [| n t]; simpl.
  - reflexivity.
  - (* Goal: nat_S (length (natlist_to_imported t)) = nat_S (nat_to_imported (length t)) *)
    apply (Logic.f_equal Imported.nat_S). apply IH.
Qed.

Instance Original_LF__DOT__Lists_LF_Lists_NatList_length_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist),
  rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x1 x2 ->
  rel_iso nat_iso (Original.LF_DOT_Lists.LF.Lists.NatList.length x1) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_length x2).
Proof.
  intros x1 x2 Hrel.
  simpl in *.
  unfold imported_Original_LF__DOT__Lists_LF_Lists_NatList_length.
  simpl in *.
  (* Hrel : natlist_to_imported x1 = x2 (in SProp eq) *)
  (* Goal : nat_to_imported (length x1) = length x2 (in SProp eq) *)
  pose proof (length_compat x1) as Hcompat.
  (* Hcompat : length (natlist_to_imported x1) = nat_to_imported (length x1) (in Logic.eq) *)
  apply (eq_srect (fun y => IsomorphismDefinitions.eq (nat_to_imported (Original.LF_DOT_Lists.LF.Lists.NatList.length x1)) 
                               (Imported.Original_LF__DOT__Lists_LF_Lists_NatList_length y)) 
                  (eq_sym (seq_of_eq Hcompat)) Hrel).
Qed.

Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.length := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_length := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.length Original_LF__DOT__Lists_LF_Lists_NatList_length_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.length Imported.Original_LF__DOT__Lists_LF_Lists_NatList_length Original_LF__DOT__Lists_LF_Lists_NatList_length_iso := {}.