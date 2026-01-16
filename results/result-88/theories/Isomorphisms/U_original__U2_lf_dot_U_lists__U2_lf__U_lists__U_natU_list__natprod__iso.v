From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* Typeclasses Opaque rel_iso. *) *) (* for speed *)

From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_natprod : Type := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natprod.

Definition natprod_to_imported (p : Original.LF_DOT_Lists.LF.Lists.NatList.natprod) : Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natprod :=
  match p with
  | Original.LF_DOT_Lists.LF.Lists.NatList.pair n1 n2 =>
      Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natprod_pair (nat_to_imported n1) (nat_to_imported n2)
  end.

Definition imported_to_natprod (p : Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natprod) : Original.LF_DOT_Lists.LF.Lists.NatList.natprod :=
  match p with
  | Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natprod_pair n1 n2 =>
      Original.LF_DOT_Lists.LF.Lists.NatList.pair (imported_to_nat n1) (imported_to_nat n2)
  end.

Lemma natprod_roundtrip1 : forall p, IsomorphismDefinitions.eq (imported_to_natprod (natprod_to_imported p)) p.
Proof.
  intro p. destruct p as [n1 n2]. unfold imported_to_natprod, natprod_to_imported.
  simpl.
  apply (IsoEq.f_equal2 Original.LF_DOT_Lists.LF.Lists.NatList.pair).
  - apply seq_of_eq. apply nat_roundtrip.
  - apply seq_of_eq. apply nat_roundtrip.
Defined.

Lemma natprod_roundtrip2 : forall p, IsomorphismDefinitions.eq (natprod_to_imported (imported_to_natprod p)) p.
Proof.
  intro p. destruct p as [n1 n2]. unfold imported_to_natprod, natprod_to_imported.
  simpl.
  apply (IsoEq.f_equal2 Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natprod_pair).
  - apply seq_of_eq. apply imported_nat_roundtrip.
  - apply seq_of_eq. apply imported_nat_roundtrip.
Defined.

Instance Original_LF__DOT__Lists_LF_Lists_NatList_natprod_iso : Iso Original.LF_DOT_Lists.LF.Lists.NatList.natprod imported_Original_LF__DOT__Lists_LF_Lists_NatList_natprod.
Proof.
  exact (Build_Iso natprod_to_imported imported_to_natprod natprod_roundtrip2 natprod_roundtrip1).
Defined.

Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.natprod := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natprod := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.natprod Original_LF__DOT__Lists_LF_Lists_NatList_natprod_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.natprod Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natprod Original_LF__DOT__Lists_LF_Lists_NatList_natprod_iso := {}.