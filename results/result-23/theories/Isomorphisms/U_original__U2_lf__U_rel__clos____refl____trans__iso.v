From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf__U_rel__relation__iso.

Definition imported_Original_LF_Rel_clos__refl__trans : forall x : Type, (x -> x -> SProp) -> x -> x -> SProp := (@Imported.Original_LF_Rel_clos__refl__trans).

(* Forward direction: Original clos_refl_trans -> Imported *)
(* Use a simpler approach: first convert using canonical a2 = to hx a1 *)
Definition clos_refl_trans_to_imported_core {X1 X2 : Type} {hx : Iso X1 X2}
  {R1 : X1 -> X1 -> Prop} {R2 : X2 -> X2 -> SProp}
  (R_iso : forall (a1 : X1) (a2 : X2) (_ : rel_iso hx a1 a2) (b1 : X1) (b2 : X2) (_ : rel_iso hx b1 b2), Iso (R1 a1 b1) (R2 a2 b2))
  (a1 b1 : X1)
  (H : Original.LF.Rel.clos_refl_trans R1 a1 b1)
  : Imported.Original_LF_Rel_clos__refl__trans X2 R2 (to hx a1) (to hx b1).
Proof.
  induction H as [x y Rxy | x | x y z Hxy IHxy Hyz IHyz]; [
    refine (Imported.Original_LF_Rel_clos__refl__trans_rt_step X2 R2 (to hx x) (to hx y) _);
    pose proof (R_iso x (to hx x) IsomorphismDefinitions.eq_refl y (to hx y) IsomorphismDefinitions.eq_refl) as Riso;
    exact (Riso Rxy)
  | apply Imported.Original_LF_Rel_clos__refl__trans_rt_refl
  | exact (Imported.Original_LF_Rel_clos__refl__trans_rt_trans _ _ _ _ _ IHxy IHyz)
  ].
Defined.

Definition clos_refl_trans_to_imported {X1 X2 : Type} {hx : Iso X1 X2}
  {R1 : X1 -> X1 -> Prop} {R2 : X2 -> X2 -> SProp}
  (R_iso : forall (a1 : X1) (a2 : X2) (_ : rel_iso hx a1 a2) (b1 : X1) (b2 : X2) (_ : rel_iso hx b1 b2), Iso (R1 a1 b1) (R2 a2 b2))
  (a1 : X1) (a2 : X2) (Ha : rel_iso hx a1 a2)
  (b1 : X1) (b2 : X2) (Hb : rel_iso hx b1 b2)
  (H : Original.LF.Rel.clos_refl_trans R1 a1 b1)
  : Imported.Original_LF_Rel_clos__refl__trans X2 R2 a2 b2.
Proof.
  pose proof (eq_of_seq (proj_rel_iso Ha)) as Ha_eq.
  pose proof (eq_of_seq (proj_rel_iso Hb)) as Hb_eq.
  subst a2 b2.
  exact (clos_refl_trans_to_imported_core R_iso H).
Defined.

(* Backward direction: Imported clos_refl_trans -> Original *)
(* Use the sind eliminator to produce SInhabited, then extract with sinhabitant axiom *)
Definition clos_refl_trans_from_imported_sinhabited {X1 X2 : Type} {hx : Iso X1 X2}
  {R1 : X1 -> X1 -> Prop} {R2 : X2 -> X2 -> SProp}
  (R_iso : forall (a1 : X1) (a2 : X2) (_ : rel_iso hx a1 a2) (b1 : X1) (b2 : X2) (_ : rel_iso hx b1 b2), Iso (R1 a1 b1) (R2 a2 b2))
  (a2 : X2) (b2 : X2)
  (H : Imported.Original_LF_Rel_clos__refl__trans X2 R2 a2 b2)
  : SInhabited (Original.LF.Rel.clos_refl_trans R1 (from hx a2) (from hx b2)).
