From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(*Typeclasses Opaque rel_iso.*) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_string__string__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_X : imported_String_string := Imported.Original_LF__DOT__Imp_LF_Imp_X.
Instance Original_LF__DOT__Imp_LF_Imp_X_iso : rel_iso String_string_iso Original.LF_DOT_Imp.LF.Imp.X imported_Original_LF__DOT__Imp_LF_Imp_X.
Proof.
  simpl. unfold imported_Original_LF__DOT__Imp_LF_Imp_X.
  simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.X := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_X := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.X Original_LF__DOT__Imp_LF_Imp_X_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.X Imported.Original_LF__DOT__Imp_LF_Imp_X Original_LF__DOT__Imp_LF_Imp_X_iso := {}.