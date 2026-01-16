From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.and__iso Isomorphisms.le__iso.

Monomorphic Definition imported_Original_LF__DOT__Auto_LF_Auto_le__antisym : forall x x0 : imported_nat, imported_and (imported_le x x0) (imported_le x0 x) -> imported_Corelib_Init_Logic_eq x x0 := Imported.Original_LF__DOT__Auto_LF_Auto_le__antisym.
Monomorphic Instance Original_LF__DOT__Auto_LF_Auto_le__antisym_iso : forall (x1 : nat) (x2 : imported_nat) (hx : @rel_iso nat imported_nat nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : @rel_iso nat imported_nat nat_iso x3 x4) (x5 : x1 <= x3 <= x1)
    (x6 : imported_and (imported_le x2 x4) (imported_le x4 x2)),
  @rel_iso (x1 <= x3 <= x1) (imported_and (imported_le x2 x4) (imported_le x4 x2))
    (@relax_Iso_Ts_Ps (x1 <= x3 <= x1) (imported_and (imported_le x2 x4) (imported_le x4 x2))
       (@and_iso (x1 <= x3) (imported_le x2 x4) (@le_iso x1 x2 hx x3 x4 hx0) (x3 <= x1) (imported_le x4 x2) (@le_iso x3 x4 hx0 x1 x2 hx)))
    x5 x6 ->
  @rel_iso (x1 = x3) (@imported_Corelib_Init_Logic_eq imported_nat x2 x4)
    (@relax_Iso_Ts_Ps (x1 = x3) (@imported_Corelib_Init_Logic_eq imported_nat x2 x4) (@Corelib_Init_Logic_eq_iso nat imported_nat nat_iso x1 x2 hx x3 x4 hx0))
    (Original.LF_DOT_Auto.LF.Auto.le_antisym x1 x3 x5) (@imported_Original_LF__DOT__Auto_LF_Auto_le__antisym x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Auto.LF.Auto.le_antisym := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Auto_LF_Auto_le__antisym := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Auto.LF.Auto.le_antisym Original_LF__DOT__Auto_LF_Auto_le__antisym_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Auto.LF.Auto.le_antisym Imported.Original_LF__DOT__Auto_LF_Auto_le__antisym Original_LF__DOT__Auto_LF_Auto_le__antisym_iso := {}.