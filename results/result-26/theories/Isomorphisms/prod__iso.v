From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


Definition imported_prod : Type -> Type -> Type := Imported.prod.
Instance prod_iso : forall x1 x2 : Type, Iso x1 x2 -> forall x3 x4 : Type, Iso x3 x4 -> Iso (Datatypes.prod x1 x3) (imported_prod x2 x4).
Proof.
  intros x1 x2 hx1 x3 x4 hx3.
  exists (fun p => match p with Datatypes.pair a b => Imported.prod_pair x2 x4 (hx1.(to) a) (hx3.(to) b) end)
         (fun p => match p with Imported.prod_pair _ _ a b => Datatypes.pair (hx1.(from) a) (hx3.(from) b) end).
  - intros p.
    destruct p as [a b].
    simpl.
    apply (IsoEq.f_equal2 (Imported.prod_pair x2 x4)).
    + apply hx1.(to_from).
    + apply hx3.(to_from).
  - intros [a b].
    simpl.
    apply (IsoEq.f_equal2 Datatypes.pair).
    + apply hx1.(from_to).
    + apply hx3.(from_to).
Defined.

Instance: KnownConstant Datatypes.prod := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.prod := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Datatypes.prod prod_iso := {}.
Instance: IsoStatementProofBetween Datatypes.prod Imported.prod prod_iso := {}.