Proof.
  apply (Imported.Original_LF_Rel_clos__refl__trans_sind X2 R2 
    (fun (x y : X2) _ => SInhabited (Original.LF.Rel.clos_refl_trans R1 (from hx x) (from hx y))));
  [ intros x y Rxy; apply sinhabits; apply Original.LF.Rel.rt_step;
    pose proof (R_iso (from hx x) x (to_from hx x) (from hx y) y (to_from hx y)) as Riso;
    exact (from Riso Rxy)
  | intros x; apply sinhabits; apply Original.LF.Rel.rt_refl
  | intros x y z Hxy IHxy Hyz IHyz; apply sinhabits;
    exact (Original.LF.Rel.rt_trans _ _ _ _ (sinhabitant IHxy) (sinhabitant IHyz))
  | exact H
  ].
Defined.

Definition clos_refl_trans_from_imported {X1 X2 : Type} {hx : Iso X1 X2}
  {R1 : X1 -> X1 -> Prop} {R2 : X2 -> X2 -> SProp}
  (R_iso : forall (a1 : X1) (a2 : X2) (_ : rel_iso hx a1 a2) (b1 : X1) (b2 : X2) (_ : rel_iso hx b1 b2), Iso (R1 a1 b1) (R2 a2 b2))
  (a2 : X2) (b2 : X2)
  (H : Imported.Original_LF_Rel_clos__refl__trans X2 R2 a2 b2)
  : Original.LF.Rel.clos_refl_trans R1 (from hx a2) (from hx b2) :=
  sinhabitant (@clos_refl_trans_from_imported_sinhabited X1 X2 hx R1 R2 R_iso a2 b2 H).

Instance Original_LF_Rel_clos__refl__trans_iso : (forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF.Rel.relation x1) (x4 : forall (_ : x2) (_ : x2), SProp)
     (_ : forall (x5 : x1) (x6 : x2) (_ : @rel_iso x1 x2 hx x5 x6) (x7 : x1) (x8 : x2) (_ : @rel_iso x1 x2 hx x7 x8), Iso (x3 x5 x7) (x4 x6 x8)) (x5 : x1) (x6 : x2) (_ : @rel_iso x1 x2 hx x5 x6)
     (x7 : x1) (x8 : x2) (_ : @rel_iso x1 x2 hx x7 x8),
   Iso (@Original.LF.Rel.clos_refl_trans x1 x3 x5 x7) (@imported_Original_LF_Rel_clos__refl__trans x2 x4 x6 x8)).
Proof.
  intros X1 X2 hx R1 R2 R_iso a1 a2 Ha b1 b2 Hb.
  unfold imported_Original_LF_Rel_clos__refl__trans.
  pose proof (eq_of_seq (proj_rel_iso Ha)) as Ha_eq.
  pose proof (eq_of_seq (proj_rel_iso Hb)) as Hb_eq.
  subst a2 b2.
  unshelve refine {|
    to := fun H => clos_refl_trans_to_imported_core R_iso H;
    from := fun H => _
  |}.
  - (* from *)
    pose (@clos_refl_trans_from_imported X1 X2 hx R1 R2 R_iso (to hx a1) (to hx b1) H) as H'.
    rewrite (from_to hx a1) in H'.
    rewrite (from_to hx b1) in H'.
    exact H'.
  - (* to_from: SProp, trivial *)
    intros. apply IsomorphismDefinitions.eq_refl.
  - (* from_to: Prop, use proof irrelevance *)
    intros. apply seq_of_eq. apply Stdlib.Logic.ProofIrrelevance.proof_irrelevance.
Defined.
Instance: KnownConstant (@Original.LF.Rel.clos_refl_trans) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF_Rel_clos__refl__trans) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF.Rel.clos_refl_trans) Original_LF_Rel_clos__refl__trans_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF.Rel.clos_refl_trans) (@Imported.Original_LF_Rel_clos__refl__trans) Original_LF_Rel_clos__refl__trans_iso := {}.