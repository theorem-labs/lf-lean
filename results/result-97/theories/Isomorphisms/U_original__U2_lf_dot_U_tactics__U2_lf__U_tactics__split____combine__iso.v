From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_tactics__U2_lf__U_tactics__split____combine____statement__iso.

Definition imported_Original_LF__DOT__Tactics_LF_Tactics_split__combine : imported_Original_LF__DOT__Tactics_LF_Tactics_split__combine__statement := Imported.Original_LF__DOT__Tactics_LF_Tactics_split__combine.
Instance Original_LF__DOT__Tactics_LF_Tactics_split__combine_iso : rel_iso Original_LF__DOT__Tactics_LF_Tactics_split__combine__statement_iso Original.LF_DOT_Tactics.LF.Tactics.split_combine imported_Original_LF__DOT__Tactics_LF_Tactics_split__combine.
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.split_combine := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_split__combine := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.split_combine Original_LF__DOT__Tactics_LF_Tactics_split__combine_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.split_combine Imported.Original_LF__DOT__Tactics_LF_Tactics_split__combine Original_LF__DOT__Tactics_LF_Tactics_split__combine_iso := {}.