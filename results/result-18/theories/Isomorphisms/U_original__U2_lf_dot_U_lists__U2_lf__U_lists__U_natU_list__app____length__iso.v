From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_nat__add__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__app__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__length__iso.

Monomorphic Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_app__length : forall x x0 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Lists_LF_Lists_NatList_length (imported_Original_LF__DOT__Lists_LF_Lists_NatList_app x x0))
    (imported_Nat_add (imported_Original_LF__DOT__Lists_LF_Lists_NatList_length x) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_length x0)) := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_app__length.
Monomorphic Instance Original_LF__DOT__Lists_LF_Lists_NatList_app__length_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist)
    (hx : rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x1 x2) (x3 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x4 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist)
    (hx0 : rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x3 x4),
  rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Lists_LF_Lists_NatList_length_iso (Original_LF__DOT__Lists_LF_Lists_NatList_app_iso hx hx0))
       (Nat_add_iso (Original_LF__DOT__Lists_LF_Lists_NatList_length_iso hx) (Original_LF__DOT__Lists_LF_Lists_NatList_length_iso hx0)))
    (Original.LF_DOT_Lists.LF.Lists.NatList.app_length x1 x3) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_app__length x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.app_length := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_app__length := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.app_length Original_LF__DOT__Lists_LF_Lists_NatList_app__length_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.app_length Imported.Original_LF__DOT__Lists_LF_Lists_NatList_app__length Original_LF__DOT__Lists_LF_Lists_NatList_app__length_iso := {}.