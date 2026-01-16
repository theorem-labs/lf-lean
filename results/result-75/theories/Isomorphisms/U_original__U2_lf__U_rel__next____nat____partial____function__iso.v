From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf__U_rel__partial____function__iso Isomorphisms.U_original__U2_lf__U_rel__next____nat__iso.

Monomorphic Definition imported_Original_LF_Rel_next__nat__partial__function : forall x x0 x1 : imported_nat, imported_Original_LF_Rel_next__nat x x0 -> imported_Original_LF_Rel_next__nat x x1 -> imported_Corelib_Init_Logic_eq x0 x1 := Imported.Original_LF_Rel_next__nat__partial__function.
Monomorphic Instance Original_LF_Rel_next__nat__partial__function_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6)
    (x7 : Original.LF.Rel.next_nat x1 x3) (x8 : imported_Original_LF_Rel_next__nat x2 x4),
  rel_iso (Original_LF_Rel_next__nat_iso hx hx0) x7 x8 ->
  forall (x9 : Original.LF.Rel.next_nat x1 x5) (x10 : imported_Original_LF_Rel_next__nat x2 x6),
  rel_iso (Original_LF_Rel_next__nat_iso hx hx1) x9 x10 ->
  rel_iso (Corelib_Init_Logic_eq_iso hx0 hx1) (Original.LF.Rel.next_nat_partial_function x1 x3 x5 x7 x9) (imported_Original_LF_Rel_next__nat__partial__function x8 x10).
Admitted.
Instance: KnownConstant Original.LF.Rel.next_nat_partial_function := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF_Rel_next__nat__partial__function := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF.Rel.next_nat_partial_function Original_LF_Rel_next__nat__partial__function_iso := {}.
Instance: IsoStatementProofBetween Original.LF.Rel.next_nat_partial_function Imported.Original_LF_Rel_next__nat__partial__function Original_LF_Rel_next__nat__partial__function_iso := {}.