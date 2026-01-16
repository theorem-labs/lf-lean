From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.list__iso.

(* List_In is not exported - stubbing out *)
Axiom imported_List_In : forall x : Type, x -> imported_list x -> SProp.
Instance List_In_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2),
  rel_iso hx x3 x4 -> forall (x5 : list x1) (x6 : imported_list x2), rel_iso (list_iso hx) x5 x6 -> Iso (List.In x3 x5) (imported_List_In x4 x6).
Admitted.
Instance: KnownConstant List.In := {}. (* only needed when rel_iso is typeclasses opaque *)
Axiom knownList_In : KnownConstant imported_List_In.
Existing Instance knownList_In.
Instance: IsoStatementProofFor List.In List_In_iso := {}.
Instance: IsoStatementProofBetween List.In imported_List_In List_In_iso := {}.