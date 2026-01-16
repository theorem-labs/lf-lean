From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_nat__add__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__eqb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_plus__eqb__example : forall x x0 x1 : imported_nat,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_eqb x x0) imported_Original_LF__DOT__Basics_LF_Basics_true ->
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_eqb (imported_Nat_add x x1) (imported_Nat_add x0 x1)) imported_Original_LF__DOT__Basics_LF_Basics_true := Imported.Original_LF__DOT__Logic_LF_Logic_plus__eqb__example.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_plus__eqb__example_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6)
    (x7 : Original.LF_DOT_Basics.LF.Basics.eqb x1 x3 = Original.LF_DOT_Basics.LF.Basics.true)
    (x8 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_eqb x2 x4) imported_Original_LF__DOT__Basics_LF_Basics_true),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_eqb_iso hx hx0) Original_LF__DOT__Basics_LF_Basics_true_iso) x7 x8 ->
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_eqb_iso (Nat_add_iso hx hx1) (Nat_add_iso hx0 hx1)) Original_LF__DOT__Basics_LF_Basics_true_iso)
    (Original.LF_DOT_Logic.LF.Logic.plus_eqb_example x1 x3 x5 x7) (imported_Original_LF__DOT__Logic_LF_Logic_plus__eqb__example x6 x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.plus_eqb_example := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_plus__eqb__example := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.plus_eqb_example Original_LF__DOT__Logic_LF_Logic_plus__eqb__example_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.plus_eqb_example Imported.Original_LF__DOT__Logic_LF_Logic_plus__eqb__example Original_LF__DOT__Logic_LF_Logic_plus__eqb__example_iso := {}.