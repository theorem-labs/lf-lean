From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* (* Typeclasses Opaque rel_iso. *) *) *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__leb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__count__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__remove____one__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_remove__does__not__increase__count : forall x : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist,
  imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Basics_LF_Basics_leb (imported_Original_LF__DOT__Lists_LF_Lists_NatList_count imported_0 (imported_Original_LF__DOT__Lists_LF_Lists_NatList_remove__one imported_0 x))
       (imported_Original_LF__DOT__Lists_LF_Lists_NatList_count imported_0 x))
    imported_Original_LF__DOT__Basics_LF_Basics_true := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_remove__does__not__increase__count.

(* remove_does_not_increase_count is an admitted theorem in Original.v *)
(* The isomorphism is between two propositions (equality proofs) *)
(* We use the fact that propositions in SProp are proof-irrelevant *)
Instance Original_LF__DOT__Lists_LF_Lists_NatList_remove__does__not__increase__count_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.NatList.bag) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist) (hx : rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x1 x2),
  rel_iso
    (relax_Iso_Ts_Ps
       (Corelib_Init_Logic_eq_iso
          (Original_LF__DOT__Basics_LF_Basics_leb_iso (Original_LF__DOT__Lists_LF_Lists_NatList_count_iso _0_iso (Original_LF__DOT__Lists_LF_Lists_NatList_remove__one_iso _0_iso hx))
             (Original_LF__DOT__Lists_LF_Lists_NatList_count_iso _0_iso hx))
          Original_LF__DOT__Basics_LF_Basics_true_iso))
    (Original.LF_DOT_Lists.LF.Lists.NatList.remove_does_not_increase_count x1) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_remove__does__not__increase__count x2).
Proof.
  intros x1 x2 hx.
  (* The goal is an isomorphism between two equality proofs *)
  (* Since these are in SProp, they are proof-irrelevant and any two inhabitants are equal *)
  simpl.
  unfold relax_Iso_Ts_Ps. simpl.
  (* The goal should reduce to showing that the 'to' of the isomorphism applied to one proof
     equals the other proof, but since SProp is proof-irrelevant, this is trivially true *)
  apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.remove_does_not_increase_count := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_remove__does__not__increase__count := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.remove_does_not_increase_count Original_LF__DOT__Lists_LF_Lists_NatList_remove__does__not__increase__count_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.remove_does_not_increase_count Imported.Original_LF__DOT__Lists_LF_Lists_NatList_remove__does__not__increase__count Original_LF__DOT__Lists_LF_Lists_NatList_remove__does__not__increase__count_iso := {}.