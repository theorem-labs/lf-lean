From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_false__iso.

(* Imported.Logic_not P = P -> Imported.False_alias, and False_alias = False *)
(* So Imported.Logic_not = fun P => P -> Imported.False = fun P => P -> imported_False *)
Monomorphic Definition imported_Logic_not : SProp -> SProp := fun x2 : SProp => x2 -> imported_False.

(* This should now type-check since imported_False = Imported.False *)
Monomorphic Instance Logic_not_iso : forall (x1 : Prop) (x2 : SProp), Iso x1 x2 -> Iso (~ x1) (imported_Logic_not x2)
  := fun (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) => IsoArrow hx False_iso.

Instance: KnownConstant Logic.not := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Logic_not := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Logic.not Logic_not_iso := {}.
Instance: IsoStatementProofBetween Logic.not Imported.Logic_not Logic_not_iso := {}.