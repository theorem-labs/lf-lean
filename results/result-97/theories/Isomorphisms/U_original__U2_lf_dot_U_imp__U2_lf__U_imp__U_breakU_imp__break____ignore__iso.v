From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_breakU_imp__U2_cbreak__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_breakU_imp__U2_cseq__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_breakU_imp__ceval__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_break__ignore : forall (x : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com) (x0 x1 : imported_String_string -> imported_nat) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_result),
  imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval (imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_CSeq imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_CBreak x)
    (fun x3 : imported_String_string => x0 x3) x2 (fun x3 : imported_String_string => x1 x3) ->
  imported_Corelib_Init_Logic_eq (fun x12 : imported_String_string => x0 x12) (fun x12 : imported_String_string => x1 x12) := Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_break__ignore.
Instance Original_LF__DOT__Imp_LF_Imp_BreakImp_break__ignore_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.BreakImp.com) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com) (hx : rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso x1 x2)
    (x3 : Original.LF_DOT_Imp.LF.Imp.state) (x4 : imported_String_string -> imported_nat)
    (hx0 : forall (x5 : String.string) (x6 : imported_String_string), rel_iso String_string_iso x5 x6 -> rel_iso nat_iso (x3 x5) (x4 x6)) (x5 : Original.LF_DOT_Imp.LF.Imp.state)
    (x6 : imported_String_string -> imported_nat) (hx1 : forall (x7 : String.string) (x8 : imported_String_string), rel_iso String_string_iso x7 x8 -> rel_iso nat_iso (x5 x7) (x6 x8))
    (x7 : Original.LF_DOT_Imp.LF.Imp.BreakImp.result) (x8 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_result) (hx2 : rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_result_iso x7 x8)
    (x9 : Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval (Original.LF_DOT_Imp.LF.Imp.BreakImp.CSeq Original.LF_DOT_Imp.LF.Imp.BreakImp.CBreak x1) x3 x7 x5)
    (x10 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval (imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_CSeq imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_CBreak x2)
             (fun x : imported_String_string => x4 x) x8 (fun x : imported_String_string => x6 x)),
  rel_iso
    (Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval_iso (Original_LF__DOT__Imp_LF_Imp_BreakImp_CSeq_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_CBreak_iso hx) x3 (fun x : imported_String_string => x4 x)
       (fun (x11 : String.string) (x12 : imported_String_string) (hx3 : rel_iso String_string_iso x11 x12) => hx0 x11 x12 hx3) hx2 x5 (fun x : imported_String_string => x6 x)
       (fun (x11 : String.string) (x12 : imported_String_string) (hx3 : rel_iso String_string_iso x11 x12) => hx1 x11 x12 hx3))
    x9 x10 ->
  rel_iso
    (Corelib_Init_Logic_eq_iso
       (IsoFunND x3 (fun x12 : imported_String_string => x4 x12) (fun (x11 : String.string) (x12 : imported_String_string) (hx4 : rel_iso String_string_iso x11 x12) => hx0 x11 x12 hx4))
       (IsoFunND x5 (fun x12 : imported_String_string => x6 x12) (fun (x11 : String.string) (x12 : imported_String_string) (hx4 : rel_iso String_string_iso x11 x12) => hx1 x11 x12 hx4)))
    (Original.LF_DOT_Imp.LF.Imp.BreakImp.break_ignore x1 x3 x5 x7 x9) (imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_break__ignore x4 x6 x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.BreakImp.break_ignore := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_break__ignore := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.BreakImp.break_ignore Original_LF__DOT__Imp_LF_Imp_BreakImp_break__ignore_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.BreakImp.break_ignore Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_break__ignore Original_LF__DOT__Imp_LF_Imp_BreakImp_break__ignore_iso := {}.