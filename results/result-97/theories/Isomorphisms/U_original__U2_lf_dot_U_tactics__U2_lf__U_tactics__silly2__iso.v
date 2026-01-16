From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Tactics_LF_Tactics_silly2 : forall x x0 x1 x2 : imported_nat,
  imported_Corelib_Init_Logic_eq x x0 ->
  (imported_Corelib_Init_Logic_eq x x0 ->
   imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_cons x (imported_Original_LF__DOT__Poly_LF_Poly_cons x1 (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat)))
     (imported_Original_LF__DOT__Poly_LF_Poly_cons x0 (imported_Original_LF__DOT__Poly_LF_Poly_cons x2 (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat)))) ->
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_cons x (imported_Original_LF__DOT__Poly_LF_Poly_cons x1 (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat)))
    (imported_Original_LF__DOT__Poly_LF_Poly_cons x0 (imported_Original_LF__DOT__Poly_LF_Poly_cons x2 (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat))) := Imported.Original_LF__DOT__Tactics_LF_Tactics_silly2.
Instance Original_LF__DOT__Tactics_LF_Tactics_silly2_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6)
    (x7 : nat) (x8 : imported_nat) (hx2 : rel_iso nat_iso x7 x8) (x9 : x1 = x3) (x10 : imported_Corelib_Init_Logic_eq x2 x4),
  rel_iso (Corelib_Init_Logic_eq_iso hx hx0) x9 x10 ->
  forall
    (x11 : x1 = x3 ->
           Original.LF_DOT_Poly.LF.Poly.cons x1 (Original.LF_DOT_Poly.LF.Poly.cons x5 Original.LF_DOT_Poly.LF.Poly.nil) =
           Original.LF_DOT_Poly.LF.Poly.cons x3 (Original.LF_DOT_Poly.LF.Poly.cons x7 Original.LF_DOT_Poly.LF.Poly.nil))
    (x12 : imported_Corelib_Init_Logic_eq x2 x4 ->
           imported_Corelib_Init_Logic_eq
             (imported_Original_LF__DOT__Poly_LF_Poly_cons x2 (imported_Original_LF__DOT__Poly_LF_Poly_cons x6 (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat)))
             (imported_Original_LF__DOT__Poly_LF_Poly_cons x4 (imported_Original_LF__DOT__Poly_LF_Poly_cons x8 (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat)))),
  (forall (x13 : x1 = x3) (x14 : imported_Corelib_Init_Logic_eq x2 x4),
   rel_iso (Corelib_Init_Logic_eq_iso hx hx0) x13 x14 ->
   rel_iso
     (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx (Original_LF__DOT__Poly_LF_Poly_cons_iso hx1 (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso)))
        (Original_LF__DOT__Poly_LF_Poly_cons_iso hx0 (Original_LF__DOT__Poly_LF_Poly_cons_iso hx2 (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso))))
     (x11 x13) (x12 x14)) ->
  rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx (Original_LF__DOT__Poly_LF_Poly_cons_iso hx1 (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso)))
       (Original_LF__DOT__Poly_LF_Poly_cons_iso hx0 (Original_LF__DOT__Poly_LF_Poly_cons_iso hx2 (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso))))
    (Original.LF_DOT_Tactics.LF.Tactics.silly2 x1 x3 x5 x7 x9 x11) (imported_Original_LF__DOT__Tactics_LF_Tactics_silly2 x10 x12).
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.silly2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_silly2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.silly2 Original_LF__DOT__Tactics_LF_Tactics_silly2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.silly2 Imported.Original_LF__DOT__Tactics_LF_Tactics_silly2 Original_LF__DOT__Tactics_LF_Tactics_silly2_iso := {}.