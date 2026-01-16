From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.nat__iso.

Monomorphic Definition imported_Original_LF__DOT__Tactics_LF_Tactics_trans__eq__example'' : forall x x0 x1 x2 x3 x4 : imported_nat,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_cons x (imported_Original_LF__DOT__Poly_LF_Poly_cons x0 (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat)))
    (imported_Original_LF__DOT__Poly_LF_Poly_cons x1 (imported_Original_LF__DOT__Poly_LF_Poly_cons x2 (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat))) ->
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_cons x1 (imported_Original_LF__DOT__Poly_LF_Poly_cons x2 (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat)))
    (imported_Original_LF__DOT__Poly_LF_Poly_cons x3 (imported_Original_LF__DOT__Poly_LF_Poly_cons x4 (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat))) ->
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_cons x (imported_Original_LF__DOT__Poly_LF_Poly_cons x0 (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat)))
    (imported_Original_LF__DOT__Poly_LF_Poly_cons x3 (imported_Original_LF__DOT__Poly_LF_Poly_cons x4 (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat))) := Imported.Original_LF__DOT__Tactics_LF_Tactics_trans__eq__example''.
Monomorphic Instance Original_LF__DOT__Tactics_LF_Tactics_trans__eq__example''_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6)
    (x7 : nat) (x8 : imported_nat) (hx2 : rel_iso nat_iso x7 x8) (x9 : nat) (x10 : imported_nat) (hx3 : rel_iso nat_iso x9 x10) (x11 : nat) (x12 : imported_nat) (hx4 : rel_iso nat_iso x11 x12)
    (x13 : Original.LF_DOT_Poly.LF.Poly.cons x1 (Original.LF_DOT_Poly.LF.Poly.cons x3 Original.LF_DOT_Poly.LF.Poly.nil) =
           Original.LF_DOT_Poly.LF.Poly.cons x5 (Original.LF_DOT_Poly.LF.Poly.cons x7 Original.LF_DOT_Poly.LF.Poly.nil))
    (x14 : imported_Corelib_Init_Logic_eq
             (imported_Original_LF__DOT__Poly_LF_Poly_cons x2 (imported_Original_LF__DOT__Poly_LF_Poly_cons x4 (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat)))
             (imported_Original_LF__DOT__Poly_LF_Poly_cons x6 (imported_Original_LF__DOT__Poly_LF_Poly_cons x8 (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat)))),
  rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx (Original_LF__DOT__Poly_LF_Poly_cons_iso hx0 (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso)))
       (Original_LF__DOT__Poly_LF_Poly_cons_iso hx1 (Original_LF__DOT__Poly_LF_Poly_cons_iso hx2 (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso))))
    x13 x14 ->
  forall
    (x15 : Original.LF_DOT_Poly.LF.Poly.cons x5 (Original.LF_DOT_Poly.LF.Poly.cons x7 Original.LF_DOT_Poly.LF.Poly.nil) =
           Original.LF_DOT_Poly.LF.Poly.cons x9 (Original.LF_DOT_Poly.LF.Poly.cons x11 Original.LF_DOT_Poly.LF.Poly.nil))
    (x16 : imported_Corelib_Init_Logic_eq
             (imported_Original_LF__DOT__Poly_LF_Poly_cons x6 (imported_Original_LF__DOT__Poly_LF_Poly_cons x8 (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat)))
             (imported_Original_LF__DOT__Poly_LF_Poly_cons x10 (imported_Original_LF__DOT__Poly_LF_Poly_cons x12 (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat)))),
  rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx1 (Original_LF__DOT__Poly_LF_Poly_cons_iso hx2 (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso)))
       (Original_LF__DOT__Poly_LF_Poly_cons_iso hx3 (Original_LF__DOT__Poly_LF_Poly_cons_iso hx4 (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso))))
    x15 x16 ->
  rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx (Original_LF__DOT__Poly_LF_Poly_cons_iso hx0 (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso)))
       (Original_LF__DOT__Poly_LF_Poly_cons_iso hx3 (Original_LF__DOT__Poly_LF_Poly_cons_iso hx4 (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso))))
    (Original.LF_DOT_Tactics.LF.Tactics.trans_eq_example'' x1 x3 x5 x7 x9 x11 x13 x15) (imported_Original_LF__DOT__Tactics_LF_Tactics_trans__eq__example'' x14 x16).
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.trans_eq_example'' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_trans__eq__example'' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.trans_eq_example'' Original_LF__DOT__Tactics_LF_Tactics_trans__eq__example''_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.trans_eq_example'' Imported.Original_LF__DOT__Tactics_LF_Tactics_trans__eq__example'' Original_LF__DOT__Tactics_LF_Tactics_trans__eq__example''_iso := {}.