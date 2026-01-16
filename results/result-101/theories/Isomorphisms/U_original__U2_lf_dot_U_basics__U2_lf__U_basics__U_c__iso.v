From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__letter__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_C : imported_Original_LF__DOT__Basics_LF_Basics_letter := Imported.Original_LF__DOT__Basics_LF_Basics_C.
Instance Original_LF__DOT__Basics_LF_Basics_C_iso : rel_iso Original_LF__DOT__Basics_LF_Basics_letter_iso Original.LF_DOT_Basics.LF.Basics.C imported_Original_LF__DOT__Basics_LF_Basics_C.
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.C := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_C := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.C Original_LF__DOT__Basics_LF_Basics_C_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.C Imported.Original_LF__DOT__Basics_LF_Basics_C Original_LF__DOT__Basics_LF_Basics_C_iso := {}.