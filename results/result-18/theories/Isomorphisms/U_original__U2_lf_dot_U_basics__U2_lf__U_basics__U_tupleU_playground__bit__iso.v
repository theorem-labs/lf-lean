From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__Basics_LF_Basics_TuplePlayground_bit : Type := Imported.Original_LF__DOT__Basics_LF_Basics_TuplePlayground_bit.
Monomorphic Instance Original_LF__DOT__Basics_LF_Basics_TuplePlayground_bit_iso : Iso Original.LF_DOT_Basics.LF.Basics.TuplePlayground.bit imported_Original_LF__DOT__Basics_LF_Basics_TuplePlayground_bit.
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.TuplePlayground.bit := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_TuplePlayground_bit := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.TuplePlayground.bit Original_LF__DOT__Basics_LF_Basics_TuplePlayground_bit_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.TuplePlayground.bit Imported.Original_LF__DOT__Basics_LF_Basics_TuplePlayground_bit Original_LF__DOT__Basics_LF_Basics_TuplePlayground_bit_iso := {}.