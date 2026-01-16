From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_nat__add__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__app__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__repeat__iso.

Monomorphic Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_repeat__plus : forall x x0 x1 : imported_nat,
  imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Lists_LF_Lists_NatList_app (imported_Original_LF__DOT__Lists_LF_Lists_NatList_repeat x1 x) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_repeat x1 x0))
    (imported_Original_LF__DOT__Lists_LF_Lists_NatList_repeat x1 (imported_Nat_add x x0)) := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_repeat__plus.
Monomorphic Instance Original_LF__DOT__Lists_LF_Lists_NatList_repeat__plus_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6),
  rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Lists_LF_Lists_NatList_app_iso (Original_LF__DOT__Lists_LF_Lists_NatList_repeat_iso hx1 hx) (Original_LF__DOT__Lists_LF_Lists_NatList_repeat_iso hx1 hx0))
       (Original_LF__DOT__Lists_LF_Lists_NatList_repeat_iso hx1 (Nat_add_iso hx hx0)))
    (Original.LF_DOT_Lists.LF.Lists.NatList.repeat_plus x1 x3 x5) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_repeat__plus x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.repeat_plus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_repeat__plus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.repeat_plus Original_LF__DOT__Lists_LF_Lists_NatList_repeat__plus_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.repeat_plus Imported.Original_LF__DOT__Lists_LF_Lists_NatList_repeat__plus Original_LF__DOT__Lists_LF_Lists_NatList_repeat__plus_iso := {}.