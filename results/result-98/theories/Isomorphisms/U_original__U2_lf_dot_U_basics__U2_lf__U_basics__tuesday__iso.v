From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__day__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_tuesday : imported_Original_LF__DOT__Basics_LF_Basics_day := Imported.Original_LF__DOT__Basics_LF_Basics_tuesday.
Instance Original_LF__DOT__Basics_LF_Basics_tuesday_iso : rel_iso Original_LF__DOT__Basics_LF_Basics_day_iso Original.LF_DOT_Basics.LF.Basics.tuesday imported_Original_LF__DOT__Basics_LF_Basics_tuesday.
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.tuesday := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_tuesday := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.tuesday Original_LF__DOT__Basics_LF_Basics_tuesday_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.tuesday Imported.Original_LF__DOT__Basics_LF_Basics_tuesday Original_LF__DOT__Basics_LF_Basics_tuesday_iso := {}.