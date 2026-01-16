From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__natoption__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_option__elim : imported_nat -> imported_Original_LF__DOT__Lists_LF_Lists_NatList_natoption -> imported_nat := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_option__elim.
Instance Original_LF__DOT__Lists_LF_Lists_NatList_option__elim_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Lists.LF.Lists.NatList.natoption) (x4 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natoption),
  rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natoption_iso x3 x4 ->
  rel_iso nat_iso (Original.LF_DOT_Lists.LF.Lists.NatList.option_elim x1 x3) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_option__elim x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.option_elim := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_option__elim := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.option_elim Original_LF__DOT__Lists_LF_Lists_NatList_option__elim_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.option_elim Imported.Original_LF__DOT__Lists_LF_Lists_NatList_option__elim Original_LF__DOT__Lists_LF_Lists_NatList_option__elim_iso := {}.