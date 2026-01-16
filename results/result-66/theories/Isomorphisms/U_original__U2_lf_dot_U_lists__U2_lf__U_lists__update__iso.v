From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__id__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__partial____map__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_update : imported_Original_LF__DOT__Lists_LF_Lists_partial__map -> imported_Original_LF__DOT__Lists_LF_Lists_id -> imported_nat -> imported_Original_LF__DOT__Lists_LF_Lists_partial__map := Imported.Original_LF__DOT__Lists_LF_Lists_update.

(* The update function is just record constructor application *)
(* Original: update d x v = record x v d *)
(* Imported: Original_LF__DOT__Lists_LF_Lists_update d x v = Original_LF__DOT__Lists_LF_Lists_partial__map_record x v d *)

Instance Original_LF__DOT__Lists_LF_Lists_update_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.partial_map) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_partial__map),
  rel_iso Original_LF__DOT__Lists_LF_Lists_partial__map_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Lists.LF.Lists.id) (x4 : imported_Original_LF__DOT__Lists_LF_Lists_id),
  rel_iso Original_LF__DOT__Lists_LF_Lists_id_iso x3 x4 ->
  forall (x5 : Datatypes.nat) (x6 : imported_nat),
  rel_iso nat_iso x5 x6 -> rel_iso Original_LF__DOT__Lists_LF_Lists_partial__map_iso (Original.LF_DOT_Lists.LF.Lists.update x1 x3 x5) (imported_Original_LF__DOT__Lists_LF_Lists_update x2 x4 x6).
Proof.
  intros x1 x2 H1 x3 x4 H2 x5 x6 H3.
  constructor.
  unfold Original.LF_DOT_Lists.LF.Lists.update.
  unfold imported_Original_LF__DOT__Lists_LF_Lists_update.
  unfold Imported.Original_LF__DOT__Lists_LF_Lists_update.
  unfold Original_LF__DOT__Lists_LF_Lists_id_iso in H2.
  unfold nat_iso in H3.
  unfold Original_LF__DOT__Lists_LF_Lists_partial__map_iso in *.
  simpl in *.
  (* Now use f_equal3 *)
  apply (f_equal3 Imported.Original_LF__DOT__Lists_LF_Lists_partial__map_record H2 H3 H1).
Defined.

Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.update := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_update := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.update Original_LF__DOT__Lists_LF_Lists_update_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.update Imported.Original_LF__DOT__Lists_LF_Lists_update Original_LF__DOT__Lists_LF_Lists_update_iso := {}.