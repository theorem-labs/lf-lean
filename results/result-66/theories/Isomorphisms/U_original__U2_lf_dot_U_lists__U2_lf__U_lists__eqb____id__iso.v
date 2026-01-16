From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__eqb__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__id__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_eqb__id : imported_Original_LF__DOT__Lists_LF_Lists_id -> imported_Original_LF__DOT__Lists_LF_Lists_id -> imported_Original_LF__DOT__Basics_LF_Basics_bool := Imported.Original_LF__DOT__Lists_LF_Lists_eqb__id.

Lemma eqb_id_iso_helper : forall n1 n3,
  IsomorphismDefinitions.eq
    (bool_to_imported (Original.LF_DOT_Lists.LF.Lists.eqb_id (Original.LF_DOT_Lists.LF.Lists.Id n1) (Original.LF_DOT_Lists.LF.Lists.Id n3)))
    (Imported.Original_LF__DOT__Lists_LF_Lists_eqb__id
      (Imported.Original_LF__DOT__Lists_LF_Lists_id_Id (nat_to_imported n1))
      (Imported.Original_LF__DOT__Lists_LF_Lists_id_Id (nat_to_imported n3))).
Proof.
  fix IH 1.
  intros n1 n3.
  destruct n1 as [|n1']; destruct n3 as [|n3']; simpl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply IH.
Defined.

Instance Original_LF__DOT__Lists_LF_Lists_eqb__id_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.id) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_id),
  rel_iso Original_LF__DOT__Lists_LF_Lists_id_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Lists.LF.Lists.id) (x4 : imported_Original_LF__DOT__Lists_LF_Lists_id),
  rel_iso Original_LF__DOT__Lists_LF_Lists_id_iso x3 x4 ->
  rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (Original.LF_DOT_Lists.LF.Lists.eqb_id x1 x3) (imported_Original_LF__DOT__Lists_LF_Lists_eqb__id x2 x4).
Proof.
  intros x1 x2 H1 x3 x4 H3.
  destruct x1 as [n1]. destruct x3 as [n3].
  constructor.
  destruct H1 as [H1]. destruct H3 as [H3].
  simpl in *.
  destruct H1. destruct H3.
  apply eqb_id_iso_helper.
Defined.

Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.eqb_id := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_eqb__id := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.eqb_id Original_LF__DOT__Lists_LF_Lists_eqb__id_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.eqb_id Imported.Original_LF__DOT__Lists_LF_Lists_eqb__id Original_LF__DOT__Lists_LF_Lists_eqb__id_iso := {}.