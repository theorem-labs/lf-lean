From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__Tactics_LF_Tactics_split__combine__statement : SProp := Imported.Original_LF__DOT__Tactics_LF_Tactics_split__combine__statement.
Monomorphic Instance Original_LF__DOT__Tactics_LF_Tactics_split__combine__statement_iso : Iso Original.LF_DOT_Tactics.LF.Tactics.split_combine_statement imported_Original_LF__DOT__Tactics_LF_Tactics_split__combine__statement.
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.split_combine_statement := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_split__combine__statement := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.split_combine_statement Original_LF__DOT__Tactics_LF_Tactics_split__combine__statement_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.split_combine_statement Imported.Original_LF__DOT__Tactics_LF_Tactics_split__combine__statement Original_LF__DOT__Tactics_LF_Tactics_split__combine__statement_iso := {}.