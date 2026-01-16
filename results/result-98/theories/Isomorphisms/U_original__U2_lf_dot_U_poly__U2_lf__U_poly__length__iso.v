From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_length : forall x : Type, imported_Original_LF__DOT__Poly_LF_Poly_list x -> imported_nat := (@Imported.Original_LF__DOT__Poly_LF_Poly_length).

(* Helper: convert Original nat to Imported nat *)
Fixpoint nat_to_imported (n : nat) : imported_nat :=
  match n with
  | O => Imported.nat_O
  | S n' => Imported.nat_S (nat_to_imported n')
  end.

(* Helper: convert Original list to Imported list *)
Fixpoint list_to_imported {x1 x2 : Type} (hx : Iso x1 x2) (l : Original.LF_DOT_Poly.LF.Poly.list x1) : imported_Original_LF__DOT__Poly_LF_Poly_list x2 :=
  match l with
  | Original.LF_DOT_Poly.LF.Poly.nil => Imported.Original_LF__DOT__Poly_LF_Poly_list_nil x2
  | Original.LF_DOT_Poly.LF.Poly.cons h t => 
      Imported.Original_LF__DOT__Poly_LF_Poly_list_cons x2 (to hx h) (list_to_imported hx t)
  end.

(* Helper lemma: length commutes with the list isomorphism *)
Lemma length_commutes : forall (x1 x2 : Type) (hx : Iso x1 x2) (l : Original.LF_DOT_Poly.LF.Poly.list x1),
  IsomorphismDefinitions.eq 
    (nat_to_imported (Original.LF_DOT_Poly.LF.Poly.length l))
    (Imported.Original_LF__DOT__Poly_LF_Poly_length x2 (list_to_imported hx l)).
Proof.
  intros x1 x2 hx l.
  induction l as [|h t IH].
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl. apply (IsoEq.f_equal Imported.nat_S IH).
Defined.

(* The nat_iso to function is the same as nat_to_imported *)
Lemma nat_to_eq : forall n, IsomorphismDefinitions.eq (to nat_iso n) (nat_to_imported n).
Proof.
  intro n. induction n as [|n' IH].
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl. apply (IsoEq.f_equal Imported.nat_S IH).
Defined.

(* The list_iso to function is the same as list_to_imported *)
Lemma list_to_eq : forall (x1 x2 : Type) (hx : Iso x1 x2) l, 
  IsomorphismDefinitions.eq (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) l) (list_to_imported hx l).
Proof.
  intros x1 x2 hx l. induction l as [|h t IH].
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl. apply (IsoEq.f_equal2 (Imported.Original_LF__DOT__Poly_LF_Poly_list_cons x2) (IsomorphismDefinitions.eq_refl _) IH).
Defined.

Instance Original_LF__DOT__Poly_LF_Poly_length_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3 x4 -> rel_iso nat_iso (Original.LF_DOT_Poly.LF.Poly.length x3) (imported_Original_LF__DOT__Poly_LF_Poly_length x4).
Proof.
  intros A B hx l l' Hrel.
  destruct Hrel as [Hrel]. simpl in Hrel.
  constructor. simpl.
  (* Hrel : eq (to list_iso l) l' *)
  (* Goal: eq (to nat_iso (length l)) (length l') *)
  pose proof (@length_commutes A B hx l) as Hlen.
  pose proof (nat_to_eq (Original.LF_DOT_Poly.LF.Poly.length l)) as Hnat.
  pose proof (@list_to_eq A B hx l) as Hlist.
  (* Combine: to nat_iso (length l) = nat_to_imported (length l) = length (list_to_imported l) = length (to list_iso l) = length l' *)
  destruct Hrel using IsomorphismDefinitions.eq_sind.
  destruct Hlist using IsomorphismDefinitions.eq_sind.
  destruct Hnat using IsomorphismDefinitions.eq_sind.
  exact Hlen.
Defined.
Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.length) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Poly_LF_Poly_length) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.length) Original_LF__DOT__Poly_LF_Poly_length_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.length) (@Imported.Original_LF__DOT__Poly_LF_Poly_length) Original_LF__DOT__Poly_LF_Poly_length_iso := {}.