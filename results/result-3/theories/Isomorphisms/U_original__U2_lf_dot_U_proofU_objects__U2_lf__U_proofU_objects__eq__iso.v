From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_eq : forall x : Type, x -> x -> SProp := (@Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_eq).

(* Helper: the imported eq_refl *)
Definition imported_eq_refl := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_eq_eq_refl.

(* Helper function to convert Original.eq to Imported.eq *)
Definition orig_to_imported_eq (x1 x2 : Type) (hx : Iso x1 x2) (x3 x5 : x1) 
    (e : Original.LF_DOT_ProofObjects.LF.ProofObjects.eq x3 x5) 
    : Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_eq x2 (hx x3) (hx x5).
Proof.
  destruct e.
  (* After destruct, x3 and x5 are unified to a single variable x *)
  exact (Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_eq_eq_refl x2 (hx x)).
Defined.

(* Helper function to convert Imported.eq to Original.eq *)
Definition imported_to_orig_eq (x1 x2 : Type) (hx : Iso x1 x2) (x3 x5 : x1)
    (e : Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_eq x2 (hx x3) (hx x5))
    : Original.LF_DOT_ProofObjects.LF.ProofObjects.eq x3 x5.
Proof.
  assert (H: from hx (hx x3) = from hx (hx x5)).
  { destruct e. reflexivity. }
  assert (Hx3: from hx (hx x3) = x3) by apply from_to_tteq.
  assert (Hx5: from hx (hx x5) = x5) by apply from_to_tteq.
  assert (Heq: x3 = x5).
  { rewrite <- Hx3. rewrite <- Hx5. exact H. }
  destruct Heq.
  exact (Original.LF_DOT_ProofObjects.LF.ProofObjects.eq_refl x3).
Defined.

Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_eq_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2),
  rel_iso hx x3 x4 -> forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> Iso (Original.LF_DOT_ProofObjects.LF.ProofObjects.eq x3 x5) (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_eq x4 x6).
Proof.
  intros x1 x2 hx x3 x4 h34 x5 x6 h56.
  unfold rel_iso in h34, h56. simpl in h34, h56.
  destruct h34 as [].
  destruct h56 as [].
  (* Goal: Iso (x3 == x5) (Imported.eq (hx x3) (hx x5)) *)
  unshelve refine {|
    to := @orig_to_imported_eq x1 x2 hx x3 x5;
    from := @imported_to_orig_eq x1 x2 hx x3 x5
  |}.
  - (* to_from: for SProp, this is trivial by proof irrelevance *)
    intro e. apply IsomorphismDefinitions.eq_refl.
  - (* from_to: for Prop, use proof irrelevance *)
    intro e. 
    apply seq_of_peq_t.
    apply Stdlib.Logic.ProofIrrelevance.proof_irrelevance.
Defined.

Instance: KnownConstant (@Original.LF_DOT_ProofObjects.LF.ProofObjects.eq) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_eq) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_ProofObjects.LF.ProofObjects.eq) Original_LF__DOT__ProofObjects_LF_ProofObjects_eq_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_ProofObjects.LF.ProofObjects.eq) (@Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_eq) Original_LF__DOT__ProofObjects_LF_ProofObjects_eq_iso := {}.