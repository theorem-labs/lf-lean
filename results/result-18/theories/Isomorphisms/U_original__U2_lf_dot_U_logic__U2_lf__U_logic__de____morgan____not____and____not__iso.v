From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_de__morgan__not__and__not : SProp := Imported.Original_LF__DOT__Logic_LF_Logic_de__morgan__not__and__not.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_de__morgan__not__and__not_iso : Iso Original.LF_DOT_Logic.LF.Logic.de_morgan_not_and_not imported_Original_LF__DOT__Logic_LF_Logic_de__morgan__not__and__not.
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.de_morgan_not_and_not := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_de__morgan__not__and__not := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.de_morgan_not_and_not Original_LF__DOT__Logic_LF_Logic_de__morgan__not__and__not_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.de_morgan_not_and_not Imported.Original_LF__DOT__Logic_LF_Logic_de__morgan__not__and__not Original_LF__DOT__Logic_LF_Logic_de__morgan__not__and__not_iso := {}.