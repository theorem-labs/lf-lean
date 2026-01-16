From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_emptyU_set__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__exp____match__iso Isomorphisms.U_logic__not__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_EmptySet__is__empty : forall (x : Type) (x0 : imported_Original_LF__DOT__Poly_LF_Poly_list x),
  imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x0 (imported_Original_LF__DOT__IndProp_LF_IndProp_EmptySet x) -> imported_False := Imported.Original_LF__DOT__IndProp_LF_IndProp_EmptySet__is__empty.
Instance Original_LF__DOT__IndProp_LF_IndProp_EmptySet__is__empty_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx0 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3 x4) (x5 : Original.LF_DOT_IndProp.LF.IndProp.exp_match x3 Original.LF_DOT_IndProp.LF.IndProp.EmptySet)
    (x6 : imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x4 (imported_Original_LF__DOT__IndProp_LF_IndProp_EmptySet x2)),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx0 (Original_LF__DOT__IndProp_LF_IndProp_EmptySet_iso hx)) x5 x6 ->
  rel_iso {| to := False_iso; from := from False_iso; to_from := fun x : imported_False => to_from False_iso x; from_to := fun x : False => seq_p_of_t (from_to False_iso x) |}
    (Original.LF_DOT_IndProp.LF.IndProp.EmptySet_is_empty x1 x3 x5) (imported_Original_LF__DOT__IndProp_LF_IndProp_EmptySet__is__empty x6).
Proof.
  intros x1 x2 hx x3 x4 hx0 x5 x6 Hmatch.
  (* Both sides are False/imported_False. The rel_iso for False is trivial
     because there are no inhabitants of False (SProp). *)
  constructor. simpl.
  (* The goal is: to False_iso (EmptySet_is_empty x1 x3 x5) = imported_EmptySet_is_empty x6 *)
  (* Both are in imported_False (SProp), which has no inhabitants.
     All SProp equalities are trivially true (definitional equality). *)
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.EmptySet_is_empty := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_EmptySet__is__empty := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.EmptySet_is_empty Original_LF__DOT__IndProp_LF_IndProp_EmptySet__is__empty_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.EmptySet_is_empty Imported.Original_LF__DOT__IndProp_LF_IndProp_EmptySet__is__empty Original_LF__DOT__IndProp_LF_IndProp_EmptySet__is__empty_iso := {}.