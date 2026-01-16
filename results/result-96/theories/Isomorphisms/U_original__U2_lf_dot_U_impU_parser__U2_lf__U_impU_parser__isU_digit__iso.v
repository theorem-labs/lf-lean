From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_ascii__ascii__iso Isomorphisms.bool__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_isDigit : imported_Ascii_ascii -> imported_bool := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_isDigit.

Lemma isDigit_compat : forall (x1 : Ascii.ascii),
  rel_iso bool_iso (Original.LF_DOT_ImpParser.LF.ImpParser.isDigit x1) 
                   (imported_Original_LF__DOT__ImpParser_LF_ImpParser_isDigit (ascii_to x1)).
Proof.
  intros x1.
  constructor; simpl.
  destruct x1 as [b0 b1 b2 b3 b4 b5 b6 b7].
  destruct b0; destruct b1; destruct b2; destruct b3;
  destruct b4; destruct b5; destruct b6; destruct b7;
  apply IsomorphismDefinitions.eq_refl.
Defined.

Instance Original_LF__DOT__ImpParser_LF_ImpParser_isDigit_iso : forall (x1 : Ascii.ascii) (x2 : imported_Ascii_ascii),
  rel_iso Ascii_ascii_iso x1 x2 -> rel_iso bool_iso (Original.LF_DOT_ImpParser.LF.ImpParser.isDigit x1) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_isDigit x2).
Proof.
  intros x1 x2 Hx.
  constructor; simpl in Hx. simpl in Hx.
  apply (IsoEq.eq_srect (fun x2' => rel_iso bool_iso (Original.LF_DOT_ImpParser.LF.ImpParser.isDigit x1) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_isDigit x2')) (isDigit_compat x1) Hx).
Defined.
Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.isDigit := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_isDigit := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.isDigit Original_LF__DOT__ImpParser_LF_ImpParser_isDigit_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.isDigit Imported.Original_LF__DOT__ImpParser_LF_ImpParser_isDigit Original_LF__DOT__ImpParser_LF_ImpParser_isDigit_iso := {}.