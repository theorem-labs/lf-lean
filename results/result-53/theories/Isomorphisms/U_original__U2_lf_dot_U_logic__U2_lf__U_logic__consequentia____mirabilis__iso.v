From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Unset Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_consequentia__mirabilis : SProp := Imported.Original_LF__DOT__Logic_LF_Logic_consequentia__mirabilis.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_consequentia__mirabilis_iso : Iso Original.LF_DOT_Logic.LF.Logic.consequentia_mirabilis imported_Original_LF__DOT__Logic_LF_Logic_consequentia__mirabilis.
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.consequentia_mirabilis := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_consequentia__mirabilis := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.consequentia_mirabilis Original_LF__DOT__Logic_LF_Logic_consequentia__mirabilis_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.consequentia_mirabilis Imported.Original_LF__DOT__Logic_LF_Logic_consequentia__mirabilis Original_LF__DOT__Logic_LF_Logic_consequentia__mirabilis_iso := {}.