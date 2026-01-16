From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__even__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__false__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__odd__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__Tactics_LF_Tactics_silly__ex : forall x : imported_nat,
  (forall x0 : imported_nat,
   imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_even x0) imported_Original_LF__DOT__Basics_LF_Basics_true ->
   imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_even (imported_S x0)) imported_Original_LF__DOT__Basics_LF_Basics_false) ->
  (forall x0 : imported_nat,
   imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_even x0) imported_Original_LF__DOT__Basics_LF_Basics_false ->
   imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_odd x0) imported_Original_LF__DOT__Basics_LF_Basics_true) ->
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_even x) imported_Original_LF__DOT__Basics_LF_Basics_true ->
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_odd (imported_S x)) imported_Original_LF__DOT__Basics_LF_Basics_true := Imported.Original_LF__DOT__Tactics_LF_Tactics_silly__ex.
Instance Original_LF__DOT__Tactics_LF_Tactics_silly__ex_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2)
    (x3 : forall n : nat, Original.LF_DOT_Basics.LF.Basics.even n = Original.LF_DOT_Basics.LF.Basics.true -> Original.LF_DOT_Basics.LF.Basics.even (S n) = Original.LF_DOT_Basics.LF.Basics.false)
    (x4 : forall x : imported_nat,
          imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_even x) imported_Original_LF__DOT__Basics_LF_Basics_true ->
          imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_even (imported_S x)) imported_Original_LF__DOT__Basics_LF_Basics_false),
  (forall (x5 : nat) (x6 : imported_nat) (hx0 : rel_iso nat_iso x5 x6) (x7 : Original.LF_DOT_Basics.LF.Basics.even x5 = Original.LF_DOT_Basics.LF.Basics.true)
     (x8 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_even x6) imported_Original_LF__DOT__Basics_LF_Basics_true),
   rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_even_iso hx0) Original_LF__DOT__Basics_LF_Basics_true_iso) x7 x8 ->
   rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_even_iso (S_iso hx0)) Original_LF__DOT__Basics_LF_Basics_false_iso) (x3 x5 x7) (x4 x6 x8)) ->
  forall (x5 : forall n : nat, Original.LF_DOT_Basics.LF.Basics.even n = Original.LF_DOT_Basics.LF.Basics.false -> Original.LF_DOT_Basics.LF.Basics.odd n = Original.LF_DOT_Basics.LF.Basics.true)
    (x6 : forall x : imported_nat,
          imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_even x) imported_Original_LF__DOT__Basics_LF_Basics_false ->
          imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_odd x) imported_Original_LF__DOT__Basics_LF_Basics_true),
  (forall (x7 : nat) (x8 : imported_nat) (hx1 : rel_iso nat_iso x7 x8) (x9 : Original.LF_DOT_Basics.LF.Basics.even x7 = Original.LF_DOT_Basics.LF.Basics.false)
     (x10 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_even x8) imported_Original_LF__DOT__Basics_LF_Basics_false),
   rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_even_iso hx1) Original_LF__DOT__Basics_LF_Basics_false_iso) x9 x10 ->
   rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_odd_iso hx1) Original_LF__DOT__Basics_LF_Basics_true_iso) (x5 x7 x9) (x6 x8 x10)) ->
  forall (x7 : Original.LF_DOT_Basics.LF.Basics.even x1 = Original.LF_DOT_Basics.LF.Basics.true)
    (x8 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_even x2) imported_Original_LF__DOT__Basics_LF_Basics_true),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_even_iso hx) Original_LF__DOT__Basics_LF_Basics_true_iso) x7 x8 ->
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_odd_iso (S_iso hx)) Original_LF__DOT__Basics_LF_Basics_true_iso) (Original.LF_DOT_Tactics.LF.Tactics.silly_ex x1 x3 x5 x7)
    (imported_Original_LF__DOT__Tactics_LF_Tactics_silly__ex x4 x6 x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.silly_ex := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_silly__ex := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.silly_ex Original_LF__DOT__Tactics_LF_Tactics_silly__ex_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.silly_ex Imported.Original_LF__DOT__Tactics_LF_Tactics_silly__ex Original_LF__DOT__Tactics_LF_Tactics_silly__ex_iso := {}.