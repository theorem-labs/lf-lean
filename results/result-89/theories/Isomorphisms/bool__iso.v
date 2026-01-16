From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* Typeclasses Opaque rel_iso *). *) (* for speed *)


Definition imported_bool : Type := Imported.mybool.
Instance bool_iso : Iso bool imported_bool.
Proof.
  exists (fun b : bool => match b with true => Imported.Original_LF__DOT__Basics_LF_Basics_bool_true | false => Imported.Original_LF__DOT__Basics_LF_Basics_bool_false end)
         (fun b : Imported.mybool => match b with Imported.Original_LF__DOT__Basics_LF_Basics_bool_true => true | Imported.Original_LF__DOT__Basics_LF_Basics_bool_false => false end).
  - intros [|]; apply IsomorphismDefinitions.eq_refl.
  - intros [|]; apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant bool := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.mybool := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor bool bool_iso := {}.
Instance: IsoStatementProofBetween bool Imported.mybool bool_iso := {}.