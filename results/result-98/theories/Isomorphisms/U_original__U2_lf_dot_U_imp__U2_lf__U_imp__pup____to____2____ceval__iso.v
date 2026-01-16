From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____update__iso Isomorphisms.__0__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_x__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_y__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__ceval__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__empty____st__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__pup____to____n__iso Isomorphisms.U_s__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.false__iso Isomorphisms.true__iso.

(* Convert Imported state definition to use our imported_* aliases *)
Definition imported_st1' : imported_String_string -> imported_nat :=
  fun x => imported_Original_LF__DOT__Maps_LF_Maps_t__update 
    (fun x0 => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x0)
    imported_Original_LF__DOT__Imp_LF_Imp_X
    (imported_S (imported_S imported_0)) x.

Definition imported_st2' : imported_String_string -> imported_nat :=
  fun x => imported_Original_LF__DOT__Maps_LF_Maps_t__update
    (fun x0 => imported_Original_LF__DOT__Maps_LF_Maps_t__update
       (fun x1 => imported_Original_LF__DOT__Maps_LF_Maps_t__update
          (fun x2 => imported_Original_LF__DOT__Maps_LF_Maps_t__update
             (fun x3 => imported_Original_LF__DOT__Maps_LF_Maps_t__update
                (fun x4 => imported_Original_LF__DOT__Maps_LF_Maps_t__update
                   (fun x5 => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x5)
                   imported_Original_LF__DOT__Imp_LF_Imp_X (imported_S (imported_S imported_0)) x4)
                imported_Original_LF__DOT__Imp_LF_Imp_Y imported_0 x3)
             imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_S (imported_S imported_0)) x2)
          imported_Original_LF__DOT__Imp_LF_Imp_X (imported_S imported_0) x1)
       imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_S (imported_S (imported_S imported_0))) x0)
    imported_Original_LF__DOT__Imp_LF_Imp_X imported_0 x.

(* Check that our definitions match the imported one *)
Lemma imported_pup_type_check :
  imported_Original_LF__DOT__Imp_LF_Imp_ceval imported_Original_LF__DOT__Imp_LF_Imp_pup__to__n imported_st1' imported_st2'.
Proof.
  unfold imported_st1', imported_st2'.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_pup__to__n, imported_Original_LF__DOT__Imp_LF_Imp_ceval.
  unfold imported_Original_LF__DOT__Maps_LF_Maps_t__update.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_empty__st.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_X, imported_Original_LF__DOT__Imp_LF_Imp_Y.
  unfold imported_S, imported_0.
  exact Imported.Original_LF__DOT__Imp_LF_Imp_pup__to__2__ceval.
Qed.

Definition imported_Original_LF__DOT__Imp_LF_Imp_pup__to__2__ceval :
  imported_Original_LF__DOT__Imp_LF_Imp_ceval imported_Original_LF__DOT__Imp_LF_Imp_pup__to__n imported_st1' imported_st2' := imported_pup_type_check.

(* Original states *)
Definition original_st1 : Original.LF_DOT_Imp.LF.Imp.state :=
  Original.LF_DOT_Maps.LF.Maps.t_update Original.LF_DOT_Imp.LF.Imp.empty_st Original.LF_DOT_Imp.LF.Imp.X 2%nat.

Definition original_st2 : Original.LF_DOT_Imp.LF.Imp.state :=
  Original.LF_DOT_Maps.LF.Maps.t_update
    (Original.LF_DOT_Maps.LF.Maps.t_update
       (Original.LF_DOT_Maps.LF.Maps.t_update
          (Original.LF_DOT_Maps.LF.Maps.t_update
             (Original.LF_DOT_Maps.LF.Maps.t_update
                (Original.LF_DOT_Maps.LF.Maps.t_update
                   Original.LF_DOT_Imp.LF.Imp.empty_st
                   Original.LF_DOT_Imp.LF.Imp.X 2%nat)
                Original.LF_DOT_Imp.LF.Imp.Y 0%nat)
             Original.LF_DOT_Imp.LF.Imp.Y 2%nat)
          Original.LF_DOT_Imp.LF.Imp.X 1%nat)
       Original.LF_DOT_Imp.LF.Imp.Y 3%nat)
    Original.LF_DOT_Imp.LF.Imp.X 0%nat.

