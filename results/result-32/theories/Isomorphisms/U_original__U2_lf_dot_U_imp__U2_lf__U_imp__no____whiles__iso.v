From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
(* #[local] Set Universe Polymorphism. *)
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
 (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__com__iso Isomorphisms.bool__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_no__whiles : imported_Original_LF__DOT__Imp_LF_Imp_com -> imported_bool := Imported.Original_LF__DOT__Imp_LF_Imp_no__whiles.

(* Lemma about andb *)
Lemma andb_compat : forall b1 b2 : bool,
  bool_to_imported (andb b1 b2) = Imported.mybool_andb (bool_to_imported b1) (bool_to_imported b2).
Proof. intros b1 b2. destruct b1; destruct b2; reflexivity. Qed.

(* The key lemma: Imported.no_whiles computes correctly on CSeq *)
Lemma no_whiles_CSeq : forall c1 c2 : Imported.Original_LF__DOT__Imp_LF_Imp_com,
  Imported.Original_LF__DOT__Imp_LF_Imp_no__whiles
    (Imported.Original_LF__DOT__Imp_LF_Imp_com_CSeq c1 c2) =
  Imported.mybool_andb
    (Imported.Original_LF__DOT__Imp_LF_Imp_no__whiles c1)
    (Imported.Original_LF__DOT__Imp_LF_Imp_no__whiles c2).
Proof. reflexivity. Qed.

Lemma no_whiles_CIf : forall b c1 c2,
  Imported.Original_LF__DOT__Imp_LF_Imp_no__whiles
    (Imported.Original_LF__DOT__Imp_LF_Imp_com_CIf b c1 c2) =
  Imported.mybool_andb
    (Imported.Original_LF__DOT__Imp_LF_Imp_no__whiles c1)
    (Imported.Original_LF__DOT__Imp_LF_Imp_no__whiles c2).
Proof. reflexivity. Qed.

(* Main lemma: no_whiles commutes with the isomorphisms *)
Lemma no_whiles_compat : forall c : Original.LF_DOT_Imp.LF.Imp.com,
  bool_to_imported (Original.LF_DOT_Imp.LF.Imp.no_whiles c) = 
  Imported.Original_LF__DOT__Imp_LF_Imp_no__whiles (com_to_imported c).
Proof.
  induction c as [| x a | c1 IH1 c2 IH2 | b c1 IH1 c2 IH2 | b c IH]; 
  try reflexivity.
  - (* CSeq *)
    simpl (Original.LF_DOT_Imp.LF.Imp.no_whiles _).
    simpl (com_to_imported _).
    change (Imported.Original_LF__DOT__Imp_LF_Imp_no__whiles 
              (Imported.Original_LF__DOT__Imp_LF_Imp_com_CSeq (com_to_imported c1) (com_to_imported c2)))
      with (Imported.mybool_andb
              (Imported.Original_LF__DOT__Imp_LF_Imp_no__whiles (com_to_imported c1))
              (Imported.Original_LF__DOT__Imp_LF_Imp_no__whiles (com_to_imported c2))).
    rewrite <- IH1, <- IH2.
    destruct (Original.LF_DOT_Imp.LF.Imp.no_whiles c1); destruct (Original.LF_DOT_Imp.LF.Imp.no_whiles c2); reflexivity.
  - (* CIf *)
    simpl (Original.LF_DOT_Imp.LF.Imp.no_whiles _).
    simpl (com_to_imported _).
    change (Imported.Original_LF__DOT__Imp_LF_Imp_no__whiles 
              (Imported.Original_LF__DOT__Imp_LF_Imp_com_CIf (bexp_to_imported b) (com_to_imported c1) (com_to_imported c2)))
      with (Imported.mybool_andb
              (Imported.Original_LF__DOT__Imp_LF_Imp_no__whiles (com_to_imported c1))
              (Imported.Original_LF__DOT__Imp_LF_Imp_no__whiles (com_to_imported c2))).
    rewrite <- IH1, <- IH2.
    destruct (Original.LF_DOT_Imp.LF.Imp.no_whiles c1); destruct (Original.LF_DOT_Imp.LF.Imp.no_whiles c2); reflexivity.
Qed.

Instance Original_LF__DOT__Imp_LF_Imp_no__whiles_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.com) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_com),
  rel_iso Original_LF__DOT__Imp_LF_Imp_com_iso x1 x2 -> rel_iso bool_iso (Original.LF_DOT_Imp.LF.Imp.no_whiles x1) (imported_Original_LF__DOT__Imp_LF_Imp_no__whiles x2).
Proof.
  intros x1 x2 H.
  apply Build_rel_iso.
  destruct H as [H]. simpl in H.
  simpl in *.
  pose proof (no_whiles_compat x1) as Hcompat.
  apply (IsoEq.eq_trans (IsoEq.seq_of_eq Hcompat) (IsoEq.f_equal Imported.Original_LF__DOT__Imp_LF_Imp_no__whiles H)).
Defined.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.no_whiles := {}. 
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_no__whiles := {}. 
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.no_whiles Original_LF__DOT__Imp_LF_Imp_no__whiles_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.no_whiles Imported.Original_LF__DOT__Imp_LF_Imp_no__whiles Original_LF__DOT__Imp_LF_Imp_no__whiles_iso := {}.
