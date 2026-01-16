From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf__U_rel__symmetric__iso Isomorphisms.U_logic__not__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__le__iso.

Definition imported_Original_LF_Rel_le__not__symmetric : (forall x x0 : imported_nat, imported_Original_LF__DOT__IndProp_LF_IndProp_le x x0 -> imported_Original_LF__DOT__IndProp_LF_IndProp_le x0 x) -> imported_False := Imported.Original_LF_Rel_le__not__symmetric.
Instance Original_LF_Rel_le__not__symmetric_iso : forall (x1 : Original.LF.Rel.symmetric Original.LF_DOT_IndProp.LF.IndProp.le)
    (x2 : forall x x0 : imported_nat, imported_Original_LF__DOT__IndProp_LF_IndProp_le x x0 -> imported_Original_LF__DOT__IndProp_LF_IndProp_le x0 x),
  (forall (x3 : nat) (x4 : imported_nat) (hx : rel_iso nat_iso x3 x4) (x5 : nat) (x6 : imported_nat) (hx0 : rel_iso nat_iso x5 x6) (x7 : Original.LF_DOT_IndProp.LF.IndProp.le x3 x5)
     (x8 : imported_Original_LF__DOT__IndProp_LF_IndProp_le x4 x6),
   rel_iso (Original_LF__DOT__IndProp_LF_IndProp_le_iso hx hx0) x7 x8 -> rel_iso (Original_LF__DOT__IndProp_LF_IndProp_le_iso hx0 hx) (x1 x3 x5 x7) (x2 x4 x6 x8)) ->
  rel_iso False_iso (Original.LF.Rel.le_not_symmetric x1) (imported_Original_LF_Rel_le__not__symmetric x2).
Admitted.
Instance: KnownConstant Original.LF.Rel.le_not_symmetric := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF_Rel_le__not__symmetric := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF.Rel.le_not_symmetric Original_LF_Rel_le__not__symmetric_iso := {}.
Instance: IsoStatementProofBetween Original.LF.Rel.le_not_symmetric Imported.Original_LF_Rel_le__not__symmetric Original_LF_Rel_le__not__symmetric_iso := {}.