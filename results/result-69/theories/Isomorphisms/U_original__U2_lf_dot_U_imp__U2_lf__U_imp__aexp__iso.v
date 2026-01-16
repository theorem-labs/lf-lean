From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From Stdlib Require Import Ascii String.
From IsomorphismChecker Require Original Imported.
From IsomorphismChecker Require Export Isomorphisms.nat__iso Isomorphisms.U_string__string__iso.


Definition imported_Original_LF__DOT__Imp_LF_Imp_aexp : Type := Imported.Original_LF__DOT__Imp_LF_Imp_aexp.

(* Now we define the aexp isomorphism *)
Fixpoint aexp_to_imported (a : Original.LF_DOT_Imp.LF.Imp.aexp) : Imported.Original_LF__DOT__Imp_LF_Imp_aexp :=
  match a with
  | Original.LF_DOT_Imp.LF.Imp.ANum n => 
      Imported.Original_LF__DOT__Imp_LF_Imp_aexp_ANum (nat_to_imported n)
  | Original.LF_DOT_Imp.LF.Imp.AId s => 
      Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AId (string_to_imported s)
  | Original.LF_DOT_Imp.LF.Imp.APlus a1 a2 => 
      Imported.Original_LF__DOT__Imp_LF_Imp_aexp_APlus (aexp_to_imported a1) (aexp_to_imported a2)
  | Original.LF_DOT_Imp.LF.Imp.AMinus a1 a2 => 
      Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AMinus (aexp_to_imported a1) (aexp_to_imported a2)
  | Original.LF_DOT_Imp.LF.Imp.AMult a1 a2 => 
      Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AMult (aexp_to_imported a1) (aexp_to_imported a2)
  end.

Fixpoint aexp_from_imported (a : Imported.Original_LF__DOT__Imp_LF_Imp_aexp) : Original.LF_DOT_Imp.LF.Imp.aexp :=
  match a with
  | Imported.Original_LF__DOT__Imp_LF_Imp_aexp_ANum n => 
      Original.LF_DOT_Imp.LF.Imp.ANum (imported_to_nat n)
  | Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AId s => 
      Original.LF_DOT_Imp.LF.Imp.AId (string_from_imported s)
  | Imported.Original_LF__DOT__Imp_LF_Imp_aexp_APlus a1 a2 => 
      Original.LF_DOT_Imp.LF.Imp.APlus (aexp_from_imported a1) (aexp_from_imported a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AMinus a1 a2 => 
      Original.LF_DOT_Imp.LF.Imp.AMinus (aexp_from_imported a1) (aexp_from_imported a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AMult a1 a2 => 
      Original.LF_DOT_Imp.LF.Imp.AMult (aexp_from_imported a1) (aexp_from_imported a2)
  end.

(* Helper lemmas for aexp constructors *)
Lemma imported_aexp_ANum_eq : forall n n',
  @Logic.eq _ n n' -> @Logic.eq _ (Imported.Original_LF__DOT__Imp_LF_Imp_aexp_ANum n) (Imported.Original_LF__DOT__Imp_LF_Imp_aexp_ANum n').
Proof. intros. destruct H. reflexivity. Defined.

Lemma imported_aexp_AId_eq : forall s s',
  @Logic.eq _ s s' -> @Logic.eq _ (Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AId s) (Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AId s').
Proof. intros. destruct H. reflexivity. Defined.

Lemma imported_aexp_APlus_eq : forall a1 a1' a2 a2',
  @Logic.eq _ a1 a1' -> @Logic.eq _ a2 a2' ->
  @Logic.eq _ (Imported.Original_LF__DOT__Imp_LF_Imp_aexp_APlus a1 a2) (Imported.Original_LF__DOT__Imp_LF_Imp_aexp_APlus a1' a2').
Proof. intros. destruct H. destruct H0. reflexivity. Defined.

Lemma imported_aexp_AMinus_eq : forall a1 a1' a2 a2',
  @Logic.eq _ a1 a1' -> @Logic.eq _ a2 a2' ->
  @Logic.eq _ (Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AMinus a1 a2) (Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AMinus a1' a2').
Proof. intros. destruct H. destruct H0. reflexivity. Defined.

Lemma imported_aexp_AMult_eq : forall a1 a1' a2 a2',
  @Logic.eq _ a1 a1' -> @Logic.eq _ a2 a2' ->
  @Logic.eq _ (Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AMult a1 a2) (Imported.Original_LF__DOT__Imp_LF_Imp_aexp_AMult a1' a2').
