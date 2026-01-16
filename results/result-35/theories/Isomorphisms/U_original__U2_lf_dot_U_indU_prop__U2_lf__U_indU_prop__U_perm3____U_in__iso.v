From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_perm3U_reminder__U_perm3__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__U_in__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3__In : forall (x : Type) (x0 : x) (x1 x2 : imported_Original_LF__DOT__Poly_LF_Poly_list x),
  imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3 x1 x2 -> imported_Original_LF__DOT__Logic_LF_Logic_In x0 x1 -> imported_Original_LF__DOT__Logic_LF_Logic_In x0 x2 := Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3__In.
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_Perm3__In_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2) (hx0 : rel_iso hx x3 x4) (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx1 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6) (x7 : Original.LF_DOT_Poly.LF.Poly.list x1) (x8 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx2 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x7 x8) (x9 : Original.LF_DOT_IndProp.LF.IndProp.Perm3Reminder.Perm3 x5 x7)
    (x10 : imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3 x6 x8),
  rel_iso (Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3_iso hx1 hx2) x9 x10 ->
  forall (x11 : Original.LF_DOT_Logic.LF.Logic.In x3 x5) (x12 : imported_Original_LF__DOT__Logic_LF_Logic_In x4 x6),
  rel_iso (Original_LF__DOT__Logic_LF_Logic_In_iso hx0 hx1) x11 x12 ->
  rel_iso (Original_LF__DOT__Logic_LF_Logic_In_iso hx0 hx2) (Original.LF_DOT_IndProp.LF.IndProp.Perm3_In x1 x3 x5 x7 x9 x11) (imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3__In x10 x12).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.Perm3_In := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3__In := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.Perm3_In Original_LF__DOT__IndProp_LF_IndProp_Perm3__In_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.Perm3_In Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3__In Original_LF__DOT__IndProp_LF_IndProp_Perm3__In_iso := {}.