From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__id__iso.

Monomorphic Definition imported_Original_LF__DOT__Lists_LF_Lists_eqb__id : imported_Original_LF__DOT__Lists_LF_Lists_id -> imported_Original_LF__DOT__Lists_LF_Lists_id -> imported_Original_LF__DOT__Basics_LF_Basics_bool := Imported.Original_LF__DOT__Lists_LF_Lists_eqb__id.
Monomorphic Instance Original_LF__DOT__Lists_LF_Lists_eqb__id_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.id) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_id),
  rel_iso Original_LF__DOT__Lists_LF_Lists_id_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Lists.LF.Lists.id) (x4 : imported_Original_LF__DOT__Lists_LF_Lists_id),
  rel_iso Original_LF__DOT__Lists_LF_Lists_id_iso x3 x4 ->
  rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (Original.LF_DOT_Lists.LF.Lists.eqb_id x1 x3) (imported_Original_LF__DOT__Lists_LF_Lists_eqb__id x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.eqb_id := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_eqb__id := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.eqb_id Original_LF__DOT__Lists_LF_Lists_eqb__id_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.eqb_id Imported.Original_LF__DOT__Lists_LF_Lists_eqb__id Original_LF__DOT__Lists_LF_Lists_eqb__id_iso := {}.