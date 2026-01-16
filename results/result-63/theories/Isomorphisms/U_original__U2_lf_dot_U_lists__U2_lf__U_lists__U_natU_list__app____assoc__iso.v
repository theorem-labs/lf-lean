From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__app__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_app__assoc : forall x x0 x1 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Lists_LF_Lists_NatList_app (imported_Original_LF__DOT__Lists_LF_Lists_NatList_app x x0) x1)
    (imported_Original_LF__DOT__Lists_LF_Lists_NatList_app x (imported_Original_LF__DOT__Lists_LF_Lists_NatList_app x0 x1)) := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_app__assoc.
Instance Original_LF__DOT__Lists_LF_Lists_NatList_app__assoc_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist)
    (hx : rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x1 x2) (x3 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x4 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist)
    (hx0 : rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x3 x4) (x5 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x6 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist)
    (hx1 : rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x5 x6),
  rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Lists_LF_Lists_NatList_app_iso (Original_LF__DOT__Lists_LF_Lists_NatList_app_iso hx hx0) hx1)
       (Original_LF__DOT__Lists_LF_Lists_NatList_app_iso hx (Original_LF__DOT__Lists_LF_Lists_NatList_app_iso hx0 hx1)))
    (Original.LF_DOT_Lists.LF.Lists.NatList.app_assoc x1 x3 x5) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_app__assoc x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.app_assoc := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_app__assoc := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.app_assoc Original_LF__DOT__Lists_LF_Lists_NatList_app__assoc_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.app_assoc Imported.Original_LF__DOT__Lists_LF_Lists_NatList_app__assoc Original_LF__DOT__Lists_LF_Lists_NatList_app__assoc_iso := {}.