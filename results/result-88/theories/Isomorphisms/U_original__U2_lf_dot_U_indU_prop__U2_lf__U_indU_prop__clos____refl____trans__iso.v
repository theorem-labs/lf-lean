From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* Typeclasses Opaque rel_iso. *) *) (* for speed *)


Definition imported_Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans : forall x : Type, (x -> x -> SProp) -> x -> x -> SProp := (@Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans).

(* Helper to convert between Original and Imported clos_refl_trans *)
Section CRT_Iso.
  Variable X : Type.
  Variable R1 : X -> X -> Prop.
  Variable R2 : X -> X -> SProp.
  (* Riso says that R1 and R2 are related by the Prop-SProp isomorphism *)
  Variable Riso : forall (a b : X), Iso (R1 a b) (R2 a b).

  (* Forward direction: Original -> Imported *)
  Definition crt_to : forall (a : X) (b : X),
      Original.LF_DOT_IndProp.LF.IndProp.clos_refl_trans R1 a b ->
      Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans X R2 a b.
  Proof.
    fix IH 3.
    intros a b H.
    destruct H as [x y Hxy | x | x y z Hxy Hyz].
    - (* rt_step *)
      apply Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans_rt_step.
      exact (to (Riso x y) Hxy).
    - (* rt_refl *)
      apply Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans_rt_refl.
    - (* rt_trans *)
      apply (Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans_rt_trans X R2 x y z).
      + exact (IH _ _ Hxy).
      + exact (IH _ _ Hyz).
  Defined.

  (* Backward direction: Imported.crt -> SInhabited (Original.crt) *)
  (* We can eliminate from SProp to SProp *)
  (* Use a term-level fixpoint definition *)
  Let crt_from_S_aux := 
    fix IH (a : X) (b : X) (H : Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans X R2 a b) {struct H}
      : SInhabited (Original.LF_DOT_IndProp.LF.IndProp.clos_refl_trans R1 a b) :=
      match H in Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans _ _ a' b' 
            return SInhabited (Original.LF_DOT_IndProp.LF.IndProp.clos_refl_trans R1 a' b')
      with
      | Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans_rt_step _ _ x y Hxy =>
          sinhabits (Original.LF_DOT_IndProp.LF.IndProp.rt_step R1 x y (from (Riso x y) Hxy))
      | Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans_rt_refl _ _ x =>
          sinhabits (Original.LF_DOT_IndProp.LF.IndProp.rt_refl R1 x)
      | Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans_rt_trans _ _ x y z Hxy Hyz =>
          sinhabits (Original.LF_DOT_IndProp.LF.IndProp.rt_trans R1 x y z 
                       (sinhabitant (IH x y Hxy))
                       (sinhabitant (IH y z Hyz)))
      end.

  Definition crt_from_S : forall (a b : X),
      Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans X R2 a b ->
      SInhabited (Original.LF_DOT_IndProp.LF.IndProp.clos_refl_trans R1 a b) :=
    crt_from_S_aux.

  (* Now the backward direction from Imported to Original *)
  Definition crt_from (a b : X)
      (H : Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans X R2 a b)
      : Original.LF_DOT_IndProp.LF.IndProp.clos_refl_trans R1 a b :=
    sinhabitant (@crt_from_S a b H).

  (* Build the isomorphism *)
  Definition crt_iso : forall (a b : X),
      Iso (Original.LF_DOT_IndProp.LF.IndProp.clos_refl_trans R1 a b)
          (Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans X R2 a b).
  Proof.
    intros a b.
    apply Build_Iso with (to := @crt_to a b) (from := @crt_from a b).
    - (* to_from : to (from x) = x, this is SProp equality so trivial *)
      intro x. apply IsomorphismDefinitions.eq_refl.
    - (* from_to : from (to x) = x, use proof irrelevance for Prop *)
      intro x.
      apply seq_of_peq_t.
      apply Stdlib.Logic.ProofIrrelevance.proof_irrelevance.
  Defined.

End CRT_Iso.

