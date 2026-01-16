From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__U_in__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__map__iso Isomorphisms.__0__iso Isomorphisms.U_nat__mul__iso.

Monomorphic Definition imported_Original_LF__DOT__Logic_LF_Logic_lemma__application__ex : forall (x : imported_nat) (x0 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat),
  imported_Original_LF__DOT__Logic_LF_Logic_In x (imported_Original_LF__DOT__Poly_LF_Poly_map (fun x1 : imported_nat => imported_Nat_mul x1 imported_0) x0) ->
  imported_Corelib_Init_Logic_eq x imported_0 := (@Imported.Original_LF__DOT__Logic_LF_Logic_lemma__application__ex).
Monomorphic Instance Original_LF__DOT__Logic_LF_Logic_lemma__application__ex_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list nat) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat)
    (hx0 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso) x3 x4) (x5 : Original.LF_DOT_Logic.LF.Logic.In x1 (Original.LF_DOT_Poly.LF.Poly.map (fun m : nat => m * 0) x3))
    (x6 : imported_Original_LF__DOT__Logic_LF_Logic_In x2 (imported_Original_LF__DOT__Poly_LF_Poly_map (fun x : imported_nat => imported_Nat_mul x imported_0) x4)),
  rel_iso
    (Original_LF__DOT__Logic_LF_Logic_In_iso hx
       (Original_LF__DOT__Poly_LF_Poly_map_iso (fun m : nat => m * 0) (fun x : imported_nat => imported_Nat_mul x imported_0)
          (fun (x7 : nat) (x8 : imported_nat) (hx1 : rel_iso nat_iso x7 x8) => Nat_mul_iso hx1 _0_iso) hx0))
    x5 x6 ->
  rel_iso (Corelib_Init_Logic_eq_iso hx _0_iso) (Original.LF_DOT_Logic.LF.Logic.lemma_application_ex x5) (imported_Original_LF__DOT__Logic_LF_Logic_lemma__application__ex x6).
Admitted.
Instance: KnownConstant (@Original.LF_DOT_Logic.LF.Logic.lemma_application_ex) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Logic_LF_Logic_lemma__application__ex) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Logic.LF.Logic.lemma_application_ex) Original_LF__DOT__Logic_LF_Logic_lemma__application__ex_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Logic.LF.Logic.lemma_application_ex) (@Imported.Original_LF__DOT__Logic_LF_Logic_lemma__application__ex) Original_LF__DOT__Logic_LF_Logic_lemma__application__ex_iso := {}.