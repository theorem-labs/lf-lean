From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* (* Typeclasses Opaque rel_iso. *) *) *) (* for speed *)


Definition imported_Original_LF__DOT__Basics_LF_Basics_bool : Type := Imported.Original_LF__DOT__Basics_LF_Basics_bool.

(* Named conversion functions for use in other isomorphisms *)
Definition bool_to_imported (x : Original.LF_DOT_Basics.LF.Basics.bool) : imported_Original_LF__DOT__Basics_LF_Basics_bool :=
  match x with
  | Original.LF_DOT_Basics.LF.Basics.true => Imported.Original_LF__DOT__Basics_LF_Basics_bool_true
  | Original.LF_DOT_Basics.LF.Basics.false => Imported.Original_LF__DOT__Basics_LF_Basics_bool_false
  end.

Definition imported_to_bool (y : imported_Original_LF__DOT__Basics_LF_Basics_bool) : Original.LF_DOT_Basics.LF.Basics.bool :=
  match y with
  | Imported.Original_LF__DOT__Basics_LF_Basics_bool_true => Original.LF_DOT_Basics.LF.Basics.true
  | Imported.Original_LF__DOT__Basics_LF_Basics_bool_false => Original.LF_DOT_Basics.LF.Basics.false
  end.

Instance Original_LF__DOT__Basics_LF_Basics_bool_iso : Iso Original.LF_DOT_Basics.LF.Basics.bool imported_Original_LF__DOT__Basics_LF_Basics_bool.
Proof.
  apply Build_Iso with
    (to := fun x => match x with
                   | Original.LF_DOT_Basics.LF.Basics.true => Imported.Original_LF__DOT__Basics_LF_Basics_bool_true
                   | Original.LF_DOT_Basics.LF.Basics.false => Imported.Original_LF__DOT__Basics_LF_Basics_bool_false
                   end)
    (from := fun y => match y with
                     | Imported.Original_LF__DOT__Basics_LF_Basics_bool_true => Original.LF_DOT_Basics.LF.Basics.true
                     | Imported.Original_LF__DOT__Basics_LF_Basics_bool_false => Original.LF_DOT_Basics.LF.Basics.false
                     end).
  - (* to_from *)
    intros x.
    destruct x; apply IsomorphismDefinitions.eq_refl.
  - (* from_to *)
    intros x.
    destruct x; apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.bool := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_bool := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.bool Original_LF__DOT__Basics_LF_Basics_bool_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.bool Imported.Original_LF__DOT__Basics_LF_Basics_bool Original_LF__DOT__Basics_LF_Basics_bool_iso := {}.