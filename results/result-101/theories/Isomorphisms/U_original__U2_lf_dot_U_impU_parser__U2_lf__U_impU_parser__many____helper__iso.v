From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
From Stdlib Require Import String Ascii.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__parser__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_many__helper : forall x : Type,
  (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token ->
   imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE (imported_prod x (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token))) ->
  imported_list x ->
  imported_nat ->
  imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token ->
  imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE (imported_prod (imported_list x) (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token)) := (@Imported.Original_LF__DOT__ImpParser_LF_ImpParser_many__helper).

(* Helper lemma: list_rev_append commutes with list_iso *)
Lemma list_rev_append_iso_eq : forall (A B : Type) (iso : Iso A B) (l1 l2 : list A),
  IsomorphismDefinitions.eq 
    (to (list_iso iso) (List.rev_append l1 l2))
    (Imported.list_rev_append B (to (list_iso iso) l1) (to (list_iso iso) l2)).
Proof.
  intros A B iso.
  fix IH 1.
  intros l1 l2.
  destruct l1 as [|h t].
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl. apply IH.
Defined.

(* Helper lemma: list_rev commutes with list_iso *)
Lemma list_rev_iso_eq : forall (A B : Type) (iso : Iso A B) (l : list A),
  IsomorphismDefinitions.eq 
    (to (list_iso iso) (List.rev l))
    (Imported.list_rev B (to (list_iso iso) l)).
Proof.
  intros A B iso l.
  unfold Imported.list_rev.
  (* We use seq_of_eq to convert Prop equality to SProp equality *)
  apply (eq_trans (f_equal (to (list_iso iso)) (seq_of_eq (List.rev_alt l)))).
  apply list_rev_append_iso_eq.
Defined.

(* Helper: the error string "Too many recursive calls" converts correctly *)
Lemma too_many_recursive_calls_iso :
  IsomorphismDefinitions.eq
    (string_to_mystring (String.String "T"%char (String.String "o"%char (String.String "o"%char (String.String " "%char (String.String "m"%char (String.String "a"%char (String.String "n"%char (String.String "y"%char (String.String " "%char (String.String "r"%char (String.String "e"%char (String.String "c"%char (String.String "u"%char (String.String "r"%char (String.String "s"%char (String.String "i"%char (String.String "v"%char (String.String "e"%char (String.String " "%char (String.String "c"%char (String.String "a"%char (String.String "l"%char (String.String "l"%char (String.String "s"%char String.EmptyString)))))))))))))))))))))))))
    Imported.too_many_recursive_calls.
Proof.
  apply IsomorphismDefinitions.eq_refl.
Defined.

(* Helper lemma for the core induction - using eq_rect_r to go the other direction *)
Lemma many_helper_iso_aux :
  forall (x1 x2 : Type) (hx : Iso x1 x2)
         (p : Original.LF_DOT_ImpParser.LF.ImpParser.parser x1)
         (p' : Imported.list Imported.Original_LF__DOT__ImpParser_LF_ImpParser_token ->
               Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE 
                 (Imported.prod x2 (Imported.list Imported.Original_LF__DOT__ImpParser_LF_ImpParser_token))),
    (forall xs, IsomorphismDefinitions.eq
                  (to (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso hx (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso))) (p xs))
                  (p' (to (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso) xs))) ->
    forall steps acc xs,
      IsomorphismDefinitions.eq
        (to (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso (list_iso hx) (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso)))
            (Original.LF_DOT_ImpParser.LF.ImpParser.many_helper p acc steps xs))
        (@Imported.Original_LF__DOT__ImpParser_LF_ImpParser_many__helper x2 p' 
           (to (list_iso hx) acc) 
           (nat_to_lean_nat steps) 
           (to (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso) xs)).
