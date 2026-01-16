From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__letter__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_A : imported_Original_LF__DOT__Basics_LF_Basics_letter := Imported.Original_LF__DOT__Basics_LF_Basics_A.
Instance Original_LF__DOT__Basics_LF_Basics_A_iso : rel_iso Original_LF__DOT__Basics_LF_Basics_letter_iso Original.LF_DOT_Basics.LF.Basics.A imported_Original_LF__DOT__Basics_LF_Basics_A.
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.A := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_A := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.A Original_LF__DOT__Basics_LF_Basics_A_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.A Imported.Original_LF__DOT__Basics_LF_Basics_A Original_LF__DOT__Basics_LF_Basics_A_iso := {}.