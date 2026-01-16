From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_breakU_imp__U2_cseq__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_breakU_imp__U2_sbreak__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_breakU_imp__ceval__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_seq__stops__on__break : forall (x x0 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com) (x1 x2 : imported_String_string -> imported_nat),
  imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval x (fun x3 : imported_String_string => x1 x3) imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_SBreak (fun x3 : imported_String_string => x2 x3) ->
  imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval (imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_CSeq x x0) (fun x3 : imported_String_string => x1 x3)
    imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_SBreak (fun x3 : imported_String_string => x2 x3) := Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_seq__stops__on__break.
Instance Original_LF__DOT__Imp_LF_Imp_BreakImp_seq__stops__on__break_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.BreakImp.com) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com) (hx : rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso x1 x2)
    (x3 : Original.LF_DOT_Imp.LF.Imp.BreakImp.com) (x4 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com) (hx0 : rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso x3 x4)
    (x5 : Original.LF_DOT_Imp.LF.Imp.state) (x6 : imported_String_string -> imported_nat)
    (hx1 : forall (x7 : String.string) (x8 : imported_String_string), rel_iso String_string_iso x7 x8 -> rel_iso nat_iso (x5 x7) (x6 x8)) (x7 : Original.LF_DOT_Imp.LF.Imp.state)
    (x8 : imported_String_string -> imported_nat) (hx2 : forall (x9 : String.string) (x10 : imported_String_string), rel_iso String_string_iso x9 x10 -> rel_iso nat_iso (x7 x9) (x8 x10))
    (x9 : Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval x1 x5 Original.LF_DOT_Imp.LF.Imp.BreakImp.SBreak x7)
    (x10 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval x2 (fun x : imported_String_string => x6 x) imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_SBreak
             (fun x : imported_String_string => x8 x)),
  rel_iso
    (Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval_iso hx x5 (fun x : imported_String_string => x6 x)
       (fun (x11 : String.string) (x12 : imported_String_string) (hx3 : rel_iso String_string_iso x11 x12) => hx1 x11 x12 hx3) Original_LF__DOT__Imp_LF_Imp_BreakImp_SBreak_iso x7
       (fun x : imported_String_string => x8 x) (fun (x11 : String.string) (x12 : imported_String_string) (hx3 : rel_iso String_string_iso x11 x12) => hx2 x11 x12 hx3))
    x9 x10 ->
  rel_iso
    (Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval_iso (Original_LF__DOT__Imp_LF_Imp_BreakImp_CSeq_iso hx hx0) x5 (fun x : imported_String_string => x6 x)
       (fun (x11 : String.string) (x12 : imported_String_string) (hx4 : rel_iso String_string_iso x11 x12) => hx1 x11 x12 hx4) Original_LF__DOT__Imp_LF_Imp_BreakImp_SBreak_iso x7
       (fun x : imported_String_string => x8 x) (fun (x11 : String.string) (x12 : imported_String_string) (hx4 : rel_iso String_string_iso x11 x12) => hx2 x11 x12 hx4))
    (Original.LF_DOT_Imp.LF.Imp.BreakImp.seq_stops_on_break x1 x3 x5 x7 x9) (imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_seq__stops__on__break x4 x6 x8 x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.BreakImp.seq_stops_on_break := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_seq__stops__on__break := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.BreakImp.seq_stops_on_break Original_LF__DOT__Imp_LF_Imp_BreakImp_seq__stops__on__break_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.BreakImp.seq_stops_on_break Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_seq__stops__on__break Original_LF__DOT__Imp_LF_Imp_BreakImp_seq__stops__on__break_iso := {}.