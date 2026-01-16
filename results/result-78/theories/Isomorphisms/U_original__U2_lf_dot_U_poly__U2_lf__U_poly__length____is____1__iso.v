From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__length__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__eqb__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_length__is__1 : forall x : Type, imported_Original_LF__DOT__Poly_LF_Poly_list x -> imported_Original_LF__DOT__Basics_LF_Basics_bool := (@Imported.Original_LF__DOT__Poly_LF_Poly_length__is__1).

(* eqb commutes with the nat isomorphism *)
Lemma eqb_commutes : forall (n m : nat),
  IsomorphismDefinitions.eq 
    (bool_to_imported (Original.LF_DOT_Basics.LF.Basics.eqb n m))
    (Imported.Original_LF__DOT__Basics_LF_Basics_eqb (nat_to_imported n) (nat_to_imported m)).
Proof.
  intro n.
  induction n as [|n' IHn].
  - intro m. destruct m.
    + simpl. apply IsomorphismDefinitions.eq_refl.
    + simpl. apply IsomorphismDefinitions.eq_refl.
  - intro m. destruct m.
    + simpl. apply IsomorphismDefinitions.eq_refl.
    + simpl. apply IHn.
Defined.

(* length commutes with the list isomorphism *)
Lemma length_commutes' : forall (x1 x2 : Type) (hx : Iso x1 x2) (l : Original.LF_DOT_Poly.LF.Poly.list x1),
  IsomorphismDefinitions.eq 
    (nat_to_imported (Original.LF_DOT_Poly.LF.Poly.length l))
    (Imported.Original_LF__DOT__Poly_LF_Poly_length x2 (list_to_imported hx l)).
Proof.
  intros x1 x2 hx l.
  induction l as [|h t IH].
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl. apply (IsoEq.f_equal Imported.nat_S IH).
Defined.

(* The bool_iso to function is the same as bool_to_imported *)
Lemma bool_to_eq' : forall b, IsomorphismDefinitions.eq (to Original_LF__DOT__Basics_LF_Basics_bool_iso b) (bool_to_imported b).
Proof.
  intro b. destruct b; simpl; apply IsomorphismDefinitions.eq_refl.
Defined.

(* length_is_1 commutes with the isomorphisms *)
Lemma length_is_1_commutes : forall (x1 x2 : Type) (hx : Iso x1 x2) (l : Original.LF_DOT_Poly.LF.Poly.list x1),
  IsomorphismDefinitions.eq 
    (bool_to_imported (Original.LF_DOT_Poly.LF.Poly.length_is_1 l))
    (Imported.Original_LF__DOT__Poly_LF_Poly_length__is__1 x2 (list_to_imported hx l)).
Proof.
  intros x1 x2 hx l.
  unfold Original.LF_DOT_Poly.LF.Poly.length_is_1.
  unfold Imported.Original_LF__DOT__Poly_LF_Poly_length__is__1.
  pose proof (@length_commutes' x1 x2 hx l) as Hlen.
  pose proof (eqb_commutes (Original.LF_DOT_Poly.LF.Poly.length l) 1) as Heqb.
  (* Goal: bool_to_imported (eqb (length l) 1) = eqb (length (list_to_imported l)) (S O) *)
  destruct Hlen using IsomorphismDefinitions.eq_sind.
  exact Heqb.
Defined.

Instance Original_LF__DOT__Poly_LF_Poly_length__is__1_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3 x4 ->
  rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (Original.LF_DOT_Poly.LF.Poly.length_is_1 x3) (imported_Original_LF__DOT__Poly_LF_Poly_length__is__1 x4).
Proof.
  intros A B hx l l' Hrel.
  (* unfold rel_iso *) in *.
  (* Hrel : eq (to list_iso l) l' *)
  (* Goal: eq (to bool_iso (length_is_1 l)) (length_is_1 l') *)
  pose proof (@length_is_1_commutes A B hx l) as Hlen.
  pose proof (bool_to_eq' (Original.LF_DOT_Poly.LF.Poly.length_is_1 l)) as Hbool.
  pose proof (@list_to_eq A B hx l) as Hlist.
  (* Combine: to bool_iso (length_is_1 l) = bool_to_imported (length_is_1 l) = length_is_1 (list_to_imported l) = length_is_1 (to list_iso l) = length_is_1 l' *)
  destruct Hrel using IsomorphismDefinitions.eq_sind.
  destruct Hlist using IsomorphismDefinitions.eq_sind.
  destruct Hbool using IsomorphismDefinitions.eq_sind.
  exact Hlen.
Defined.
Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.length_is_1) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Poly_LF_Poly_length__is__1) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.length_is_1) Original_LF__DOT__Poly_LF_Poly_length__is__1_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.length_is_1) (@Imported.Original_LF__DOT__Poly_LF_Poly_length__is__1) Original_LF__DOT__Poly_LF_Poly_length__is__1_iso := {}.