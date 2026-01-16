From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__pair__iso Isomorphisms.nat__iso.

Monomorphic Definition imported_Original_LF__DOT__Tactics_LF_Tactics_silly2a : forall x x0 : imported_nat,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_pair x x) (imported_Original_LF__DOT__Poly_LF_Poly_pair x0 x0) ->
  (forall x1 x2 : imported_nat,
   imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_pair x1 x1) (imported_Original_LF__DOT__Poly_LF_Poly_pair x2 x2) ->
   imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_cons x1 (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat))
     (imported_Original_LF__DOT__Poly_LF_Poly_cons x2 (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat))) ->
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_cons x (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat))
    (imported_Original_LF__DOT__Poly_LF_Poly_cons x0 (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat)) := Imported.Original_LF__DOT__Tactics_LF_Tactics_silly2a.
Monomorphic Instance Original_LF__DOT__Tactics_LF_Tactics_silly2a_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4)
    (x5 : Original.LF_DOT_Poly.LF.Poly.pair x1 x1 = Original.LF_DOT_Poly.LF.Poly.pair x3 x3)
    (x6 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_pair x2 x2) (imported_Original_LF__DOT__Poly_LF_Poly_pair x4 x4)),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Poly_LF_Poly_pair_iso hx hx) (Original_LF__DOT__Poly_LF_Poly_pair_iso hx0 hx0)) x5 x6 ->
  forall
    (x7 : forall q r : nat,
          Original.LF_DOT_Poly.LF.Poly.pair q q = Original.LF_DOT_Poly.LF.Poly.pair r r ->
          Original.LF_DOT_Poly.LF.Poly.cons q Original.LF_DOT_Poly.LF.Poly.nil = Original.LF_DOT_Poly.LF.Poly.cons r Original.LF_DOT_Poly.LF.Poly.nil)
    (x8 : forall x x0 : imported_nat,
          imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_pair x x) (imported_Original_LF__DOT__Poly_LF_Poly_pair x0 x0) ->
          imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_cons x (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat))
            (imported_Original_LF__DOT__Poly_LF_Poly_cons x0 (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat))),
  (forall (x9 : nat) (x10 : imported_nat) (hx2 : rel_iso nat_iso x9 x10) (x11 : nat) (x12 : imported_nat) (hx3 : rel_iso nat_iso x11 x12)
     (x13 : Original.LF_DOT_Poly.LF.Poly.pair x9 x9 = Original.LF_DOT_Poly.LF.Poly.pair x11 x11)
     (x14 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_pair x10 x10) (imported_Original_LF__DOT__Poly_LF_Poly_pair x12 x12)),
   rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Poly_LF_Poly_pair_iso hx2 hx2) (Original_LF__DOT__Poly_LF_Poly_pair_iso hx3 hx3)) x13 x14 ->
   rel_iso
     (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx2 (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso))
        (Original_LF__DOT__Poly_LF_Poly_cons_iso hx3 (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso)))
     (x7 x9 x11 x13) (x8 x10 x12 x14)) ->
  rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Poly_LF_Poly_cons_iso hx (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso))
       (Original_LF__DOT__Poly_LF_Poly_cons_iso hx0 (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso)))
    (Original.LF_DOT_Tactics.LF.Tactics.silly2a x1 x3 x5 x7) (imported_Original_LF__DOT__Tactics_LF_Tactics_silly2a x6 x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.silly2a := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_silly2a := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.silly2a Original_LF__DOT__Tactics_LF_Tactics_silly2a_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.silly2a Imported.Original_LF__DOT__Tactics_LF_Tactics_silly2a Original_LF__DOT__Tactics_LF_Tactics_silly2a_iso := {}.