From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__leb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso.

Definition imported_Original_LF__DOT__Induction_LF_Induction_leb__refl : forall x : imported_nat, imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_leb x x) imported_Original_LF__DOT__Basics_LF_Basics_true := Imported.Original_LF__DOT__Induction_LF_Induction_leb__refl.
Instance Original_LF__DOT__Induction_LF_Induction_leb__refl_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_leb_iso hx hx) Original_LF__DOT__Basics_LF_Basics_true_iso) (Original.LF_DOT_Induction.LF.Induction.leb_refl x1)
    (imported_Original_LF__DOT__Induction_LF_Induction_leb__refl x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.leb_refl := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_leb__refl := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.leb_refl Original_LF__DOT__Induction_LF_Induction_leb__refl_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.leb_refl Imported.Original_LF__DOT__Induction_LF_Induction_leb__refl Original_LF__DOT__Induction_LF_Induction_leb__refl_iso := {}.