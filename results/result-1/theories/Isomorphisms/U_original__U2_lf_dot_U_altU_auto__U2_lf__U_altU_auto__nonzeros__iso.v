From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat -> imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat := Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros.

(* Helper lemma that the two functions commute with the isomorphism *)
Lemma nonzeros_commutes : forall (x1 : Original.LF_DOT_Poly.LF.Poly.list nat),
  IsomorphismDefinitions.eq 
    (to (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso) (Original.LF_DOT_AltAuto.LF.AltAuto.nonzeros x1))
    (Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros (to (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso) x1)).
Proof.
  fix IH 1.
  intro x1.
  destruct x1 as [| h t].
  { simpl. apply IsomorphismDefinitions.eq_refl. }
  { simpl.
    destruct h as [| h'].
    { simpl. apply IH. }
    { simpl.
      apply (IsoEq.f_equal2 (Imported.Original_LF__DOT__Poly_LF_Poly_list_cons _)).
      { apply IsomorphismDefinitions.eq_refl. }
      { apply IH. }
    }
  }
Qed.

Instance Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros_iso : forall (x1 : Original.LF_DOT_Poly.LF.Poly.list nat) (x2 : imported_Original_LF__DOT__Poly_LF_Poly_list imported_nat),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso) x1 x2 ->
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso nat_iso) (Original.LF_DOT_AltAuto.LF.AltAuto.nonzeros x1) (imported_Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros x2).
Proof.
  intros x1 x2 H.
  destruct H as [H].
  constructor.
  unfold imported_Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros.
  pose proof (nonzeros_commutes x1) as Hcomm.
  eapply IsoEq.eq_trans.
  { exact Hcomm. }
  { apply (IsoEq.f_equal Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros H). }
Defined.
Instance: KnownConstant Original.LF_DOT_AltAuto.LF.AltAuto.nonzeros := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_AltAuto.LF.AltAuto.nonzeros Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_AltAuto.LF.AltAuto.nonzeros Imported.Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros Original_LF__DOT__AltAuto_LF_AltAuto_nonzeros_iso := {}.