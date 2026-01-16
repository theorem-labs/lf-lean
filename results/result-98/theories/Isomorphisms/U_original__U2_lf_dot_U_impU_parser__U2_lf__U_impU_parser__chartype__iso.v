From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_chartype : Type := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_chartype.

Definition chartype_to (c : Original.LF_DOT_ImpParser.LF.ImpParser.chartype) : imported_Original_LF__DOT__ImpParser_LF_ImpParser_chartype :=
  match c with
  | Original.LF_DOT_ImpParser.LF.ImpParser.white => Imported.Original_LF__DOT__ImpParser_LF_ImpParser_chartype_white
  | Original.LF_DOT_ImpParser.LF.ImpParser.alpha => Imported.Original_LF__DOT__ImpParser_LF_ImpParser_chartype_alpha
  | Original.LF_DOT_ImpParser.LF.ImpParser.digit => Imported.Original_LF__DOT__ImpParser_LF_ImpParser_chartype_digit
  | Original.LF_DOT_ImpParser.LF.ImpParser.other => Imported.Original_LF__DOT__ImpParser_LF_ImpParser_chartype_other
  end.

Definition chartype_from (c : imported_Original_LF__DOT__ImpParser_LF_ImpParser_chartype) : Original.LF_DOT_ImpParser.LF.ImpParser.chartype :=
  match c with
  | Imported.Original_LF__DOT__ImpParser_LF_ImpParser_chartype_white => Original.LF_DOT_ImpParser.LF.ImpParser.white
  | Imported.Original_LF__DOT__ImpParser_LF_ImpParser_chartype_alpha => Original.LF_DOT_ImpParser.LF.ImpParser.alpha
  | Imported.Original_LF__DOT__ImpParser_LF_ImpParser_chartype_digit => Original.LF_DOT_ImpParser.LF.ImpParser.digit
  | Imported.Original_LF__DOT__ImpParser_LF_ImpParser_chartype_other => Original.LF_DOT_ImpParser.LF.ImpParser.other
  end.

Instance Original_LF__DOT__ImpParser_LF_ImpParser_chartype_iso : Iso Original.LF_DOT_ImpParser.LF.ImpParser.chartype imported_Original_LF__DOT__ImpParser_LF_ImpParser_chartype.
Proof.
  exists chartype_to chartype_from.
  - intros []; apply IsomorphismDefinitions.eq_refl.
  - intros []; apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.chartype := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_chartype := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.chartype Original_LF__DOT__ImpParser_LF_ImpParser_chartype_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.chartype Imported.Original_LF__DOT__ImpParser_LF_ImpParser_chartype Original_LF__DOT__ImpParser_LF_ImpParser_chartype_iso := {}.