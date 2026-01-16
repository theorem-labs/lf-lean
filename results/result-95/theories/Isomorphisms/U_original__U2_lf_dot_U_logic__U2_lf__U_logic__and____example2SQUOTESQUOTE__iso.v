From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_nat__add__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_and__example2'' : forall n m : imported_nat, imported_Corelib_Init_Logic_eq n imported_0 -> imported_Corelib_Init_Logic_eq m imported_0 -> imported_Corelib_Init_Logic_eq (imported_Nat_add n m) imported_0 := Imported.Original_LF__DOT__Logic_LF_Logic_and__example2''.
Instance Original_LF__DOT__Logic_LF_Logic_and__example2''_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : x1 = Datatypes.O) (x6 : imported_Corelib_Init_Logic_eq x2 imported_0),
  rel_iso (Corelib_Init_Logic_eq_iso hx _0_iso) x5 x6 ->
  forall (x7 : x3 = Datatypes.O) (x8 : imported_Corelib_Init_Logic_eq x4 imported_0),
  rel_iso (Corelib_Init_Logic_eq_iso hx0 _0_iso) x7 x8 ->
  rel_iso (Corelib_Init_Logic_eq_iso (Nat_add_iso hx hx0) _0_iso) (Original.LF_DOT_Logic.LF.Logic.and_example2'' x1 x3 x5 x7) (imported_Original_LF__DOT__Logic_LF_Logic_and__example2'' x6 x8).
Proof.
  intros x1 x2 hx x3 x4 hx0 x5 x6 H56 x7 x8 H78.
  constructor. simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.and_example2'' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_and__example2'' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.and_example2'' Original_LF__DOT__Logic_LF_Logic_and__example2''_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.and_example2'' Imported.Original_LF__DOT__Logic_LF_Logic_and__example2'' Original_LF__DOT__Logic_LF_Logic_and__example2''_iso := {}.