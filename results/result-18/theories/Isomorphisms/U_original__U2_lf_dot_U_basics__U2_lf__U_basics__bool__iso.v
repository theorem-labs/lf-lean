From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



Definition imported_Original_LF__DOT__Basics_LF_Basics_bool : Type := Imported.Original_LF__DOT__Basics_LF_Basics_bool.

Definition bool_to_imported (b : Original.LF_DOT_Basics.LF.Basics.bool) : imported_Original_LF__DOT__Basics_LF_Basics_bool :=
  match b with
  | Original.LF_DOT_Basics.LF.Basics.true => Imported.Original_LF__DOT__Basics_LF_Basics_bool_true
  | Original.LF_DOT_Basics.LF.Basics.false => Imported.Original_LF__DOT__Basics_LF_Basics_bool_false
  end.

Definition imported_to_bool (b : imported_Original_LF__DOT__Basics_LF_Basics_bool) : Original.LF_DOT_Basics.LF.Basics.bool :=
  match b with
  | Imported.Original_LF__DOT__Basics_LF_Basics_bool_true => Original.LF_DOT_Basics.LF.Basics.true
  | Imported.Original_LF__DOT__Basics_LF_Basics_bool_false => Original.LF_DOT_Basics.LF.Basics.false
  end.

Lemma bool_to_from : forall x, IsomorphismDefinitions.eq (bool_to_imported (imported_to_bool x)) x.
Proof. intros []; apply IsomorphismDefinitions.eq_refl. Defined.

Lemma bool_from_to : forall x, IsomorphismDefinitions.eq (imported_to_bool (bool_to_imported x)) x.
Proof. intros []; apply IsomorphismDefinitions.eq_refl. Defined.

Instance Original_LF__DOT__Basics_LF_Basics_bool_iso : Iso Original.LF_DOT_Basics.LF.Basics.bool imported_Original_LF__DOT__Basics_LF_Basics_bool :=
  Build_Iso bool_to_imported imported_to_bool bool_to_from bool_from_to.

Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.bool := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_bool := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.bool Original_LF__DOT__Basics_LF_Basics_bool_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.bool Imported.Original_LF__DOT__Basics_LF_Basics_bool Original_LF__DOT__Basics_LF_Basics_bool_iso := {}.
