From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_some__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__ceval__iso Isomorphisms.U_original__U2_lf_dot_U_impU2_cevalU_fun__U2_lf__U_impU2_cevalU_fun__ceval____step__iso Isomorphisms.ex__iso.

Definition imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval____ceval__step : forall (x : imported_Original_LF__DOT__Imp_LF_Imp_com) (x0 x1 : imported_String_string -> imported_nat),
  imported_Original_LF__DOT__Imp_LF_Imp_ceval x (fun x2 : imported_String_string => x0 x2) (fun x2 : imported_String_string => x1 x2) ->
  imported_ex
    (fun H : imported_nat =>
     imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step (fun x2 : imported_String_string => x0 x2) x H)
       (imported_Some (fun x12 : imported_String_string => x1 x12))) := Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval____ceval__step.

(* This is an isomorphism between an axiom in Original and the corresponding axiom in Imported *)
(* Since ceval__ceval_step is Admitted in Original, this is valid to Admit *)
Instance Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval____ceval__step_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.com) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_com) (hx : rel_iso Original_LF__DOT__Imp_LF_Imp_com_iso x1 x2) (x3 : Original.LF_DOT_Imp.LF.Imp.state)
    (x4 : imported_String_string -> imported_nat) (hx0 : forall (x5 : String.string) (x6 : imported_String_string), rel_iso String_string_iso x5 x6 -> rel_iso nat_iso (x3 x5) (x4 x6))
    (x5 : Original.LF_DOT_Imp.LF.Imp.state) (x6 : imported_String_string -> imported_nat)
    (hx1 : forall (x7 : String.string) (x8 : imported_String_string), rel_iso String_string_iso x7 x8 -> rel_iso nat_iso (x5 x7) (x6 x8)) (x7 : Original.LF_DOT_Imp.LF.Imp.ceval x1 x3 x5)
    (x8 : imported_Original_LF__DOT__Imp_LF_Imp_ceval x2 (fun H : imported_String_string => x4 H) (fun H : imported_String_string => x6 H)),
  rel_iso
    (relax_Iso_Ts_Ps
       (Original_LF__DOT__Imp_LF_Imp_ceval_iso hx x3 (fun H : imported_String_string => x4 H)
          (fun (x9 : String.string) (x10 : imported_String_string) (hx2 : rel_iso String_string_iso x9 x10) => hx0 x9 x10 hx2) x5 (fun H : imported_String_string => x6 H)
          (fun (x9 : String.string) (x10 : imported_String_string) (hx2 : rel_iso String_string_iso x9 x10) => hx1 x9 x10 hx2)))
    x7 x8 ->
  rel_iso
    (relax_Iso_Ts_Ps
       (ex_iso (fun i : nat => @Logic.eq _ (Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step x3 x1 i) (Some x5))
          (fun H : imported_nat =>
           imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step (fun H0 : imported_String_string => x4 H0) x2 H)
             (imported_Some (fun x12 : imported_String_string => x6 x12)))
          (fun (x9 : nat) (x10 : imported_nat) (hx3 : rel_iso nat_iso x9 x10) =>
           Corelib_Init_Logic_eq_iso
             (Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step_iso x3 (fun H : imported_String_string => x4 H)
                (fun (x11 : String.string) (x12 : imported_String_string) (hx4 : rel_iso String_string_iso x11 x12) => hx0 x11 x12 hx4) hx hx3)
             (Some_iso
                (IsoFunND x5 (fun x12 : imported_String_string => x6 x12) (fun (x11 : String.string) (x12 : imported_String_string) (hx4 : rel_iso String_string_iso x11 x12) => hx1 x11 x12 hx4))))))
    (Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval__ceval_step x1 x3 x5 x7) (imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval____ceval__step x4 x6 x8).
Admitted.

Instance: KnownConstant Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval__ceval_step := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval____ceval__step := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval__ceval_step Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval____ceval__step_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval__ceval_step Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval____ceval__step Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval____ceval__step_iso := {}.
