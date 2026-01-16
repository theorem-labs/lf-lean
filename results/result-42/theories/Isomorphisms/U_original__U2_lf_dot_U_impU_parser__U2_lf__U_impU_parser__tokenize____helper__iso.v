From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
From Stdlib Require Import List.
Import ListNotations.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.U_ascii__ascii__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__chartype__iso Isomorphisms.list__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper : imported_Original_LF__DOT__ImpParser_LF_ImpParser_chartype -> imported_list imported_Ascii_ascii -> imported_list imported_Ascii_ascii -> imported_list (imported_list imported_Ascii_ascii) := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper.

(* Helper definitions *)
Definition chartype_to_imported (c : Original.LF_DOT_ImpParser.LF.ImpParser.chartype) : imported_Original_LF__DOT__ImpParser_LF_ImpParser_chartype :=
  Original_LF__DOT__ImpParser_LF_ImpParser_chartype_iso.(to) c.

Definition list_ascii_to_imported (l : list Ascii.ascii) : imported_list imported_Ascii_ascii :=
  (list_iso Ascii_ascii_iso).(to) l.

Definition list_list_ascii_to_imported (l : list (list Ascii.ascii)) : imported_list (imported_list imported_Ascii_ascii) :=
  (list_iso (list_iso Ascii_ascii_iso)).(to) l.

(* Helper lemma: rev_append preserves the isomorphism *)
Lemma rev_append_iso : forall (l1 l2 : list Ascii.ascii),
  IsomorphismDefinitions.eq 
    (list_ascii_to_imported (rev_append l1 l2))
    (Imported.rev_append _ (list_ascii_to_imported l1) (list_ascii_to_imported l2)).
Proof.
  induction l1 as [|h t IH]; intros l2.
  - (* l1 = [] *)
    unfold list_ascii_to_imported. simpl. apply IsomorphismDefinitions.eq_refl.
  - (* l1 = h :: t *)
    unfold list_ascii_to_imported. simpl.
    specialize (IH (h :: l2)).
    unfold list_ascii_to_imported in IH. simpl in IH.
    exact IH.
Qed.

Lemma rev_iso : forall (l : list Ascii.ascii),
  IsomorphismDefinitions.eq 
    (list_ascii_to_imported (List.rev l)) 
    (Imported.rev _ (list_ascii_to_imported l)).
Proof.
  intros l.
  (* Use rev_alt: rev l = rev_append l [] *)
  rewrite rev_alt.
  unfold Imported.rev.
  apply rev_append_iso.
Qed.

(* More specific version for the cons case *)
Lemma rev_cons_iso : forall (h : Ascii.ascii) (t : list Ascii.ascii),
  IsomorphismDefinitions.eq 
    (list_ascii_to_imported (List.rev (h :: t)))
    (Imported.rev _ (list_ascii_to_imported (h :: t))).
Proof.
  intros h t.
  apply rev_iso.
Qed.

(* Key lemma: app preserves the isomorphism for list (list ascii) *)
Lemma app_list_list_iso : forall (l1 l2 : list (list Ascii.ascii)),
  IsomorphismDefinitions.eq 
    (list_list_ascii_to_imported (l1 ++ l2))
    (Imported.app _ (list_list_ascii_to_imported l1) (list_list_ascii_to_imported l2)).
Proof.
  induction l1 as [|h t IH]; intros l2; unfold list_list_ascii_to_imported; simpl.
  - apply IsomorphismDefinitions.eq_refl.
  - apply (IsoEq.f_equal2 (Imported.list_cons _)).
    + apply IsomorphismDefinitions.eq_refl.
    + specialize (IH l2). unfold list_list_ascii_to_imported in IH. exact IH.
Qed.

(* The main isomorphism theorem *)
(* We prove by showing: to (tokenize_helper cls acc xs) = tokenize_helper_imp (to cls) (to acc) (to xs) *)

(* The proof uses fix to handle the recursion in SProp *)
Lemma tokenize_helper_iso_main : forall (x1 : Original.LF_DOT_ImpParser.LF.ImpParser.chartype) 
                                       (x3 : list Ascii.ascii) (x5 : list Ascii.ascii),
  IsomorphismDefinitions.eq
    (list_list_ascii_to_imported (Original.LF_DOT_ImpParser.LF.ImpParser.tokenize_helper x1 x3 x5))
    (imported_Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper 
      (chartype_to_imported x1) (list_ascii_to_imported x3) (list_ascii_to_imported x5)).
