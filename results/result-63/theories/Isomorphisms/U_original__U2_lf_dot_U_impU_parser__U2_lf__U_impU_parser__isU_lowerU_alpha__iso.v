From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_ascii__ascii__iso Isomorphisms.bool__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_isLowerAlpha : imported_Ascii_ascii -> imported_bool := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_isLowerAlpha.
Instance Original_LF__DOT__ImpParser_LF_ImpParser_isLowerAlpha_iso : forall (x1 : Ascii.ascii) (x2 : imported_Ascii_ascii),
  rel_iso Ascii_ascii_iso x1 x2 -> rel_iso bool_iso (Original.LF_DOT_ImpParser.LF.ImpParser.isLowerAlpha x1) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_isLowerAlpha x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.isLowerAlpha := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_isLowerAlpha := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.isLowerAlpha Original_LF__DOT__ImpParser_LF_ImpParser_isLowerAlpha_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.isLowerAlpha Imported.Original_LF__DOT__ImpParser_LF_ImpParser_isLowerAlpha Original_LF__DOT__ImpParser_LF_ImpParser_isLowerAlpha_iso := {}.