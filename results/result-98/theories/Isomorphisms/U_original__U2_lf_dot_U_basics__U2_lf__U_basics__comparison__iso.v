From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


Definition imported_Original_LF__DOT__Basics_LF_Basics_comparison : Type := Imported.Original_LF__DOT__Basics_LF_Basics_comparison.

Definition comparison_to (c : Original.LF_DOT_Basics.LF.Basics.comparison) : imported_Original_LF__DOT__Basics_LF_Basics_comparison :=
  match c with
  | Original.LF_DOT_Basics.LF.Basics.Eq => Imported.Original_LF__DOT__Basics_LF_Basics_comparison_Eq
  | Original.LF_DOT_Basics.LF.Basics.Lt => Imported.Original_LF__DOT__Basics_LF_Basics_comparison_Lt
  | Original.LF_DOT_Basics.LF.Basics.Gt => Imported.Original_LF__DOT__Basics_LF_Basics_comparison_Gt
  end.

Definition comparison_from (c : imported_Original_LF__DOT__Basics_LF_Basics_comparison) : Original.LF_DOT_Basics.LF.Basics.comparison :=
  match c with
  | Imported.Original_LF__DOT__Basics_LF_Basics_comparison_Eq => Original.LF_DOT_Basics.LF.Basics.Eq
  | Imported.Original_LF__DOT__Basics_LF_Basics_comparison_Lt => Original.LF_DOT_Basics.LF.Basics.Lt
  | Imported.Original_LF__DOT__Basics_LF_Basics_comparison_Gt => Original.LF_DOT_Basics.LF.Basics.Gt
  end.

Lemma comparison_to_from : forall x, IsomorphismDefinitions.eq (comparison_to (comparison_from x)) x.
Proof.
  intro x; destruct x; apply IsomorphismDefinitions.eq_refl.
Qed.

Lemma comparison_from_to : forall x, IsomorphismDefinitions.eq (comparison_from (comparison_to x)) x.
Proof.
  intro x; destruct x; apply IsomorphismDefinitions.eq_refl.
Qed.

Instance Original_LF__DOT__Basics_LF_Basics_comparison_iso : Iso Original.LF_DOT_Basics.LF.Basics.comparison imported_Original_LF__DOT__Basics_LF_Basics_comparison :=
  Build_Iso comparison_to comparison_from comparison_to_from comparison_from_to.

Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.comparison := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_comparison := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.comparison Original_LF__DOT__Basics_LF_Basics_comparison_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.comparison Imported.Original_LF__DOT__Basics_LF_Basics_comparison Original_LF__DOT__Basics_LF_Basics_comparison_iso := {}.
