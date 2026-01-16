From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__hd__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__hd____error__iso Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__option____elim__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_option__elim__hd : forall (x : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist) (x0 : imported_nat),
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Lists_LF_Lists_NatList_hd x0 x)
    (imported_Original_LF__DOT__Lists_LF_Lists_NatList_option__elim x0 (imported_Original_LF__DOT__Lists_LF_Lists_NatList_hd__error x)) := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_option__elim__hd.
Instance Original_LF__DOT__Lists_LF_Lists_NatList_option__elim__hd_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist)
    (hx : rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4),
  rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Lists_LF_Lists_NatList_hd_iso hx0 hx)
       (Original_LF__DOT__Lists_LF_Lists_NatList_option__elim_iso hx0 (Original_LF__DOT__Lists_LF_Lists_NatList_hd__error_iso hx)))
    (Original.LF_DOT_Lists.LF.Lists.NatList.option_elim_hd x1 x3) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_option__elim__hd x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.option_elim_hd := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_option__elim__hd := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.option_elim_hd Original_LF__DOT__Lists_LF_Lists_NatList_option__elim__hd_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.option_elim_hd Imported.Original_LF__DOT__Lists_LF_Lists_NatList_option__elim__hd Original_LF__DOT__Lists_LF_Lists_NatList_option__elim__hd_iso := {}.