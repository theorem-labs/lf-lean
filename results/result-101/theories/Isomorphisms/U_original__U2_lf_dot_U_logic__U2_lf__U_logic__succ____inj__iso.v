From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__injective__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_succ__inj : forall x x0 : imported_nat, imported_Corelib_Init_Logic_eq (imported_S x) (imported_S x0) -> imported_Corelib_Init_Logic_eq x x0 := Imported.Original_LF__DOT__Logic_LF_Logic_succ__inj.
Instance Original_LF__DOT__Logic_LF_Logic_succ__inj_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : S x1 = S x3)
    (x6 : imported_Corelib_Init_Logic_eq (imported_S x2) (imported_S x4)),
  rel_iso (Corelib_Init_Logic_eq_iso (S_iso hx) (S_iso hx0)) x5 x6 ->
  rel_iso (Corelib_Init_Logic_eq_iso hx hx0) (Original.LF_DOT_Logic.LF.Logic.succ_inj x1 x3 x5) (imported_Original_LF__DOT__Logic_LF_Logic_succ__inj x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.succ_inj := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_succ__inj := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.succ_inj Original_LF__DOT__Logic_LF_Logic_succ__inj_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.succ_inj Imported.Original_LF__DOT__Logic_LF_Logic_succ__inj Original_LF__DOT__Logic_LF_Logic_succ__inj_iso := {}.