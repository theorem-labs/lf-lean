From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *)

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__id__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_partial__map : Type := Imported.Original_LF__DOT__Lists_LF_Lists_partial__map.

Fixpoint partial_map_to_imported (m : Original.LF_DOT_Lists.LF.Lists.partial_map) : imported_Original_LF__DOT__Lists_LF_Lists_partial__map :=
  match m with
  | Original.LF_DOT_Lists.LF.Lists.empty => Imported.Original_LF__DOT__Lists_LF_Lists_partial__map_empty
  | Original.LF_DOT_Lists.LF.Lists.record i v m' => 
      Imported.Original_LF__DOT__Lists_LF_Lists_partial__map_record 
        (id_to_imported i) 
        (nat_to_imported v) 
        (partial_map_to_imported m')
  end.

Fixpoint partial_map_from_imported (m : imported_Original_LF__DOT__Lists_LF_Lists_partial__map) : Original.LF_DOT_Lists.LF.Lists.partial_map :=
  match m with
  | Imported.Original_LF__DOT__Lists_LF_Lists_partial__map_empty => Original.LF_DOT_Lists.LF.Lists.empty
  | Imported.Original_LF__DOT__Lists_LF_Lists_partial__map_record i v m' => 
      Original.LF_DOT_Lists.LF.Lists.record 
        (id_from_imported i) 
        (imported_to_nat v) 
        (partial_map_from_imported m')
  end.

Lemma partial_map_to_from : forall x, IsomorphismDefinitions.eq (partial_map_to_imported (partial_map_from_imported x)) x.
Proof.
  fix IH 1.
  intros x. destruct x.
  - apply IsomorphismDefinitions.eq_refl.
  - simpl. apply IsoEq.f_equal3.
    + apply id_to_from.
    + apply nat_to_from.
    + apply IH.
Defined.

Lemma partial_map_from_to : forall x, IsomorphismDefinitions.eq (partial_map_from_imported (partial_map_to_imported x)) x.
Proof.
  fix IH 1.
  intros x. destruct x.
  - apply IsomorphismDefinitions.eq_refl.
  - simpl. apply IsoEq.f_equal3.
    + apply id_from_to.
    + apply nat_from_to.
    + apply IH.
Defined.

Instance Original_LF__DOT__Lists_LF_Lists_partial__map_iso : Iso Original.LF_DOT_Lists.LF.Lists.partial_map imported_Original_LF__DOT__Lists_LF_Lists_partial__map :=
  Build_Iso partial_map_to_imported partial_map_from_imported partial_map_to_from partial_map_from_to.

Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.partial_map := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_partial__map := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.partial_map Original_LF__DOT__Lists_LF_Lists_partial__map_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.partial_map Imported.Original_LF__DOT__Lists_LF_Lists_partial__map Original_LF__DOT__Lists_LF_Lists_partial__map_iso := {}.