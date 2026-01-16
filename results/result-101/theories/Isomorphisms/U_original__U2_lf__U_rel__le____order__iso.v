From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf__U_rel__order__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__le__iso.

Definition imported_Original_LF_Rel_le__order : imported_Original_LF_Rel_order (fun H H0 : imported_nat => imported_Original_LF__DOT__IndProp_LF_IndProp_le H H0) := Imported.Original_LF_Rel_le__order.
Instance Original_LF_Rel_le__order_iso : rel_iso
    {|
      to :=
        Original_LF_Rel_order_iso Original.LF_DOT_IndProp.LF.IndProp.le (fun H H0 : imported_nat => imported_Original_LF__DOT__IndProp_LF_IndProp_le H H0)
          (fun (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) => Original_LF__DOT__IndProp_LF_IndProp_le_iso hx hx0);
      from :=
        from
          (Original_LF_Rel_order_iso Original.LF_DOT_IndProp.LF.IndProp.le (fun H H0 : imported_nat => imported_Original_LF__DOT__IndProp_LF_IndProp_le H H0)
             (fun (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) => Original_LF__DOT__IndProp_LF_IndProp_le_iso hx hx0));
      to_from :=
        fun x : imported_Original_LF_Rel_order (fun H H0 : imported_nat => imported_Original_LF__DOT__IndProp_LF_IndProp_le H H0) =>
        to_from
          (Original_LF_Rel_order_iso Original.LF_DOT_IndProp.LF.IndProp.le (fun H H0 : imported_nat => imported_Original_LF__DOT__IndProp_LF_IndProp_le H H0)
             (fun (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) => Original_LF__DOT__IndProp_LF_IndProp_le_iso hx hx0))
          x;
      from_to :=
        fun x : Original.LF.Rel.order Original.LF_DOT_IndProp.LF.IndProp.le =>
        seq_p_of_t
          (from_to
             (Original_LF_Rel_order_iso Original.LF_DOT_IndProp.LF.IndProp.le (fun H H0 : imported_nat => imported_Original_LF__DOT__IndProp_LF_IndProp_le H H0)
                (fun (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) => Original_LF__DOT__IndProp_LF_IndProp_le_iso hx hx0))
             x)
    |} Original.LF.Rel.le_order imported_Original_LF_Rel_le__order.
Admitted.
Instance: KnownConstant Original.LF.Rel.le_order := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF_Rel_le__order := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF.Rel.le_order Original_LF_Rel_le__order_iso := {}.
Instance: IsoStatementProofBetween Original.LF.Rel.le_order Imported.Original_LF_Rel_le__order Original_LF_Rel_le__order_iso := {}.