From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__total____map__iso.

Definition imported_Original_LF__DOT__Maps_LF_Maps_t__update : forall x : Type, (imported_String_string -> x) -> imported_String_string -> x -> imported_String_string -> x := (@Imported.Original_LF__DOT__Maps_LF_Maps_t__update).

(* Helper: convert between Coq bool and Imported.mybool *)
Definition bool_to_mybool (b : bool) : Imported.mybool :=
  match b with
  | true => Imported.mybool_mytrue
  | false => Imported.mybool_myfalse
  end.

Lemma string_eqb_compat_core : forall (s1 s2 : String.string),
  IsomorphismDefinitions.eq (bool_to_mybool (String.eqb s1 s2)) 
                             (Imported.String_eqb (to String_string_iso s1) (to String_string_iso s2)).
Proof.
  fix IH 1.
  intros s1 s2.
  destruct s1 as [|c1 rest1].
  - (* s1 = EmptyString *)
    destruct s2 as [|c2 rest2].
    + simpl. exact IsomorphismDefinitions.eq_refl.
    + simpl. exact IsomorphismDefinitions.eq_refl.
  - (* s1 = String c1 rest1 *)
    destruct s2 as [|c2 rest2].
    + simpl. exact IsomorphismDefinitions.eq_refl.
    + simpl.
      destruct c1 as [b0 b1 b2 b3 b4 b5 b6 b7].
      destruct c2 as [c0 c1_ c2_ c3 c4 c5 c6 c7].
      simpl.
      destruct b0, b1, b2, b3, b4, b5, b6, b7, c0, c1_, c2_, c3, c4, c5, c6, c7;
      simpl; try (exact (IH rest1 rest2)); try exact IsomorphismDefinitions.eq_refl.
Qed.

Lemma string_eqb_compat : forall (s1 s2 : String.string) (t1 t2 : imported_String_string),
  rel_iso String_string_iso s1 t1 ->
  rel_iso String_string_iso s2 t2 ->
  IsomorphismDefinitions.eq (bool_to_mybool (String.eqb s1 s2)) (Imported.String_eqb t1 t2).
Proof.
  intros s1 s2 t1 t2 H1 H2.
  unfold rel_iso in H1, H2. simpl in H1, H2.
  pose proof (string_eqb_compat_core s1 s2) as Hcore.
  apply (eq_trans Hcore).
  apply f_equal2.
  - exact H1.
  - exact H2.
Qed.

Instance Original_LF__DOT__Maps_LF_Maps_t__update_iso : forall (x1 x2 : Type) (hx : IsoOrSortRelaxed x1 x2) (x3 : Original.LF_DOT_Maps.LF.Maps.total_map x1) (x4 : imported_String_string -> x2),
  (forall (x5 : String.string) (x6 : imported_String_string), rel_iso String_string_iso x5 x6 -> rel_iso_sort hx (x3 x5) (x4 x6)) ->
  forall (x5 : String.string) (x6 : imported_String_string),
  rel_iso String_string_iso x5 x6 ->
  forall (x7 : x1) (x8 : x2),
  rel_iso_sort hx x7 x8 ->
  forall (x9 : String.string) (x10 : imported_String_string),
  rel_iso String_string_iso x9 x10 -> rel_iso_sort hx (Original.LF_DOT_Maps.LF.Maps.t_update x3 x5 x7 x9) (imported_Original_LF__DOT__Maps_LF_Maps_t__update x4 x6 x8 x10).
Proof.
  intros x1 x2 hx m1 m2 Hm k1 k2 Hk v1 v2 Hv x1' x2' Hx.
  unfold Original.LF_DOT_Maps.LF.Maps.t_update, imported_Original_LF__DOT__Maps_LF_Maps_t__update.
  unfold Imported.Original_LF__DOT__Maps_LF_Maps_t__update.
  pose proof (@string_eqb_compat k1 x1' k2 x2' Hk Hx) as Heqb.
  destruct (String.eqb k1 x1') eqn:E1.
  - (* k1 = x1' in Coq, so String_eqb k2 x2' should be mybool_mytrue *)
    assert (Imported.String_eqb k2 x2' = Imported.mybool_mytrue) as E2.
    { apply eq_of_seq. apply (eq_trans (eq_sym Heqb)). simpl. exact IsomorphismDefinitions.eq_refl. }
    rewrite E2. simpl. exact Hv.
  - (* k1 <> x1' in Coq, so String_eqb k2 x2' should be mybool_myfalse *)
    assert (Imported.String_eqb k2 x2' = Imported.mybool_myfalse) as E2.
    { apply eq_of_seq. apply (eq_trans (eq_sym Heqb)). simpl. exact IsomorphismDefinitions.eq_refl. }
    rewrite E2. simpl.
    apply Hm. exact Hx.
Qed.

Instance: KnownConstant (@Original.LF_DOT_Maps.LF.Maps.t_update) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Maps_LF_Maps_t__update) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Maps.LF.Maps.t_update) Original_LF__DOT__Maps_LF_Maps_t__update_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Maps.LF.Maps.t_update) (@Imported.Original_LF__DOT__Maps_LF_Maps_t__update) Original_LF__DOT__Maps_LF_Maps_t__update_iso := {}.