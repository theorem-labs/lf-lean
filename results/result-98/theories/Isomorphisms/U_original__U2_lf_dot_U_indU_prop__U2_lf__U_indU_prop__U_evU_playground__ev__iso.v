From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev : imported_nat -> SProp := Imported.Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev.

(* Define the conversion functions *)
Definition nat_to_imported : nat -> imported_nat :=
  fix to_nat (n : nat) : imported_nat :=
    match n with
    | O => Imported.nat_O
    | Datatypes.S n' => Imported.nat_S (to_nat n')
    end.

Definition imported_to_nat : imported_nat -> nat :=
  fix from_nat (n : imported_nat) : nat :=
    match n with
    | Imported.nat_O => O
    | Imported.nat_S n' => Datatypes.S (from_nat n')
    end.

(* Round-trip lemmas *)
Definition nat_round_trip : forall n : nat, imported_to_nat (nat_to_imported n) = n.
Proof.
  fix IH 1.
  intros [|n'].
  - reflexivity.
  - simpl. f_equal. apply IH.
Defined.

Definition imported_round_trip : forall n : imported_nat, nat_to_imported (imported_to_nat n) = n.
Proof.
  fix IH 1.
  intros [|n'].
  - reflexivity.
  - simpl. f_equal. apply IH.
Defined.

(* Short names for convenience *)
Definition ev_orig := Original.LF_DOT_IndProp.LF.IndProp.EvPlayground.ev.
Definition ev_imp := Imported.Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev.

(* Helper: construct ev_imp from nat, using same structure as ev *)
Definition ev_to_imported_aux : forall n : Datatypes.nat, ev_orig n -> ev_imp (nat_to_imported n).
Proof.
  refine (fix F n H {struct H} := _).
  destruct H as [|n' H'].
  - exact Imported.Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_ev_0.
  - exact (Imported.Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_ev_SS 
             (nat_to_imported n') (F n' H')).
Defined.

Definition ev_to_imported := ev_to_imported_aux.

(* For the reverse direction: we use the decidability of evenness *)
(* Define is_even for imported nat *)
Fixpoint is_even_imported (n : Imported.nat) : bool :=
  match n with
  | Imported.nat_O => true
  | Imported.nat_S Imported.nat_O => false
  | Imported.nat_S (Imported.nat_S n') => is_even_imported n'
  end.

(* Construct ev_orig from the is_even predicate *)
Definition ev_of_is_even : forall (n : Datatypes.nat), 
  is_even_imported (nat_to_imported n) = true -> ev_orig n.
Proof.
  fix IH 1.
  intros n H.
  destruct n as [|[|n']].
  - exact Original.LF_DOT_IndProp.LF.IndProp.EvPlayground.ev_0.
  - (* n = 1, impossible *)
    simpl in H. discriminate H.
  - (* n = S (S n') *)
    simpl in H.
    exact (Original.LF_DOT_IndProp.LF.IndProp.EvPlayground.ev_SS n' (IH n' H)).
Defined.

(* Helper to convert SProp eq to Prop eq for bool *)
Definition sprop_eq_to_prop_eq_bool (x y : bool) (H : @IsomorphismDefinitions.eq bool x y) : x = y :=
  match H in (IsomorphismDefinitions.eq _ z) return x = z with
  | IsomorphismDefinitions.eq_refl => Logic.eq_refl
  end.

(* Now prove that ev_imp n implies is_even_imported n = true (as SProp first) *)
Definition ev_imp_implies_even_sprop : forall n : Imported.nat, 
  ev_imp n -> @IsomorphismDefinitions.eq bool (is_even_imported n) true.
Proof.
  intros n H.
  refine (Imported.Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_sind
            (fun m _ => @IsomorphismDefinitions.eq bool (is_even_imported m) true)
            _ _ n H).
  - exact IsomorphismDefinitions.eq_refl.
  - intros n' H' IH. exact IH.
Defined.

(* Convert to Prop eq *)
Definition ev_imp_implies_even (n : Imported.nat) (H : ev_imp n) : is_even_imported n = true :=
  @sprop_eq_to_prop_eq_bool (is_even_imported n) true (@ev_imp_implies_even_sprop n H).

(* Transport is_even along the round-trip *)
Definition ev_from_imported (n : Imported.nat) (H : ev_imp n) : ev_orig (imported_to_nat n) :=
  ev_of_is_even (imported_to_nat n) 
    (match imported_round_trip n as Heq in (@Logic.eq _ _ m) 
           return is_even_imported m = true -> 
                  is_even_imported (nat_to_imported (imported_to_nat n)) = true
     with
     | Logic.eq_refl => fun x => x
     end (@ev_imp_implies_even n H)).

(* Build the isomorphism as a direct definition *)
Definition ev_iso_to (x1 : nat) (x2 : imported_nat) 
  (Hx : IsomorphismDefinitions.eq (nat_to_imported x1) x2) 
  (Hev : ev_orig x1) : ev_imp x2 :=
  match Hx in (IsomorphismDefinitions.eq _ y) return ev_imp y with
  | IsomorphismDefinitions.eq_refl => @ev_to_imported x1 Hev
  end.

Definition ev_iso_from (x1 : nat) (x2 : imported_nat)
  (Hx : IsomorphismDefinitions.eq (nat_to_imported x1) x2)
  (H : ev_imp x2) : ev_orig x1 :=
  let H' := match Hx in (IsomorphismDefinitions.eq _ y) return ev_imp y -> ev_imp (nat_to_imported x1) with
            | IsomorphismDefinitions.eq_refl => fun h => h
            end H in
  let H'' := @ev_from_imported (nat_to_imported x1) H' in
  match nat_round_trip x1 in (_ = m) return ev_orig m with
  | Logic.eq_refl => H''
  end.

Require Import Stdlib.Logic.ProofIrrelevance.

(* Convert proof irrelevance to SProp equality for Prop types *)
Definition prop_proof_irrel_to_seq : forall (P : Prop) (p1 p2 : P), IsomorphismDefinitions.eq p1 p2 :=
  fun P p1 p2 =>
    match proof_irrelevance P p1 p2 in (_ = p) return IsomorphismDefinitions.eq p1 p with
    | Logic.eq_refl => IsomorphismDefinitions.eq_refl
    end.

Instance Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso : (forall (x1 : nat) (x2 : imported_nat) (_ : @rel_iso nat imported_nat nat_iso x1 x2),
   Iso (Original.LF_DOT_IndProp.LF.IndProp.EvPlayground.ev x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev x2)).
Proof.
  intros x1 x2 Hx.
  destruct Hx as [Hx]. simpl in Hx.
  unfold imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev.
  refine {|
    to := @ev_iso_to x1 x2 Hx;
    from := @ev_iso_from x1 x2 Hx;
    to_from := fun _ => IsomorphismDefinitions.eq_refl;
    from_to := _
  |}.
  intro e.
  apply prop_proof_irrel_to_seq.
Defined.

Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.EvPlayground.ev := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.EvPlayground.ev Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.EvPlayground.ev Imported.Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso := {}.