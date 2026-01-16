From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_logic__not__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__false__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_not__true__is__false : forall x : imported_Original_LF__DOT__Basics_LF_Basics_bool,
  (imported_Corelib_Init_Logic_eq x imported_Original_LF__DOT__Basics_LF_Basics_true -> imported_False) -> imported_Corelib_Init_Logic_eq x imported_Original_LF__DOT__Basics_LF_Basics_false := Imported.Original_LF__DOT__Logic_LF_Logic_not__true__is__false.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_not__true__is__false_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.bool) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_bool) (hx : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x1 x2)
    (x3 : x1 <> Original.LF_DOT_Basics.LF.Basics.true) (x4 : imported_Corelib_Init_Logic_eq x2 imported_Original_LF__DOT__Basics_LF_Basics_true -> imported_False),
  (forall (x5 : x1 = Original.LF_DOT_Basics.LF.Basics.true) (x6 : imported_Corelib_Init_Logic_eq x2 imported_Original_LF__DOT__Basics_LF_Basics_true),
   rel_iso (Corelib_Init_Logic_eq_iso hx Original_LF__DOT__Basics_LF_Basics_true_iso) x5 x6 -> rel_iso False_iso (x3 x5) (x4 x6)) ->
  rel_iso (Corelib_Init_Logic_eq_iso hx Original_LF__DOT__Basics_LF_Basics_false_iso) (Original.LF_DOT_Logic.LF.Logic.not_true_is_false x1 x3)
    (imported_Original_LF__DOT__Logic_LF_Logic_not__true__is__false x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.not_true_is_false := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_not__true__is__false := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.not_true_is_false Original_LF__DOT__Logic_LF_Logic_not__true__is__false_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.not_true_is_false Imported.Original_LF__DOT__Logic_LF_Logic_not__true__is__false Original_LF__DOT__Logic_LF_Logic_not__true__is__false_iso := {}.