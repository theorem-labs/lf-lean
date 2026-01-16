From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__id__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__partial____map__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_update : imported_Original_LF__DOT__Lists_LF_Lists_partial__map -> imported_Original_LF__DOT__Lists_LF_Lists_id -> imported_nat -> imported_Original_LF__DOT__Lists_LF_Lists_partial__map := Imported.Original_LF__DOT__Lists_LF_Lists_update.
Instance Original_LF__DOT__Lists_LF_Lists_update_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.partial_map) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_partial__map),
  rel_iso Original_LF__DOT__Lists_LF_Lists_partial__map_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Lists.LF.Lists.id) (x4 : imported_Original_LF__DOT__Lists_LF_Lists_id),
  rel_iso Original_LF__DOT__Lists_LF_Lists_id_iso x3 x4 ->
  forall (x5 : nat) (x6 : imported_nat),
  rel_iso nat_iso x5 x6 -> rel_iso Original_LF__DOT__Lists_LF_Lists_partial__map_iso (Original.LF_DOT_Lists.LF.Lists.update x1 x3 x5) (imported_Original_LF__DOT__Lists_LF_Lists_update x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.update := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_update := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.update Original_LF__DOT__Lists_LF_Lists_update_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.update Imported.Original_LF__DOT__Lists_LF_Lists_update Original_LF__DOT__Lists_LF_Lists_update_iso := {}.