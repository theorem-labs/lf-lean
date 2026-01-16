From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__natoption__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__id__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__partial____map__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__eqb__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_find : imported_Original_LF__DOT__Lists_LF_Lists_id -> imported_Original_LF__DOT__Lists_LF_Lists_partial__map -> imported_Original_LF__DOT__Lists_LF_Lists_NatList_natoption := Imported.Original_LF__DOT__Lists_LF_Lists_find.

(* Helper lemma showing eqb is preserved under the isomorphism *)
Lemma eqb_nat_equiv : forall nx ny,
  Imported.Original_LF__DOT__Basics_LF_Basics_eqb (nat_to_imported nx) (nat_to_imported ny) =
  match Original.LF_DOT_Basics.LF.Basics.eqb nx ny with
  | Original.LF_DOT_Basics.LF.Basics.true => Imported.Original_LF__DOT__Basics_LF_Basics_bool_true
  | Original.LF_DOT_Basics.LF.Basics.false => Imported.Original_LF__DOT__Basics_LF_Basics_bool_false
  end.
Proof.
  induction nx; destruct ny; simpl; try reflexivity.
  apply IHnx.
Defined.

(* Helper lemma for find isomorphism *)
Lemma find_iso_helper : forall (x : Original.LF_DOT_Lists.LF.Lists.id) (m : Original.LF_DOT_Lists.LF.Lists.partial_map),
  IsomorphismDefinitions.eq
    (natoption_to_imported (Original.LF_DOT_Lists.LF.Lists.find x m))
    (Imported.Original_LF__DOT__Lists_LF_Lists_find (id_to_imported x) (partial_map_to_imported m)).
Proof.
  intros [nx] m.
  revert nx.
  induction m as [| [ny] v m' IHm']; intro nx.
  - (* empty case - both reduce to None by computation *)
    apply IsomorphismDefinitions.eq_refl.
  - (* record case *)
    simpl (Original.LF_DOT_Lists.LF.Lists.find _ _).
    simpl (id_to_imported _).
    simpl (partial_map_to_imported _).
    (* The imported find uses brecOn which doesn't reduce by simpl, 
       so we need to use a different approach *)
    assert (Himported: Imported.Original_LF__DOT__Lists_LF_Lists_find
              (Imported.Original_LF__DOT__Lists_LF_Lists_id_Id (nat_to_imported nx))
              (Imported.Original_LF__DOT__Lists_LF_Lists_partial__map_record
                 (Imported.Original_LF__DOT__Lists_LF_Lists_id_Id (nat_to_imported ny))
                 (nat_to_imported v) (partial_map_to_imported m')) =
            match Imported.Original_LF__DOT__Basics_LF_Basics_eqb (nat_to_imported nx) (nat_to_imported ny) with
            | Imported.Original_LF__DOT__Basics_LF_Basics_bool_true => 
                Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natoption_Some (nat_to_imported v)
            | Imported.Original_LF__DOT__Basics_LF_Basics_bool_false =>
                Imported.Original_LF__DOT__Lists_LF_Lists_find
                  (Imported.Original_LF__DOT__Lists_LF_Lists_id_Id (nat_to_imported nx))
                  (partial_map_to_imported m')
            end).
    { reflexivity. }
    rewrite Himported. clear Himported.
    rewrite eqb_nat_equiv.
    destruct (Original.LF_DOT_Basics.LF.Basics.eqb nx ny) eqn:Heqb.
    + (* eqb = true: find returns Some v *)
      simpl (natoption_to_imported _).
      apply IsomorphismDefinitions.eq_refl.
    + (* eqb = false: find recurses on m' *)
      simpl (natoption_to_imported _).
      apply IHm'.
Defined.

Instance Original_LF__DOT__Lists_LF_Lists_find_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.id) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_id),
  rel_iso Original_LF__DOT__Lists_LF_Lists_id_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Lists.LF.Lists.partial_map) (x4 : imported_Original_LF__DOT__Lists_LF_Lists_partial__map),
  rel_iso Original_LF__DOT__Lists_LF_Lists_partial__map_iso x3 x4 ->
  rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natoption_iso (Original.LF_DOT_Lists.LF.Lists.find x1 x3) (imported_Original_LF__DOT__Lists_LF_Lists_find x2 x4).
Proof.
  intros x1 x2 H1 x3 x4 H3.
  constructor. simpl.
  destruct H1 as [H1]. destruct H3 as [H3].
  simpl in *.
  destruct H1. destruct H3.
  apply find_iso_helper.
Defined.

Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.find := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_find := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.find Original_LF__DOT__Lists_LF_Lists_find_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.find Imported.Original_LF__DOT__Lists_LF_Lists_find Original_LF__DOT__Lists_LF_Lists_find_iso := {}.