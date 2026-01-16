From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__total____map__iso Isomorphisms.nat__iso.

(* state is just a type alias for total_map nat, so we derive its iso from total_map_iso nat_iso *)
Monomorphic Definition imported_Original_LF__DOT__Imp_LF_Imp_state : Type
  := imported_Original_LF__DOT__Maps_LF_Maps_total__map imported_nat.

Monomorphic Instance Original_LF__DOT__Imp_LF_Imp_state_iso : Iso Original.LF_DOT_Imp.LF.Imp.state imported_Original_LF__DOT__Imp_LF_Imp_state
  := Original_LF__DOT__Maps_LF_Maps_total__map_iso nat_iso.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.state := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.state Original_LF__DOT__Imp_LF_Imp_state_iso := {}.
