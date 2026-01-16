From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__s____execute__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.app__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_execute__app : forall (x : imported_String_string -> imported_nat) (x0 x1 : imported_list imported_Original_LF__DOT__Imp_LF_Imp_sinstr) (x2 : imported_list imported_nat),
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Imp_LF_Imp_s__execute (fun x3 : imported_String_string => x x3) x2 (imported_app x0 x1))
    (imported_Original_LF__DOT__Imp_LF_Imp_s__execute (fun x3 : imported_String_string => x x3) (imported_Original_LF__DOT__Imp_LF_Imp_s__execute (fun x3 : imported_String_string => x x3) x2 x0) x1) := Imported.Original_LF__DOT__Imp_LF_Imp_execute__app.
Instance Original_LF__DOT__Imp_LF_Imp_execute__app_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.state) (x2 : imported_String_string -> imported_nat)
    (hx : forall (x3 : String.string) (x4 : imported_String_string), rel_iso String_string_iso x3 x4 -> rel_iso nat_iso (x1 x3) (x2 x4)) (x3 : list Original.LF_DOT_Imp.LF.Imp.sinstr)
    (x4 : imported_list imported_Original_LF__DOT__Imp_LF_Imp_sinstr) (hx0 : rel_iso (list_iso Original_LF__DOT__Imp_LF_Imp_sinstr_iso) x3 x4) (x5 : list Original.LF_DOT_Imp.LF.Imp.sinstr)
    (x6 : imported_list imported_Original_LF__DOT__Imp_LF_Imp_sinstr) (hx1 : rel_iso (list_iso Original_LF__DOT__Imp_LF_Imp_sinstr_iso) x5 x6) (x7 : list nat) (x8 : imported_list imported_nat)
    (hx2 : rel_iso (list_iso nat_iso) x7 x8),
  rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Imp_LF_Imp_s__execute_iso x1 (fun x : imported_String_string => x2 x)
          (fun (x9 : String.string) (x10 : imported_String_string) (hx3 : rel_iso String_string_iso x9 x10) => hx x9 x10 hx3) hx2 (app_iso hx0 hx1))
       (Original_LF__DOT__Imp_LF_Imp_s__execute_iso x1 (fun x : imported_String_string => x2 x)
          (fun (x9 : String.string) (x10 : imported_String_string) (hx3 : rel_iso String_string_iso x9 x10) => hx x9 x10 hx3)
          (Original_LF__DOT__Imp_LF_Imp_s__execute_iso x1 (fun x : imported_String_string => x2 x)
             (fun (x9 : String.string) (x10 : imported_String_string) (hx3 : rel_iso String_string_iso x9 x10) => hx x9 x10 hx3) hx2 hx0)
          hx1))
    (Original.LF_DOT_Imp.LF.Imp.execute_app x1 x3 x5 x7) (imported_Original_LF__DOT__Imp_LF_Imp_execute__app x2 x4 x6 x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.execute_app := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_execute__app := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.execute_app Original_LF__DOT__Imp_LF_Imp_execute__app_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.execute_app Imported.Original_LF__DOT__Imp_LF_Imp_execute__app Original_LF__DOT__Imp_LF_Imp_execute__app_iso := {}.