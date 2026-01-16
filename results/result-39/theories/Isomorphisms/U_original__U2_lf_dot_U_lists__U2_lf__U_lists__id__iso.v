From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)

From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Lists_LF_Lists_id : Type := Imported.Original_LF__DOT__Lists_LF_Lists_id.

(* Isomorphism between nat and Imported.nat *)
Definition id_to_imported (i : Original.LF_DOT_Lists.LF.Lists.id) : imported_Original_LF__DOT__Lists_LF_Lists_id :=
  match i with
  | Original.LF_DOT_Lists.LF.Lists.Id n => Imported.Original_LF__DOT__Lists_LF_Lists_id_Id (nat_to_imported n)
  end.

Definition id_from_imported (i : imported_Original_LF__DOT__Lists_LF_Lists_id) : Original.LF_DOT_Lists.LF.Lists.id :=
  match i with
  | Imported.Original_LF__DOT__Lists_LF_Lists_id_Id n => Original.LF_DOT_Lists.LF.Lists.Id (imported_to_nat n)
  end.

Lemma id_to_from : forall x, IsomorphismDefinitions.eq (id_to_imported (id_from_imported x)) x.
Proof.
  intros x. destruct x as [n].
  unfold id_from_imported, id_to_imported. simpl.
  apply IsoEq.f_equal. apply nat_to_from.
Defined.

Lemma id_from_to : forall x, IsomorphismDefinitions.eq (id_from_imported (id_to_imported x)) x.
Proof.
  intros x. destruct x as [n].
  unfold id_from_imported, id_to_imported. simpl.
  apply IsoEq.f_equal. apply nat_from_to.
Defined.

Instance Original_LF__DOT__Lists_LF_Lists_id_iso : Iso Original.LF_DOT_Lists.LF.Lists.id imported_Original_LF__DOT__Lists_LF_Lists_id :=
  Build_Iso id_to_imported id_from_imported id_to_from id_from_to.

Instance: KnownConstant Original.LF_DOT_Lists.LF.Lists.id := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Lists_LF_Lists_id := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Lists.LF.Lists.id Original_LF__DOT__Lists_LF_Lists_id_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Lists.LF.Lists.id Imported.Original_LF__DOT__Lists_LF_Lists_id Original_LF__DOT__Lists_LF_Lists_id_iso := {}.