(* General isomorphism: directly build the maps with explicit transport *)
Section CRT_Iso_General.
  Variable X1 X2 : Type.
  Variable hx : Iso X1 X2.
  Variable R1 : X1 -> X1 -> Prop.
  Variable R2 : X2 -> X2 -> SProp.
  Variable Riso : forall (a1 : X1) (a2 : X2), rel_iso hx a1 a2 -> 
                  forall (b1 : X1) (b2 : X2), rel_iso hx b1 b2 -> 
                  Iso (R1 a1 b1) (R2 a2 b2).

  (* Forward: Original.crt R1 a b -> Imported.crt X2 R2 (to hx a) (to hx b) *)
  Definition crt_to_gen : forall (a b : X1),
      Original.LF_DOT_IndProp.LF.IndProp.clos_refl_trans R1 a b ->
      Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans X2 R2 (to hx a) (to hx b).
  Proof.
    fix IH 3.
    intros a b H.
    destruct H as [x y Hxy | x | x y z Hxy Hyz].
    - (* rt_step *)
      apply Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans_rt_step.
      apply (to (@Riso x (to hx x) IsomorphismDefinitions.eq_refl 
                        y (to hx y) IsomorphismDefinitions.eq_refl)).
      exact Hxy.
    - (* rt_refl *)
      apply Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans_rt_refl.
    - (* rt_trans *)
      apply (Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans_rt_trans X2 R2 (to hx x) (to hx y) (to hx z)).
      + exact (IH _ _ Hxy).
      + exact (IH _ _ Hyz).
  Defined.

  (* Backward: Imported.crt X2 R2 a2 b2 -> SInhabited (Original.crt R1 (from hx a2) (from hx b2)) *)
  Let crt_from_gen_S_aux :=
    fix IH (a : X2) (b : X2) (H : Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans X2 R2 a b) {struct H}
      : SInhabited (Original.LF_DOT_IndProp.LF.IndProp.clos_refl_trans R1 (from hx a) (from hx b)) :=
      match H in Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans _ _ a' b' 
            return SInhabited (Original.LF_DOT_IndProp.LF.IndProp.clos_refl_trans R1 (from hx a') (from hx b'))
      with
      | Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans_rt_step _ _ x y Hxy =>
          sinhabits (Original.LF_DOT_IndProp.LF.IndProp.rt_step R1 (from hx x) (from hx y) 
                       (from (@Riso (from hx x) x (to_from hx x) (from hx y) y (to_from hx y)) Hxy))
      | Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans_rt_refl _ _ x =>
          sinhabits (Original.LF_DOT_IndProp.LF.IndProp.rt_refl R1 (from hx x))
      | Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans_rt_trans _ _ x y z Hxy Hyz =>
          sinhabits (Original.LF_DOT_IndProp.LF.IndProp.rt_trans R1 (from hx x) (from hx y) (from hx z) 
                       (sinhabitant (IH x y Hxy))
                       (sinhabitant (IH y z Hyz)))
      end.

  Definition crt_from_gen_S : forall (a b : X2),
      Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans X2 R2 a b ->
      SInhabited (Original.LF_DOT_IndProp.LF.IndProp.clos_refl_trans R1 (from hx a) (from hx b)) :=
    crt_from_gen_S_aux.

  Definition crt_from_gen (a b : X2)
      (H : Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans X2 R2 a b)
      : Original.LF_DOT_IndProp.LF.IndProp.clos_refl_trans R1 (from hx a) (from hx b) :=
    sinhabitant (@crt_from_gen_S a b H).

  (* Build the general isomorphism *)
  Definition crt_iso_general (a1 : X1) (a2 : X2) (Ha : rel_iso hx a1 a2)
                             (b1 : X1) (b2 : X2) (Hb : rel_iso hx b1 b2)
      : Iso (Original.LF_DOT_IndProp.LF.IndProp.clos_refl_trans R1 a1 b1)
            (Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans X2 R2 a2 b2).
  Proof.
    destruct Ha as [Ha], Hb as [Hb]. simpl in *.
    destruct Ha, Hb.
    (* Now a2 = to hx a1 and b2 = to hx b1 *)
    apply Build_Iso with (to := @crt_to_gen a1 b1) 
                         (from := fun h => 
                           match from_to hx a1 in IsomorphismDefinitions.eq _ a1' return Original.LF_DOT_IndProp.LF.IndProp.clos_refl_trans R1 a1' b1 with
                           | IsomorphismDefinitions.eq_refl =>
                             match from_to hx b1 in IsomorphismDefinitions.eq _ b1' return Original.LF_DOT_IndProp.LF.IndProp.clos_refl_trans R1 (from hx (to hx a1)) b1' with
                             | IsomorphismDefinitions.eq_refl => @crt_from_gen (to hx a1) (to hx b1) h
                             end
                           end).
    - intro x. apply IsomorphismDefinitions.eq_refl.
    - intro x. apply seq_of_peq_t.
      apply Stdlib.Logic.ProofIrrelevance.proof_irrelevance.
  Defined.

End CRT_Iso_General.

Instance Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1 -> x1 -> Prop) (x4 : x2 -> x2 -> SProp),
  (forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> Iso (x3 x5 x7) (x4 x6 x8)) ->
  forall (x5 : x1) (x6 : x2),
  rel_iso hx x5 x6 ->
  forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> Iso (Original.LF_DOT_IndProp.LF.IndProp.clos_refl_trans x3 x5 x7) (imported_Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans x4 x6 x8).
Proof.
  intros x1 x2 hx x3 x4 Riso a1 a2 Ha b1 b2 Hb.
  exact (@crt_iso_general x1 x2 hx x3 x4 Riso a1 a2 Ha b1 b2 Hb).
Defined.

Instance: KnownConstant (@Original.LF_DOT_IndProp.LF.IndProp.clos_refl_trans) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_IndProp.LF.IndProp.clos_refl_trans) Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_IndProp.LF.IndProp.clos_refl_trans) (@Imported.Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans) Original_LF__DOT__IndProp_LF_IndProp_clos__refl__trans_iso := {}.