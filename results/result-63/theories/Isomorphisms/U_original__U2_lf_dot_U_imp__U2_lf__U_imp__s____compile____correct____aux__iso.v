From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.cons__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aeval__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__s____compile__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__s____execute__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_s__compile__correct__aux : forall (x : imported_String_string -> imported_nat) (x0 : imported_Original_LF__DOT__Imp_LF_Imp_aexp) (x1 : imported_list imported_nat),
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Imp_LF_Imp_s__execute (fun x2 : imported_String_string => x x2) x1 (imported_Original_LF__DOT__Imp_LF_Imp_s__compile x0))
    (imported_cons (imported_Original_LF__DOT__Imp_LF_Imp_aeval (fun x2 : imported_String_string => x x2) x0) x1) := Imported.Original_LF__DOT__Imp_LF_Imp_s__compile__correct__aux.
Instance Original_LF__DOT__Imp_LF_Imp_s__compile__correct__aux_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.state) (x2 : imported_String_string -> imported_nat)
    (hx : forall (x3 : String.string) (x4 : imported_String_string), rel_iso String_string_iso x3 x4 -> rel_iso nat_iso (x1 x3) (x2 x4)) (x3 : Original.LF_DOT_Imp.LF.Imp.aexp)
    (x4 : imported_Original_LF__DOT__Imp_LF_Imp_aexp) (hx0 : rel_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso x3 x4) (x5 : list nat) (x6 : imported_list imported_nat)
    (hx1 : rel_iso (list_iso nat_iso) x5 x6),
  rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Imp_LF_Imp_s__execute_iso x1 (fun x : imported_String_string => x2 x)
          (fun (x7 : String.string) (x8 : imported_String_string) (hx2 : rel_iso String_string_iso x7 x8) => hx x7 x8 hx2) hx1 (Original_LF__DOT__Imp_LF_Imp_s__compile_iso hx0))
       (cons_iso
          (Original_LF__DOT__Imp_LF_Imp_aeval_iso x1 (fun x : imported_String_string => x2 x)
             (fun (x7 : String.string) (x8 : imported_String_string) (hx2 : rel_iso String_string_iso x7 x8) => hx x7 x8 hx2) hx0)
          hx1))
    (Original.LF_DOT_Imp.LF.Imp.s_compile_correct_aux x1 x3 x5) (imported_Original_LF__DOT__Imp_LF_Imp_s__compile__correct__aux x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.s_compile_correct_aux := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_s__compile__correct__aux := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.s_compile_correct_aux Original_LF__DOT__Imp_LF_Imp_s__compile__correct__aux_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.s_compile_correct_aux Imported.Original_LF__DOT__Imp_LF_Imp_s__compile__correct__aux Original_LF__DOT__Imp_LF_Imp_s__compile__correct__aux_iso := {}.