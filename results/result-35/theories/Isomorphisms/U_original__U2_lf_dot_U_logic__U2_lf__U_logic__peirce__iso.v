From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_peirce : SProp := Imported.Original_LF__DOT__Logic_LF_Logic_peirce.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_peirce_iso : Iso Original.LF_DOT_Logic.LF.Logic.peirce imported_Original_LF__DOT__Logic_LF_Logic_peirce.
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.peirce := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_peirce := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.peirce Original_LF__DOT__Logic_LF_Logic_peirce_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.peirce Imported.Original_LF__DOT__Logic_LF_Logic_peirce Original_LF__DOT__Logic_LF_Logic_peirce_iso := {}.