From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_ascii__ascii__iso Isomorphisms.U_string__string__iso Isomorphisms.list__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_string__of__list : imported_list imported_Ascii_ascii -> imported_String_string := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_string__of__list.

Definition list_ascii_to : list Ascii.ascii -> imported_list imported_Ascii_ascii :=
  fix f (l : list Ascii.ascii) : imported_list imported_Ascii_ascii :=
    match l with
    | nil => @Imported.list_nil _
    | cons c rest => @Imported.list_cons _ (ascii_to c) (f rest)
    end.

Lemma string_of_list_compat : forall (x1 : list Ascii.ascii),
  rel_iso String_string_iso 
          (Original.LF_DOT_ImpParser.LF.ImpParser.string_of_list x1) 
          (imported_Original_LF__DOT__ImpParser_LF_ImpParser_string__of__list (list_ascii_to x1)).
Proof.
  fix IH 1.
  intros x1.
  constructor; simpl.
  destruct x1 as [|c rest].
  - apply IsomorphismDefinitions.eq_refl.
  - simpl.
    apply (IsoEq.f_equal2 Imported.String_string_String).
    + destruct c as [b0 b1 b2 b3 b4 b5 b6 b7].
      destruct b0; destruct b1; destruct b2; destruct b3;
      destruct b4; destruct b5; destruct b6; destruct b7;
      apply IsomorphismDefinitions.eq_refl.
    + apply IH.
Defined.

Instance Original_LF__DOT__ImpParser_LF_ImpParser_string__of__list_iso : forall (x1 : list Ascii.ascii) (x2 : imported_list imported_Ascii_ascii),
  rel_iso (list_iso Ascii_ascii_iso) x1 x2 ->
  rel_iso String_string_iso (Original.LF_DOT_ImpParser.LF.ImpParser.string_of_list x1) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_string__of__list x2).
Proof.
  intros x1 x2 Hx.
  constructor; simpl in Hx. simpl in Hx.
  apply (IsoEq.eq_srect (fun x2' => rel_iso String_string_iso (Original.LF_DOT_ImpParser.LF.ImpParser.string_of_list x1) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_string__of__list x2')) (string_of_list_compat x1) Hx).
Defined.

Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.string_of_list := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_string__of__list := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.string_of_list Original_LF__DOT__ImpParser_LF_ImpParser_string__of__list_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.string_of_list Imported.Original_LF__DOT__ImpParser_LF_ImpParser_string__of__list Original_LF__DOT__ImpParser_LF_ImpParser_string__of__list_iso := {}.