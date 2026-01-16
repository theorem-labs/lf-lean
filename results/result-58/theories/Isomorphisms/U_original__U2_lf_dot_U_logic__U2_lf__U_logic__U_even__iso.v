From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Require Import Stdlib.Logic.ProofIrrelevance.

From IsomorphismChecker Require Export Isomorphisms.nat__iso Isomorphisms.U_original__U2_lf_dot_U_induction__U2_lf__U_induction__double__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_Even : imported_nat -> SProp := Imported.Original_LF__DOT__Logic_LF_Logic_Even.

Definition Even_orig := Original.LF_DOT_Logic.LF.Logic.Even.
Definition Even_imp := Imported.Original_LF__DOT__Logic_LF_Logic_Even.

(* Convert Prop proof irrelevance to SProp eq *)
Definition prop_proof_irrel_to_seq : forall (P : Prop) (p1 p2 : P), IsomorphismDefinitions.eq p1 p2 :=
  fun P p1 p2 =>
    match proof_irrelevance P p1 p2 in (_ = p) return IsomorphismDefinitions.eq p1 p with
    | Logic.eq_refl => IsomorphismDefinitions.eq_refl
    end.

(* Helper: convert Logic.eq to Imported.Corelib_Init_Logic_eq *)
Definition logic_eq_to_imported_eq {A : Type} {x y : A} (H : @Logic.eq A x y) : Imported.Corelib_Init_Logic_eq A x y :=
  match H in (@Logic.eq _ _ z) return Imported.Corelib_Init_Logic_eq A x z with
  | Logic.eq_refl => Imported.Corelib_Init_Logic_eq_refl A x
  end.

