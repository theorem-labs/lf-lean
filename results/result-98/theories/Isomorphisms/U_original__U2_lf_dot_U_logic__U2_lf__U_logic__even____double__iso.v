From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__even__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso Isomorphisms.U_original__U2_lf_dot_U_induction__U2_lf__U_induction__double__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_even__double : forall x : imported_nat,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_even (imported_Original_LF__DOT__Induction_LF_Induction_double x)) imported_Original_LF__DOT__Basics_LF_Basics_true := Imported.Original_LF__DOT__Logic_LF_Logic_even__double.
Instance Original_LF__DOT__Logic_LF_Logic_even__double_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_even_iso (Original_LF__DOT__Induction_LF_Induction_double_iso hx)) Original_LF__DOT__Basics_LF_Basics_true_iso)
    (Original.LF_DOT_Logic.LF.Logic.even_double x1) (imported_Original_LF__DOT__Logic_LF_Logic_even__double x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.even_double := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_even__double := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.even_double Original_LF__DOT__Logic_LF_Logic_even__double_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.even_double Imported.Original_LF__DOT__Logic_LF_Logic_even__double Original_LF__DOT__Logic_LF_Logic_even__double_iso := {}.