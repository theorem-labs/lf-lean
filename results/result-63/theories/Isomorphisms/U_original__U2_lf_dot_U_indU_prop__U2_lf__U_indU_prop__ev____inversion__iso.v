From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_evU_playground__ev__iso Isomorphisms.U_s__iso Isomorphisms.and__iso Isomorphisms.ex__iso Isomorphisms.or__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_ev__inversion : forall x : imported_nat,
  imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev x ->
  imported_or (imported_Corelib_Init_Logic_eq x imported_0)
    (imported_ex (fun H : imported_nat => imported_and (imported_Corelib_Init_Logic_eq x (imported_S (imported_S H))) (imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev H))) := Imported.Original_LF__DOT__IndProp_LF_IndProp_ev__inversion.
Instance Original_LF__DOT__IndProp_LF_IndProp_ev__inversion_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : Original.LF_DOT_IndProp.LF.IndProp.EvPlayground.ev x1)
    (x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev x2),
  rel_iso
    {|
      to := Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso hx;
      from := from (Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso hx);
      to_from := fun x : imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev x2 => to_from (Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso hx) x;
      from_to := fun x : Original.LF_DOT_IndProp.LF.IndProp.EvPlayground.ev x1 => seq_p_of_t (from_to (Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso hx) x)
    |} x3 x4 ->
  rel_iso
    {|
      to :=
        or_iso (Corelib_Init_Logic_eq_iso hx _0_iso)
          (ex_iso (fun n' : nat => x1 = S (S n') /\ Original.LF_DOT_IndProp.LF.IndProp.EvPlayground.ev n')
             (fun H : imported_nat => imported_and (imported_Corelib_Init_Logic_eq x2 (imported_S (imported_S H))) (imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev H))
             (fun (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6) =>
              and_iso (Corelib_Init_Logic_eq_iso hx (S_iso (S_iso hx1))) (Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso hx1)));
      from :=
        from
          (or_iso (Corelib_Init_Logic_eq_iso hx _0_iso)
             (ex_iso (fun n' : nat => x1 = S (S n') /\ Original.LF_DOT_IndProp.LF.IndProp.EvPlayground.ev n')
                (fun H : imported_nat => imported_and (imported_Corelib_Init_Logic_eq x2 (imported_S (imported_S H))) (imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev H))
                (fun (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6) =>
                 and_iso (Corelib_Init_Logic_eq_iso hx (S_iso (S_iso hx1))) (Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso hx1))));
      to_from :=
        fun
          x : imported_or (imported_Corelib_Init_Logic_eq x2 imported_0)
                (imported_ex (fun H : imported_nat => imported_and (imported_Corelib_Init_Logic_eq x2 (imported_S (imported_S H))) (imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev H))) =>
        to_from
          (or_iso (Corelib_Init_Logic_eq_iso hx _0_iso)
             (ex_iso (fun n' : nat => x1 = S (S n') /\ Original.LF_DOT_IndProp.LF.IndProp.EvPlayground.ev n')
                (fun H : imported_nat => imported_and (imported_Corelib_Init_Logic_eq x2 (imported_S (imported_S H))) (imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev H))
                (fun (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6) =>
                 and_iso (Corelib_Init_Logic_eq_iso hx (S_iso (S_iso hx1))) (Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso hx1))))
          x;
      from_to :=
        fun x : x1 = 0 \/ (exists n' : nat, x1 = S (S n') /\ Original.LF_DOT_IndProp.LF.IndProp.EvPlayground.ev n') =>
        seq_p_of_t
          (from_to
             (or_iso (Corelib_Init_Logic_eq_iso hx _0_iso)
                (ex_iso (fun n' : nat => x1 = S (S n') /\ Original.LF_DOT_IndProp.LF.IndProp.EvPlayground.ev n')
                   (fun H : imported_nat => imported_and (imported_Corelib_Init_Logic_eq x2 (imported_S (imported_S H))) (imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev H))
                   (fun (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6) =>
                    and_iso (Corelib_Init_Logic_eq_iso hx (S_iso (S_iso hx1))) (Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso hx1))))
             x)
    |} (Original.LF_DOT_IndProp.LF.IndProp.ev_inversion x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_ev__inversion x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.ev_inversion := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_ev__inversion := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.ev_inversion Original_LF__DOT__IndProp_LF_IndProp_ev__inversion_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.ev_inversion Imported.Original_LF__DOT__IndProp_LF_IndProp_ev__inversion Original_LF__DOT__IndProp_LF_IndProp_ev__inversion_iso := {}.