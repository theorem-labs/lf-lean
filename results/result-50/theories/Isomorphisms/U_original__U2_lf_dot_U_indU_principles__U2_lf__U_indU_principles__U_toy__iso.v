From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


Definition imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_Toy : Type := Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_Toy.

(* Both Toy types are empty inductive types with no constructors *)
(* They are trivially isomorphic - we can use the empty eliminator *)

Definition Toy_to_imported (t : Original.LF_DOT_IndPrinciples.LF.IndPrinciples.Toy) : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_Toy :=
  match t with end.

Definition imported_to_Toy (t : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_Toy) : Original.LF_DOT_IndPrinciples.LF.IndPrinciples.Toy :=
  match t with end.

Lemma to_from_proof : forall x : imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_Toy, 
  IsomorphismDefinitions.eq (Toy_to_imported (imported_to_Toy x)) x.
Proof.
  intro x. destruct x.
Qed.

Lemma from_to_proof : forall x : Original.LF_DOT_IndPrinciples.LF.IndPrinciples.Toy, 
  IsomorphismDefinitions.eq (imported_to_Toy (Toy_to_imported x)) x.
Proof.
  intro x. destruct x.
Qed.

Instance Original_LF__DOT__IndPrinciples_LF_IndPrinciples_Toy_iso : Iso Original.LF_DOT_IndPrinciples.LF.IndPrinciples.Toy imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_Toy :=
  Build_Iso Toy_to_imported imported_to_Toy to_from_proof from_to_proof.

Instance: KnownConstant Original.LF_DOT_IndPrinciples.LF.IndPrinciples.Toy := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_Toy := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndPrinciples.LF.IndPrinciples.Toy Original_LF__DOT__IndPrinciples_LF_IndPrinciples_Toy_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndPrinciples.LF.IndPrinciples.Toy Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_Toy Original_LF__DOT__IndPrinciples_LF_IndPrinciples_Toy_iso := {}.