(* State relatedness proofs *)
Lemma st1_rel : forall x1 x2, rel_iso String_string_iso x1 x2 -> rel_iso nat_iso (original_st1 x1) (imported_st1' x2).
Proof.
  intros x1 x2 Hx.
  unfold original_st1, imported_st1'.
  apply unwrap_sprop.
  unshelve refine (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso
    Original.LF_DOT_Imp.LF.Imp.empty_st
    (fun x => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x)
    _ Original_LF__DOT__Imp_LF_Imp_X_iso 2%nat (imported_S (imported_S imported_0))
    _ Hx).
  - intros y1 y2 Hy. apply wrap_sprop. apply Original_LF__DOT__Imp_LF_Imp_empty__st_iso. exact Hy.
  - apply wrap_sprop. apply S_iso. apply S_iso. exact _0_iso.
Qed.

(* Helper lemmas for st2_rel *)
Definition orig_st_base := Original.LF_DOT_Imp.LF.Imp.empty_st.
Definition orig_st_1' := Original.LF_DOT_Maps.LF.Maps.t_update orig_st_base Original.LF_DOT_Imp.LF.Imp.X 2%nat.
Definition orig_st_2' := Original.LF_DOT_Maps.LF.Maps.t_update orig_st_1' Original.LF_DOT_Imp.LF.Imp.Y 0%nat.
Definition orig_st_3' := Original.LF_DOT_Maps.LF.Maps.t_update orig_st_2' Original.LF_DOT_Imp.LF.Imp.Y 2%nat.
Definition orig_st_4' := Original.LF_DOT_Maps.LF.Maps.t_update orig_st_3' Original.LF_DOT_Imp.LF.Imp.X 1%nat.
Definition orig_st_5' := Original.LF_DOT_Maps.LF.Maps.t_update orig_st_4' Original.LF_DOT_Imp.LF.Imp.Y 3%nat.
Definition orig_st_6' := Original.LF_DOT_Maps.LF.Maps.t_update orig_st_5' Original.LF_DOT_Imp.LF.Imp.X 0%nat.

Definition imp_st_base := (fun x => imported_Original_LF__DOT__Imp_LF_Imp_empty__st x).
Definition imp_st_1' := (fun x => imported_Original_LF__DOT__Maps_LF_Maps_t__update imp_st_base imported_Original_LF__DOT__Imp_LF_Imp_X (imported_S (imported_S imported_0)) x).
Definition imp_st_2' := (fun x => imported_Original_LF__DOT__Maps_LF_Maps_t__update imp_st_1' imported_Original_LF__DOT__Imp_LF_Imp_Y imported_0 x).
Definition imp_st_3' := (fun x => imported_Original_LF__DOT__Maps_LF_Maps_t__update imp_st_2' imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_S (imported_S imported_0)) x).
Definition imp_st_4' := (fun x => imported_Original_LF__DOT__Maps_LF_Maps_t__update imp_st_3' imported_Original_LF__DOT__Imp_LF_Imp_X (imported_S imported_0) x).
Definition imp_st_5' := (fun x => imported_Original_LF__DOT__Maps_LF_Maps_t__update imp_st_4' imported_Original_LF__DOT__Imp_LF_Imp_Y (imported_S (imported_S (imported_S imported_0))) x).
Definition imp_st_6' := (fun x => imported_Original_LF__DOT__Maps_LF_Maps_t__update imp_st_5' imported_Original_LF__DOT__Imp_LF_Imp_X imported_0 x).

Lemma st_base_rel : forall x1 x2, rel_iso String_string_iso x1 x2 -> rel_iso nat_iso (orig_st_base x1) (imp_st_base x2).
Proof. intros. apply Original_LF__DOT__Imp_LF_Imp_empty__st_iso. assumption. Qed.