Proof.
  intros x1 x3 x5.
  revert x1 x3.
  induction x5 as [|h5 t5 IH]; intros x1 x3.
  { (* x5 = [] *)
    unfold list_list_ascii_to_imported, list_ascii_to_imported, chartype_to_imported.
    destruct x3 as [|h3 t3]; destruct x1; simpl;
    try apply IsomorphismDefinitions.eq_refl.
    all: apply (IsoEq.f_equal2 (Imported.list_cons _));
         [apply rev_cons_iso | apply IsomorphismDefinitions.eq_refl]. }
  { (* x5 = h5 :: t5 *)
    unfold list_list_ascii_to_imported, list_ascii_to_imported, chartype_to_imported in IH.
    (* Case analysis on chartype, ascii character, and accumulator *)
    destruct x1; destruct h5 as [b0 b1 b2 b3 b4 b5 b6 b7];
    destruct b0; destruct b1; destruct b2; destruct b3;
    destruct b4; destruct b5; destruct b6; destruct b7;
    destruct x3 as [|h3 t3];
    unfold list_list_ascii_to_imported, list_ascii_to_imported, chartype_to_imported;
    simpl;
    (* Apply the induction hypothesis or use reflexivity *)
    try apply IH;
    try (apply (IsoEq.f_equal2 (Imported.list_cons _));
         [try apply IsomorphismDefinitions.eq_refl; try apply rev_cons_iso | 
          try apply IsomorphismDefinitions.eq_refl; try apply IH]);
    try (apply (IsoEq.f_equal2 (Imported.list_cons _));
         [apply (IsoEq.f_equal2 (Imported.list_cons _)); 
          [apply IsomorphismDefinitions.eq_refl | apply IsomorphismDefinitions.eq_refl] |
          apply IH]);
    try (eapply IsoEq.eq_trans; [apply app_list_list_iso |];
         apply (IsoEq.f_equal2 (Imported.app _));
         [try apply IsomorphismDefinitions.eq_refl;
          try (apply (IsoEq.f_equal2 (Imported.list_cons _));
               [try apply rev_cons_iso; try apply IsomorphismDefinitions.eq_refl | 
                apply IsomorphismDefinitions.eq_refl]) |
          apply IH]);
    try apply IsomorphismDefinitions.eq_refl;
    try apply IH. }
Qed.

Instance Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper_iso : forall (x1 : Original.LF_DOT_ImpParser.LF.ImpParser.chartype) (x2 : imported_Original_LF__DOT__ImpParser_LF_ImpParser_chartype),
  rel_iso Original_LF__DOT__ImpParser_LF_ImpParser_chartype_iso x1 x2 ->
  forall (x3 : list Ascii.ascii) (x4 : imported_list imported_Ascii_ascii),
  rel_iso (list_iso Ascii_ascii_iso) x3 x4 ->
  forall (x5 : list Ascii.ascii) (x6 : imported_list imported_Ascii_ascii),
  rel_iso (list_iso Ascii_ascii_iso) x5 x6 ->
  rel_iso (list_iso (list_iso Ascii_ascii_iso)) (Original.LF_DOT_ImpParser.LF.ImpParser.tokenize_helper x1 x3 x5) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper x2 x4 x6).
Proof.
  intros x1 x2 Hcls x3 x4 Hacc x5 x6 Hxs.
  idtac.
  
  (* Use transitivity: the LHS is tokenize_helper_iso_main, then we rewrite x2, x4, x6 *)
  eapply IsoEq.eq_trans.
  { apply tokenize_helper_iso_main. }
  
  (* Now we need to show the imported functions are equal when we substitute the iso'd values *)
  apply (IsoEq.f_equal3 imported_Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper).
  - exact Hcls.
  - exact Hacc.
  - exact Hxs.
Qed.

Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.tokenize_helper := {}. 
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper := {}. 
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.tokenize_helper Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.tokenize_helper Imported.Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__helper_iso := {}.
