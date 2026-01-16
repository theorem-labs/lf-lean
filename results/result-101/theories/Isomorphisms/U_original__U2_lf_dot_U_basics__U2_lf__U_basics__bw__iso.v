From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Definition imported_Original_LF__DOT__Basics_LF_Basics_bw : Type := Imported.Original_LF__DOT__Basics_LF_Basics_bw.
Instance Original_LF__DOT__Basics_LF_Basics_bw_iso : Iso Original.LF_DOT_Basics.LF.Basics.bw imported_Original_LF__DOT__Basics_LF_Basics_bw.
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.bw := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_bw := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.bw Original_LF__DOT__Basics_LF_Basics_bw_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.bw Imported.Original_LF__DOT__Basics_LF_Basics_bw Original_LF__DOT__Basics_LF_Basics_bw_iso := {}.