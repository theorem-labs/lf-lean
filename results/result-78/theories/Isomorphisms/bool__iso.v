From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)

(* Imported.Coqbool is our bool type *)
Definition imported_bool : Type := Imported.Coqbool.

(* Build the isomorphism between bool and Imported.Coqbool *)
Definition bool_to_coqbool (b : bool) : Imported.Coqbool :=
  match b with
  | true => Imported.Coqbool_true
  | false => Imported.Coqbool_false
  end.

Definition coqbool_to_bool (b : Imported.Coqbool) : bool :=
  match b with
  | Imported.Coqbool_true => true
  | Imported.Coqbool_false => false
  end.

Instance bool_iso : Iso bool imported_bool :=
  {| to := bool_to_coqbool;
     from := coqbool_to_bool;
     to_from := fun b => match b with
       | Imported.Coqbool_true => IsomorphismDefinitions.eq_refl
       | Imported.Coqbool_false => IsomorphismDefinitions.eq_refl
       end;
     from_to := fun b => match b with
       | true => IsomorphismDefinitions.eq_refl
       | false => IsomorphismDefinitions.eq_refl
       end
  |}.

#[export] Instance: KnownConstant bool := {}. (* only needed when rel_iso is typeclasses opaque *)
#[export] Instance: KnownConstant Imported.Coqbool := {}. (* only needed when rel_iso is typeclasses opaque *)
#[export] Instance: IsoStatementProofFor bool bool_iso := {}.
#[export] Instance: IsoStatementProofBetween bool Imported.Coqbool bool_iso := {}.
