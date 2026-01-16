From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_string__string__iso Isomorphisms.list__iso Isomorphisms.U_ascii__ascii__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__tokenize____helper__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__list____of____string__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__string____of____list__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__chartype__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_tokenize : imported_String_string -> imported_list imported_String_string := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_tokenize.

(* Lemma: map preserves isomorphism when applied with iso'd function *)
Lemma map_iso_simple : forall (A1 A2 B1 B2 : Type) (isoA : Iso A1 A2) (isoB : Iso B1 B2) 
                       (f : A1 -> B1) (g : A2 -> B2),
  (forall a1, IsomorphismDefinitions.eq (isoB.(to) (f a1)) (g (isoA.(to) a1))) ->
  forall l1, IsomorphismDefinitions.eq 
               ((list_iso isoB).(to) (List.map f l1)) 
               (Imported.map _ _ g ((list_iso isoA).(to) l1)).
Proof.
  intros A1 A2 B1 B2 isoA isoB f g Hfg.
  fix IH 1.
  intros l1.
  destruct l1 as [|h1 t1].
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl. apply (IsoEq.f_equal2 (Imported.list_cons _)).
    + apply Hfg.
    + apply IH.
Qed.

(* String_of_list iso helper *)
Lemma string_of_list_iso_helper : forall l,
  IsomorphismDefinitions.eq 
    (String_string_iso.(to) (Original.LF_DOT_ImpParser.LF.ImpParser.string_of_list l))
    (Imported.Original_LF__DOT__ImpParser_LF_ImpParser_string__of__list ((list_iso Ascii_ascii_iso).(to) l)).
Proof.
  intros l.
  assert (Hrel : rel_iso (list_iso Ascii_ascii_iso) l ((list_iso Ascii_ascii_iso).(to) l)).
  { constructor. apply IsomorphismDefinitions.eq_refl. }
  pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_string__of__list_iso l ((list_iso Ascii_ascii_iso).(to) l) Hrel) as H.
  constructor; simpl in H. exact H.
Qed.

Instance Original_LF__DOT__ImpParser_LF_ImpParser_tokenize_iso : forall (x1 : String.string) (x2 : imported_String_string),
  rel_iso String_string_iso x1 x2 -> rel_iso (list_iso String_string_iso) (Original.LF_DOT_ImpParser.LF.ImpParser.tokenize x1) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_tokenize x2).
Proof.
  intros x1 x2 Hs.
  idtac.
  unfold Original.LF_DOT_ImpParser.LF.ImpParser.tokenize.
  unfold imported_Original_LF__DOT__ImpParser_LF_ImpParser_tokenize.
  unfold Imported.Original_LF__DOT__ImpParser_LF_ImpParser_tokenize.
  
  eapply IsoEq.eq_trans.
  { apply map_iso_simple. apply string_of_list_iso_helper. }
  
  apply (IsoEq.f_equal (Imported.map _ _ _)).
  
  assert (Hwhite : rel_iso Original_LF__DOT__ImpParser_LF_ImpParser_chartype_iso 
                           Original.LF_DOT_ImpParser.LF.ImpParser.white
                           (Original_LF__DOT__ImpParser_LF_ImpParser_chartype_iso.(to) Original.LF_DOT_ImpParser.LF.ImpParser.white)).
  { constructor. apply IsomorphismDefinitions.eq_refl. }
  
  assert (Hnil : rel_iso (list_iso Ascii_ascii_iso) (@nil Ascii.ascii) (Imported.list_nil _)).
  { constructor; simpl. apply IsomorphismDefinitions.eq_refl. }
  
  assert (Hxs : rel_iso (list_iso Ascii_ascii_iso) 
                        (Original.LF_DOT_ImpParser.LF.ImpParser.list_of_string x1)
                        ((list_iso Ascii_ascii_iso).(to) (Original.LF_DOT_ImpParser.LF.ImpParser.list_of_string x1))).
  { constructor. apply IsomorphismDefinitions.eq_refl. }
  
  pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper_iso 
                Original.LF_DOT_ImpParser.LF.ImpParser.white
                (Original_LF__DOT__ImpParser_LF_ImpParser_chartype_iso.(to) Original.LF_DOT_ImpParser.LF.ImpParser.white)
                Hwhite
                (@nil Ascii.ascii)
                (Imported.list_nil _)
                Hnil
                (Original.LF_DOT_ImpParser.LF.ImpParser.list_of_string x1)
                ((list_iso Ascii_ascii_iso).(to) (Original.LF_DOT_ImpParser.LF.ImpParser.list_of_string x1))
                Hxs) as H.
  constructor; simpl in H. simpl in H.
  
  eapply IsoEq.eq_trans.
  { exact H. }
  
  apply (IsoEq.f_equal3 imported_Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper).
  - apply IsomorphismDefinitions.eq_refl.
  - apply IsomorphismDefinitions.eq_refl.
  - pose proof (@Original_LF__DOT__ImpParser_LF_ImpParser_list__of__string_iso x1 x2 Hs) as Hlist.
    constructor; simpl in Hlist. exact Hlist.
Defined.

Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.tokenize := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_tokenize := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.tokenize Original_LF__DOT__ImpParser_LF_ImpParser_tokenize_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.tokenize Imported.Original_LF__DOT__ImpParser_LF_ImpParser_tokenize Original_LF__DOT__ImpParser_LF_ImpParser_tokenize_iso := {}.