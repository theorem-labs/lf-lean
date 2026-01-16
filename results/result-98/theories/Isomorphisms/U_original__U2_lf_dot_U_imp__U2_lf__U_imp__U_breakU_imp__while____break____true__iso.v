From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_breakU_imp__U2_cwhile__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_breakU_imp__U2_sbreak__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_breakU_imp__U2_scontinue__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_breakU_imp__ceval__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__beval__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.ex__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_while__break__true : forall (x : imported_Original_LF__DOT__Imp_LF_Imp_bexp) (x0 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com) (x1 x2 : imported_String_string -> imported_nat),
  imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval (imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_CWhile x x0) (fun H : imported_String_string => x1 H)
    imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_SContinue (fun H : imported_String_string => x2 H) ->
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Imp_LF_Imp_beval (fun H : imported_String_string => x2 H) x) imported_true ->
  imported_ex
    (fun H : imported_String_string -> imported_nat =>
     imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval x0 (fun H0 : imported_String_string => H H0) imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_SBreak (fun H0 : imported_String_string => x2 H0)) := Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_while__break__true.
Instance Original_LF__DOT__Imp_LF_Imp_BreakImp_while__break__true_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.bexp) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_bexp) (hx : rel_iso Original_LF__DOT__Imp_LF_Imp_bexp_iso x1 x2)
    (x3 : Original.LF_DOT_Imp.LF.Imp.BreakImp.com) (x4 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com) (hx0 : rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso x3 x4)
    (x5 : Original.LF_DOT_Imp.LF.Imp.state) (x6 : imported_String_string -> imported_nat)
    (hx1 : forall (x7 : String.string) (x8 : imported_String_string), rel_iso String_string_iso x7 x8 -> rel_iso nat_iso (x5 x7) (x6 x8)) (x7 : Original.LF_DOT_Imp.LF.Imp.state)
    (x8 : imported_String_string -> imported_nat) (hx2 : forall (x9 : String.string) (x10 : imported_String_string), rel_iso String_string_iso x9 x10 -> rel_iso nat_iso (x7 x9) (x8 x10))
    (x9 : Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval (Original.LF_DOT_Imp.LF.Imp.BreakImp.CWhile x1 x3) x5 Original.LF_DOT_Imp.LF.Imp.BreakImp.SContinue x7)
    (x10 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval (imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_CWhile x2 x4) (fun H : imported_String_string => x6 H)
             imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_SContinue (fun H : imported_String_string => x8 H)),
  rel_iso
    (relax_Iso_Ts_Ps
       (Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval_iso (Original_LF__DOT__Imp_LF_Imp_BreakImp_CWhile_iso hx hx0) x5 (fun H : imported_String_string => x6 H)
          (fun (x11 : String.string) (x12 : imported_String_string) (hx3 : rel_iso String_string_iso x11 x12) => hx1 x11 x12 hx3) Original_LF__DOT__Imp_LF_Imp_BreakImp_SContinue_iso x7
          (fun H : imported_String_string => x8 H) (fun (x11 : String.string) (x12 : imported_String_string) (hx3 : rel_iso String_string_iso x11 x12) => hx2 x11 x12 hx3)))
    x9 x10 ->
  forall (x11 : Original.LF_DOT_Imp.LF.Imp.beval x7 x1 = true)
    (x12 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Imp_LF_Imp_beval (fun H : imported_String_string => x8 H) x2) imported_true),
  rel_iso
    (relax_Iso_Ts_Ps
       (Corelib_Init_Logic_eq_iso
          (Original_LF__DOT__Imp_LF_Imp_beval_iso x7 (fun H : imported_String_string => x8 H)
             (fun (x13 : String.string) (x14 : imported_String_string) (hx4 : rel_iso String_string_iso x13 x14) => hx2 x13 x14 hx4) hx)
          true_iso))
    x11 x12 ->
  rel_iso
    (relax_Iso_Ts_Ps
       (ex_iso (fun st'' : Original.LF_DOT_Imp.LF.Imp.state => Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval x3 st'' Original.LF_DOT_Imp.LF.Imp.BreakImp.SBreak x7)
          (fun H : imported_String_string -> imported_nat =>
           imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval x4 (fun H0 : imported_String_string => H H0) imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_SBreak
             (fun H0 : imported_String_string => x8 H0))
          (fun (x13 : Original.LF_DOT_Imp.LF.Imp.state) (x14 : imported_String_string -> imported_nat) (hx5 : rel_iso (IsoArrow String_string_iso nat_iso) x13 x14) =>
           Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval_iso hx0 x13 (fun H : imported_String_string => x14 H)
             (fun (x15 : String.string) (x16 : imported_String_string) (hx6 : rel_iso String_string_iso x15 x16) => IsoUnFunND hx5 hx6) Original_LF__DOT__Imp_LF_Imp_BreakImp_SBreak_iso x7
             (fun H : imported_String_string => x8 H) (fun (x15 : String.string) (x16 : imported_String_string) (hx6 : rel_iso String_string_iso x15 x16) => hx2 x15 x16 hx6))))
    (Original.LF_DOT_Imp.LF.Imp.BreakImp.while_break_true x1 x3 x5 x7 x9 x11) (imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_while__break__true x6 x8 x10 x12).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.BreakImp.while_break_true := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_while__break__true := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.BreakImp.while_break_true Original_LF__DOT__Imp_LF_Imp_BreakImp_while__break__true_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.BreakImp.while_break_true Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_while__break__true Original_LF__DOT__Imp_LF_Imp_BreakImp_while__break__true_iso := {}.