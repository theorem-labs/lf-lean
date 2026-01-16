From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_ascii__ascii__iso Isomorphisms.U_string__string__iso Isomorphisms.list__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_list__of__string : imported_String_string -> imported_list imported_Ascii_ascii := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_list__of__string.

Lemma list_of_string_compat : forall (x1 : String.string),
  rel_iso (list_iso Ascii_ascii_iso) 
          (Original.LF_DOT_ImpParser.LF.ImpParser.list_of_string x1) 
          (imported_Original_LF__DOT__ImpParser_LF_ImpParser_list__of__string (string_to x1)).
Proof.
  fix IH 1.
  intros x1.
  constructor; simpl.
  destruct x1 as [|c rest].
  - apply IsomorphismDefinitions.eq_refl.
  - simpl.
    apply (IsoEq.f_equal2 (@Imported.list_cons _)).
    + destruct c as [b0 b1 b2 b3 b4 b5 b6 b7].
      destruct b0; destruct b1; destruct b2; destruct b3;
      destruct b4; destruct b5; destruct b6; destruct b7;
      apply IsomorphismDefinitions.eq_refl.
    + apply IH.
Defined.

Instance Original_LF__DOT__ImpParser_LF_ImpParser_list__of__string_iso : forall (x1 : String.string) (x2 : imported_String_string),
  rel_iso String_string_iso x1 x2 ->
  rel_iso (list_iso Ascii_ascii_iso) (Original.LF_DOT_ImpParser.LF.ImpParser.list_of_string x1) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_list__of__string x2).
Proof.
  intros x1 x2 Hx.
  unfold rel_iso in Hx. simpl in Hx.
  apply (IsoEq.eq_srect (fun x2' => rel_iso (list_iso Ascii_ascii_iso) (Original.LF_DOT_ImpParser.LF.ImpParser.list_of_string x1) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_list__of__string x2')) (list_of_string_compat x1) Hx).
Defined.

Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.list_of_string := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_list__of__string := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.list_of_string Original_LF__DOT__ImpParser_LF_ImpParser_list__of__string_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.list_of_string Imported.Original_LF__DOT__ImpParser_LF_ImpParser_list__of__string Original_LF__DOT__ImpParser_LF_ImpParser_list__of__string_iso := {}.