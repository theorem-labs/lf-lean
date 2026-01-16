From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_breakU_imp__ceval__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.and__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Monomorphic Definition imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval__deterministic : forall (x : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com) (x0 x1 x2 : imported_String_string -> imported_nat) (x3 x4 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_result),
  imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval x (fun H : imported_String_string => x0 H) x3 (fun H : imported_String_string => x1 H) ->
  imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval x (fun H : imported_String_string => x0 H) x4 (fun H : imported_String_string => x2 H) ->
  imported_and (imported_Corelib_Init_Logic_eq (fun x18 : imported_String_string => x1 x18) (fun x18 : imported_String_string => x2 x18)) (imported_Corelib_Init_Logic_eq x3 x4) := Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval__deterministic.
Monomorphic Instance Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval__deterministic_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.BreakImp.com) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com) (hx : rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso x1 x2)
    (x3 : Original.LF_DOT_Imp.LF.Imp.state) (x4 : imported_String_string -> imported_nat)
    (hx0 : forall (x5 : String.string) (x6 : imported_String_string), rel_iso String_string_iso x5 x6 -> rel_iso nat_iso (x3 x5) (x4 x6)) (x5 : Original.LF_DOT_Imp.LF.Imp.state)
    (x6 : imported_String_string -> imported_nat) (hx1 : forall (x7 : String.string) (x8 : imported_String_string), rel_iso String_string_iso x7 x8 -> rel_iso nat_iso (x5 x7) (x6 x8))
    (x7 : Original.LF_DOT_Imp.LF.Imp.state) (x8 : imported_String_string -> imported_nat)
    (hx2 : forall (x9 : String.string) (x10 : imported_String_string), rel_iso String_string_iso x9 x10 -> rel_iso nat_iso (x7 x9) (x8 x10)) (x9 : Original.LF_DOT_Imp.LF.Imp.BreakImp.result)
    (x10 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_result) (hx3 : rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_result_iso x9 x10) (x11 : Original.LF_DOT_Imp.LF.Imp.BreakImp.result)
    (x12 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_result) (hx4 : rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_result_iso x11 x12)
    (x13 : Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval x1 x3 x9 x5)
    (x14 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval x2 (fun H : imported_String_string => x4 H) x10 (fun H : imported_String_string => x6 H)),
  rel_iso
    (relax_Iso_Ts_Ps
       (Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval_iso hx x3 (fun H : imported_String_string => x4 H)
          (fun (x15 : String.string) (x16 : imported_String_string) (hx5 : rel_iso String_string_iso x15 x16) => hx0 x15 x16 hx5) hx3 x5 (fun H : imported_String_string => x6 H)
          (fun (x15 : String.string) (x16 : imported_String_string) (hx5 : rel_iso String_string_iso x15 x16) => hx1 x15 x16 hx5)))
    x13 x14 ->
  forall (x15 : Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval x1 x3 x11 x7)
    (x16 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval x2 (fun H : imported_String_string => x4 H) x12 (fun H : imported_String_string => x8 H)),
  rel_iso
    (relax_Iso_Ts_Ps
       (Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval_iso hx x3 (fun H : imported_String_string => x4 H)
          (fun (x17 : String.string) (x18 : imported_String_string) (hx6 : rel_iso String_string_iso x17 x18) => hx0 x17 x18 hx6) hx4 x7 (fun H : imported_String_string => x8 H)
          (fun (x17 : String.string) (x18 : imported_String_string) (hx6 : rel_iso String_string_iso x17 x18) => hx2 x17 x18 hx6)))
    x15 x16 ->
  rel_iso
    (relax_Iso_Ts_Ps
       (and_iso
          (Corelib_Init_Logic_eq_iso
             (IsoFunND x5 (fun x18 : imported_String_string => x6 x18) (fun (x17 : String.string) (x18 : imported_String_string) (hx7 : rel_iso String_string_iso x17 x18) => hx1 x17 x18 hx7))
             (IsoFunND x7 (fun x18 : imported_String_string => x8 x18) (fun (x17 : String.string) (x18 : imported_String_string) (hx7 : rel_iso String_string_iso x17 x18) => hx2 x17 x18 hx7)))
          (Corelib_Init_Logic_eq_iso hx3 hx4)))
    (Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval_deterministic x1 x3 x5 x7 x9 x11 x13 x15) (imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval__deterministic x4 x6 x8 x14 x16).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval_deterministic := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval__deterministic := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval_deterministic Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval__deterministic_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval_deterministic Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval__deterministic Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval__deterministic_iso := {}.