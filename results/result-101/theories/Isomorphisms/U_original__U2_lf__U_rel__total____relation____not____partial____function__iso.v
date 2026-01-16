From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf__U_rel__partial____function__iso Isomorphisms.U_logic__not__iso Isomorphisms.U_original__U2_lf__U_rel__total____relation__iso.

Definition imported_Original_LF_Rel_total__relation__not__partial__function : (forall x x0 x1 : imported_nat, imported_Original_LF_Rel_total__relation x x0 -> imported_Original_LF_Rel_total__relation x x1 -> imported_Corelib_Init_Logic_eq x0 x1) -> imported_False := Imported.Original_LF_Rel_total__relation__not__partial__function.
Instance Original_LF_Rel_total__relation__not__partial__function_iso : forall (x1 : Original.LF.Rel.partial_function Original.LF.Rel.total_relation)
    (x2 : forall x x0 x2 : imported_nat, imported_Original_LF_Rel_total__relation x x0 -> imported_Original_LF_Rel_total__relation x x2 -> imported_Corelib_Init_Logic_eq x0 x2),
  (forall (x3 : nat) (x4 : imported_nat) (hx : rel_iso nat_iso x3 x4) (x5 : nat) (x6 : imported_nat) (hx0 : rel_iso nat_iso x5 x6) (x7 : nat) (x8 : imported_nat) (hx1 : rel_iso nat_iso x7 x8)
     (x9 : Original.LF.Rel.total_relation x3 x5) (x10 : imported_Original_LF_Rel_total__relation x4 x6),
   rel_iso (Original_LF_Rel_total__relation_iso hx hx0) x9 x10 ->
   forall (x11 : Original.LF.Rel.total_relation x3 x7) (x12 : imported_Original_LF_Rel_total__relation x4 x8),
   rel_iso (Original_LF_Rel_total__relation_iso hx hx1) x11 x12 -> rel_iso (Corelib_Init_Logic_eq_iso hx0 hx1) (x1 x3 x5 x7 x9 x11) (x2 x4 x6 x8 x10 x12)) ->
  rel_iso False_iso (Original.LF.Rel.total_relation_not_partial_function x1) (imported_Original_LF_Rel_total__relation__not__partial__function x2).
Admitted.
Instance: KnownConstant Original.LF.Rel.total_relation_not_partial_function := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF_Rel_total__relation__not__partial__function := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF.Rel.total_relation_not_partial_function Original_LF_Rel_total__relation__not__partial__function_iso := {}.
Instance: IsoStatementProofBetween Original.LF.Rel.total_relation_not_partial_function Imported.Original_LF_Rel_total__relation__not__partial__function Original_LF_Rel_total__relation__not__partial__function_iso := {}.