From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_perm3__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__cons__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3__refl : forall (x : Type) (x0 x1 x2 : x),
  imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3
    (imported_Original_LF__DOT__Poly_LF_Poly_cons x0
       (imported_Original_LF__DOT__Poly_LF_Poly_cons x1 (imported_Original_LF__DOT__Poly_LF_Poly_cons x2 (imported_Original_LF__DOT__Poly_LF_Poly_nil x))))
    (imported_Original_LF__DOT__Poly_LF_Poly_cons x0
       (imported_Original_LF__DOT__Poly_LF_Poly_cons x1 (imported_Original_LF__DOT__Poly_LF_Poly_cons x2 (imported_Original_LF__DOT__Poly_LF_Poly_nil x)))) := Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3__refl.
Instance Original_LF__DOT__IndProp_LF_IndProp_Perm3__refl_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2) (hx0 : rel_iso hx x3 x4) (x5 : x1) (x6 : x2) (hx1 : rel_iso hx x5 x6) (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8),
  rel_iso
    (Original_LF__DOT__IndProp_LF_IndProp_Perm3_iso
       (Original_LF__DOT__Poly_LF_Poly_cons_iso hx0 (Original_LF__DOT__Poly_LF_Poly_cons_iso hx1 (Original_LF__DOT__Poly_LF_Poly_cons_iso hx2 (Original_LF__DOT__Poly_LF_Poly_nil_iso hx))))
       (Original_LF__DOT__Poly_LF_Poly_cons_iso hx0 (Original_LF__DOT__Poly_LF_Poly_cons_iso hx1 (Original_LF__DOT__Poly_LF_Poly_cons_iso hx2 (Original_LF__DOT__Poly_LF_Poly_nil_iso hx)))))
    (Original.LF_DOT_IndProp.LF.IndProp.Perm3_refl x1 x3 x5 x7) (imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3__refl x4 x6 x8).
Proof.
  intros. unfold imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3__refl.
  constructor. simpl. apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.Perm3_refl := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3__refl := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.Perm3_refl Original_LF__DOT__IndProp_LF_IndProp_Perm3__refl_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.Perm3_refl Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3__refl Original_LF__DOT__IndProp_LF_IndProp_Perm3__refl_iso := {}.