From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__natlist__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_nonzeros : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist -> imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_nonzeros.

(* nonzeros is an axiom in both Original (Admitted) and Imported, so we axiomatize the isomorphism *)
Axiom Original_LF__DOT__Lists_LF_Lists_NatList_nonzeros_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist),
  rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso x1 x2 ->
  rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso (Original.LF_DOT_Lists.LF.Lists.NatList.nonzeros x1) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_nonzeros x2).
Existing Instance Original_LF__DOT__Lists_LF_Lists_NatList_nonzeros_iso.

Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.nonzeros := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_nonzeros := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.nonzeros Original_LF__DOT__Lists_LF_Lists_NatList_nonzeros_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.nonzeros Imported.Original_LF__DOT__Lists_LF_Lists_NatList_nonzeros Original_LF__DOT__Lists_LF_Lists_NatList_nonzeros_iso := {}.