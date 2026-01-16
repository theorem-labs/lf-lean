From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.cons__iso Isomorphisms.nil__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_invert__example1 : forall x x0 x1 : imported_nat,
  imported_Corelib_Init_Logic_eq (imported_cons x (imported_cons x0 (imported_nil imported_nat))) (imported_cons x (imported_cons x1 (imported_nil imported_nat))) ->
  imported_Corelib_Init_Logic_eq x0 x1 := (@Imported.Original_LF__DOT__Imp_LF_Imp_AExp_invert__example1).
Instance Original_LF__DOT__Imp_LF_Imp_AExp_invert__example1_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6)
    (x7 : (x1 :: x3 :: nil)%list = (x1 :: x5 :: nil)%list)
    (x8 : imported_Corelib_Init_Logic_eq (imported_cons x2 (imported_cons x4 (imported_nil imported_nat))) (imported_cons x2 (imported_cons x6 (imported_nil imported_nat)))),
  rel_iso (Corelib_Init_Logic_eq_iso (cons_iso hx (cons_iso hx0 (nil_iso nat_iso))) (cons_iso hx (cons_iso hx1 (nil_iso nat_iso)))) x7 x8 ->
  rel_iso (Corelib_Init_Logic_eq_iso hx0 hx1) (Original.LF_DOT_Imp.LF.Imp.AExp.invert_example1 x7) (imported_Original_LF__DOT__Imp_LF_Imp_AExp_invert__example1 x8).
Admitted.
Instance: KnownConstant (@Original.LF_DOT_Imp.LF.Imp.AExp.invert_example1) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Imp_LF_Imp_AExp_invert__example1) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Imp.LF.Imp.AExp.invert_example1) Original_LF__DOT__Imp_LF_Imp_AExp_invert__example1_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Imp.LF.Imp.AExp.invert_example1) (@Imported.Original_LF__DOT__Imp_LF_Imp_AExp_invert__example1) Original_LF__DOT__Imp_LF_Imp_AExp_invert__example1_iso := {}.