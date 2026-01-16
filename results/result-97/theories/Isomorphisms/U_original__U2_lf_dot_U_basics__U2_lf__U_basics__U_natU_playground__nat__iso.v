From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat : Type := Imported.Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat.
Instance Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat_iso : Iso Original.LF_DOT_Basics.LF.Basics.NatPlayground.nat imported_Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat.
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.NatPlayground.nat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.NatPlayground.nat Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.NatPlayground.nat Imported.Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat Original_LF__DOT__Basics_LF_Basics_NatPlayground_nat_iso := {}.