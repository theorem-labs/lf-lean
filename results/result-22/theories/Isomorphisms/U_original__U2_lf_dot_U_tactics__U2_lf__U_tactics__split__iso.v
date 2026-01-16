From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__prod__iso.

(* Helper lemmas for converting between equality types *)
Lemma lean_eq_to_seq' : forall (A : Type) (x y : A),
  Imported.Eq A x y -> IsomorphismDefinitions.eq x y.
Proof. intros A x y H. destruct H. constructor. Defined.

Lemma seq_to_lean_eq : forall (A : Type) (x y : A),
  IsomorphismDefinitions.eq x y -> Imported.Eq A x y.
Proof. intros A x y H. destruct H. constructor. Defined.

Lemma imported_corelib_eq_to_seq : forall (A : Type) (x y : A),
  Imported.Corelib_Init_Logic_eq A x y -> IsomorphismDefinitions.eq x y.
Proof. intros A x y H. destruct H. constructor. Defined.

Monomorphic Definition imported_Original_LF__DOT__Tactics_LF_Tactics_split : forall x x0 : Type,
  imported_Original_LF__DOT__Poly_LF_Poly_list (imported_Original_LF__DOT__Poly_LF_Poly_prod x x0) ->
  imported_Original_LF__DOT__Poly_LF_Poly_prod (imported_Original_LF__DOT__Poly_LF_Poly_list x) (imported_Original_LF__DOT__Poly_LF_Poly_list x0) := (@Imported.Original_LF__DOT__Tactics_LF_Tactics_split).

Lemma lean_corelib_eq_to_seq : forall (A : Type) (x y : A),
  Imported.Corelib_Init_Logic_eq A x y -> IsomorphismDefinitions.eq x y.
Proof. intros A x y H. destruct H. constructor. Defined.

Lemma seq_to_lean_corelib_eq : forall (A : Type) (x y : A),
  IsomorphismDefinitions.eq x y -> Imported.Corelib_Init_Logic_eq A x y.
Proof. intros A x y H. destruct H. constructor. Defined.

Monomorphic Instance Original_LF__DOT__Tactics_LF_Tactics_split_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 x4 : Type) (hx0 : Iso x3 x4) (x5 : Original.LF_DOT_Poly.LF.Poly.list (Original.LF_DOT_Poly.LF.Poly.prod x1 x3))
    (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list (imported_Original_LF__DOT__Poly_LF_Poly_prod x2 x4)),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso (Original_LF__DOT__Poly_LF_Poly_prod_iso hx hx0)) x5 x6 ->
  rel_iso (Original_LF__DOT__Poly_LF_Poly_prod_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) (Original_LF__DOT__Poly_LF_Poly_list_iso hx0)) (Original.LF_DOT_Tactics.LF.Tactics.split x5)
    (imported_Original_LF__DOT__Tactics_LF_Tactics_split x6).
Proof.
  intros x1 x2 hx x3 x4 hx0 x5 x6 Hrel.
  destruct Hrel as [Heq]. destruct Heq.
  constructor.
  unfold imported_Original_LF__DOT__Tactics_LF_Tactics_split, Imported.Original_LF__DOT__Tactics_LF_Tactics_split.
  induction x5 as [|[a b] t IH].
  - simpl. symmetry.
    apply (lean_corelib_eq_to_seq (Imported.Original_LF__DOT__Poly_LF_Poly_split_nil_eq x2 x4)).
  - simpl.
    destruct (Original.LF_DOT_Tactics.LF.Tactics.split t) as [lx ly] eqn:Hsplit.
    simpl in IH. symmetry.
    apply eq_sym in IH.
    apply (lean_corelib_eq_to_seq (Imported.Original_LF__DOT__Poly_LF_Poly_split_cons_eq x2 x4 (to hx a) (to hx0 b) 
                  (to (Original_LF__DOT__Poly_LF_Poly_list_iso (Original_LF__DOT__Poly_LF_Poly_prod_iso hx hx0)) t)
                  (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) lx)
                  (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx0) ly)
                  (seq_to_lean_eq IH))).
Defined.
Instance: KnownConstant (@Original.LF_DOT_Tactics.LF.Tactics.split) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Tactics_LF_Tactics_split) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Tactics.LF.Tactics.split) Original_LF__DOT__Tactics_LF_Tactics_split_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Tactics.LF.Tactics.split) (@Imported.Original_LF__DOT__Tactics_LF_Tactics_split) Original_LF__DOT__Tactics_LF_Tactics_split_iso := {}.
