From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__rev__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_rev__injective : forall x x0 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Lists_LF_Lists_NatList_rev x) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_rev x0) -> imported_Corelib_Init_Logic_eq x x0 := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_rev__injective.
Instance Original_LF__DOT__Lists_LF_Lists_NatList_rev__injective_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist)
    (hx : rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x1 x2) (x3 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x4 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist)
    (hx0 : rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x3 x4) (x5 : Original.LF_DOT_Lists.LF.Lists.NatList.rev x1 = Original.LF_DOT_Lists.LF.Lists.NatList.rev x3)
    (x6 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Lists_LF_Lists_NatList_rev x2) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_rev x4)),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Lists_LF_Lists_NatList_rev_iso hx) (Original_LF__DOT__Lists_LF_Lists_NatList_rev_iso hx0)) x5 x6 ->
  rel_iso (Corelib_Init_Logic_eq_iso hx hx0) (Original.LF_DOT_Lists.LF.Lists.NatList.rev_injective x1 x3 x5) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_rev__injective x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.rev_injective := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_rev__injective := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.rev_injective Original_LF__DOT__Lists_LF_Lists_NatList_rev__injective_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.rev_injective Imported.Original_LF__DOT__Lists_LF_Lists_NatList_rev__injective Original_LF__DOT__Lists_LF_Lists_NatList_rev__injective_iso := {}.