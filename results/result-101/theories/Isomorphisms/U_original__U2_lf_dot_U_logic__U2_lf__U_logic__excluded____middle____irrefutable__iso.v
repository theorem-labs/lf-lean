From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_logic__not__iso Isomorphisms.or__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_excluded__middle__irrefutable : forall x : SProp, (imported_or x (x -> imported_False) -> imported_False) -> imported_False := Imported.Original_LF__DOT__Logic_LF_Logic_excluded__middle__irrefutable.
Instance Original_LF__DOT__Logic_LF_Logic_excluded__middle__irrefutable_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : x1 \/ (x1 -> False) -> False) (x4 : imported_or x2 (x2 -> imported_False) -> imported_False),
  (forall (x5 : x1 \/ (x1 -> False)) (x6 : imported_or x2 (x2 -> imported_False)),
   rel_iso
     {|
       to := or_iso hx (IsoArrow hx False_iso);
       from := from (or_iso hx (IsoArrow hx False_iso));
       to_from := fun x : imported_or x2 (x2 -> imported_False) => to_from (or_iso hx (IsoArrow hx False_iso)) x;
       from_to := fun x : x1 \/ (x1 -> False) => seq_p_of_t (from_to (or_iso hx (IsoArrow hx False_iso)) x)
     |} x5 x6 ->
   rel_iso {| to := False_iso; from := from False_iso; to_from := fun x : imported_False => to_from False_iso x; from_to := fun x : False => seq_p_of_t (from_to False_iso x) |} (x3 x5) (x4 x6)) ->
  rel_iso {| to := False_iso; from := from False_iso; to_from := fun x : imported_False => to_from False_iso x; from_to := fun x : False => seq_p_of_t (from_to False_iso x) |}
    (Original.LF_DOT_Logic.LF.Logic.excluded_middle_irrefutable x1 x3) (imported_Original_LF__DOT__Logic_LF_Logic_excluded__middle__irrefutable x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.excluded_middle_irrefutable := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_excluded__middle__irrefutable := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.excluded_middle_irrefutable Original_LF__DOT__Logic_LF_Logic_excluded__middle__irrefutable_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.excluded_middle_irrefutable Imported.Original_LF__DOT__Logic_LF_Logic_excluded__middle__irrefutable Original_LF__DOT__Logic_LF_Logic_excluded__middle__irrefutable_iso := {}.