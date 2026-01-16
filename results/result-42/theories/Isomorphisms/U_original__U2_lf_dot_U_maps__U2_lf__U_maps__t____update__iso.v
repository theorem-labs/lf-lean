From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__total____map__iso.
From IsomorphismChecker Require Export Isomorphisms.U_ascii__ascii__iso.

Definition imported_Original_LF__DOT__Maps_LF_Maps_t__update : forall x : Type, (imported_String_string -> x) -> imported_String_string -> x -> imported_String_string -> x := (@Imported.Original_LF__DOT__Maps_LF_Maps_t__update).

(* Helper: ascii equality preserves the isomorphism *)
Lemma ascii_eqb_iso : forall (a1 a2 : Ascii.ascii),
  IsomorphismDefinitions.eq (bool_to_Bool (Ascii.eqb a1 a2)) 
                            (Imported.Ascii_eqb (ascii_to_imported a1) (ascii_to_imported a2)).
Proof.
  intros [b0 b1 b2 b3 b4 b5 b6 b7] [c0 c1 c2 c3 c4 c5 c6 c7].
  unfold Ascii.eqb, ascii_to_imported, Imported.Ascii_eqb, bool_to_Bool.
  simpl.
  (* Both sides compute the conjunction of 8 bit comparisons *)
  destruct b0, b1, b2, b3, b4, b5, b6, b7, c0, c1, c2, c3, c4, c5, c6, c7;
  exact IsomorphismDefinitions.eq_refl.
Qed.

(* Helper: string equality on converted strings *)
Lemma string_eqb_converted : forall (s1 s2 : String.string),
  IsomorphismDefinitions.eq (bool_to_Bool (String.eqb s1 s2)) 
                            (Imported.String_eqb (string_to_imported s1) (string_to_imported s2)).
Proof.
  fix IH 1.
  intros s1 s2.
  destruct s1 as [|a1 s1']; destruct s2 as [|a2 s2'].
  - (* EmptyString, EmptyString *)
    simpl. exact IsomorphismDefinitions.eq_refl.
  - (* EmptyString, String *)
    simpl. exact IsomorphismDefinitions.eq_refl.
  - (* String, EmptyString *)
    simpl. exact IsomorphismDefinitions.eq_refl.
  - (* String a1 s1', String a2 s2' *)
    simpl.
    (* Goal: eq (bool_to_Bool (Ascii.eqb a1 a2 && String.eqb s1' s2'))
              (Bool_and (ascii_eqb (ascii_to_imported a1) (ascii_to_imported a2)) 
                        (String_eqb (string_to_imported s1') (string_to_imported s2'))) *)
    destruct (Ascii.eqb a1 a2) eqn:Ha.
    + (* Ascii.eqb a1 a2 = true *)
      simpl.
      (* We need to show the ascii_eqb on imported side is also true, and recurse *)
      pose proof (ascii_eqb_iso a1 a2) as Hascii.
      rewrite Ha in Hascii. simpl in Hascii.
      (* Hascii : eq Bool_true (ascii_eqb (ascii_to_imported a1) (ascii_to_imported a2)) *)
      apply (@IsoEq.eq_srect Imported.Bool Imported.Bool_true 
               (fun x => IsomorphismDefinitions.eq (bool_to_Bool (String.eqb s1' s2'))
                          (Imported.Bool_and x (Imported.String_eqb (string_to_imported s1') (string_to_imported s2'))))).
      simpl.
      exact (IH s1' s2').
      exact Hascii.
    + (* Ascii.eqb a1 a2 = false *)
      simpl.
      pose proof (ascii_eqb_iso a1 a2) as Hascii.
      rewrite Ha in Hascii. simpl in Hascii.
      apply (@IsoEq.eq_srect Imported.Bool Imported.Bool_false
               (fun x => IsomorphismDefinitions.eq Imported.Bool_false
                          (Imported.Bool_and x (Imported.String_eqb (string_to_imported s1') (string_to_imported s2'))))).
      simpl. exact IsomorphismDefinitions.eq_refl.
      exact Hascii.
Qed.

(* Helper: string equality preserves the isomorphism *)
(* This captures the fact that string_to_imported preserves equality *)
Lemma string_eqb_iso : forall (s1 s2 : String.string) (t1 t2 : Imported.String_string),
  rel_iso String_string_iso s1 t1 ->
  rel_iso String_string_iso s2 t2 ->
  IsomorphismDefinitions.eq (bool_to_Bool (String.eqb s1 s2)) (Imported.String_eqb t1 t2).
Proof.
  intros s1 s2 t1 t2 H1 H2.
  unfold rel_iso in H1, H2. simpl in H1, H2.
  (* H1 : eq (string_to_imported s1) t1 *)
  (* H2 : eq (string_to_imported s2) t2 *)
  pose proof (string_eqb_converted s1 s2) as Hconv.
  (* Hconv : eq (bool_to_Bool (String.eqb s1 s2)) (String_eqb (string_to_imported s1) (string_to_imported s2)) *)
  apply (@IsoEq.eq_srect Imported.String_string (string_to_imported s1) 
           (fun x => IsomorphismDefinitions.eq (bool_to_Bool (String.eqb s1 s2)) (Imported.String_eqb x t2))).
  apply (@IsoEq.eq_srect Imported.String_string (string_to_imported s2)
           (fun x => IsomorphismDefinitions.eq (bool_to_Bool (String.eqb s1 s2)) (Imported.String_eqb (string_to_imported s1) x))).
  exact Hconv.
  exact H2.
  exact H1.
Qed.

(* Bool case helper *)
Lemma bool_case_iso : forall (A B : Type) (hx : IsoOrSortRelaxed A B) (b : bool) (ib : Imported.Bool)
  (vt : A) (ivt : B) (vf : A) (ivf : B),
  IsomorphismDefinitions.eq (bool_to_Bool b) ib ->
  rel_iso_sort hx vt ivt ->
  rel_iso_sort hx vf ivf ->
  rel_iso_sort hx (if b then vt else vf) (Imported.bool_case B ib ivt ivf).
Proof.
  intros A B hx b ib vt ivt vf ivf Hb Hvt Hvf.
  destruct b; simpl.
  - (* b = true, Hb : eq Bool_true ib *)
    exact (@IsoEq.eq_srect Imported.Bool Imported.Bool_true (fun x => rel_iso_sort hx vt (Imported.bool_case B x ivt ivf)) Hvt ib Hb).
  - (* b = false, Hb : eq Bool_false ib *)
    exact (@IsoEq.eq_srect Imported.Bool Imported.Bool_false (fun x => rel_iso_sort hx vf (Imported.bool_case B x ivt ivf)) Hvf ib Hb).
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
  intros x1 x2 hx x3 x4 Hmap x5 x6 H56 x7 x8 H78 x9 x10 H910.
  unfold Original.LF_DOT_Maps.LF.Maps.t_update.
  unfold imported_Original_LF__DOT__Maps_LF_Maps_t__update, Imported.Original_LF__DOT__Maps_LF_Maps_t__update.
  apply bool_case_iso.
  - apply string_eqb_iso; assumption.
  - exact H78.
  - apply Hmap. exact H910.
Qed.
Instance: KnownConstant (@Original.LF_DOT_Maps.LF.Maps.t_update) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Maps_LF_Maps_t__update) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Maps.LF.Maps.t_update) Original_LF__DOT__Maps_LF_Maps_t__update_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Maps.LF.Maps.t_update) (@Imported.Original_LF__DOT__Maps_LF_Maps_t__update) Original_LF__DOT__Maps_LF_Maps_t__update_iso := {}.