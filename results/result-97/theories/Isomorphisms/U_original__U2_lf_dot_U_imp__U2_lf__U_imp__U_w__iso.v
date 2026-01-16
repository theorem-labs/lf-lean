From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_string__string__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_W : imported_String_string := Imported.Original_LF__DOT__Imp_LF_Imp_W.
Instance Original_LF__DOT__Imp_LF_Imp_W_iso : rel_iso String_string_iso Original.LF_DOT_Imp.LF.Imp.W imported_Original_LF__DOT__Imp_LF_Imp_W.
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.W := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_W := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.W Original_LF__DOT__Imp_LF_Imp_W_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.W Imported.Original_LF__DOT__Imp_LF_Imp_W Original_LF__DOT__Imp_LF_Imp_W_iso := {}.