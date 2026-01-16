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

(* Key lemma: string comparison is compatible with the isomorphism *)
Lemma examplemap'_equiv : forall x1 : String.string,
  bool_to_coqbool (Original.LF_DOT_Maps.LF.Maps.examplemap' x1) = 
  Imported.Original_LF__DOT__Maps_LF_Maps_examplemap' (string_to_imported x1).
Proof.
  intro x1.
  unfold Original.LF_DOT_Maps.LF.Maps.examplemap'.
  unfold Imported.Original_LF__DOT__Maps_LF_Maps_examplemap'.
  unfold Original.LF_DOT_Maps.LF.Maps.t_update, Original.LF_DOT_Maps.LF.Maps.t_empty.
  unfold Imported.Original_LF__DOT__Maps_LF_Maps_t__update, Imported.Original_LF__DOT__Maps_LF_Maps_t__empty.
  unfold Imported.str_bar, Imported.str_foo.
  unfold Imported.char_b, Imported.char_a, Imported.char_r, Imported.char_f, Imported.char_o.
  (* Get the compatibility lemmas *)
  generalize (string_eqb_converted "bar" x1); intro Hbar.
  generalize (string_eqb_converted "foo" x1); intro Hfoo.
  simpl string_to_imported in Hbar.
  simpl string_to_imported in Hfoo.
  (* Case analysis on the Rocq side *)
  destruct (String.eqb "bar" x1) eqn:Ebar;
  destruct (String.eqb "foo" x1) eqn:Efoo;
  simpl bool_to_coqbool; simpl bool_to_coqbool in Hbar; simpl bool_to_coqbool in Hfoo;
  try rewrite <- (eq_of_seq (proj_rel_iso Hbar));
  try rewrite <- (eq_of_seq (proj_rel_iso Hfoo));
  reflexivity.
Qed.

(* The proof follows from the isomorphisms for t_update and t_empty *)
Instance Original_LF__DOT__Maps_LF_Maps_examplemap'_iso : forall (x1 : String.string) (x2 : imported_String_string),
  rel_iso String_string_iso x1 x2 -> rel_iso bool_iso (Original.LF_DOT_Maps.LF.Maps.examplemap' x1) (imported_Original_LF__DOT__Maps_LF_Maps_examplemap' x2).
Proof.
  intros x1 x2 Hx.
  idtac.
  pose proof (eq_of_seq (proj_rel_iso Hx)) as Hx'. subst x2.
  rewrite examplemap'_equiv.
  apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_Maps.LF.Maps.examplemap' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Maps_LF_Maps_examplemap' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Maps.LF.Maps.examplemap' Original_LF__DOT__Maps_LF_Maps_examplemap'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Maps.LF.Maps.examplemap' Imported.Original_LF__DOT__Maps_LF_Maps_examplemap' Original_LF__DOT__Maps_LF_Maps_examplemap'_iso := {}.