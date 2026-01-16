From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. *) (* for speed *)

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf__U_rel__relation__iso.

Definition imported_Original_LF_Rel_clos__refl__trans__1n : forall x : Type, (x -> x -> SProp) -> x -> x -> SProp := (@Imported.Original_LF_Rel_clos__refl__trans__1n).

(* Helper for the to direction *)
Section ToDirection.
  Variables (x1 x2 : Type) (hx : Iso x1 x2).
  Variables (R : Original.LF.Rel.relation x1) (R' : x2 -> x2 -> SProp).
  Variable HR : forall (a : x1) (a' : x2), rel_iso hx a a' -> 
                forall (b : x1) (b' : x2), rel_iso hx b b' -> Iso (R a b) (R' a' b').

  Fixpoint clos_to (a b : x1) (H : Original.LF.Rel.clos_refl_trans_1n R a b) {struct H}: 
    Imported.Original_LF_Rel_clos__refl__trans__1n x2 R' (hx a) (hx b).
  Proof.
    destruct H as [| y z Hxy Hrest].
    - constructor.
    - eapply Imported.Original_LF_Rel_clos__refl__trans__1n_rt1n_trans.
      + (* HR has implicit arguments for a, a', b, b' - only the rel_iso proofs are explicit *)
        refine (to (HR (a':=hx a) _ (b':=hx y) _) Hxy); apply rel_iso_refl.
      + exact (clos_to y z Hrest).
  Defined.
End ToDirection.

(* Helper for the from direction - uses inhabited pattern to go SProp -> Prop *)
Section FromDirection.
  Variables (x1 x2 : Type) (hx : Iso x1 x2).
  Variables (R : Original.LF.Rel.relation x1) (R' : x2 -> x2 -> SProp).
  Variable HR : forall (a : x1) (a' : x2), rel_iso hx a a' -> 
                forall (b : x1) (b' : x2), rel_iso hx b b' -> Iso (R a b) (R' a' b').

  (* We build a function that produces SInhabited of the result,
     then use sinhabitant to extract it.
     The key is that the fix produces SInhabited (...) which is an SProp,
     so we can destruct the SProp input to build it. *)
  
  (* Helper to build rel_iso from hx (from hx x) to x *)
  Local Definition rel_iso_from (x' : x2) : rel_iso hx (from hx x') x'.
  Proof.
    constructor. simpl.
    (* rel_iso hx (from hx x') x' = IsomorphismDefinitions.eq (hx (from hx x')) x' *)
    (* to_from hx x' already has type IsomorphismDefinitions.eq (hx (from hx x')) x' *)
    exact (to_from hx x').
  Defined.
  
  Fixpoint clos_from_aux (a' b' : x2) (H : Imported.Original_LF_Rel_clos__refl__trans__1n x2 R' a' b') {struct H} :
    SInhabited (Original.LF.Rel.clos_refl_trans_1n R (from hx a') (from hx b')).
  Proof.
    destruct H as [x | x y z Hxy Hrest].
    - apply sinhabits. constructor.
    - apply sinhabits.
      apply Original.LF.Rel.rt1n_trans with (y := from hx y).
      + refine (from (HR (a':=x) (rel_iso_from x) (b':=y) (rel_iso_from y)) Hxy).
      + apply sinhabitant.
        exact (clos_from_aux y z Hrest).
  Defined.
  
  Definition clos_from (a' b' : x2) (H : Imported.Original_LF_Rel_clos__refl__trans__1n x2 R' a' b') :
    Original.LF.Rel.clos_refl_trans_1n R (from hx a') (from hx b') :=
    sinhabitant (@clos_from_aux a' b' H).
End FromDirection.

Instance Original_LF_Rel_clos__refl__trans__1n_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF.Rel.relation x1) (x4 : x2 -> x2 -> SProp),
  (forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> Iso (x3 x5 x7) (x4 x6 x8)) ->
  forall (x5 : x1) (x6 : x2),
  rel_iso hx x5 x6 -> forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> Iso (Original.LF.Rel.clos_refl_trans_1n x3 x5 x7) (imported_Original_LF_Rel_clos__refl__trans__1n x4 x6 x8).
Proof.
  intros x1 x2 hx R R' HR a a' Ha b b' Hb.
  rename Ha into Ha_iso. rename Hb into Hb_iso. pose proof (proj_rel_iso Ha_iso) as Ha. pose proof (proj_rel_iso Hb_iso) as Hb.
  (* Define the to and from functions explicitly *)
  pose (my_to := fun (H : Original.LF.Rel.clos_refl_trans_1n R a b) =>
    let H' := @clos_to x1 x2 hx R R' HR a b H in
    match Ha in IsomorphismDefinitions.eq _ a'' return 
          Imported.Original_LF_Rel_clos__refl__trans__1n x2 R' a'' b' with
    | IsomorphismDefinitions.eq_refl => 
      match Hb in IsomorphismDefinitions.eq _ b'' return 
            Imported.Original_LF_Rel_clos__refl__trans__1n x2 R' (hx a) b'' with
      | IsomorphismDefinitions.eq_refl => H'
      end
    end).
  pose (my_from := fun (H : imported_Original_LF_Rel_clos__refl__trans__1n R' a' b') =>
    let tr1 := match Ha in IsomorphismDefinitions.eq _ a'' return 
                     Imported.Original_LF_Rel_clos__refl__trans__1n x2 R' a'' b' -> 
                     Imported.Original_LF_Rel_clos__refl__trans__1n x2 R' (hx a) b' with
               | IsomorphismDefinitions.eq_refl => fun x => x
               end in
    let tr2 := match Hb in IsomorphismDefinitions.eq _ b'' return 
                     Imported.Original_LF_Rel_clos__refl__trans__1n x2 R' (hx a) b'' -> 
                     Imported.Original_LF_Rel_clos__refl__trans__1n x2 R' (hx a) (hx b) with
               | IsomorphismDefinitions.eq_refl => fun x => x
               end in
    let result := @clos_from x1 x2 hx R R' HR (hx a) (hx b) (tr2 (tr1 H)) in
    let Fa := from_to hx a in
    let Fb := from_to hx b in
    match Fa in IsomorphismDefinitions.eq _ a'' return 
          Original.LF.Rel.clos_refl_trans_1n R a'' b with
    | IsomorphismDefinitions.eq_refl => 
      match Fb in IsomorphismDefinitions.eq _ b'' return 
            Original.LF.Rel.clos_refl_trans_1n R (from hx (hx a)) b'' with
      | IsomorphismDefinitions.eq_refl => result
      end
    end).
  refine (@Build_Iso _ _ my_to my_from _ _).
  - intro x. exact IsomorphismDefinitions.eq_refl.
  - intro x. exact (seq_of_peq_t (Stdlib.Logic.ProofIrrelevance.proof_irrelevance _ _ x)).
Defined.

Instance: KnownConstant (@Original.LF.Rel.clos_refl_trans_1n) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF_Rel_clos__refl__trans__1n) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF.Rel.clos_refl_trans_1n) Original_LF_Rel_clos__refl__trans__1n_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF.Rel.clos_refl_trans_1n) (@Imported.Original_LF_Rel_clos__refl__trans__1n) Original_LF_Rel_clos__refl__trans__1n_iso := {}.