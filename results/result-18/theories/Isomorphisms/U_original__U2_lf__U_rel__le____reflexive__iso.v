From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf__U_rel__reflexive__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__le__iso.

Monomorphic Definition imported_Original_LF_Rel_le__reflexive : forall x : imported_nat, imported_Original_LF__DOT__IndProp_LF_IndProp_le x x := Imported.Original_LF_Rel_le__reflexive.
Monomorphic Instance Original_LF_Rel_le__reflexive_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_le_iso hx hx) (Original.LF.Rel.le_reflexive x1) (imported_Original_LF_Rel_le__reflexive x2).
Admitted.
Instance: KnownConstant Original.LF.Rel.le_reflexive := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF_Rel_le__reflexive := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF.Rel.le_reflexive Original_LF_Rel_le__reflexive_iso := {}.
Instance: IsoStatementProofBetween Original.LF.Rel.le_reflexive Imported.Original_LF_Rel_le__reflexive Original_LF_Rel_le__reflexive_iso := {}.