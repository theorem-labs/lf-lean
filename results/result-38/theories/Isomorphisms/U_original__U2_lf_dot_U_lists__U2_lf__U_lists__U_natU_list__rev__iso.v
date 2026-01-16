From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__natlist__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__app__iso.
Import IsomorphismDefinitions.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_rev : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist -> imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_rev.

(* Helper: Imported.rev respects the nil constructor *)
Lemma imported_rev_nil :
  IsomorphismDefinitions.eq 
    (Imported.Original_LF__DOT__Lists_LF_Lists_NatList_rev 
      Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist_nil)
    Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist_nil.
Proof.
  apply IsomorphismDefinitions.eq_refl.
Qed.

(* Helper: Imported.rev respects the cons constructor *)
Lemma imported_rev_cons : forall n t,
  IsomorphismDefinitions.eq 
    (Imported.Original_LF__DOT__Lists_LF_Lists_NatList_rev 
      (Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist_cons n t))
    (Imported.Original_LF__DOT__Lists_LF_Lists_NatList_app 
      (Imported.Original_LF__DOT__Lists_LF_Lists_NatList_rev t)
      (Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist_cons n 
        Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist_nil)).
Proof.
  intros.
  apply IsomorphismDefinitions.eq_refl.
Qed.

(* Prove that rev commutes with natlist_to_imported *)
Lemma rev_commutes : forall (l : Original.LF_DOT_Lists.LF.Lists.NatList.natlist),
  Logic.eq (natlist_to_imported (Original.LF_DOT_Lists.LF.Lists.NatList.rev l))
           (Imported.Original_LF__DOT__Lists_LF_Lists_NatList_rev (natlist_to_imported l)).
Proof.
  fix IH 1.
  intros l.
  destruct l as [| n t].
  { reflexivity. }
  { simpl (Original.LF_DOT_Lists.LF.Lists.NatList.rev _).
    simpl (natlist_to_imported (Original.LF_DOT_Lists.LF.Lists.NatList.cons _ _)).
    specialize (IH t) as IH_t.
    (* Goal: natlist_to_imported (app (rev t) [n]) = Imported.rev (cons (nat_to_imported n) (natlist_to_imported t)) *)
    apply eq_of_seq.
    (* First use app_compat *)
    pose proof (Logic.eq_sym (app_compat (Original.LF_DOT_Lists.LF.Lists.NatList.rev t) 
                                         (Original.LF_DOT_Lists.LF.Lists.NatList.cons n Original.LF_DOT_Lists.LF.Lists.NatList.nil))) as Happ.
    simpl (natlist_to_imported (Original.LF_DOT_Lists.LF.Lists.NatList.cons _ _)) in Happ.
    pose proof (seq_of_eq Happ) as Happ_seq.
    (* Now use IH_t *)
    pose proof (seq_of_eq IH_t) as HIH.
    pose proof (f_equal (fun x => Imported.Original_LF__DOT__Lists_LF_Lists_NatList_app x 
                (Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist_cons (nat_to_imported n) Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist_nil)) HIH) as Happ2.
    pose proof (eq_trans Happ_seq Happ2) as H1.
    (* H1: natlist_to_imported (app (rev t) [n]) = Imported.app (Imported.rev (natlist_to_imported t)) [nat_to_imported n] *)
    (* Now we need: Imported.app (Imported.rev (natlist_to_imported t)) [n] = Imported.rev (cons n (natlist_to_imported t)) *)
    pose proof (eq_sym (imported_rev_cons (nat_to_imported n) (natlist_to_imported t))) as H2.
    apply (eq_trans H1 H2). }
Qed.

Instance Original_LF__DOT__Lists_LF_Lists_NatList_rev_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist),
  rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x1 x2 ->
  rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso (Original.LF_DOT_Lists.LF.Lists.NatList.rev x1) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_rev x2).
Proof.
  intros x1 x2 H1.
  constructor.
  unfold imported_Original_LF__DOT__Lists_LF_Lists_NatList_rev.
  unfold Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso in *.
  simpl in *.
  (* H1 : eq (natlist_to_imported x1) x2 *)
  (* Goal: eq (natlist_to_imported (rev x1)) (Imported.rev x2) *)
  pose proof (seq_of_eq (rev_commutes x1)) as Hcomm.
  pose proof (f_equal Imported.Original_LF__DOT__Lists_LF_Lists_NatList_rev H1) as Harg.
  apply (eq_trans Hcomm Harg).
Defined.

Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.rev := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_rev := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.rev Original_LF__DOT__Lists_LF_Lists_NatList_rev_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.rev Imported.Original_LF__DOT__Lists_LF_Lists_NatList_rev Original_LF__DOT__Lists_LF_Lists_NatList_rev_iso := {}.