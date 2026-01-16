From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_string__string__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_Y : imported_String_string := Imported.Original_LF__DOT__Imp_LF_Imp_Y.
Instance Original_LF__DOT__Imp_LF_Imp_Y_iso : rel_iso String_string_iso Original.LF_DOT_Imp.LF.Imp.Y imported_Original_LF__DOT__Imp_LF_Imp_Y.
Proof.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_Y.
  constructor.
  simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.Y := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_Y := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.Y Original_LF__DOT__Imp_LF_Imp_Y_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.Y Imported.Original_LF__DOT__Imp_LF_Imp_Y Original_LF__DOT__Imp_LF_Imp_Y_iso := {}.