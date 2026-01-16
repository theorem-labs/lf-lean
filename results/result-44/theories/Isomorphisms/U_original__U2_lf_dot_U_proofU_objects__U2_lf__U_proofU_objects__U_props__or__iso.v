From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or : SProp -> SProp -> SProp := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or.

(* Helper: to function - case split on Prop to produce SProp *)
Definition or_to (x1 : Prop) (x2 : SProp) (H1 : Iso x1 x2) (x3 : Prop) (x4 : SProp) (H2 : Iso x3 x4) 
  (h : Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.or x1 x3) 
  : imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or x2 x4 :=
  match h with
  | Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.or_introl p => 
      Imported.or_inl x2 x4 (H1.(to) p)
  | Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.or_intror q => 
      Imported.or_inr x2 x4 (H2.(to) q)
  end.

(* Helper: use SProp elimination to produce SInhabited of the Prop *)
Definition or_to_sin
  (x1 : Prop) (x2 : SProp) (H1 : Iso x1 x2) (x3 : Prop) (x4 : SProp) (H2 : Iso x3 x4)
  (h : imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or x2 x4) 
  : SInhabited (Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.or x1 x3) :=
  match h with
  | Imported.or_inl _ _ p => sinhabits (Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.or_introl (H1.(from) p))
  | Imported.or_inr _ _ q => sinhabits (Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.or_intror (H2.(from) q))
  end.

Definition or_from (x1 : Prop) (x2 : SProp) (H1 : Iso x1 x2) (x3 : Prop) (x4 : SProp) (H2 : Iso x3 x4)
  (h : imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or x2 x4) 
  : Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.or x1 x3 :=
  sinhabitant (or_to_sin H1 H2 h).

(* Build the isomorphism between Original.or and Imported.or *)
Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or_iso : (forall (x1 : Prop) (x2 : SProp) (H1 : Iso x1 x2) (x3 : Prop) (x4 : SProp) (H2 : Iso x3 x4),
   Iso (Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.or x1 x3) (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or x2 x4)).
Proof.
  intros x1 x2 H1 x3 x4 H2.
  apply relax_Iso_Ps_Ts.  (* Convert from Iso@{Prop SProp ; ...} to Iso@{Type SProp ; ...} *)
  exact {| to := or_to H1 H2;
           from := or_from H1 H2;
           to_from := fun x => IsomorphismDefinitions.eq_refl x;
           from_to := fun x => IsoEq.seq_of_peq (ProofIrrelevance.proof_irrelevance _ _ _) |}.
Defined.

Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.or := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.or Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.or Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or_iso := {}.
