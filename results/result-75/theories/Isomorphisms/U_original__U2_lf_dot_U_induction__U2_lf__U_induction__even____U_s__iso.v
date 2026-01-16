From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__even__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__negb__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__Induction_LF_Induction_even__S : forall x : imported_nat,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_even (imported_S x))
    (imported_Original_LF__DOT__Basics_LF_Basics_negb (imported_Original_LF__DOT__Basics_LF_Basics_even x)) := Imported.Original_LF__DOT__Induction_LF_Induction_even__S.
Monomorphic Instance Original_LF__DOT__Induction_LF_Induction_even__S_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_even_iso (S_iso hx)) (Original_LF__DOT__Basics_LF_Basics_negb_iso (Original_LF__DOT__Basics_LF_Basics_even_iso hx)))
    (Original.LF_DOT_Induction.LF.Induction.even_S x1) (imported_Original_LF__DOT__Induction_LF_Induction_even__S x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.even_S := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_even__S := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.even_S Original_LF__DOT__Induction_LF_Induction_even__S_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.even_S Imported.Original_LF__DOT__Induction_LF_Induction_even__S Original_LF__DOT__Induction_LF_Induction_even__S_iso := {}.