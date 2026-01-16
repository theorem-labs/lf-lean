From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


Definition imported_Original_LF__DOT__Basics_LF_Basics_day : Type := Imported.Original_LF__DOT__Basics_LF_Basics_day.

(* Define the isomorphism between the two day types *)
Definition day_to_imported (d : Original.LF_DOT_Basics.LF.Basics.day) : imported_Original_LF__DOT__Basics_LF_Basics_day :=
  match d with
  | Original.LF_DOT_Basics.LF.Basics.monday => Imported.Original_LF__DOT__Basics_LF_Basics_day_monday
  | Original.LF_DOT_Basics.LF.Basics.tuesday => Imported.Original_LF__DOT__Basics_LF_Basics_day_tuesday
  | Original.LF_DOT_Basics.LF.Basics.wednesday => Imported.Original_LF__DOT__Basics_LF_Basics_day_wednesday
  | Original.LF_DOT_Basics.LF.Basics.thursday => Imported.Original_LF__DOT__Basics_LF_Basics_day_thursday
  | Original.LF_DOT_Basics.LF.Basics.friday => Imported.Original_LF__DOT__Basics_LF_Basics_day_friday
  | Original.LF_DOT_Basics.LF.Basics.saturday => Imported.Original_LF__DOT__Basics_LF_Basics_day_saturday
  | Original.LF_DOT_Basics.LF.Basics.sunday => Imported.Original_LF__DOT__Basics_LF_Basics_day_sunday
  end.

Definition imported_to_day (d : imported_Original_LF__DOT__Basics_LF_Basics_day) : Original.LF_DOT_Basics.LF.Basics.day :=
  match d with
  | Imported.Original_LF__DOT__Basics_LF_Basics_day_monday => Original.LF_DOT_Basics.LF.Basics.monday
  | Imported.Original_LF__DOT__Basics_LF_Basics_day_tuesday => Original.LF_DOT_Basics.LF.Basics.tuesday
  | Imported.Original_LF__DOT__Basics_LF_Basics_day_wednesday => Original.LF_DOT_Basics.LF.Basics.wednesday
  | Imported.Original_LF__DOT__Basics_LF_Basics_day_thursday => Original.LF_DOT_Basics.LF.Basics.thursday
  | Imported.Original_LF__DOT__Basics_LF_Basics_day_friday => Original.LF_DOT_Basics.LF.Basics.friday
  | Imported.Original_LF__DOT__Basics_LF_Basics_day_saturday => Original.LF_DOT_Basics.LF.Basics.saturday
  | Imported.Original_LF__DOT__Basics_LF_Basics_day_sunday => Original.LF_DOT_Basics.LF.Basics.sunday
  end.

Instance Original_LF__DOT__Basics_LF_Basics_day_iso : Iso Original.LF_DOT_Basics.LF.Basics.day imported_Original_LF__DOT__Basics_LF_Basics_day.
Proof.
  refine (@Build_Iso Original.LF_DOT_Basics.LF.Basics.day imported_Original_LF__DOT__Basics_LF_Basics_day day_to_imported imported_to_day _ _).
  - intro d; destruct d; apply IsomorphismDefinitions.eq_refl.
  - intro d; destruct d; apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.day := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_day := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.day Original_LF__DOT__Basics_LF_Basics_day_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.day Imported.Original_LF__DOT__Basics_LF_Basics_day Original_LF__DOT__Basics_LF_Basics_day_iso := {}.