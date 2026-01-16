From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__minus__iso.

Definition imported_Original_LF__DOT__Induction_LF_Induction_minus__n__n : forall x : imported_nat, imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_minus x x) imported_0 := Imported.Original_LF__DOT__Induction_LF_Induction_minus__n__n.
Instance Original_LF__DOT__Induction_LF_Induction_minus__n__n_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_minus_iso hx hx) _0_iso) (Original.LF_DOT_Induction.LF.Induction.minus_n_n x1)
    (imported_Original_LF__DOT__Induction_LF_Induction_minus__n__n x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.minus_n_n := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_minus__n__n := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.minus_n_n Original_LF__DOT__Induction_LF_Induction_minus__n__n_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.minus_n_n Imported.Original_LF__DOT__Induction_LF_Induction_minus__n__n Original_LF__DOT__Induction_LF_Induction_minus__n__n_iso := {}.