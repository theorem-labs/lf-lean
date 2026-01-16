From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)

(* Use the LF Poly list definition *)
Definition imported_list : Type -> Type := Imported.Original_LF__DOT__Poly_LF_Poly_list.

Fixpoint list_to_imported {X1 X2 : Type} (hx : Iso X1 X2) (l : list X1) : Imported.Original_LF__DOT__Poly_LF_Poly_list X2 :=
  match l with
  | nil => Imported.Original_LF__DOT__Poly_LF_Poly_list_nil X2
  | cons h t => Imported.Original_LF__DOT__Poly_LF_Poly_list_cons X2 (to hx h) (list_to_imported hx t)
  end.

Fixpoint imported_to_list {X1 X2 : Type} (hx : Iso X1 X2) (l : Imported.Original_LF__DOT__Poly_LF_Poly_list X2) : list X1 :=
  match l with
  | Imported.Original_LF__DOT__Poly_LF_Poly_list_nil _ => nil
  | Imported.Original_LF__DOT__Poly_LF_Poly_list_cons _ h t => cons (from hx h) (imported_to_list hx t)
  end.

Lemma list_roundtrip1 : forall {X1 X2 : Type} (hx : Iso X1 X2) (l : list X1),
  imported_to_list hx (list_to_imported hx l) = l.
Proof.
  intros X1 X2 hx l.
  induction l as [| h t IH].
  - reflexivity.
  - simpl. f_equal.
    + exact (eq_of_seq (from_to hx h)).
    + exact IH.
Qed.

Lemma list_roundtrip2 : forall {X1 X2 : Type} (hx : Iso X1 X2) (l : Imported.Original_LF__DOT__Poly_LF_Poly_list X2),
  list_to_imported hx (imported_to_list hx l) = l.
Proof.
  intros X1 X2 hx l.
  induction l as [| h t IH].
  - reflexivity.
  - simpl. f_equal.
    + exact (eq_of_seq (to_from hx h)).
    + exact IH.
Qed.

Lemma list_roundtrip1_sprop : forall {X1 X2 : Type} (hx : Iso X1 X2) (l : list X1),
  IsomorphismDefinitions.eq (imported_to_list hx (list_to_imported hx l)) l.
Proof.
  intros. rewrite list_roundtrip1. apply IsomorphismDefinitions.eq_refl.
Qed.

Lemma list_roundtrip2_sprop : forall {X1 X2 : Type} (hx : Iso X1 X2) (l : Imported.Original_LF__DOT__Poly_LF_Poly_list X2),
  IsomorphismDefinitions.eq (list_to_imported hx (imported_to_list hx l)) l.
Proof.
  intros. rewrite list_roundtrip2. apply IsomorphismDefinitions.eq_refl.
Qed.

Instance list_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso (list x1) (imported_list x2) :=
  fun x1 x2 hx =>
  {| to := list_to_imported hx;
     from := imported_to_list hx;
     to_from := list_roundtrip2_sprop hx;
     from_to := list_roundtrip1_sprop hx
  |}.

Instance: KnownConstant list := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_list := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor list list_iso := {}.
Instance: IsoStatementProofBetween list Imported.Original_LF__DOT__Poly_LF_Poly_list list_iso := {}.
