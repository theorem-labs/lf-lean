From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* Typeclasses Opaque rel_iso. *) *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_lists__U2_lf__U_lists__U_natU_list__natprod__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_fst' : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natprod -> imported_nat := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_fst'.

Instance Original_LF__DOT__Lists_LF_Lists_NatList_fst'_iso : forall (x1 : Original.LF_DOT_Lists.LF.Lists.NatList.natprod) (x2 : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natprod),
  rel_iso Original_LF__DOT__Lists_LF_Lists_NatList_natprod_iso x1 x2 -> rel_iso nat_iso (Original.LF_DOT_Lists.LF.Lists.NatList.fst' x1) (imported_Original_LF__DOT__Lists_LF_Lists_NatList_fst' x2).
Proof.
  intros x1 x2 Hiso.
  destruct Hiso as [Hiso]. constructor. simpl in *.
  unfold imported_Original_LF__DOT__Lists_LF_Lists_NatList_fst'.
  destruct x1 as [n1 n2].
  simpl.
  (* Hiso : to natprod_iso (pair n1 n2) = x2 *)
  (* Goal: nat_to_imported n1 = Imported.fst' x2 *)
  unfold Original_LF__DOT__Lists_LF_Lists_NatList_natprod_iso in Hiso.
  simpl in Hiso.
  unfold natprod_to_imported in Hiso.
  (* Hiso : {| ... |} = x2 *)
  destruct Hiso.
  simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.fst' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_fst' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.fst' Original_LF__DOT__Lists_LF_Lists_NatList_fst'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.fst' Imported.Original_LF__DOT__Lists_LF_Lists_NatList_fst' Original_LF__DOT__Lists_LF_Lists_NatList_fst'_iso := {}.