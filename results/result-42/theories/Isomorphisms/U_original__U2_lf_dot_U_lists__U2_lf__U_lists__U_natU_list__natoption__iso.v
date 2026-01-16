From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_NatList_natoption : Type := Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natoption.

(* Conversion functions between Original.natoption and Imported.natoption *)
Definition natoption_to_imported (o : Original.LF_DOT_Lists.LF.Lists.NatList.natoption) : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natoption :=
  match o with
  | Original.LF_DOT_Lists.LF.Lists.NatList.Some n => Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natoption_Some (nat_to_imported n)
  | Original.LF_DOT_Lists.LF.Lists.NatList.None => Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natoption_None
  end.

Definition natoption_from_imported (o : imported_Original_LF__DOT__Lists_LF_Lists_NatList_natoption) : Original.LF_DOT_Lists.LF.Lists.NatList.natoption :=
  match o with
  | Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natoption_Some n => Original.LF_DOT_Lists.LF.Lists.NatList.Some (imported_to_nat n)
  | Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natoption_None => Original.LF_DOT_Lists.LF.Lists.NatList.None
  end.

(* Round-trip proofs *)
Lemma natoption_to_from : forall o, IsomorphismDefinitions.eq (natoption_to_imported (natoption_from_imported o)) o.
Proof.
  intro o.
  destruct o as [n |].
  - simpl.
    apply IsoEq.f_equal.
    apply seq_of_eq. apply imported_nat_from_to.
  - apply IsomorphismDefinitions.eq_refl.
Qed.

Lemma natoption_from_to : forall o, IsomorphismDefinitions.eq (natoption_from_imported (natoption_to_imported o)) o.
Proof.
  intro o.
  destruct o as [n |].
  - simpl.
    apply IsoEq.f_equal.
    apply seq_of_eq. apply nat_from_to.
  - apply IsomorphismDefinitions.eq_refl.
Qed.

Instance Original_LF__DOT__Lists_LF_Lists_NatList_natoption_iso : Iso Original.LF_DOT_Lists.LF.Lists.NatList.natoption imported_Original_LF__DOT__Lists_LF_Lists_NatList_natoption :=
  {| to := natoption_to_imported;
     from := natoption_from_imported;
     to_from := natoption_to_from;
     from_to := natoption_from_to |}.

Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.NatList.natoption := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natoption := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.NatList.natoption Original_LF__DOT__Lists_LF_Lists_NatList_natoption_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.NatList.natoption Imported.Original_LF__DOT__Lists_LF_Lists_NatList_natoption Original_LF__DOT__Lists_LF_Lists_NatList_natoption_iso := {}.