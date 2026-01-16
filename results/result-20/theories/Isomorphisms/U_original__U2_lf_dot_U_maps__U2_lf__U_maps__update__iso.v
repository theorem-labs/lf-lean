From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__partial____map__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____update__iso.

Definition imported_Original_LF__DOT__Maps_LF_Maps_update : forall x : Type, (imported_String_string -> imported_option x) -> imported_String_string -> x -> imported_String_string -> imported_option x := (@Imported.Original_LF__DOT__Maps_LF_Maps_update).

(* Helper: Some preserves the isomorphism *)
Lemma Some_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (v1 : x1) (v2 : x2),
  rel_iso hx v1 v2 -> rel_iso (option_iso hx) (Some v1) (Imported.option_Some x2 v2).
Proof.
  intros x1 x2 hx v1 v2 Hv.
  constructor; simpl.
  unfold option_to_imported. simpl.
  exact (IsoEq.f_equal (Imported.option_Some x2) Hv).
Qed.

Instance Original_LF__DOT__Maps_LF_Maps_update_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Maps.LF.Maps.partial_map x1) (x4 : imported_String_string -> imported_option x2),
  (forall (x5 : String.string) (x6 : imported_String_string), rel_iso String_string_iso x5 x6 -> rel_iso (option_iso hx) (x3 x5) (x4 x6)) ->
  forall (x5 : String.string) (x6 : imported_String_string),
  rel_iso String_string_iso x5 x6 ->
  forall (x7 : x1) (x8 : x2),
  rel_iso hx x7 x8 ->
  forall (x9 : String.string) (x10 : imported_String_string),
  rel_iso String_string_iso x9 x10 -> rel_iso (option_iso hx) (Original.LF_DOT_Maps.LF.Maps.update x3 x5 x7 x9) (imported_Original_LF__DOT__Maps_LF_Maps_update x4 x6 x8 x10).
Proof.
  intros x1 x2 hx x3 x4 Hmap x5 x6 H56 x7 x8 H78 x9 x10 H910.
  unfold Original.LF_DOT_Maps.LF.Maps.update.
  unfold imported_Original_LF__DOT__Maps_LF_Maps_update, Imported.Original_LF__DOT__Maps_LF_Maps_update.
  (* update m x v = t_update m x (Some v) on both sides *)
  constructor; simpl.
  unfold option_to_imported.
  unfold Original.LF_DOT_Maps.LF.Maps.t_update.
  unfold Imported.Original_LF__DOT__Maps_LF_Maps_t__update.
  (* Goal depends on String.eqb x5 x9 and String_eqb x6 x10 *)
  (* Use string_eqb_iso to relate them *)
  pose proof (@string_eqb_iso x5 x9 x6 x10 H56 H910) as Heqb.
  (* Heqb : eq (bool_to_Bool (String.eqb x5 x9)) (String_eqb x6 x10) *)
  destruct (String.eqb x5 x9) eqn:Heq.
  - (* x5 =? x9 = true *)
    simpl in Heqb.
    (* Heqb : eq Bool_true (String_eqb x6 x10) *)
    apply (@IsoEq.eq_srect Imported.Bool Imported.Bool_true 
             (fun b => IsomorphismDefinitions.eq 
                        (Imported.option_Some x2 (to hx x7))
                        (Imported.bool_case (Imported.option x2) b (Imported.option_Some x2 x8) (x4 x10)))).
    simpl.
    (* Need: eq (option_Some x2 (to hx x7)) (option_Some x2 x8) *)
    (* H78 : rel_iso hx x7 x8, i.e., eq (to hx x7) x8 *)
    pose proof (eq_of_seq (proj_rel_iso Hx1)) as E1. pose proof (eq_of_seq (proj_rel_iso Hx3)) as E3. subst x2 x4.
    exact (IsoEq.f_equal (Imported.option_Some x2) H78).
    exact Heqb.
  - (* x5 =? x9 = false *)
    simpl in Heqb.
    (* Heqb : eq Bool_false (String_eqb x6 x10) *)
    apply (@IsoEq.eq_srect Imported.Bool Imported.Bool_false
             (fun b => IsomorphismDefinitions.eq
                        (option_to_imported (to hx) (x3 x9))
                        (Imported.bool_case (Imported.option x2) b (Imported.option_Some x2 x8) (x4 x10)))).
    simpl.
    (* Need: eq (option_to_imported (to hx) (x3 x9)) (x4 x10) *)
    (* This follows from Hmap x9 x10 H910 *)
    pose proof (Hmap x9 x10 H910) as Hmap910.
    pose proof (eq_of_seq (proj_rel_iso Hx1)) as E1. pose proof (eq_of_seq (proj_rel_iso Hx3)) as E3. subst x2 x4.
    exact Hmap910.
    exact Heqb.
Qed.
Instance: KnownConstant (@Original.LF_DOT_Maps.LF.Maps.update) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Maps_LF_Maps_update) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Maps.LF.Maps.update) Original_LF__DOT__Maps_LF_Maps_update_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Maps.LF.Maps.update) (@Imported.Original_LF__DOT__Maps_LF_Maps_update) Original_LF__DOT__Maps_LF_Maps_update_iso := {}.