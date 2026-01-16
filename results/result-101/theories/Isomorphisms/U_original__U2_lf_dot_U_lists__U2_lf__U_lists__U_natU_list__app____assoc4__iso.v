From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__app__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_app__assoc4 : forall x x0 x1 x2 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist,
  imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Lists_LF_Lists_NatList_app x (imported_Original_LF__DOT__Lists_LF_Lists_NatList_app x0 (imported_Original_LF__DOT__Lists_LF_Lists_NatList_app x1 x2)))
    (imported_Original_LF__DOT__Lists_LF_Lists_NatList_app (imported_Original_LF__DOT__Lists_LF_Lists_NatList_app (imported_Original_LF__DOT__Lists_LF_Lists_NatList_app x x0) x1) x2) := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_app__assoc4.
Instance Original_LF__DOT__Lists_LF_Lists_NatList_app__assoc4_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist)
    (hx : rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x1 x2) (x3 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x4 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist)
    (hx0 : rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x3 x4) (x5 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x6 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist)
    (hx1 : rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x5 x6) (x7 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x8 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist)
    (hx2 : rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x7 x8),
  rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Lists_LF_Lists_NatList_app_iso hx (Original_LF__DOT__Lists_LF_Lists_NatList_app_iso hx0 (Original_LF__DOT__Lists_LF_Lists_NatList_app_iso hx1 hx2)))
       (Original_LF__DOT__Lists_LF_Lists_NatList_app_iso (Original_LF__DOT__Lists_LF_Lists_NatList_app_iso (Original_LF__DOT__Lists_LF_Lists_NatList_app_iso hx hx0) hx1) hx2))
    (Original.LF_DOT_Lists.LF.Lists.NatList.app_assoc4 x1 x3 x5 x7) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_app__assoc4 x2 x4 x6 x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.app_assoc4 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_app__assoc4 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.app_assoc4 Original_LF__DOT__Lists_LF_Lists_NatList_app__assoc4_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.app_assoc4 Imported.Original_LF__DOT__Lists_LF_Lists_NatList_app__assoc4 Original_LF__DOT__Lists_LF_Lists_NatList_app__assoc4_iso := {}.