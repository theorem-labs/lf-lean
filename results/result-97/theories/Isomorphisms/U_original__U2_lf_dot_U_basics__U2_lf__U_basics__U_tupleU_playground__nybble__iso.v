From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__Basics_LF_Basics_TuplePlayground_nybble : Type := Imported.Original_LF__DOT__Basics_LF_Basics_TuplePlayground_nybble.
Instance Original_LF__DOT__Basics_LF_Basics_TuplePlayground_nybble_iso : Iso Original.LF_DOT_Basics.LF.Basics.TuplePlayground.nybble imported_Original_LF__DOT__Basics_LF_Basics_TuplePlayground_nybble.
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.TuplePlayground.nybble := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_TuplePlayground_nybble := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.TuplePlayground.nybble Original_LF__DOT__Basics_LF_Basics_TuplePlayground_nybble_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.TuplePlayground.nybble Imported.Original_LF__DOT__Basics_LF_Basics_TuplePlayground_nybble Original_LF__DOT__Basics_LF_Basics_TuplePlayground_nybble_iso := {}.