(* Prove double commutes with nat_to_imported *)
Fixpoint double_iso_lemma (n : Datatypes.nat) : 
  @Logic.eq Imported.nat (nat_to_imported (Original.LF_DOT_Induction.LF.Induction.double n)) (Imported.Original_LF__DOT__Induction_LF_Induction_double (nat_to_imported n)) :=
  match n return @Logic.eq Imported.nat (nat_to_imported (Original.LF_DOT_Induction.LF.Induction.double n)) (Imported.Original_LF__DOT__Induction_LF_Induction_double (nat_to_imported n)) with
  | O => Logic.eq_refl
  | S n' => 
    match double_iso_lemma n' in (@Logic.eq _ _ m) 
      return @Logic.eq Imported.nat (Imported.nat_S (Imported.nat_S (nat_to_imported (Original.LF_DOT_Induction.LF.Induction.double n')))) 
             (Imported.nat_S (Imported.nat_S m)) 
    with
    | Logic.eq_refl => Logic.eq_refl
    end
  end.

(* to: Even_orig x1 -> Even_imp x2 *)
Definition Even_to (x1 : nat) (x2 : imported_nat) 
  (Hx : IsomorphismDefinitions.eq (nat_to_imported x1) x2)
  (H : Even_orig x1) : Even_imp x2.
Proof.
  unfold Even_orig, Original.LF_DOT_Logic.LF.Logic.Even in H.
  destruct H as [n Hn].
  unfold Even_imp, Imported.Original_LF__DOT__Logic_LF_Logic_Even.
  apply Imported.Original_LF__DOT__Logic_LF_Logic_ex_intro with (x := nat_to_imported n).
  destruct Hx.
  rewrite Hn.
  apply logic_eq_to_imported_eq.
  apply double_iso_lemma.
Defined.

(* Convert imported nat to Datatypes.nat *)
Fixpoint imported_to_nat (n : Imported.nat) : Datatypes.nat :=
  match n with
  | Imported.nat_O => O
  | Imported.nat_S n' => S (imported_to_nat n')
  end.

(* Prove imported_to_nat . nat_to_imported = id *)
Lemma nat_round_trip : forall x : Datatypes.nat, @Logic.eq Datatypes.nat (imported_to_nat (nat_to_imported x)) x.
Proof.
  induction x.
  - exact Logic.eq_refl.
  - simpl. exact (match IHx in (_ = y) return (Datatypes.S (imported_to_nat (nat_to_imported x)) = Datatypes.S y) with
                  | Logic.eq_refl => Logic.eq_refl
                  end).
Defined.

(* imported double to standard double *)
Lemma double_imported_std : forall m : Imported.nat,
  @Logic.eq Datatypes.nat (imported_to_nat (Imported.Original_LF__DOT__Induction_LF_Induction_double m)) 
            (Original.LF_DOT_Induction.LF.Induction.double (imported_to_nat m)).
Proof.
  fix IH 1.
  destruct m.
  - reflexivity.
  - simpl. f_equal. f_equal. apply IH.
Defined.

(* Convert Imported eq to Logic.eq *)
Definition imported_eq_to_logic_eq {A : Type} {x y : A} (H : Imported.Corelib_Init_Logic_eq A x y) : @Logic.eq A x y :=
  Imported.Corelib_Init_Logic_eq_recl A x (fun z _ => @Logic.eq A x z) Logic.eq_refl y H.

(* Lemma: nat_to_imported is injective when inverted *)
Lemma imported_to_nat_to_imported : forall m : Imported.nat,
  @Logic.eq Imported.nat (nat_to_imported (imported_to_nat m)) m.
Proof.
  fix IH 1.
  destruct m.
  - reflexivity.
  - simpl. f_equal. apply IH.
Defined.

(* from: Even_imp (nat_to_imported x1) -> SInhabited (Even_orig x1)  *)
Definition Even_from_SInhabited_core (x1 : nat)
  (H : Even_imp (nat_to_imported x1)) : SInhabited (Even_orig x1).
Proof.
  unfold Even_imp, Imported.Original_LF__DOT__Logic_LF_Logic_Even in H.
  apply (Imported.Original_LF__DOT__Logic_LF_Logic_ex_indl Imported.nat 
           (fun n => Imported.Corelib_Init_Logic_eq Imported.nat (nat_to_imported x1) (Imported.Original_LF__DOT__Induction_LF_Induction_double n))
           (fun _ => SInhabited (Even_orig x1))).
  - intros m Hm.
    apply sinhabits.
    unfold Even_orig, Original.LF_DOT_Logic.LF.Logic.Even.
    exists (imported_to_nat m).
    pose proof (imported_eq_to_logic_eq Hm) as Hm'.
    (* Hm' : nat_to_imported x1 = Imported.double m *)
    (* Goal: x1 = double (imported_to_nat m) *)
    transitivity (imported_to_nat (nat_to_imported x1)).
    + symmetry. apply nat_round_trip.
    + transitivity (imported_to_nat (Imported.Original_LF__DOT__Induction_LF_Induction_double m)).
      * f_equal. exact Hm'.
      * apply double_imported_std.
  - exact H.
Defined.

Definition Even_from (x1 : nat) (x2 : imported_nat) 
  (Hx : IsomorphismDefinitions.eq (nat_to_imported x1) x2)
  (H : Even_imp x2) : Even_orig x1.
Proof.
  apply sinhabitant.
  apply Even_from_SInhabited_core.
  destruct Hx.
  exact H.
Defined.

Instance Original_LF__DOT__Logic_LF_Logic_Even_iso : (forall (x1 : nat) (x2 : imported_nat) (_ : @rel_iso nat imported_nat nat_iso x1 x2), Iso (Original.LF_DOT_Logic.LF.Logic.Even x1) (imported_Original_LF__DOT__Logic_LF_Logic_Even x2)).
Proof.
  intros x1 x2 Hx.
  destruct Hx as [Hx]. simpl in Hx.
  unfold imported_Original_LF__DOT__Logic_LF_Logic_Even.
  refine {|
    to := @Even_to x1 x2 Hx;
    from := @Even_from x1 x2 Hx;
    to_from := fun _ => IsomorphismDefinitions.eq_refl;
    from_to := _
  |}.
  intro e.
  apply prop_proof_irrel_to_seq.
Defined.

Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.Even := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_Even := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.Even Original_LF__DOT__Logic_LF_Logic_Even_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.Even Imported.Original_LF__DOT__Logic_LF_Logic_Even Original_LF__DOT__Logic_LF_Logic_Even_iso := {}.
