From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)

From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_natoption : Type := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natoption.

(* Forward: Original.natoption -> Imported.natoption *)
Definition natoption_to_imported (o : Original.LF_DOT_Lists.LF.Lists.NatList.natoption) : Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natoption :=
  match o with
  | Original.LF_DOT_Lists.LF.Lists.NatList.Some n => Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natoption_Some (nat_to_imported n)
  | Original.LF_DOT_Lists.LF.Lists.NatList.None => Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natoption_None
  end.

(* Backward: Imported.natoption -> Original.natoption *)
Definition imported_to_natoption (o : Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natoption) : Original.LF_DOT_Lists.LF.Lists.NatList.natoption :=
  match o with
  | Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natoption_Some n => Original.LF_DOT_Lists.LF.Lists.NatList.Some (imported_to_nat n)
  | Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natoption_None => Original.LF_DOT_Lists.LF.Lists.NatList.None
  end.

Lemma natoption_roundtrip : forall o : Original.LF_DOT_Lists.LF.Lists.NatList.natoption,
  Logic.eq (imported_to_natoption (natoption_to_imported o)) o.
Proof.
  intros o. destruct o as [n|]; simpl.
  - apply Logic.f_equal. apply nat_roundtrip.
  - reflexivity.
Qed.

Lemma imported_natoption_roundtrip : forall o : Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natoption,
  Logic.eq (natoption_to_imported (imported_to_natoption o)) o.
Proof.
  intros o. destruct o as [n|]; simpl.
  - apply Logic.f_equal. apply imported_nat_roundtrip.
  - reflexivity.
Qed.

Instance Original_LF__DOT__Lists_LF_Lists_NatList_natoption_iso : Iso Original.LF_DOT_Lists.LF.Lists.NatList.natoption imported_Original_LF__DOT__Lists_LF_Lists_NatList_natoption.
Proof.
  refine {|
    to := natoption_to_imported;
    from := imported_to_natoption;
    to_from := _;
    from_to := _
  |}.
  - intros o. apply seq_of_eq. apply imported_natoption_roundtrip.
  - intros o. apply seq_of_eq. apply natoption_roundtrip.
Defined.

Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.natoption := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natoption := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.natoption Original_LF__DOT__Lists_LF_Lists_NatList_natoption_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.natoption Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natoption Original_LF__DOT__Lists_LF_Lists_NatList_natoption_iso := {}.