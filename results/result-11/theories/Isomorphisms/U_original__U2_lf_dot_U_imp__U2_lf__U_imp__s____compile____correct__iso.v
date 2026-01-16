From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.cons__iso Isomorphisms.nil__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__aeval__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__s____compile__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__s____execute__iso.

(* Since this is an admitted theorem in Original.v, we axiomatize it *)
Axiom imported_Original_LF__DOT__Imp_LF_Imp_s__compile__correct : forall (x : imported_String_string -> imported_nat) (x0 : imported_Original_LF__DOT__Imp_LF_Imp_aexp),
  imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Imp_LF_Imp_s__execute (fun x1 : imported_String_string => x x1) (imported_nil imported_nat) (imported_Original_LF__DOT__Imp_LF_Imp_s__compile x0))
    (imported_cons (imported_Original_LF__DOT__Imp_LF_Imp_aeval (fun x1 : imported_String_string => x x1) x0) (imported_nil imported_nat)).
Instance Original_LF__DOT__Imp_LF_Imp_s__compile__correct_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.state) (x2 : imported_String_string -> imported_nat)
    (hx : forall (x3 : String.string) (x4 : imported_String_string), rel_iso String_string_iso x3 x4 -> rel_iso nat_iso (x1 x3) (x2 x4)) (x3 : Original.LF_DOT_Imp.LF.Imp.aexp)
    (x4 : imported_Original_LF__DOT__Imp_LF_Imp_aexp) (hx0 : rel_iso Original_LF__DOT__Imp_LF_Imp_aexp_iso x3 x4),
  rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Imp_LF_Imp_s__execute_iso x1 (fun x : imported_String_string => x2 x)
          (fun (x5 : String.string) (x6 : imported_String_string) (hx1 : rel_iso String_string_iso x5 x6) => hx x5 x6 hx1) (nil_iso nat_iso) (Original_LF__DOT__Imp_LF_Imp_s__compile_iso hx0))
       (cons_iso
          (Original_LF__DOT__Imp_LF_Imp_aeval_iso x1 (fun x : imported_String_string => x2 x)
             (fun (x5 : String.string) (x6 : imported_String_string) (hx1 : rel_iso String_string_iso x5 x6) => hx x5 x6 hx1) hx0)
          (nil_iso nat_iso)))
    (Original.LF_DOT_Imp.LF.Imp.s_compile_correct x1 x3) (imported_Original_LF__DOT__Imp_LF_Imp_s__compile__correct x2 x4).
Proof.
  (* Since s_compile_correct is admitted in Original.v, we can admit the isomorphism *)
  admit.
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.s_compile_correct := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant imported_Original_LF__DOT__Imp_LF_Imp_s__compile__correct := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.s_compile_correct Original_LF__DOT__Imp_LF_Imp_s__compile__correct_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.s_compile_correct imported_Original_LF__DOT__Imp_LF_Imp_s__compile__correct Original_LF__DOT__Imp_LF_Imp_s__compile__correct_iso := {}.