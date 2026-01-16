From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)


From IsomorphismChecker Require Export Isomorphisms.U_string__string__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_token : Type := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_token.

(* Token is just string, so we can reuse String_string_iso *)
Instance Original_LF__DOT__ImpParser_LF_ImpParser_token_iso : Iso Original.LF_DOT_ImpParser.LF.ImpParser.token imported_Original_LF__DOT__ImpParser_LF_ImpParser_token.
Proof.
  unfold Original.LF_DOT_ImpParser.LF.ImpParser.token.
  unfold imported_Original_LF__DOT__ImpParser_LF_ImpParser_token.
  unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_token.
  exact String_string_iso.
Defined.
Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.token := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_token := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.token Original_LF__DOT__ImpParser_LF_ImpParser_token_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.token Imported.Original_LF__DOT__ImpParser_LF_ImpParser_token Original_LF__DOT__ImpParser_LF_ImpParser_token_iso := {}.