From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_pumping__napp__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__app__iso Isomorphisms.U_nat__add__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp__plus : forall (x : Type) (x0 x1 : imported_nat) (x2 : imported_Original_LF__DOT__Poly_LF_Poly_list x),
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp (imported_Nat_add x0 x1) x2)
    (imported_Original_LF__DOT__Poly_LF_Poly_app (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp x0 x2) (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp x1 x2)).
Proof.
  (* This is the axiom from Lean that corresponds to the Admitted in Rocq *)
  intros x n m l.
  unfold imported_Corelib_Init_Logic_eq, imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp, imported_Nat_add, imported_Original_LF__DOT__Poly_LF_Poly_app.
  (* The imported axiom gives us this in Type equality, but we need SProp equality *)
  (* Imported.Corelib_Init_Logic_eq is in Type, but imported_Corelib_Init_Logic_eq (= IsomorphismDefinitions.eq) is in SProp *)
  pose proof (Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp__plus x n m l) as H.
  (* H : Imported.Corelib_Init_Logic_eq _ _ (in SProp) *)
  destruct H.
  apply Imported.Corelib_Init_Logic_eq_refl.
Defined.

Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp__plus_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : nat) (x6 : imported_nat) (hx1 : rel_iso nat_iso x5 x6)
    (x7 : Original.LF_DOT_Poly.LF.Poly.list x1) (x8 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx2 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x7 x8),
  rel_iso
    (relax_Iso_Ts_Ps
       (Corelib_Init_Logic_eq_iso (Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp_iso (Nat_add_iso hx0 hx1) hx2)
          (Original_LF__DOT__Poly_LF_Poly_app_iso (Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp_iso hx0 hx2) (Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp_iso hx1 hx2))))
    (Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp_plus x1 x3 x5 x7) (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp__plus x4 x6 x8).
Proof.
  intros.
  (* The goal is to show that applying to to the original proof gives the imported proof *)
  (* Since both proofs are in proof-irrelevant sorts (Prop vs SProp), this is automatic *)
  unfold rel_iso, relax_Iso_Ts_Ps.
  simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp_plus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp__plus := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp_plus Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp__plus_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp_plus Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp__plus Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp__plus_iso := {}.
