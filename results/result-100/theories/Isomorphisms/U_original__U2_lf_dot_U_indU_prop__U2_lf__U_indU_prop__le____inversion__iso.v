From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_leU_playground__le__iso Isomorphisms.U_s__iso Isomorphisms.and__iso Isomorphisms.ex__iso Isomorphisms.or__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_le__inversion : forall x x0 : imported_nat,
  imported_Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le x x0 ->
  imported_or (imported_Corelib_Init_Logic_eq x x0)
    (imported_ex (fun H : imported_nat => imported_and (imported_Corelib_Init_Logic_eq x0 (imported_S H)) (imported_Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le x H))) := Imported.Original_LF__DOT__IndProp_LF_IndProp_le__inversion.
Instance Original_LF__DOT__IndProp_LF_IndProp_le__inversion_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le x1 x3)
    (x6 : imported_Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le x2 x4),
  rel_iso
    {|
      to := Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le_iso hx hx0;
      from := from (Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le_iso hx hx0);
      to_from := fun x : imported_Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le x2 x4 => to_from (Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le_iso hx hx0) x;
      from_to := fun x : Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le x1 x3 => seq_p_of_t (from_to (Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le_iso hx hx0) x)
    |} x5 x6 ->
  rel_iso
    {|
      to :=
        or_iso (Corelib_Init_Logic_eq_iso hx hx0)
          (ex_iso (fun m' : nat => x3 = S m' /\ Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le x1 m')
             (fun H : imported_nat => imported_and (imported_Corelib_Init_Logic_eq x4 (imported_S H)) (imported_Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le x2 H))
             (fun (x7 : nat) (x8 : imported_nat) (hx2 : rel_iso nat_iso x7 x8) => and_iso (Corelib_Init_Logic_eq_iso hx0 (S_iso hx2)) (Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le_iso hx hx2)));
      from :=
        from
          (or_iso (Corelib_Init_Logic_eq_iso hx hx0)
             (ex_iso (fun m' : nat => x3 = S m' /\ Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le x1 m')
                (fun H : imported_nat => imported_and (imported_Corelib_Init_Logic_eq x4 (imported_S H)) (imported_Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le x2 H))
                (fun (x7 : nat) (x8 : imported_nat) (hx2 : rel_iso nat_iso x7 x8) =>
                 and_iso (Corelib_Init_Logic_eq_iso hx0 (S_iso hx2)) (Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le_iso hx hx2))));
      to_from :=
        fun
          x : imported_or (imported_Corelib_Init_Logic_eq x2 x4)
                (imported_ex (fun H : imported_nat => imported_and (imported_Corelib_Init_Logic_eq x4 (imported_S H)) (imported_Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le x2 H))) =>
        to_from
          (or_iso (Corelib_Init_Logic_eq_iso hx hx0)
             (ex_iso (fun m' : nat => x3 = S m' /\ Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le x1 m')
                (fun H : imported_nat => imported_and (imported_Corelib_Init_Logic_eq x4 (imported_S H)) (imported_Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le x2 H))
                (fun (x7 : nat) (x8 : imported_nat) (hx2 : rel_iso nat_iso x7 x8) =>
                 and_iso (Corelib_Init_Logic_eq_iso hx0 (S_iso hx2)) (Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le_iso hx hx2))))
          x;
      from_to :=
        fun x : x1 = x3 \/ (exists m' : nat, x3 = S m' /\ Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le x1 m') =>
        seq_p_of_t
          (from_to
             (or_iso (Corelib_Init_Logic_eq_iso hx hx0)
                (ex_iso (fun m' : nat => x3 = S m' /\ Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le x1 m')
                   (fun H : imported_nat => imported_and (imported_Corelib_Init_Logic_eq x4 (imported_S H)) (imported_Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le x2 H))
                   (fun (x7 : nat) (x8 : imported_nat) (hx2 : rel_iso nat_iso x7 x8) =>
                    and_iso (Corelib_Init_Logic_eq_iso hx0 (S_iso hx2)) (Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le_iso hx hx2))))
             x)
    |} (Original.LF_DOT_IndProp.LF.IndProp.le_inversion x1 x3 x5) (imported_Original_LF__DOT__IndProp_LF_IndProp_le__inversion x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.le_inversion := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_le__inversion := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.le_inversion Original_LF__DOT__IndProp_LF_IndProp_le__inversion_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.le_inversion Imported.Original_LF__DOT__IndProp_LF_IndProp_le__inversion Original_LF__DOT__IndProp_LF_IndProp_le__inversion_iso := {}.