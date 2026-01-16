From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
From Stdlib Require Import String Ascii.
Open Scope string_scope.
Open Scope char_scope.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__optionU_e__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__token__iso Isomorphisms.list__iso Isomorphisms.nat__iso Isomorphisms.prod__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__isU_digit__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__list____of____string__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_parseNumber : imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token ->
  imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE (imported_prod imported_nat (imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token)) := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseNumber.

(* Helper: forallb isDigit compatibility *)
Lemma forallb_isDigit_compat : forall (xs : list Ascii.ascii),
  IsomorphismDefinitions.eq 
    (bool_iso.(to) (List.forallb Original.LF_DOT_ImpParser.LF.ImpParser.isDigit xs))
    (Imported.forallb Imported.ascii Imported.isDigit
      ((list_iso Ascii_ascii_iso).(to) xs)).
Proof.
  fix IH 1.
  intros [| x xs'].
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl.
    destruct x as [b0 b1 b2 b3 b4 b5 b6 b7].
    destruct b0; destruct b1; destruct b2; destruct b3;
    destruct b4; destruct b5; destruct b6; destruct b7;
    simpl; try apply IsomorphismDefinitions.eq_refl;
    try exact (IH xs').
Defined.

(* Helper: list_of_string compatibility *)
Lemma list_of_string_compat' : forall (s : String.string),
  IsomorphismDefinitions.eq
    ((list_iso Ascii_ascii_iso).(to) (Original.LF_DOT_ImpParser.LF.ImpParser.list_of_string s))
    (Imported.list_of_string (String_string_iso.(to) s)).
Proof.
  fix IH 1.
  intros [| c s'].
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl.
    apply (IsoEq.f_equal2 (Imported.list_cons _)).
    + apply IsomorphismDefinitions.eq_refl.
    + exact (IH s').
Defined.

(* Prove nat_of_ascii compatibility *)
Lemma nat_of_ascii_compat : forall (c : Ascii.ascii),
  IsomorphismDefinitions.eq
    (nat_iso.(to) (Ascii.nat_of_ascii c))
    (Imported.nat_of_ascii (Ascii_ascii_iso.(to) c)).
Proof.
  intros [b0 b1 b2 b3 b4 b5 b6 b7].
  destruct b0; destruct b1; destruct b2; destruct b3;
  destruct b4; destruct b5; destruct b6; destruct b7;
  simpl; apply IsomorphismDefinitions.eq_refl.
Defined.

(* Helper: add compatibility using Lean reduction lemmas *)
Lemma add_compat : forall n m : nat,
  IsomorphismDefinitions.eq (nat_iso.(to) (n + m)) (Imported.nat_add (nat_iso.(to) n) (nat_iso.(to) m)).
Proof.
  fix IH 1.
  intros [|n'] m.
  - simpl. 
    pose proof (Imported.nat_add_zero_l (nat_to_lean_nat m)) as H.
    destruct H. apply IsomorphismDefinitions.eq_refl.
  - simpl.
    pose proof (Imported.nat_add_succ_l (nat_to_lean_nat n') (nat_to_lean_nat m)) as H.
    destruct H.
    apply (IsoEq.f_equal Lean.Nat_succ). apply IH.
Defined.

(* Helper: mul compatibility *)
Lemma mul_compat : forall n m : nat,
  IsomorphismDefinitions.eq (nat_iso.(to) (n * m)) (Imported.nat_mul (nat_iso.(to) n) (nat_iso.(to) m)).
Proof.
  fix IH 1.
  intros [|n'] m.
  - simpl. 
    pose proof (Imported.nat_mul_zero_l (nat_to_lean_nat m)) as H.
    destruct H. apply IsomorphismDefinitions.eq_refl.
  - simpl.
    pose proof (Imported.nat_mul_succ_l (nat_to_lean_nat n') (nat_to_lean_nat m)) as H.
    destruct H.
    apply (IsoEq.eq_trans (add_compat m (n' * m))).
    apply (IsoEq.f_equal (Imported.nat_add (nat_to_lean_nat m))). apply IH.
Defined.

(* Helper: sub compatibility *)
Lemma sub_compat : forall n m : nat,
  IsomorphismDefinitions.eq (nat_iso.(to) (n - m)) (Imported.nat_sub (nat_iso.(to) n) (nat_iso.(to) m)).
Proof.
  fix IH 1.
  intros n [|m'].
  - simpl. destruct n; apply IsomorphismDefinitions.eq_refl.
  - destruct n as [|n'].
    + simpl. pose proof (Imported.nat_sub_zero_l (nat_to_lean_nat (S m'))) as H.
      destruct H. apply IsomorphismDefinitions.eq_refl.
    + simpl. 
      pose proof (Imported.nat_sub_succ_succ (nat_to_lean_nat n') (nat_to_lean_nat m')) as H.
      destruct H. apply IH.
Defined.

(* nat_10 and nat_48 compatibility *)
Lemma nat_10_compat : IsomorphismDefinitions.eq (nat_iso.(to) 10%nat) Imported.nat_10.
Proof. simpl. apply IsomorphismDefinitions.eq_refl. Defined.

Lemma nat_48_compat : IsomorphismDefinitions.eq (nat_iso.(to) 48%nat) Imported.nat_48.
Proof. simpl. apply IsomorphismDefinitions.eq_refl. Defined.

(* fold_left compatibility for parseNumber - complex due to universe issues with list_iso *)
Lemma fold_left_parseNumber_compat' : forall (xs : list Ascii.ascii) (acc : nat),
  IsomorphismDefinitions.eq
    (nat_iso.(to) (List.fold_left
      (fun n d => 10 * n + (Ascii.nat_of_ascii d - Ascii.nat_of_ascii "0"%char))
      xs acc))
    (Imported.fold_left_nat
      (fun acc' d => Imported.nat_add (Imported.nat_mul Imported.nat_10 acc') 
                                       (Imported.nat_sub (Imported.nat_of_ascii d) Imported.nat_48))
      ((list_iso Ascii_ascii_iso).(to) xs)
      (nat_iso.(to) acc)).
Proof.
  fix IH 1.
  intros [| x xs'] acc.
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl.
    eapply IsoEq.eq_trans.
    { apply (IH xs' (10 * acc + (Ascii.nat_of_ascii x - 48))%nat). }
    apply (IsoEq.f_equal (fun acc' => Imported.fold_left_nat _ ((list_iso Ascii_ascii_iso).(to) xs') acc')).
    eapply IsoEq.eq_trans.
    { apply add_compat. }
    apply (IsoEq.f_equal2 Imported.nat_add).
    + eapply IsoEq.eq_trans. apply mul_compat.
      apply (IsoEq.f_equal2 Imported.nat_mul).
      * apply nat_10_compat.
      * apply IsomorphismDefinitions.eq_refl.
    + eapply IsoEq.eq_trans. apply sub_compat.
      apply (IsoEq.f_equal2 Imported.nat_sub).
      * apply nat_of_ascii_compat.
      * apply nat_48_compat.
Defined.

(* Main parseNumber compatibility lemma *)
Lemma parseNumber_compat : forall (xs : list Original.LF_DOT_ImpParser.LF.ImpParser.token),
  IsomorphismDefinitions.eq
    ((Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso nat_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso))).(to)
      (Original.LF_DOT_ImpParser.LF.ImpParser.parseNumber xs))
    (Imported.parseNumber ((list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso).(to) xs)).
Proof.
  intros [| x xs'].
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl.
    destruct (List.forallb Original.LF_DOT_ImpParser.LF.ImpParser.isDigit 
              (Original.LF_DOT_ImpParser.LF.ImpParser.list_of_string x)) eqn:Hforallb.
    + pose proof (forallb_isDigit_compat (Original.LF_DOT_ImpParser.LF.ImpParser.list_of_string x)) as Hcompat.
      rewrite Hforallb in Hcompat. simpl in Hcompat.
      refine (eq_srect (fun b => IsomorphismDefinitions.eq _ (Imported.mybool_andb_match_1 _ b _ _)) _ _).
      2: {
        eapply IsoEq.eq_trans. exact Hcompat.
        apply (IsoEq.f_equal (Imported.forallb _ _)).
        apply list_of_string_compat'.
      }
      simpl.
      apply (IsoEq.f_equal (Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_SomeE _)).
      apply (IsoEq.f_equal2 (Imported.prod_mk _ _)).
      * eapply IsoEq.eq_trans.
        exact (fold_left_parseNumber_compat' (Original.LF_DOT_ImpParser.LF.ImpParser.list_of_string x) 0).
        apply (IsoEq.f_equal (fun l => Imported.fold_left_nat _ l _)).
        apply list_of_string_compat'.
      * apply IsomorphismDefinitions.eq_refl.
    + pose proof (forallb_isDigit_compat (Original.LF_DOT_ImpParser.LF.ImpParser.list_of_string x)) as Hcompat.
      rewrite Hforallb in Hcompat. simpl in Hcompat.
      refine (eq_srect (fun b => IsomorphismDefinitions.eq _ (Imported.mybool_andb_match_1 _ b _ _)) _ _).
      2: {
        eapply IsoEq.eq_trans. exact Hcompat.
        apply (IsoEq.f_equal (Imported.forallb _ _)).
        apply list_of_string_compat'.
      }
      simpl.
      apply IsomorphismDefinitions.eq_refl.
Defined.

Instance Original_LF__DOT__ImpParser_LF_ImpParser_parseNumber_iso : forall (x1 : list Original.LF_DOT_ImpParser.LF.ImpParser.token) (x2 : imported_list imported_Original_LF__DOT__ImpParser_LF_ImpParser_token),
  rel_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso) x1 x2 ->
  rel_iso (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso nat_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso)))
    (Original.LF_DOT_ImpParser.LF.ImpParser.parseNumber x1) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_parseNumber x2).
Proof.
  intros x1 x2 Hiso.
  pose proof (proj_rel_iso Hiso) as Hiso'. simpl in Hiso'.
  apply (eq_srect 
    (fun x2' => rel_iso (Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso (prod_iso nat_iso (list_iso Original_LF__DOT__ImpParser_LF_ImpParser_token_iso)))
      (Original.LF_DOT_ImpParser.LF.ImpParser.parseNumber x1) 
      (imported_Original_LF__DOT__ImpParser_LF_ImpParser_parseNumber x2'))
    (parseNumber_compat x1) Hiso').
Defined.

Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.parseNumber := {}.
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseNumber := {}.
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.parseNumber Original_LF__DOT__ImpParser_LF_ImpParser_parseNumber_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.parseNumber Imported.Original_LF__DOT__ImpParser_LF_ImpParser_parseNumber Original_LF__DOT__ImpParser_LF_ImpParser_parseNumber_iso := {}.
