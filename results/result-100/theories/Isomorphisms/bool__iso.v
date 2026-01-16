From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



Definition imported_bool : Type := Imported.Coqbool.

(* Build the isomorphism between bool and Imported.Coqbool *)
(* Note: Coqbool = mybool, so we use mybool constructors *)
Definition bool_to_mybool (b : bool) : Imported.Coqbool :=
  match b with
  | true => Imported.mybool_mytrue
  | false => Imported.mybool_myfalse
  end.

Definition mybool_to_bool (b : Imported.Coqbool) : bool :=
  match b with
  | Imported.mybool_mytrue => true
  | Imported.mybool_myfalse => false
  end.

Instance bool_iso : Iso bool imported_bool :=
  {| to := bool_to_mybool;
     from := mybool_to_bool;
     to_from := fun b => match b with
       | Imported.mybool_mytrue => IsomorphismDefinitions.eq_refl
       | Imported.mybool_myfalse => IsomorphismDefinitions.eq_refl
       end;
     from_to := fun b => match b with
       | true => IsomorphismDefinitions.eq_refl
       | false => IsomorphismDefinitions.eq_refl
       end
  |}.

(* Alias for compatibility *)
Definition bool_to_imported := bool_to_mybool.

Instance: KnownConstant bool := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Coqbool := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor bool bool_iso := {}.
Instance: IsoStatementProofBetween bool Imported.Coqbool bool_iso := {}.