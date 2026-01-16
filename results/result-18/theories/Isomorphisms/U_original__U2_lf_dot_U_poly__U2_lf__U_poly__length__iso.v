From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_length : forall x : Type, imported_Original_LF__DOT__Poly_LF_Poly_list x -> imported_nat := (@Imported.Original_LF__DOT__Poly_LF_Poly_length).
Instance Original_LF__DOT__Poly_LF_Poly_length_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3 x4 -> rel_iso nat_iso (Original.LF_DOT_Poly.LF.Poly.length x3) (imported_Original_LF__DOT__Poly_LF_Poly_length x4).
Proof.
  intros x1 x2 hx.
  fix IH 1.
  intros x3 x4 Hx.
  destruct Hx as [Hx'].
  unfold imported_Original_LF__DOT__Poly_LF_Poly_length.
  constructor. simpl in *.
  destruct x3 as [| h t].
  - (* nil case *)
    apply (@IsoEq.eq_srect_nodep _ (Imported.Original_LF__DOT__Poly_LF_Poly_list_nil x2) (fun y => IsomorphismDefinitions.eq Imported.nat_O (Imported.Original_LF__DOT__Poly_LF_Poly_length x2 y)) IsomorphismDefinitions.eq_refl x4 Hx').
  - (* cons case *)
    simpl.
    apply (@IsoEq.eq_srect_nodep _ (Imported.Original_LF__DOT__Poly_LF_Poly_list_cons x2 (to hx h) (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) t)) (fun y => IsomorphismDefinitions.eq (Imported.nat_S (to nat_iso (Original.LF_DOT_Poly.LF.Poly.length t))) (Imported.Original_LF__DOT__Poly_LF_Poly_length x2 y))).
    + simpl.
      apply (IsoEq.f_equal Imported.nat_S).
      destruct (IH t (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) t) (Build_rel_iso IsomorphismDefinitions.eq_refl)) as [IHres].
      exact IHres.
    + exact Hx'.
Defined.
Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.length) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Poly_LF_Poly_length) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.length) Original_LF__DOT__Poly_LF_Poly_length_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.length) (@Imported.Original_LF__DOT__Poly_LF_Poly_length) Original_LF__DOT__Poly_LF_Poly_length_iso := {}.