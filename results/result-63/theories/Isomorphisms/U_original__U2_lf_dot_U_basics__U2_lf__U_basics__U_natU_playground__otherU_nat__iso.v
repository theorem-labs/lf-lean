From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__Basics_LF_Basics_NatPlayground_otherNat : Type := Imported.Original_LF__DOT__Basics_LF_Basics_NatPlayground_otherNat.
Instance Original_LF__DOT__Basics_LF_Basics_NatPlayground_otherNat_iso : Iso Original.LF_DOT_Basics.LF.Basics.NatPlayground.otherNat imported_Original_LF__DOT__Basics_LF_Basics_NatPlayground_otherNat.
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.NatPlayground.otherNat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_NatPlayground_otherNat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.NatPlayground.otherNat Original_LF__DOT__Basics_LF_Basics_NatPlayground_otherNat_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.NatPlayground.otherNat Imported.Original_LF__DOT__Basics_LF_Basics_NatPlayground_otherNat Original_LF__DOT__Basics_LF_Basics_NatPlayground_otherNat_iso := {}.