From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
From Stdlib Require Import Logic.ProofIrrelevance.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3 : forall x : Type, imported_Original_LF__DOT__Poly_LF_Poly_list x -> imported_Original_LF__DOT__Poly_LF_Poly_list x -> SProp := (@Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3).

(* Helper to convert lists *)
Definition to_imported_list {X1 X2 : Type} (hx : Iso X1 X2) : 
  Original.LF_DOT_Poly.LF.Poly.list X1 -> imported_Original_LF__DOT__Poly_LF_Poly_list X2 :=
  to (Original_LF__DOT__Poly_LF_Poly_list_iso hx).

Definition from_imported_list {X1 X2 : Type} (hx : Iso X1 X2) : 
  imported_Original_LF__DOT__Poly_LF_Poly_list X2 -> Original.LF_DOT_Poly.LF.Poly.list X1 :=
  from (Original_LF__DOT__Poly_LF_Poly_list_iso hx).

(* The core conversion functions for Perm3 - using fix for SProp compatibility *)
Fixpoint perm3_to {X1 X2 : Type} (hx : Iso X1 X2)
  {l1 l2 : Original.LF_DOT_Poly.LF.Poly.list X1} 
  (p : Original.LF_DOT_IndProp.LF.IndProp.Perm3Reminder.Perm3 l1 l2) {struct p} :
  imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3 
    (to_imported_list hx l1) (to_imported_list hx l2) :=
  match p with
  | Original.LF_DOT_IndProp.LF.IndProp.Perm3Reminder.perm3_swap12 a b c =>
      Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3_perm3_swap12 
        X2 (to hx a) (to hx b) (to hx c)
  | Original.LF_DOT_IndProp.LF.IndProp.Perm3Reminder.perm3_swap23 a b c =>
      Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3_perm3_swap23 
        X2 (to hx a) (to hx b) (to hx c)
  | Original.LF_DOT_IndProp.LF.IndProp.Perm3Reminder.perm3_trans l1' l2' l3' p1 p2 =>
      Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3_perm3_trans 
        X2 _ _ _ (perm3_to hx p1) (perm3_to hx p2)
  end.

(* Build a perm3_from that returns into SInhabited (which is SProp) *)
Fixpoint perm3_from_sinhabited {X1 X2 : Type} (hx : Iso X1 X2)
  {l1' l2' : imported_Original_LF__DOT__Poly_LF_Poly_list X2}
  (p : imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3 l1' l2') {struct p} :
  SInhabited (Original.LF_DOT_IndProp.LF.IndProp.Perm3Reminder.Perm3 
    (from_imported_list hx l1') (from_imported_list hx l2')) :=
  match p in Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3 _ l1'' l2''
        return SInhabited (Original.LF_DOT_IndProp.LF.IndProp.Perm3Reminder.Perm3 
                 (from_imported_list hx l1'') (from_imported_list hx l2'')) with
  | Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3_perm3_swap12 _ a b c =>
      sinhabits (Original.LF_DOT_IndProp.LF.IndProp.Perm3Reminder.perm3_swap12 
        (from hx a) (from hx b) (from hx c))
  | Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3_perm3_swap23 _ a b c =>
      sinhabits (Original.LF_DOT_IndProp.LF.IndProp.Perm3Reminder.perm3_swap23 
        (from hx a) (from hx b) (from hx c))
  | Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3_perm3_trans _ l1'' l2'' l3'' p1 p2 =>
      sinhabits (Original.LF_DOT_IndProp.LF.IndProp.Perm3Reminder.perm3_trans _ _ _ 
        (sinhabitant (perm3_from_sinhabited hx p1)) 
        (sinhabitant (perm3_from_sinhabited hx p2)))
  end.

Instance Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Poly.LF.Poly.list x1) (x4 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3 x4 ->
  forall (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6 ->
  Iso (Original.LF_DOT_IndProp.LF.IndProp.Perm3Reminder.Perm3 x3 x5) (imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3 x4 x6).
Proof.
  intros x1 x2 hx x3 x4 H34 x5 x6 H56.
  (* unfold rel_iso in *. *)
  (* H34 : to list_iso x3 = x4, H56 : to list_iso x5 = x6 *)
  apply relax_Iso_Ps_Ts.
  unshelve eapply Build_Iso.
  - (* to: Perm3 x3 x5 -> Perm3 x4 x6 *)
    intro p.
    pose proof (perm3_to hx p) as p'.
    unfold to_imported_list in p'.
    (* p' : Perm3 (to x3) (to x5), we need Perm3 x4 x6 *)
    exact (match H34 in (IsomorphismDefinitions.eq _ y) return 
             imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3 y _ with
           | IsomorphismDefinitions.eq_refl => 
               match H56 in (IsomorphismDefinitions.eq _ z) return 
                 imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3 _ z with
               | IsomorphismDefinitions.eq_refl => p'
               end
           end).
  - (* from: Perm3 x4 x6 -> Perm3 x3 x5 *)
    intro p.
    (* Transport p to Perm3 (to x3) (to x5) *)
    pose proof (match H34 in (IsomorphismDefinitions.eq _ y) return 
                  imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3 y x6 -> 
                  imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3 
                    (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3) x6 with
                | IsomorphismDefinitions.eq_refl => fun q => q
                end p) as p'.
    pose proof (match H56 in (IsomorphismDefinitions.eq _ z) return 
                  imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3 _ z -> 
                  imported_Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3 
                    (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3) 
                    (to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5) with
                | IsomorphismDefinitions.eq_refl => fun q => q
                end p') as p''.
    (* Use perm3_from_sinhabited and sinhabitant *)
    pose proof (perm3_from_sinhabited hx p'') as q.
    unfold from_imported_list in q.
    (* q : SInhabited (Perm3 (from (to x3)) (from (to x5))) *)
    pose proof (sinhabitant q) as q'.
    (* q' : Perm3 (from (to x3)) (from (to x5)) *)
    pose proof (from_to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x3) as E3.
    pose proof (from_to (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5) as E5.
    exact (match E3 in (IsomorphismDefinitions.eq _ y) return 
             Original.LF_DOT_IndProp.LF.IndProp.Perm3Reminder.Perm3 y _ with
           | IsomorphismDefinitions.eq_refl => 
               match E5 in (IsomorphismDefinitions.eq _ z) return 
                 Original.LF_DOT_IndProp.LF.IndProp.Perm3Reminder.Perm3 _ z with
               | IsomorphismDefinitions.eq_refl => q'
               end
           end).
  - (* to_from: for SProp result, any two elements are equal *)
    intro x. apply IsomorphismDefinitions.eq_refl.
  - (* from_to: for Prop, use proof_irrelevance *)
    intro x. apply seq_of_peq, proof_irrelevance.
Defined.
Instance: KnownConstant (@Original.LF_DOT_IndProp.LF.IndProp.Perm3Reminder.Perm3) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_IndProp.LF.IndProp.Perm3Reminder.Perm3) Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_IndProp.LF.IndProp.Perm3Reminder.Perm3) (@Imported.Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3) Original_LF__DOT__IndProp_LF_IndProp_Perm3Reminder_Perm3_iso := {}.