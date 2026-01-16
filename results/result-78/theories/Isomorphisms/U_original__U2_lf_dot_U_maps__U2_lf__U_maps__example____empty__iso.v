From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__total____map__iso Isomorphisms.bool__iso.

Definition imported_Original_LF__DOT__Maps_LF_Maps_example__empty : imported_String_string -> imported_bool := Imported.Original_LF__DOT__Maps_LF_Maps_example__empty.

(* example_empty = t_empty false = fun _ => false *)
(* Both return false for any input, so the iso is just that false ~ Coqbool_false *)
Instance Original_LF__DOT__Maps_LF_Maps_example__empty_iso : forall (x1 : String.string) (x2 : imported_String_string),
  rel_iso String_string_iso x1 x2 -> rel_iso bool_iso (Original.LF_DOT_Maps.LF.Maps.example_empty x1) (imported_Original_LF__DOT__Maps_LF_Maps_example__empty x2).
Proof.
  intros x1 x2 Hstr.
  (* example_empty x1 = false, and imported version also = Coqbool_false *)
  unfold Original.LF_DOT_Maps.LF.Maps.example_empty.
  unfold imported_Original_LF__DOT__Maps_LF_Maps_example__empty.
  unfold Imported.Original_LF__DOT__Maps_LF_Maps_example__empty.
  unfold Imported.Original_LF__DOT__Maps_LF_Maps_t__empty.
  unfold Original.LF_DOT_Maps.LF.Maps.t_empty.
  (* Now we need to show rel_iso bool_iso false Imported.Coqbool_false *)
  constructor. simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.

#[export] Instance: KnownConstant Original.LF_DOT_Maps.LF.Maps.example_empty := {}. (* only needed when rel_iso is typeclasses opaque *)
#[export] Instance: KnownConstant Imported.Original_LF__DOT__Maps_LF_Maps_example__empty := {}. (* only needed when rel_iso is typeclasses opaque *)
#[export] Instance: IsoStatementProofFor Original.LF_DOT_Maps.LF.Maps.example_empty Original_LF__DOT__Maps_LF_Maps_example__empty_iso := {}.
#[export] Instance: IsoStatementProofBetween Original.LF_DOT_Maps.LF.Maps.example_empty Imported.Original_LF__DOT__Maps_LF_Maps_example__empty Original_LF__DOT__Maps_LF_Maps_example__empty_iso := {}.