From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__fold__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__mult__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__Poly_LF_Poly_fold__example2 : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Poly_LF_Poly_fold (fun x x0 : imported_nat => imported_Original_LF__DOT__Basics_LF_Basics_mult x x0)
       (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S imported_0)
          (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S imported_0))
             (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S (imported_S imported_0)))
                (imported_Original_LF__DOT__Poly_LF_Poly_cons (imported_S (imported_S (imported_S (iterate1 imported_S (1)%nat imported_0)))) (imported_Original_LF__DOT__Poly_LF_Poly_nil imported_nat)))))
       (imported_S imported_0))
    (imported_S (imported_S (imported_S (iterate1 imported_S (21)%nat imported_0)))) := Imported.Original_LF__DOT__Poly_LF_Poly_fold__example2.
Monomorphic Instance Original_LF__DOT__Poly_LF_Poly_fold__example2_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (unwrap_sprop
          (Original_LF__DOT__Poly_LF_Poly_fold_iso nat_iso Original.LF_DOT_Basics.LF.Basics.mult (fun x x0 : imported_nat => imported_Original_LF__DOT__Basics_LF_Basics_mult x x0)
             (fun (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso_sort nat_iso x3 x4) =>
              {| unwrap_sprop := Original_LF__DOT__Basics_LF_Basics_mult_iso hx (unwrap_sprop hx0) |})
             (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso _0_iso)
                (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso _0_iso))
                   (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso (S_iso _0_iso)))
                      (Original_LF__DOT__Poly_LF_Poly_cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso (1)%nat (0)%nat imported_0 _0_iso)))) (Original_LF__DOT__Poly_LF_Poly_nil_iso nat_iso)))))
             1 (imported_S imported_0) {| unwrap_sprop := S_iso _0_iso |}))
       (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso (21)%nat (0)%nat imported_0 _0_iso)))))
    Original.LF_DOT_Poly.LF.Poly.fold_example2 imported_Original_LF__DOT__Poly_LF_Poly_fold__example2.
Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.fold_example2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_fold__example2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.fold_example2 Original_LF__DOT__Poly_LF_Poly_fold__example2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.fold_example2 Imported.Original_LF__DOT__Poly_LF_Poly_fold__example2 Original_LF__DOT__Poly_LF_Poly_fold__example2_iso := {}.