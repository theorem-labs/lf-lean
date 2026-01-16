From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
From Stdlib Require Import Logic.ProofIrrelevance.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. *)

From IsomorphismChecker Require Export Isomorphisms.list__iso Isomorphisms.U_original__U_false__iso.

Definition imported_List_In : forall x : Type, x -> imported_list x -> SProp := @Imported.List_In.

(* Admit for now - this is a dependency *)
Instance List_In_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2),
  rel_iso hx x3 x4 -> forall (x5 : list x1) (x6 : imported_list x2), rel_iso (list_iso hx) x5 x6 -> Iso (List.In x3 x5) (imported_List_In x4 x6).
Admitted.

Instance: KnownConstant (@List.In) := {}.
Instance: KnownConstant (@Imported.List_In) := {}.
Instance: IsoStatementProofFor (@List.In) List_In_iso := {}.
Instance: IsoStatementProofBetween (@List.In) (@imported_List_In) List_In_iso := {}.