Proof.
  intros x1 x2 hx p p' Hp.
  fix IH 1.
  intros steps acc xs.
  destruct steps as [|n]; simpl.
  - (* steps = 0 *)
    apply (f_equal (Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_NoneE _)).
    apply too_many_recursive_calls_iso.
  - (* steps = S n *)
    destruct (p xs) as [[t xs''] | err] eqn:Ep.
    + (* p xs = SomeE (t, xs'') *)
      pose proof (Hp xs) as Hp'.
      simpl in Hp'. rewrite Ep in Hp'. simpl in Hp'.
      refine (eq_srect (fun r => IsomorphismDefinitions.eq _ (Imported.Original_LF__DOT__ImpParser_LF_ImpParser_many__helper_match_2 x2 _ r _ _)) _ Hp').
      simpl. apply IH.
    + (* p xs = NoneE err *)
      pose proof (Hp xs) as Hp'.
      simpl in Hp'. rewrite Ep in Hp'. simpl in Hp'.
      refine (eq_srect (fun r => IsomorphismDefinitions.eq _ (Imported.Original_LF__DOT__ImpParser_LF_ImpParser_many__helper_match_2 x2 _ r _ _)) _ Hp').
      simpl.
      apply (f_equal2 (fun l1 l2 => Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_SomeE _ (Imported.prod_mk _ _ l1 l2))).
      * apply (list_rev_iso_eq hx acc).
      * apply IsomorphismDefinitions.eq_refl.
Defined.

(* Main instance - direct proof using the aux lemma *)
Instance Original_LF__DOT__ImpParser_LF_ImpParser_many__helper_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_ImpParser.LF.ImpParser.parser x1)
    (x4 : imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token ->
          imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE (imported_prod x2 (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token))),
  (forall (x5 : list Original.LF_DOT_ImpParser.LF.ImpParser.token) (x6 : imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token),
   rel_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso) x5 x6 ->
   rel_iso (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso hx (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso))) (x3 x5) (x4 x6)) ->
  forall (x5 : list x1) (x6 : imported_list x2),
  rel_iso (list_iso hx) x5 x6 ->
  forall (x7 : nat) (x8 : imported_nat),
  rel_iso nat_iso x7 x8 ->
  forall (x9 : list Original.LF_DOT_ImpParser.LF.ImpParser.token) (x10 : imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token),
  rel_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso) x9 x10 ->
  rel_iso (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso (list_iso hx) (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso)))
    (Original.LF_DOT_ImpParser.LF.ImpParser.many_helper x3 x5 x7 x9) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_many__helper x4 x6 x8 x10).
Proof.
  intros x1 x2 hx p p' Hp acc acc' Hacc steps steps' Hsteps xs xs' Hxs.
  constructor.
  simpl in *.
  unfold imported_Original_LF__DOT__ImpParser_LF_ImpParser_many__helper.
  (* Rewrite xs', steps', acc' using their equalities *)
  refine (eq_srect (fun v => IsomorphismDefinitions.eq _ (@Imported.Original_LF__DOT__ImpParser_LF_ImpParser_many__helper x2 p' acc' steps' v)) _ Hxs).
  refine (eq_srect (fun v => IsomorphismDefinitions.eq _ (@Imported.Original_LF__DOT__ImpParser_LF_ImpParser_many__helper x2 p' acc' v _)) _ Hsteps).
  refine (eq_srect (fun v => IsomorphismDefinitions.eq _ (@Imported.Original_LF__DOT__ImpParser_LF_ImpParser_many__helper x2 p' v _ _)) _ Hacc).
  (* Apply the auxiliary lemma *)
  apply many_helper_iso_aux.
  intros ys.
  specialize (Hp ys (to (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso) ys) IsomorphismDefinitions.eq_refl).
  exact Hp.
Defined.
Instance: KnownConstant (@Original.LF_DOT_ImpParser.LF.ImpParser.many_helper) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__ImpParser_LF_ImpParser_many__helper) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_ImpParser.LF.ImpParser.many_helper) Original_LF__DOT__ImpParser_LF_ImpParser_many__helper_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_ImpParser.LF.ImpParser.many_helper) (@Imported.Original_LF__DOT__ImpParser_LF_ImpParser_many__helper) Original_LF__DOT__ImpParser_LF_ImpParser_many__helper_iso := {}.