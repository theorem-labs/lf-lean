From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool____rec__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__even__iso Isomorphisms.U_original__U2_lf_dot_U_induction__U2_lf__U_induction__double__iso Isomorphisms.U_s__iso Isomorphisms.ex__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_even__double__conv : forall x : imported_nat,
  imported_ex
    (fun H : imported_nat =>
     imported_Corelib_Init_Logic_eq x
       (imported_Original_LF__DOT__Basics_LF_Basics_bool__rec (fun _ : imported_Original_LF__DOT__Basics_LF_Basics_bool => imported_nat) (imported_Original_LF__DOT__Induction_LF_Induction_double H)
          (imported_S (imported_Original_LF__DOT__Induction_LF_Induction_double H)) (imported_Original_LF__DOT__Basics_LF_Basics_even x))) := Imported.Original_LF__DOT__Logic_LF_Logic_even__double__conv.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_even__double__conv_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2),
  rel_iso
    (relax_Iso_Ts_Ps
       (ex_iso (fun k : nat => x1 = (if Original.LF_DOT_Basics.LF.Basics.even x1 then Original.LF_DOT_Induction.LF.Induction.double k else S (Original.LF_DOT_Induction.LF.Induction.double k)))
          (fun H : imported_nat =>
           imported_Corelib_Init_Logic_eq x2
             (imported_Original_LF__DOT__Basics_LF_Basics_bool__rec (fun _ : imported_Original_LF__DOT__Basics_LF_Basics_bool => imported_nat)
                (imported_Original_LF__DOT__Induction_LF_Induction_double H) (imported_S (imported_Original_LF__DOT__Induction_LF_Induction_double H))
                (imported_Original_LF__DOT__Basics_LF_Basics_even x2)))
          (fun (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) =>
           Corelib_Init_Logic_eq_iso hx
             (unwrap_sprop
                (Original_LF__DOT__Basics_LF_Basics_bool__rec_iso (fun _ : Original.LF_DOT_Basics.LF.Basics.bool => nat) (fun _ : imported_Original_LF__DOT__Basics_LF_Basics_bool => imported_nat)
                   (fun (x5 : Original.LF_DOT_Basics.LF.Basics.bool) (x6 : imported_Original_LF__DOT__Basics_LF_Basics_bool) (_ : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x5 x6) => nat_iso)
                   (Original.LF_DOT_Induction.LF.Induction.double x3) (imported_Original_LF__DOT__Induction_LF_Induction_double x4)
                   {| unwrap_sprop := Original_LF__DOT__Induction_LF_Induction_double_iso hx0 |} (S (Original.LF_DOT_Induction.LF.Induction.double x3))
                   (imported_S (imported_Original_LF__DOT__Induction_LF_Induction_double x4)) {| unwrap_sprop := S_iso (Original_LF__DOT__Induction_LF_Induction_double_iso hx0) |}
                   (Original_LF__DOT__Basics_LF_Basics_even_iso hx))))))
    (Original.LF_DOT_Logic.LF.Logic.even_double_conv x1) (imported_Original_LF__DOT__Logic_LF_Logic_even__double__conv x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.even_double_conv := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_even__double__conv := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.even_double_conv Original_LF__DOT__Logic_LF_Logic_even__double__conv_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.even_double_conv Imported.Original_LF__DOT__Logic_LF_Logic_even__double__conv Original_LF__DOT__Logic_LF_Logic_even__double__conv_iso := {}.