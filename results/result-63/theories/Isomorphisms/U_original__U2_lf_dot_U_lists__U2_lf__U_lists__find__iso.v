From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__natoption__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__id__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__partial____map__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_find : imported_Original_LF__DOT__Lists_LF_Lists_id -> imported_Original_LF__DOT__Lists_LF_Lists_partial__map -> imported_Original_LF__DOT__Lists_LF_Lists_NatList_natoption := Imported.Original_LF__DOT__Lists_LF_Lists_find.
Instance Original_LF__DOT__Lists_LF_Lists_find_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.id) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_id),
  rel_iso Original_LF__DOT__Lists_LF_Lists_id_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Lists.LF.Lists.partial_map) (x4 : imported_Original_LF__DOT__Lists_LF_Lists_partial__map),
  rel_iso Original_LF__DOT__Lists_LF_Lists_partial__map_iso x3 x4 ->
  rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natoption_iso (Original.LF_DOT_Lists.LF.Lists.find x1 x3) (imported_Original_LF__DOT__Lists_LF_Lists_find x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.find := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_find := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.find Original_LF__DOT__Lists_LF_Lists_find_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.find Imported.Original_LF__DOT__Lists_LF_Lists_find Original_LF__DOT__Lists_LF_Lists_find_iso := {}.