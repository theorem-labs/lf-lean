From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__constfun__iso Isomorphisms.__0__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__Poly_LF_Poly_constfun__example2 : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Poly_LF_Poly_constfun (imported_S (imported_S (imported_S (iterate1 imported_S 2 imported_0))))
       (imported_S (imported_S (imported_S (iterate1 imported_S 96 imported_0)))))
    (imported_S (imported_S (imported_S (iterate1 imported_S 2 imported_0)))) := Imported.Original_LF__DOT__Poly_LF_Poly_constfun__example2.
Monomorphic Instance Original_LF__DOT__Poly_LF_Poly_constfun__example2_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (unwrap_sprop
          (Original_LF__DOT__Poly_LF_Poly_constfun_iso nat_iso 5 (imported_S (imported_S (imported_S (iterate1 imported_S 2 imported_0))))
             {| unwrap_sprop := S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 2 O imported_0 _0_iso))) |} (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 96 O imported_0 _0_iso))))))
       (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 2 O imported_0 _0_iso)))))
    Original.LF_DOT_Poly.LF.Poly.constfun_example2 imported_Original_LF__DOT__Poly_LF_Poly_constfun__example2.
Admitted.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.constfun_example2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_constfun__example2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.constfun_example2 Original_LF__DOT__Poly_LF_Poly_constfun__example2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.constfun_example2 Imported.Original_LF__DOT__Poly_LF_Poly_constfun__example2 Original_LF__DOT__Poly_LF_Poly_constfun__example2_iso := {}.