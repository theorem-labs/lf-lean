From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. *)

From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist : Type := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist.

(* Forward: Original.natlist -> Imported.natlist *)
Fixpoint natlist_to_imported (l : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) : Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist :=
  match l with
  | Original.LF_DOT_Lists.LF.Lists.NatList.nil => Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist_nil
  | Original.LF_DOT_Lists.LF.Lists.NatList.cons n t => 
      Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist_cons 
        (nat_to_imported n) 
        (natlist_to_imported t)
  end.

(* Backward: Imported.natlist -> Original.natlist *)
Fixpoint imported_to_natlist (l : Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist) : Original.LF_DOT_Lists.LF.Lists.NatList.natlist :=
  match l with
  | Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist_nil => Original.LF_DOT_Lists.LF.Lists.NatList.nil
  | Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist_cons n t => 
      Original.LF_DOT_Lists.LF.Lists.NatList.cons 
        (imported_to_nat n) 
        (imported_to_natlist t)
  end.

Lemma natlist_roundtrip : forall l : Original.LF_DOT_Lists.LF.Lists.NatList.natlist, 
  Logic.eq (imported_to_natlist (natlist_to_imported l)) l.
Proof.
  fix IH 1.
  intros l. destruct l as [| n t]; simpl.
  - reflexivity.
  - apply (@Logic.eq_ind_r nat n (fun x => Logic.eq (Original.LF_DOT_Lists.LF.Lists.NatList.cons x (imported_to_natlist (natlist_to_imported t))) (Original.LF_DOT_Lists.LF.Lists.NatList.cons n t))).
    + apply Logic.f_equal. apply IH.
    + apply nat_roundtrip.
Defined.

Lemma imported_natlist_roundtrip : forall l : Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist,
  Logic.eq (natlist_to_imported (imported_to_natlist l)) l.
Proof.
  fix IH 1.
  intros l. destruct l as [| n t]; simpl.
  - reflexivity.
  - apply (@Logic.eq_ind_r Imported.nat n (fun x => Logic.eq (Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist_cons x (natlist_to_imported (imported_to_natlist t))) (Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist_cons n t))).
    + apply Logic.f_equal. apply IH.
    + apply imported_nat_roundtrip.
Defined.

Instance Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso : Iso Original.LF_DOT_Lists.LF.Lists.NatList.natlist imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist.
Proof.
  refine {|
    to := natlist_to_imported;
    from := imported_to_natlist;
    to_from := _;
    from_to := _
  |}.
  - intros l. apply seq_of_eq. apply imported_natlist_roundtrip.
  - intros l. apply seq_of_eq. apply natlist_roundtrip.
Defined.

Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.natlist := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.natlist Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.natlist Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso := {}.