From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_logic__not__iso Isomorphisms.and__iso Isomorphisms.or__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_de__morgan__not__or : forall x x0 : SProp, (imported_or x x0 -> imported_False) -> imported_and (x -> imported_False) (x0 -> imported_False) := Imported.Original_LF__DOT__Logic_LF_Logic_de__morgan__not__or.
Instance Original_LF__DOT__Logic_LF_Logic_de__morgan__not__or_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Prop) (x4 : SProp) (hx0 : Iso x3 x4) (x5 : ~ (x1 \/ x3)) (x6 : imported_or x2 x4 -> imported_False),
  (forall (x7 : x1 \/ x3) (x8 : imported_or x2 x4),
   rel_iso
     {| to := or_iso hx hx0; from := from (or_iso hx hx0); to_from := fun x : imported_or x2 x4 => to_from (or_iso hx hx0) x; from_to := fun x : x1 \/ x3 => seq_p_of_t (from_to (or_iso hx hx0) x) |}
     x7 x8 ->
   rel_iso {| to := False_iso; from := from False_iso; to_from := fun x : imported_False => to_from False_iso x; from_to := fun x : False => seq_p_of_t (from_to False_iso x) |} (x5 x7) (x6 x8)) ->
  rel_iso
    {|
      to := and_iso (IsoArrow hx False_iso) (IsoArrow hx0 False_iso);
      from := from (and_iso (IsoArrow hx False_iso) (IsoArrow hx0 False_iso));
      to_from := fun x : imported_and (x2 -> imported_False) (x4 -> imported_False) => to_from (and_iso (IsoArrow hx False_iso) (IsoArrow hx0 False_iso)) x;
      from_to := fun x : ~ x1 /\ ~ x3 => seq_p_of_t (from_to (and_iso (IsoArrow hx False_iso) (IsoArrow hx0 False_iso)) x)
    |} (Original.LF_DOT_Logic.LF.Logic.de_morgan_not_or x1 x3 x5) (imported_Original_LF__DOT__Logic_LF_Logic_de__morgan__not__or x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.de_morgan_not_or := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_de__morgan__not__or := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.de_morgan_not_or Original_LF__DOT__Logic_LF_Logic_de__morgan__not__or_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.de_morgan_not_or Imported.Original_LF__DOT__Logic_LF_Logic_de__morgan__not__or Original_LF__DOT__Logic_LF_Logic_de__morgan__not__or_iso := {}.