Lemma st_1'_rel : forall x1 x2, rel_iso String_string_iso x1 x2 -> rel_iso nat_iso (orig_st_1' x1) (imp_st_1' x2).
Proof.
  intros x1 x2 Hx. unfold orig_st_1', imp_st_1'.
  apply unwrap_sprop.
  unshelve refine (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso orig_st_base imp_st_base
    _ Original_LF__DOT__Imp_LF_Imp_X_iso 2%nat (imported_S (imported_S imported_0)) _ Hx).
  - intros y1 y2 Hy. apply wrap_sprop. apply st_base_rel. exact Hy.
  - apply wrap_sprop. apply S_iso. apply S_iso. exact _0_iso.
Qed.

Lemma st_2'_rel : forall x1 x2, rel_iso String_string_iso x1 x2 -> rel_iso nat_iso (orig_st_2' x1) (imp_st_2' x2).
Proof.
  intros x1 x2 Hx. unfold orig_st_2', imp_st_2'.
  apply unwrap_sprop.
  unshelve refine (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso orig_st_1' imp_st_1'
    _ Original_LF__DOT__Imp_LF_Imp_Y_iso 0%nat imported_0 _ Hx).
  - intros y1 y2 Hy. apply wrap_sprop. apply st_1'_rel. exact Hy.
  - apply wrap_sprop. exact _0_iso.
Qed.

Lemma st_3'_rel : forall x1 x2, rel_iso String_string_iso x1 x2 -> rel_iso nat_iso (orig_st_3' x1) (imp_st_3' x2).
Proof.
  intros x1 x2 Hx. unfold orig_st_3', imp_st_3'.
  apply unwrap_sprop.
  unshelve refine (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso orig_st_2' imp_st_2'
    _ Original_LF__DOT__Imp_LF_Imp_Y_iso 2%nat (imported_S (imported_S imported_0)) _ Hx).
  - intros y1 y2 Hy. apply wrap_sprop. apply st_2'_rel. exact Hy.
  - apply wrap_sprop. apply S_iso. apply S_iso. exact _0_iso.
Qed.

Lemma st_4'_rel : forall x1 x2, rel_iso String_string_iso x1 x2 -> rel_iso nat_iso (orig_st_4' x1) (imp_st_4' x2).
Proof.
  intros x1 x2 Hx. unfold orig_st_4', imp_st_4'.
  apply unwrap_sprop.
  unshelve refine (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso orig_st_3' imp_st_3'
    _ Original_LF__DOT__Imp_LF_Imp_X_iso 1%nat (imported_S imported_0) _ Hx).
  - intros y1 y2 Hy. apply wrap_sprop. apply st_3'_rel. exact Hy.
  - apply wrap_sprop. apply S_iso. exact _0_iso.
Qed.

Lemma st_5'_rel : forall x1 x2, rel_iso String_string_iso x1 x2 -> rel_iso nat_iso (orig_st_5' x1) (imp_st_5' x2).
Proof.
  intros x1 x2 Hx. unfold orig_st_5', imp_st_5'.
  apply unwrap_sprop.
  unshelve refine (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso orig_st_4' imp_st_4'
    _ Original_LF__DOT__Imp_LF_Imp_Y_iso 3%nat (imported_S (imported_S (imported_S imported_0))) _ Hx).
  - intros y1 y2 Hy. apply wrap_sprop. apply st_4'_rel. exact Hy.
  - apply wrap_sprop. apply S_iso. apply S_iso. apply S_iso. exact _0_iso.
Qed.

Lemma st_6'_rel : forall x1 x2, rel_iso String_string_iso x1 x2 -> rel_iso nat_iso (orig_st_6' x1) (imp_st_6' x2).
Proof.
  intros x1 x2 Hx. unfold orig_st_6', imp_st_6'.
  apply unwrap_sprop.
  unshelve refine (Original_LF__DOT__Maps_LF_Maps_t__update_iso nat_iso orig_st_5' imp_st_5'
    _ Original_LF__DOT__Imp_LF_Imp_X_iso 0%nat imported_0 _ Hx).
  - intros y1 y2 Hy. apply wrap_sprop. apply st_5'_rel. exact Hy.
  - apply wrap_sprop. exact _0_iso.
Qed.

Lemma st2_rel : forall x1 x2, rel_iso String_string_iso x1 x2 -> rel_iso nat_iso (original_st2 x1) (imported_st2' x2).
Proof.
  intros x1 x2 Hx.
  change original_st2 with orig_st_6'.
  change imported_st2' with imp_st_6'.
  apply st_6'_rel. exact Hx.
Qed.

(* The isomorphism - allowed to be admitted *)
Instance Original_LF__DOT__Imp_LF_Imp_pup__to__2__ceval_iso : 
  rel_iso 
    (Original_LF__DOT__Imp_LF_Imp_ceval_iso 
       Original_LF__DOT__Imp_LF_Imp_pup__to__n_iso
       original_st1
       imported_st1'
       st1_rel
       original_st2
       imported_st2'
       st2_rel)
    Original.LF_DOT_Imp.LF.Imp.pup_to_2_ceval
    imported_Original_LF__DOT__Imp_LF_Imp_pup__to__2__ceval.
Admitted.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.pup_to_2_ceval := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_pup__to__2__ceval := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.pup_to_2_ceval Original_LF__DOT__Imp_LF_Imp_pup__to__2__ceval_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.pup_to_2_ceval Imported.Original_LF__DOT__Imp_LF_Imp_pup__to__2__ceval Original_LF__DOT__Imp_LF_Imp_pup__to__2__ceval_iso := {}.
