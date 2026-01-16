From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_identity__fn__applied__twice : forall x : imported_Original_LF__DOT__Basics_LF_Basics_bool -> imported_Original_LF__DOT__Basics_LF_Basics_bool,
  (forall x0 : imported_Original_LF__DOT__Basics_LF_Basics_bool, imported_Corelib_Init_Logic_eq (x x0) x0) ->
  forall x1 : imported_Original_LF__DOT__Basics_LF_Basics_bool, imported_Corelib_Init_Logic_eq (x (x x1)) x1 := Imported.Original_LF__DOT__Basics_LF_Basics_identity__fn__applied__twice.
Instance Original_LF__DOT__Basics_LF_Basics_identity__fn__applied__twice_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.bool -> Original.LF_DOT_Basics.LF.Basics.bool)
    (x2 : imported_Original_LF__DOT__Basics_LF_Basics_bool -> imported_Original_LF__DOT__Basics_LF_Basics_bool)
    (hx : forall (x3 : Original.LF_DOT_Basics.LF.Basics.bool) (x4 : imported_Original_LF__DOT__Basics_LF_Basics_bool),
          rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x3 x4 -> rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (x1 x3) (x2 x4))
    (x3 : forall x : Original.LF_DOT_Basics.LF.Basics.bool, x1 x = x) (x4 : forall x : imported_Original_LF__DOT__Basics_LF_Basics_bool, imported_Corelib_Init_Logic_eq (x2 x) x),
  (forall (x5 : Original.LF_DOT_Basics.LF.Basics.bool) (x6 : imported_Original_LF__DOT__Basics_LF_Basics_bool) (hx0 : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x5 x6),
   rel_iso (Corelib_Init_Logic_eq_iso (hx x5 x6 hx0) hx0) (x3 x5) (x4 x6)) ->
  forall (x5 : Original.LF_DOT_Basics.LF.Basics.bool) (x6 : imported_Original_LF__DOT__Basics_LF_Basics_bool) (hx1 : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x5 x6),
  rel_iso (Corelib_Init_Logic_eq_iso (hx (x1 x5) (x2 x6) (hx x5 x6 hx1)) hx1) (Original.LF_DOT_Basics.LF.Basics.identity_fn_applied_twice x1 x3 x5)
    (imported_Original_LF__DOT__Basics_LF_Basics_identity__fn__applied__twice x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.identity_fn_applied_twice := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_identity__fn__applied__twice := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.identity_fn_applied_twice Original_LF__DOT__Basics_LF_Basics_identity__fn__applied__twice_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.identity_fn_applied_twice Imported.Original_LF__DOT__Basics_LF_Basics_identity__fn__applied__twice Original_LF__DOT__Basics_LF_Basics_identity__fn__applied__twice_iso := {}.