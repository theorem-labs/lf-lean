From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* Typeclasses Opaque rel_iso *). *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.bool__iso.

Definition imported_true : imported_bool := Imported.Original_LF__DOT__Basics_LF_Basics_bool_true.
Instance true_iso : rel_iso bool_iso true imported_true.
Proof.
  constructor; simpl.
  unfold imported_true.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant true := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_bool_true := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor true true_iso := {}.
Instance: IsoStatementProofBetween true Imported.Original_LF__DOT__Basics_LF_Basics_bool_true true_iso := {}.