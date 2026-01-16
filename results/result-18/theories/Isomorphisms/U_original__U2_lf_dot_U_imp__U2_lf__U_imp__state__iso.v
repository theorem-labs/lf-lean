From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__total____map__iso Isomorphisms.nat__iso.

Monomorphic Definition imported_Original_LF__DOT__Imp_LF_Imp_state : Type := imported_Original_LF__DOT__Maps_LF_Maps_total__map imported_nat.
Monomorphic Instance Original_LF__DOT__Imp_LF_Imp_state_iso : Iso Original.LF_DOT_Imp.LF.Imp.state imported_Original_LF__DOT__Imp_LF_Imp_state
  := Original_LF__DOT__Maps_LF_Maps_total__map_iso nat_iso.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.state := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_state := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.state Original_LF__DOT__Imp_LF_Imp_state_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.state Imported.Original_LF__DOT__Imp_LF_Imp_state Original_LF__DOT__Imp_LF_Imp_state_iso := {}.