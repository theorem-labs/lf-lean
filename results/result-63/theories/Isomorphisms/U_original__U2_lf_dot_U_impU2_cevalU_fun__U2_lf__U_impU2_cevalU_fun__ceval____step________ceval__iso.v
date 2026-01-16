From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_some__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__ceval__iso Isomorphisms.U_original__U2_lf_dot_U_impU2_cevalU_fun__U2_lf__U_impU2_cevalU_fun__ceval____step__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.ex__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Definition imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step____ceval : forall (x : imported_Original_LF__DOT__Imp_LF_Imp_com) (x0 x1 : imported_String_string -> imported_nat),
  imported_ex
    (fun H : imported_nat =>
     imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step (fun H0 : imported_String_string => x0 H0) x H)
       (imported_Some (fun x12 : imported_String_string => x1 x12))) ->
  imported_Original_LF__DOT__Imp_LF_Imp_ceval x (fun H : imported_String_string => x0 H) (fun H : imported_String_string => x1 H) := Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step____ceval.
Instance Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step____ceval_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.com) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_com) (hx : rel_iso Original_LF__DOT__Imp_LF_Imp_com_iso x1 x2) (x3 : Original.LF_DOT_Imp.LF.Imp.state)
    (x4 : imported_String_string -> imported_nat) (hx0 : forall (x5 : String.string) (x6 : imported_String_string), rel_iso String_string_iso x5 x6 -> rel_iso nat_iso (x3 x5) (x4 x6))
    (x5 : Original.LF_DOT_Imp.LF.Imp.state) (x6 : imported_String_string -> imported_nat)
    (hx1 : forall (x7 : String.string) (x8 : imported_String_string), rel_iso String_string_iso x7 x8 -> rel_iso nat_iso (x5 x7) (x6 x8))
    (x7 : exists i : nat, Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step x3 x1 i = Some x5)
    (x8 : imported_ex
            (fun H : imported_nat =>
             imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step (fun H0 : imported_String_string => x4 H0) x2 H)
               (imported_Some (fun x12 : imported_String_string => x6 x12)))),
  rel_iso
    {|
      to :=
        ex_iso (fun i : nat => Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step x3 x1 i = Some x5)
          (fun H : imported_nat =>
           imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step (fun H0 : imported_String_string => x4 H0) x2 H)
             (imported_Some (fun x12 : imported_String_string => x6 x12)))
          (fun (x9 : nat) (x10 : imported_nat) (hx2 : rel_iso nat_iso x9 x10) =>
           Corelib_Init_Logic_eq_iso
             (Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step_iso x3 (fun H : imported_String_string => x4 H)
                (fun (x11 : String.string) (x12 : imported_String_string) (hx3 : rel_iso String_string_iso x11 x12) => hx0 x11 x12 hx3) hx hx2)
             (Some_iso
                (IsoFunND x5 (fun x12 : imported_String_string => x6 x12) (fun (x11 : String.string) (x12 : imported_String_string) (hx3 : rel_iso String_string_iso x11 x12) => hx1 x11 x12 hx3))));
      from :=
        from
          (ex_iso (fun i : nat => Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step x3 x1 i = Some x5)
             (fun H : imported_nat =>
              imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step (fun H0 : imported_String_string => x4 H0) x2 H)
                (imported_Some (fun x12 : imported_String_string => x6 x12)))
             (fun (x9 : nat) (x10 : imported_nat) (hx2 : rel_iso nat_iso x9 x10) =>
              Corelib_Init_Logic_eq_iso
                (Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step_iso x3 (fun H : imported_String_string => x4 H)
                   (fun (x11 : String.string) (x12 : imported_String_string) (hx3 : rel_iso String_string_iso x11 x12) => hx0 x11 x12 hx3) hx hx2)
                (Some_iso
                   (IsoFunND x5 (fun x12 : imported_String_string => x6 x12) (fun (x11 : String.string) (x12 : imported_String_string) (hx3 : rel_iso String_string_iso x11 x12) => hx1 x11 x12 hx3)))));
      to_from :=
        fun
          x : imported_ex
                (fun H : imported_nat =>
                 imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step (fun H0 : imported_String_string => x4 H0) x2 H)
                   (imported_Some (fun x12 : imported_String_string => x6 x12))) =>
        to_from
          (ex_iso (fun i : nat => Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step x3 x1 i = Some x5)
             (fun H : imported_nat =>
              imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step (fun H0 : imported_String_string => x4 H0) x2 H)
                (imported_Some (fun x12 : imported_String_string => x6 x12)))
             (fun (x9 : nat) (x10 : imported_nat) (hx2 : rel_iso nat_iso x9 x10) =>
              Corelib_Init_Logic_eq_iso
                (Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step_iso x3 (fun H : imported_String_string => x4 H)
                   (fun (x11 : String.string) (x12 : imported_String_string) (hx3 : rel_iso String_string_iso x11 x12) => hx0 x11 x12 hx3) hx hx2)
                (Some_iso
                   (IsoFunND x5 (fun x12 : imported_String_string => x6 x12) (fun (x11 : String.string) (x12 : imported_String_string) (hx3 : rel_iso String_string_iso x11 x12) => hx1 x11 x12 hx3)))))
          x;
      from_to :=
        fun x : exists y : nat, Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step x3 x1 y = Some x5 =>
        seq_p_of_t
          (from_to
             (ex_iso (fun i : nat => Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step x3 x1 i = Some x5)
                (fun H : imported_nat =>
                 imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step (fun H0 : imported_String_string => x4 H0) x2 H)
                   (imported_Some (fun x12 : imported_String_string => x6 x12)))
                (fun (x9 : nat) (x10 : imported_nat) (hx2 : rel_iso nat_iso x9 x10) =>
                 Corelib_Init_Logic_eq_iso
                   (Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step_iso x3 (fun H : imported_String_string => x4 H)
                      (fun (x11 : String.string) (x12 : imported_String_string) (hx3 : rel_iso String_string_iso x11 x12) => hx0 x11 x12 hx3) hx hx2)
                   (Some_iso
                      (IsoFunND x5 (fun x12 : imported_String_string => x6 x12) (fun (x11 : String.string) (x12 : imported_String_string) (hx3 : rel_iso String_string_iso x11 x12) => hx1 x11 x12 hx3)))))
             x)
    |} x7 x8 ->
  rel_iso
    {|
      to :=
        Original_LF__DOT__Imp_LF_Imp_ceval_iso hx x3 (fun H : imported_String_string => x4 H)
          (fun (x9 : String.string) (x10 : imported_String_string) (hx3 : rel_iso String_string_iso x9 x10) => hx0 x9 x10 hx3) x5 (fun H : imported_String_string => x6 H)
          (fun (x9 : String.string) (x10 : imported_String_string) (hx3 : rel_iso String_string_iso x9 x10) => hx1 x9 x10 hx3);
      from :=
        from
          (Original_LF__DOT__Imp_LF_Imp_ceval_iso hx x3 (fun H : imported_String_string => x4 H)
             (fun (x9 : String.string) (x10 : imported_String_string) (hx3 : rel_iso String_string_iso x9 x10) => hx0 x9 x10 hx3) x5 (fun H : imported_String_string => x6 H)
             (fun (x9 : String.string) (x10 : imported_String_string) (hx3 : rel_iso String_string_iso x9 x10) => hx1 x9 x10 hx3));
      to_from :=
        fun x : imported_Original_LF__DOT__Imp_LF_Imp_ceval x2 (fun H : imported_String_string => x4 H) (fun H : imported_String_string => x6 H) =>
        to_from
          (Original_LF__DOT__Imp_LF_Imp_ceval_iso hx x3 (fun H : imported_String_string => x4 H)
             (fun (x9 : String.string) (x10 : imported_String_string) (hx3 : rel_iso String_string_iso x9 x10) => hx0 x9 x10 hx3) x5 (fun H : imported_String_string => x6 H)
             (fun (x9 : String.string) (x10 : imported_String_string) (hx3 : rel_iso String_string_iso x9 x10) => hx1 x9 x10 hx3))
          x;
      from_to :=
        fun x : Original.LF_DOT_Imp.LF.Imp.ceval x1 x3 x5 =>
        seq_p_of_t
          (from_to
             (Original_LF__DOT__Imp_LF_Imp_ceval_iso hx x3 (fun H : imported_String_string => x4 H)
                (fun (x9 : String.string) (x10 : imported_String_string) (hx3 : rel_iso String_string_iso x9 x10) => hx0 x9 x10 hx3) x5 (fun H : imported_String_string => x6 H)
                (fun (x9 : String.string) (x10 : imported_String_string) (hx3 : rel_iso String_string_iso x9 x10) => hx1 x9 x10 hx3))
             x)
    |} (Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step__ceval x1 x3 x5 x7) (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step____ceval x4 x6 x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step__ceval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step____ceval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step__ceval Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step____ceval_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step__ceval Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step____ceval Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step____ceval_iso := {}.