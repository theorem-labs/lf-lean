From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__app__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__cons__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__length__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__nil__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_app__length__S : forall (x : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist) (x0 : imported_nat),
  imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Lists_LF_Lists_NatList_length
       (imported_Original_LF__DOT__Lists_LF_Lists_NatList_app x (imported_Original_LF__DOT__Lists_LF_Lists_NatList_cons x0 imported_Original_LF__DOT__Lists_LF_Lists_NatList_nil)))
    (imported_S (imported_Original_LF__DOT__Lists_LF_Lists_NatList_length x)) := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_app__length__S.

(* This is an axiom isomorphism - both sides are axioms (Admitted in Original.v, axiom in Lean) *)
Instance Original_LF__DOT__Lists_LF_Lists_NatList_app__length__S_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist)
    (hx : rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4),
  rel_iso
    (relax_Iso_Ts_Ps
       (Corelib_Init_Logic_eq_iso
          (Original_LF__DOT__Lists_LF_Lists_NatList_length_iso
             (Original_LF__DOT__Lists_LF_Lists_NatList_app_iso hx (Original_LF__DOT__Lists_LF_Lists_NatList_cons_iso hx0 Original_LF__DOT__Lists_LF_Lists_NatList_nil_iso)))
          (S_iso (Original_LF__DOT__Lists_LF_Lists_NatList_length_iso hx))))
    (Original.LF_DOT_Lists.LF.Lists.NatList.app_length_S x1 x3) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_app__length__S x2 x4).
Proof.
  intros x1 x2 hx x3 x4 hx0.
  simpl.
  simpl.
  (* Both sides are proof-irrelevant SProp, so any two proofs are equal *)
  apply IsomorphismDefinitions.eq_refl.
Qed.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.app_length_S := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_app__length__S := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.app_length_S Original_LF__DOT__Lists_LF_Lists_NatList_app__length__S_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.app_length_S Imported.Original_LF__DOT__Lists_LF_Lists_NatList_app__length__S Original_LF__DOT__Lists_LF_Lists_NatList_app__length__S_iso := {}.