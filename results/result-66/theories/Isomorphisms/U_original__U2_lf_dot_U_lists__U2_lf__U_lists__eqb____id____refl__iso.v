From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *)


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__eqb____id__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_eqb__id__refl : forall x : imported_Original_LF__DOT__Lists_LF_Lists_id, imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Lists_LF_Lists_eqb__id x x) imported_Original_LF__DOT__Basics_LF_Basics_true := Imported.Original_LF__DOT__Lists_LF_Lists_eqb__id__refl.

(* This is an isomorphism between two axioms - both eqb_id_refl in Original and Imported are axioms.
   The goal is an SProp equality and SProp has proof irrelevance. *)
Instance Original_LF__DOT__Lists_LF_Lists_eqb__id__refl_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.id) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_id) (hx : rel_iso Original_LF__DOT__Lists_LF_Lists_id_iso x1 x2),
  rel_iso (relax_Iso_Ts_Ps (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Lists_LF_Lists_eqb__id_iso hx hx) Original_LF__DOT__Basics_LF_Basics_true_iso))
    (Original.LF_DOT_Lists.LF.Lists.eqb_id_refl x1) (imported_Original_LF__DOT__Lists_LF_Lists_eqb__id__refl x2).
Proof.
  intros x1 x2 hx.
  constructor. simpl.
  (* The goal is an SProp equality. SProp has definitional proof irrelevance. *)
  apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.eqb_id_refl := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_eqb__id__refl := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.eqb_id_refl Original_LF__DOT__Lists_LF_Lists_eqb__id__refl_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.eqb_id_refl Imported.Original_LF__DOT__Lists_LF_Lists_eqb__id__refl Original_LF__DOT__Lists_LF_Lists_eqb__id__refl_iso := {}.