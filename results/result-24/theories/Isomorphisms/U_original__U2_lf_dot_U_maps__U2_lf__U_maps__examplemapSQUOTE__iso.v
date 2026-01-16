From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
From Stdlib.Strings Require Import String.
Open Scope string_scope.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_string__string__iso Isomorphisms.bool__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____empty__iso.
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____update__iso.

Definition imported_Original_LF__DOT__Maps_LF_Maps_examplemap' : imported_String_string -> imported_bool := Imported.Original_LF__DOT__Maps_LF_Maps_examplemap'.

(* Helper definitions to work with the isomorphisms *)
Definition bool_to : bool -> imported_bool := to bool_iso.
Definition string_to : String.string -> imported_String_string := to String_string_iso.

(* Key lemma: string comparison is compatible with the isomorphism *)
Lemma examplemap'_equiv : forall x1 : String.string,
  bool_to (Original.LF_DOT_Maps.LF.Maps.examplemap' x1) = 
  Imported.Original_LF__DOT__Maps_LF_Maps_examplemap' (string_to x1).
Proof.
  intro x1.
  unfold Original.LF_DOT_Maps.LF.Maps.examplemap', Imported.Original_LF__DOT__Maps_LF_Maps_examplemap'.
  unfold Original.LF_DOT_Maps.LF.Maps.t_update, Original.LF_DOT_Maps.LF.Maps.t_empty.
  unfold Imported.Original_LF__DOT__Maps_LF_Maps_t__update, Imported.Original_LF__DOT__Maps_LF_Maps_t__empty.
  unfold bool_to, string_to, bool_iso.
  pose proof (string_eqb_compat_core "bar" x1) as Hbar.
  pose proof (string_eqb_compat_core "foo" x1) as Hfoo.
  apply eq_of_seq in Hbar. apply eq_of_seq in Hfoo.
  unfold bool_to_mybool in Hbar, Hfoo.
  change Imported.str_bar with (String_string_iso "bar").
  change Imported.str_foo with (String_string_iso "foo").
  rewrite <- Hbar, <- Hfoo.
  destruct ("bar" =? x1)%string; destruct ("foo" =? x1)%string; reflexivity.
Qed.

(* The proof follows from the isomorphisms for t_update and t_empty *)
Instance Original_LF__DOT__Maps_LF_Maps_examplemap'_iso : forall (x1 : String.string) (x2 : imported_String_string),
  rel_iso String_string_iso x1 x2 -> rel_iso bool_iso (Original.LF_DOT_Maps.LF.Maps.examplemap' x1) (imported_Original_LF__DOT__Maps_LF_Maps_examplemap' x2).
Proof.
  intros x1 x2 Hx.
  pose proof (eq_of_seq (proj_rel_iso Hx)) as Hx'. subst x2.
  unfold imported_Original_LF__DOT__Maps_LF_Maps_examplemap'.
  rewrite <- examplemap'_equiv.
  apply rel_iso_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_Maps.LF.Maps.examplemap' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Maps_LF_Maps_examplemap' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Maps.LF.Maps.examplemap' Original_LF__DOT__Maps_LF_Maps_examplemap'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Maps.LF.Maps.examplemap' Imported.Original_LF__DOT__Maps_LF_Maps_examplemap' Original_LF__DOT__Maps_LF_Maps_examplemap'_iso := {}.