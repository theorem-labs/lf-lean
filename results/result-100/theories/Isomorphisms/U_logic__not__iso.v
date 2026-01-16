From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_false__iso.

(* Imported.Logic_not is (fun P => P -> FalseType) = (fun P => P -> imported_False) *)
Definition imported_Logic_not : SProp -> SProp := fun x2 : SProp => x2 -> imported_False.
Instance Logic_not_iso : forall (x1 : Prop) (x2 : SProp), Iso x1 x2 -> Iso (~ x1) (imported_Logic_not x2)
  := fun (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) => IsoArrow hx False_iso.

Instance: KnownConstant not := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Logic_not := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor not Logic_not_iso := {}.
Instance: IsoStatementProofBetween not Imported.Logic_not Logic_not_iso := {}.