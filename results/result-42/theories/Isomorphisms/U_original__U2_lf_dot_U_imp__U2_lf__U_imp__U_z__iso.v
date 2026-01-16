From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)


From IsomorphismChecker Require Export Isomorphisms.U_string__string__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_Z : imported_String_string := Imported.Original_LF__DOT__Imp_LF_Imp_Z.
Instance Original_LF__DOT__Imp_LF_Imp_Z_iso : rel_iso String_string_iso Original.LF_DOT_Imp.LF.Imp.Z imported_Original_LF__DOT__Imp_LF_Imp_Z.
Proof.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_Z.
  constructor.
  simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.Z := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_Z := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.Z Original_LF__DOT__Imp_LF_Imp_Z_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.Z Imported.Original_LF__DOT__Imp_LF_Imp_Z Original_LF__DOT__Imp_LF_Imp_Z_iso := {}.