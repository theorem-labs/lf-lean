From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_logic__not__iso Isomorphisms.U_original__U_false__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_not__False : imported_Original_False -> imported_False := Imported.Original_LF__DOT__Logic_LF_Logic_not__False.
Instance Original_LF__DOT__Logic_LF_Logic_not__False_iso : forall (x1 : Original.False) (x2 : imported_Original_False),
  rel_iso Original_False_iso x1 x2 -> rel_iso False_iso (Original.LF_DOT_Logic.LF.Logic.not_False x1) (imported_Original_LF__DOT__Logic_LF_Logic_not__False x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.not_False := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_not__False := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.not_False Original_LF__DOT__Logic_LF_Logic_not__False_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.not_False Imported.Original_LF__DOT__Logic_LF_Logic_not__False Original_LF__DOT__Logic_LF_Logic_not__False_iso := {}.