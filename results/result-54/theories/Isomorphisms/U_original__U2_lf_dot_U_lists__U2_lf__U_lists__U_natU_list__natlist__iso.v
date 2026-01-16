From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist : Type := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist.

(* Forward: Original.natlist -> Imported.natlist *)
Fixpoint natlist_to_imported (l : Original.LF_DOT_Lists.LF.Lists.NatList.natlist) : Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist :=
  match l with
  | Original.LF_DOT_Lists.LF.Lists.NatList.nil => Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist_nil
  | Original.LF_DOT_Lists.LF.Lists.NatList.cons n t => 
      Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist_cons 
        (nat_to_imported n) 
        (natlist_to_imported t)
  end.

(* Backward: Imported.natlist -> Original.natlist *)
Fixpoint imported_to_natlist (l : Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist) : Original.LF_DOT_Lists.LF.Lists.NatList.natlist :=
  match l with
  | Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist_nil => Original.LF_DOT_Lists.LF.Lists.NatList.nil
  | Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist_cons n t => 
      Original.LF_DOT_Lists.LF.Lists.NatList.cons 
        (imported_to_nat n) 
        (imported_to_natlist t)
  end.

Instance Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso : Iso Original.LF_DOT_Lists.LF.Lists.NatList.natlist imported_Original_LF__DOT__Lists_LF_Lists_NatList_natlist.
Proof.
  exists natlist_to_imported imported_to_natlist.
  - fix IH 1. intros l. destruct l as [| n t]; simpl.
    + apply IsomorphismDefinitions.eq_refl.
    + apply (IsoEq.f_equal2 Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist_cons).
      * exact (nat_to_from n).
      * apply IH.
  - fix IH 1. intros l. destruct l as [| n t]; simpl.
    + apply IsomorphismDefinitions.eq_refl.
    + apply (IsoEq.f_equal2 Original.LF_DOT_Lists.LF.Lists.NatList.cons).
      * exact (nat_from_to n).
      * apply IH.
Defined.

Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.natlist := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.natlist Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.natlist Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natlist Original_LF__DOT__Lists_LF_Lists_NatList_natlist_iso := {}.