Proof. intros. destruct H. destruct H0. reflexivity. Defined.

Lemma coq_aexp_ANum_eq : forall n n',
  @Logic.eq _ n n' -> @Logic.eq _ (Original.LF_DOT_Imp.LF.Imp.ANum n) (Original.LF_DOT_Imp.LF.Imp.ANum n').
Proof. intros. destruct H. reflexivity. Defined.

Lemma coq_aexp_AId_eq : forall s s',
  @Logic.eq _ s s' -> @Logic.eq _ (Original.LF_DOT_Imp.LF.Imp.AId s) (Original.LF_DOT_Imp.LF.Imp.AId s').
Proof. intros. destruct H. reflexivity. Defined.

Lemma coq_aexp_APlus_eq : forall a1 a1' a2 a2',
  @Logic.eq _ a1 a1' -> @Logic.eq _ a2 a2' ->
  @Logic.eq _ (Original.LF_DOT_Imp.LF.Imp.APlus a1 a2) (Original.LF_DOT_Imp.LF.Imp.APlus a1' a2').
Proof. intros. destruct H. destruct H0. reflexivity. Defined.

Lemma coq_aexp_AMinus_eq : forall a1 a1' a2 a2',
  @Logic.eq _ a1 a1' -> @Logic.eq _ a2 a2' ->
  @Logic.eq _ (Original.LF_DOT_Imp.LF.Imp.AMinus a1 a2) (Original.LF_DOT_Imp.LF.Imp.AMinus a1' a2').
Proof. intros. destruct H. destruct H0. reflexivity. Defined.

Lemma coq_aexp_AMult_eq : forall a1 a1' a2 a2',
  @Logic.eq _ a1 a1' -> @Logic.eq _ a2 a2' ->
  @Logic.eq _ (Original.LF_DOT_Imp.LF.Imp.AMult a1 a2) (Original.LF_DOT_Imp.LF.Imp.AMult a1' a2').
Proof. intros. destruct H. destruct H0. reflexivity. Defined.

Lemma nat_to_from' : forall n, nat_to_imported (imported_to_nat n) = n.
Proof.
  fix IH 1.
  destruct n as [|n'].
  - reflexivity.
  - simpl. f_equal. apply IH.
Defined.

Lemma nat_from_to' : forall n, imported_to_nat (nat_to_imported n) = n.
Proof.
  fix IH 1.
  destruct n as [|n'].
  - reflexivity.
  - simpl. f_equal. apply IH.
Defined.

Lemma aexp_to_from : forall a, aexp_to_imported (aexp_from_imported a) = a.
Proof.
  fix IH 1.
  destruct a.
  - simpl. apply imported_aexp_ANum_eq. apply nat_to_from'.
  - simpl. apply imported_aexp_AId_eq. apply string_to_from.
  - simpl. apply imported_aexp_APlus_eq; apply IH.
  - simpl. apply imported_aexp_AMinus_eq; apply IH.
  - simpl. apply imported_aexp_AMult_eq; apply IH.
Defined.

Lemma aexp_from_to : forall a, aexp_from_imported (aexp_to_imported a) = a.
Proof.
  fix IH 1.
  destruct a.
  - simpl. apply coq_aexp_ANum_eq. apply nat_from_to'.
  - simpl. apply coq_aexp_AId_eq. apply string_from_to.
  - simpl. apply coq_aexp_APlus_eq; apply IH.
  - simpl. apply coq_aexp_AMinus_eq; apply IH.
  - simpl. apply coq_aexp_AMult_eq; apply IH.
Defined.

Instance Original_LF__DOT__Imp_LF_Imp_aexp_iso : Iso Original.LF_DOT_Imp.LF.Imp.aexp imported_Original_LF__DOT__Imp_LF_Imp_aexp := {|
  to := aexp_to_imported;
  from := aexp_from_imported;
  to_from := fun x => logic_eq_to_iso_eq (aexp_to_from x);
  from_to := fun x => logic_eq_to_iso_eq (aexp_from_to x);
|}.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.aexp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_aexp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.aexp Original_LF__DOT__Imp_LF_Imp_aexp_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.aexp Imported.Original_LF__DOT__Imp_LF_Imp_aexp Original_LF__DOT__Imp_LF_Imp_aexp_iso := {}.
