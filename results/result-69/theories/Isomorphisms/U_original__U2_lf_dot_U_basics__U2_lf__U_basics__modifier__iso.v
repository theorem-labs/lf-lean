From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



Definition imported_Original_LF__DOT__Basics_LF_Basics_modifier : Type := Imported.Original_LF__DOT__Basics_LF_Basics_modifier.

Definition modifier_to (m : Original.LF_DOT_Basics.LF.Basics.modifier) : imported_Original_LF__DOT__Basics_LF_Basics_modifier :=
  match m with
  | Original.LF_DOT_Basics.LF.Basics.Plus => Imported.Original_LF__DOT__Basics_LF_Basics_modifier_Plus
  | Original.LF_DOT_Basics.LF.Basics.Natural => Imported.Original_LF__DOT__Basics_LF_Basics_modifier_Natural
  | Original.LF_DOT_Basics.LF.Basics.Minus => Imported.Original_LF__DOT__Basics_LF_Basics_modifier_Minus
  end.

Definition modifier_from (m : imported_Original_LF__DOT__Basics_LF_Basics_modifier) : Original.LF_DOT_Basics.LF.Basics.modifier :=
  match m with
  | Imported.Original_LF__DOT__Basics_LF_Basics_modifier_Plus => Original.LF_DOT_Basics.LF.Basics.Plus
  | Imported.Original_LF__DOT__Basics_LF_Basics_modifier_Natural => Original.LF_DOT_Basics.LF.Basics.Natural
  | Imported.Original_LF__DOT__Basics_LF_Basics_modifier_Minus => Original.LF_DOT_Basics.LF.Basics.Minus
  end.

Lemma modifier_to_from : forall x, IsomorphismDefinitions.eq (modifier_to (modifier_from x)) x.
Proof.
  intro x; destruct x; apply IsomorphismDefinitions.eq_refl.
Defined.

Lemma modifier_from_to : forall x, IsomorphismDefinitions.eq (modifier_from (modifier_to x)) x.
Proof.
  intro x; destruct x; apply IsomorphismDefinitions.eq_refl.
Defined.

Instance Original_LF__DOT__Basics_LF_Basics_modifier_iso : Iso Original.LF_DOT_Basics.LF.Basics.modifier imported_Original_LF__DOT__Basics_LF_Basics_modifier :=
  {| to := modifier_to; from := modifier_from; to_from := modifier_to_from; from_to := modifier_from_to |}.

Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.modifier := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_modifier := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.modifier Original_LF__DOT__Basics_LF_Basics_modifier_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.modifier Imported.Original_LF__DOT__Basics_LF_Basics_modifier Original_LF__DOT__Basics_LF_Basics_modifier_iso := {}.
