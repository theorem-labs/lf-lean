From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf__U_rel__antisymmetric__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__le__iso.

Definition imported_Original_LF_Rel_le__antisymmetric : forall x x0 : imported_nat, imported_Original_LF__DOT__IndProp_LF_IndProp_le x x0 -> imported_Original_LF__DOT__IndProp_LF_IndProp_le x0 x -> imported_Corelib_Init_Logic_eq x x0 := Imported.Original_LF_Rel_le__antisymmetric.
Instance Original_LF_Rel_le__antisymmetric_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : Original.LF_DOT_IndProp.LF.IndProp.le x1 x3)
    (x6 : imported_Original_LF__DOT__IndProp_LF_IndProp_le x2 x4),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_le_iso hx hx0) x5 x6 ->
  forall (x7 : Original.LF_DOT_IndProp.LF.IndProp.le x3 x1) (x8 : imported_Original_LF__DOT__IndProp_LF_IndProp_le x4 x2),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_le_iso hx0 hx) x7 x8 ->
  rel_iso (Corelib_Init_Logic_eq_iso hx hx0) (Original.LF.Rel.le_antisymmetric x1 x3 x5 x7) (imported_Original_LF_Rel_le__antisymmetric x6 x8).
Admitted.
Instance: KnownConstant Original.LF.Rel.le_antisymmetric := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF_Rel_le__antisymmetric := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF.Rel.le_antisymmetric Original_LF_Rel_le__antisymmetric_iso := {}.
Instance: IsoStatementProofBetween Original.LF.Rel.le_antisymmetric Imported.Original_LF_Rel_le__antisymmetric Original_LF_Rel_le__antisymmetric_iso := {}.