From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.and__iso Isomorphisms.le__iso.

Definition imported_Original_LF__DOT__Auto_LF_Auto_auto__example__6' : forall x x0 x1 : imported_nat, (imported_le x x1 -> imported_and (imported_le x x0) (imported_le x0 x)) -> imported_le x x1 -> imported_Corelib_Init_Logic_eq x x0 := Imported.Original_LF__DOT__Auto_LF_Auto_auto__example__6'.
Instance Original_LF__DOT__Auto_LF_Auto_auto__example__6'_iso : forall (x1 : nat) (x2 : imported_nat) (hx : @rel_iso nat imported_nat nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : @rel_iso nat imported_nat nat_iso x3 x4) (x5 : nat) 
    (x6 : imported_nat) (hx1 : @rel_iso nat imported_nat nat_iso x5 x6) (x7 : x1 <= x5 -> x1 <= x3 <= x1) (x8 : imported_le x2 x6 -> imported_and (imported_le x2 x4) (imported_le x4 x2)),
  (forall (x9 : x1 <= x5) (x10 : imported_le x2 x6),
   @rel_iso (x1 <= x5) (imported_le x2 x6) (@relax_Iso_Ts_Ps (x1 <= x5) (imported_le x2 x6) (@le_iso x1 x2 hx x5 x6 hx1)) x9 x10 ->
   @rel_iso (x1 <= x3 <= x1) (imported_and (imported_le x2 x4) (imported_le x4 x2))
     (@relax_Iso_Ts_Ps (x1 <= x3 <= x1) (imported_and (imported_le x2 x4) (imported_le x4 x2))
        (@and_iso (x1 <= x3) (imported_le x2 x4) (@le_iso x1 x2 hx x3 x4 hx0) (x3 <= x1) (imported_le x4 x2) (@le_iso x3 x4 hx0 x1 x2 hx)))
     (x7 x9) (x8 x10)) ->
  forall (x9 : x1 <= x5) (x10 : imported_le x2 x6),
  @rel_iso (x1 <= x5) (imported_le x2 x6) (@relax_Iso_Ts_Ps (x1 <= x5) (imported_le x2 x6) (@le_iso x1 x2 hx x5 x6 hx1)) x9 x10 ->
  @rel_iso (x1 = x3) (@imported_Corelib_Init_Logic_eq imported_nat x2 x4)
    (@relax_Iso_Ts_Ps (x1 = x3) (@imported_Corelib_Init_Logic_eq imported_nat x2 x4) (@Corelib_Init_Logic_eq_iso nat imported_nat nat_iso x1 x2 hx x3 x4 hx0))
    (Original.LF_DOT_Auto.LF.Auto.auto_example_6' x1 x3 x5 x7 x9) (@imported_Original_LF__DOT__Auto_LF_Auto_auto__example__6' x2 x4 x6 x8 x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_Auto.LF.Auto.auto_example_6' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Auto_LF_Auto_auto__example__6' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Auto.LF.Auto.auto_example_6' Original_LF__DOT__Auto_LF_Auto_auto__example__6'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Auto.LF.Auto.auto_example_6' Imported.Original_LF__DOT__Auto_LF_Auto_auto__example__6' Original_LF__DOT__Auto_LF_Auto_auto__example__6'_iso := {}.