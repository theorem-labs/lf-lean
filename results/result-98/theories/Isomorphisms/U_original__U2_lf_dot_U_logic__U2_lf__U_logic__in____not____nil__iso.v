From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__U_in__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.U_logic__not__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_in__not__nil : forall (x : Type) (x0 : x) (x1 : imported_Original_LF__DOT__Poly_LF_Poly_list x),
  imported_Original_LF__DOT__Logic_LF_Logic_In x0 x1 -> imported_Corelib_Init_Logic_eq x1 (imported_Original_LF__DOT__Poly_LF_Poly_nil x) -> imported_False := Imported.Original_LF__DOT__Logic_LF_Logic_in__not__nil.
Instance Original_LF__DOT__Logic_LF_Logic_in__not__nil_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2) (hx0 : rel_iso hx x3 x4) (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx1 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6) (x7 : Original.LF_DOT_Logic.LF.Logic.In x3 x5) (x8 : imported_Original_LF__DOT__Logic_LF_Logic_In x4 x6),
  rel_iso (Original_LF__DOT__Logic_LF_Logic_In_iso hx0 hx1) x7 x8 ->
  forall (x9 : x5 = Original.LF_DOT_Poly.LF.Poly.nil) (x10 : imported_Corelib_Init_Logic_eq x6 (imported_Original_LF__DOT__Poly_LF_Poly_nil x2)),
  rel_iso (Corelib_Init_Logic_eq_iso hx1 (Original_LF__DOT__Poly_LF_Poly_nil_iso hx)) x9 x10 ->
  rel_iso False_iso (Original.LF_DOT_Logic.LF.Logic.in_not_nil x1 x3 x5 x7 x9) (imported_Original_LF__DOT__Logic_LF_Logic_in__not__nil x8 x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.in_not_nil := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_in__not__nil := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.in_not_nil Original_LF__DOT__Logic_LF_Logic_in__not__nil_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.in_not_nil Imported.Original_LF__DOT__Logic_LF_Logic_in__not__nil Original_LF__DOT__Logic_LF_Logic_in__not__nil_iso := {}.