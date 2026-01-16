From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__U_in__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.__0__iso Isomorphisms.U_nat__mul__iso Isomorphisms.U_s__iso Isomorphisms.ex__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_In__example__2 : forall x : imported_nat,
  imported_Original_LF__DOT__Logic_LF_Logic_In x
    (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S imported_0))
       (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S (imported_S (iterate1 imported_S 1%nat imported_0)))) (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat))) ->
  imported_ex (fun H : imported_nat => imported_Corelib_Init_Logic_eq x (imported_Nat_mul (imported_S (imported_S imported_0)) H)) := Imported.Original_LF__DOT__Logic_LF_Logic_In__example__2.
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_In__example__2_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2)
    (x3 : Original.LF_DOT_Logic.LF.Logic.In x1 (Original.LF_DOT_Poly.LF.Poly.cons 2 (Original.LF_DOT_Poly.LF.Poly.cons 4 Original.LF_DOT_Poly.LF.Poly.nil)))
    (x4 : imported_Original_LF__DOT__Logic_LF_Logic_In x2
            (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S imported_0))
               (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S (imported_S (iterate1 imported_S 1%nat imported_0)))) (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat)))),
  rel_iso
    (relax_Iso_Ts_Ps
       (Original_LF__DOT__Logic_LF_Logic_In_iso hx
          (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso _0_iso))
             (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 1%nat 0%nat imported_0 _0_iso)))) (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso)))))
    x3 x4 ->
  rel_iso
    (relax_Iso_Ts_Ps
       (ex_iso (fun n' : nat => x1 = 2 * n') (fun H : imported_nat => imported_Corelib_Init_Logic_eq x2 (imported_Nat_mul (imported_S (imported_S imported_0)) H))
          (fun (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6) => Corelib_Init_Logic_eq_iso hx (Nat_mul_iso (S_iso (S_iso _0_iso)) hx1))))
    (Original.LF_DOT_Logic.LF.Logic.In_example_2 x1 x3) (imported_Original_LF__DOT__Logic_LF_Logic_In__example__2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.In_example_2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_In__example__2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.In_example_2 Original_LF__DOT__Logic_LF_Logic_In__example__2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.In_example_2 Imported.Original_LF__DOT__Logic_LF_Logic_In__example__2 Original_LF__DOT__Logic_LF_Logic_In__example__2_iso := {}.