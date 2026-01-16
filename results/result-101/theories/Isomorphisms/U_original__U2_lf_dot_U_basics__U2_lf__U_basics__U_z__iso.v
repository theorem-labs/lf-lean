From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bin__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_Z : imported_Original_LF__DOT__Basics_LF_Basics_bin := Imported.Original_LF__DOT__Basics_LF_Basics_Z.
Instance Original_LF__DOT__Basics_LF_Basics_Z_iso : rel_iso Original_LF__DOT__Basics_LF_Basics_bin_iso Original.LF_DOT_Basics.LF.Basics.Z imported_Original_LF__DOT__Basics_LF_Basics_Z.
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.Z := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_Z := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.Z Original_LF__DOT__Basics_LF_Basics_Z_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.Z Imported.Original_LF__DOT__Basics_LF_Basics_Z Original_LF__DOT__Basics_LF_Basics_Z_iso := {}.