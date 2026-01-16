From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_nat__pred__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__length__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__tl__iso.

Monomorphic Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_tl__length__pred : forall x : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist,
  imported_Corelib_Init_Logic_eq (imported_Nat_pred (imported_Original_LF__DOT__Lists_LF_Lists_NatList_length x))
    (imported_Original_LF__DOT__Lists_LF_Lists_NatList_length (imported_Original_LF__DOT__Lists_LF_Lists_NatList_tl x)) := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_tl__length__pred.
Monomorphic Instance Original_LF__DOT__Lists_LF_Lists_NatList_tl__length__pred_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist)
    (hx : rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x1 x2),
  rel_iso
    (Corelib_Init_Logic_eq_iso (Nat_pred_iso (Original_LF__DOT__Lists_LF_Lists_NatList_length_iso hx))
       (Original_LF__DOT__Lists_LF_Lists_NatList_length_iso (Original_LF__DOT__Lists_LF_Lists_NatList_tl_iso hx)))
    (Original.LF_DOT_Lists.LF.Lists.NatList.tl_length_pred x1) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_tl__length__pred x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.tl_length_pred := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_tl__length__pred := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.tl_length_pred Original_LF__DOT__Lists_LF_Lists_NatList_tl__length__pred_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.tl_length_pred Imported.Original_LF__DOT__Lists_LF_Lists_NatList_tl__length__pred Original_LF__DOT__Lists_LF_Lists_NatList_tl__length__pred_iso := {}.