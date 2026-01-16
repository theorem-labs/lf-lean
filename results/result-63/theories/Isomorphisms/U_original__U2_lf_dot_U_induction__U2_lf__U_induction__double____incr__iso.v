From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_induction__U2_lf__U_induction__double__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__Induction_LF_Induction_double__incr : forall x : imported_nat,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Induction_LF_Induction_double (imported_S x)) (imported_S (imported_S (imported_Original_LF__DOT__Induction_LF_Induction_double x))) := Imported.Original_LF__DOT__Induction_LF_Induction_double__incr.
Instance Original_LF__DOT__Induction_LF_Induction_double__incr_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Induction_LF_Induction_double_iso (S_iso hx)) (S_iso (S_iso (Original_LF__DOT__Induction_LF_Induction_double_iso hx))))
    (Original.LF_DOT_Induction.LF.Induction.double_incr x1) (imported_Original_LF__DOT__Induction_LF_Induction_double__incr x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.double_incr := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_double__incr := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.double_incr Original_LF__DOT__Induction_LF_Induction_double__incr_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.double_incr Imported.Original_LF__DOT__Induction_LF_Induction_double__incr Original_LF__DOT__Induction_LF_Induction_double__incr_iso := {}.