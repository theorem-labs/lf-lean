From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__even__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso Isomorphisms.U_original__U2_lf_dot_U_proofU_objects__U2_lf__U_proofU_objects__ev__iso.

Monomorphic Definition imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_even__ev : forall x : imported_nat,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_even x) imported_Original_LF__DOT__Basics_LF_Basics_true -> imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev x := Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_even__ev.
Monomorphic Instance Original_LF__DOT__IndPrinciples_LF_IndPrinciples_even__ev_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : Original.LF_DOT_Basics.LF.Basics.even x1 = Original.LF_DOT_Basics.LF.Basics.true)
    (x4 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_even x2) imported_Original_LF__DOT__Basics_LF_Basics_true),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_even_iso hx) Original_LF__DOT__Basics_LF_Basics_true_iso) x3 x4 ->
  rel_iso (Original_LF__DOT__ProofObjects_LF_ProofObjects_ev_iso hx) (Original.LF_DOT_IndPrinciples.LF.IndPrinciples.even_ev x1 x3)
    (imported_Original_LF__DOT__IndPrinciples_LF_IndPrinciples_even__ev x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndPrinciples.LF.IndPrinciples.even_ev := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_even__ev := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndPrinciples.LF.IndPrinciples.even_ev Original_LF__DOT__IndPrinciples_LF_IndPrinciples_even__ev_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndPrinciples.LF.IndPrinciples.even_ev Imported.Original_LF__DOT__IndPrinciples_LF_IndPrinciples_even__ev Original_LF__DOT__IndPrinciples_LF_IndPrinciples_even__ev_iso := {}.