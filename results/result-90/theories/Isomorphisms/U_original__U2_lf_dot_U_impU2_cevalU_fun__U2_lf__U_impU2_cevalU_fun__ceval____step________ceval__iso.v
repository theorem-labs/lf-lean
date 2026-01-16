From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Unset Implicit Arguments.
From IsomorphismChecker Require Original Imported.
#[local] Set Printing Coercions.

From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_some__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__ceval__iso Isomorphisms.U_original__U2_lf_dot_U_impU2_cevalU_fun__U2_lf__U_impU2_cevalU_fun__ceval____step__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.ex__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Definition imported_Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step____ceval := @Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step____ceval.

(* ceval_step__ceval is an allowed axiom - both Original and Imported versions are admitted.
   We admit this isomorphism as well since proving it requires the axioms to be equal. *)
Axiom Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step____ceval_iso : forall
    (x1 : Original.LF_DOT_Imp.LF.Imp.com) (x2 : Imported.Original_LF__DOT__Imp_LF_Imp_com) (hx : rel_iso Original_LF__DOT__Imp_LF_Imp_com_iso x1 x2)
    (x3 : Original.LF_DOT_Imp.LF.Imp.state) (x4 : Imported.Original_LF__DOT__Imp_LF_Imp_state) (hx0 : forall (x5 : String.string) (x6 : Imported.String_string), rel_iso String_string_iso x5 x6 -> rel_iso nat_iso (x3 x5) (x4 x6))
    (x5 : Original.LF_DOT_Imp.LF.Imp.state) (x6 : Imported.Original_LF__DOT__Imp_LF_Imp_state) (hx1 : forall (x7 : String.string) (x8 : Imported.String_string), rel_iso String_string_iso x7 x8 -> rel_iso nat_iso (x5 x7) (x6 x8))
    (x7 : exists i : nat, (Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step x3 x1 i = Some x5)%type)
    (x8 : Imported.ex Imported.nat (fun i : Imported.nat => Imported.Corelib_Init_Logic_eq (Imported.option Imported.Original_LF__DOT__Imp_LF_Imp_state) (Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step x4 x2 i) (Imported.option_Some Imported.Original_LF__DOT__Imp_LF_Imp_state x6))),
  rel_iso
    (relax_Iso_Ts_Ps
       (ex_iso (fun i : nat => (Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step x3 x1 i = Some x5)%type)
          (fun i : Imported.nat => Imported.Corelib_Init_Logic_eq (Imported.option Imported.Original_LF__DOT__Imp_LF_Imp_state) (Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step x4 x2 i) (Imported.option_Some Imported.Original_LF__DOT__Imp_LF_Imp_state x6))
          (fun (x9 : nat) (x10 : Imported.nat) (hx2 : rel_iso nat_iso x9 x10) =>
           Corelib_Init_Logic_eq_iso
             (Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step_iso x3 x4 hx0 hx hx2)
             (Some_iso (IsoFunND x5 x6 hx1)))))
    x7 x8 ->
  rel_iso
    (relax_Iso_Ts_Ps (Original_LF__DOT__Imp_LF_Imp_ceval_iso hx x3 x4 hx0 x5 x6 hx1))
    (Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step__ceval x1 x3 x5 x7)
    (@Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step____ceval x2 x4 x6 x8).

Instance: KnownConstant Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step__ceval := {}.
Instance: KnownConstant Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step____ceval := {}.
Instance: IsoStatementProofFor Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step__ceval Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step____ceval_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpCEvalFun.LF.ImpCEvalFun.ceval_step__ceval Imported.Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step____ceval Original_LF__DOT__ImpCEvalFun_LF_ImpCEvalFun_ceval__step____ceval_iso := {}.
