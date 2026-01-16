From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Unset Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_logic__not__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_disc__example : forall x : imported_nat, imported_Corelib_Init_Logic_eq imported_0 (imported_S x) -> imported_False := Imported.Original_LF__DOT__Logic_LF_Logic_disc__example.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_disc__example_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : 0 = S x1) (x4 : imported_Corelib_Init_Logic_eq imported_0 (imported_S x2)),
  rel_iso (Corelib_Init_Logic_eq_iso _0_iso (S_iso hx)) x3 x4 -> rel_iso False_iso (Original.LF_DOT_Logic.LF.Logic.disc_example x1 x3) (imported_Original_LF__DOT__Logic_LF_Logic_disc__example x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.disc_example := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_disc__example := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.disc_example Original_LF__DOT__Logic_LF_Logic_disc__example_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.disc_example Imported.Original_LF__DOT__Logic_LF_Logic_disc__example Original_LF__DOT__Logic_LF_Logic_disc__example_iso := {}.