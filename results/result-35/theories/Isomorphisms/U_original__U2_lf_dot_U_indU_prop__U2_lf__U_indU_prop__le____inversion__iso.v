From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_leU_playground__le__iso Isomorphisms.U_s__iso Isomorphisms.and__iso Isomorphisms.ex__iso Isomorphisms.or__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_le__inversion : forall x x0 : imported_nat,
  imported_Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le x x0 ->
  imported_or (imported_Corelib_Init_Logic_eq x x0)
    (imported_ex (fun H : imported_nat => imported_and (imported_Corelib_Init_Logic_eq x0 (imported_S H)) (imported_Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le x H))) := Imported.Original_LF__DOT__IndProp_LF_IndProp_le__inversion.
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_le__inversion_iso : forall (x1 : nat) (x2 : imported_nat) (hx : @rel_iso nat imported_nat nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : @rel_iso nat imported_nat nat_iso x3 x4)
    (x5 : Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le x1 x3) (x6 : imported_Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le x2 x4),
  @rel_iso (Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le x2 x4)
    (@relax_Iso_Ts_Ps (Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le x2 x4)
       (@Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le_iso x1 x2 hx x3 x4 hx0))
    x5 x6 ->
  @rel_iso (x1 = x3 \/ (exists m' : nat, x3 = S m' /\ Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le x1 m'))
    (imported_or (@imported_Corelib_Init_Logic_eq imported_nat x2 x4)
       (@imported_ex imported_nat
          (fun H : imported_nat => imported_and (@imported_Corelib_Init_Logic_eq imported_nat x4 (imported_S H)) (imported_Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le x2 H))))
    (@relax_Iso_Ts_Ps (x1 = x3 \/ (exists m' : nat, x3 = S m' /\ Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le x1 m'))
       (imported_or (@imported_Corelib_Init_Logic_eq imported_nat x2 x4)
          (@imported_ex imported_nat
             (fun H : imported_nat => imported_and (@imported_Corelib_Init_Logic_eq imported_nat x4 (imported_S H)) (imported_Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le x2 H))))
       (@or_iso (x1 = x3) (@imported_Corelib_Init_Logic_eq imported_nat x2 x4) (@Corelib_Init_Logic_eq_iso nat imported_nat nat_iso x1 x2 hx x3 x4 hx0)
          (exists m' : nat, x3 = S m' /\ Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le x1 m')
          (@imported_ex imported_nat
             (fun H : imported_nat => imported_and (@imported_Corelib_Init_Logic_eq imported_nat x4 (imported_S H)) (imported_Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le x2 H)))
          (@ex_iso nat imported_nat nat_iso (fun m' : nat => x3 = S m' /\ Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le x1 m')
             (fun H : imported_nat => imported_and (@imported_Corelib_Init_Logic_eq imported_nat x4 (imported_S H)) (imported_Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le x2 H))
             (fun (x7 : nat) (x8 : imported_nat) (hx2 : @rel_iso nat imported_nat nat_iso x7 x8) =>
              @and_iso (x3 = S x7) (@imported_Corelib_Init_Logic_eq imported_nat x4 (imported_S x8))
                (@Corelib_Init_Logic_eq_iso nat imported_nat nat_iso x3 x4 hx0 (S x7) (imported_S x8) (@S_iso x7 x8 hx2)) (Original.LF_DOT_IndProp.LF.IndProp.LePlayground.le x1 x7)
                (imported_Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le x2 x8) (@Original_LF__DOT__IndProp_LF_IndProp_LePlayground_le_iso x1 x2 hx x7 x8 hx2)))))
    (Original.LF_DOT_IndProp.LF.IndProp.le_inversion x1 x3 x5) (@imported_Original_LF__DOT__IndProp_LF_IndProp_le__inversion x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.le_inversion := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_le__inversion := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.le_inversion Original_LF__DOT__IndProp_LF_IndProp_le__inversion_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.le_inversion Imported.Original_LF__DOT__IndProp_LF_IndProp_le__inversion Original_LF__DOT__IndProp_LF_IndProp_le__inversion_iso := {}.