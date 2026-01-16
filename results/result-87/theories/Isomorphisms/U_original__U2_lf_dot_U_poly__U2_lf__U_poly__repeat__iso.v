From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_repeat : forall x : Type, x -> imported_nat -> imported_Original_LF__DOT__Poly_LF_Poly_list x := Imported.Original_LF__DOT__Poly_LF_Poly_repeat.

(* Helper lemma: list_iso hx (repeat x3 count) = repeat x2 (hx x3) (nat_iso count) *)
Lemma repeat_iso_helper : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (count : nat),
  IsomorphismDefinitions.eq 
    (Original_LF__DOT__Poly_LF_Poly_list_iso hx (Original.LF_DOT_Poly.LF.Poly.repeat x1 x3 count))
    (Imported.Original_LF__DOT__Poly_LF_Poly_repeat x2 (hx x3) (nat_iso count)).
Proof.
  intros x1 x2 hx x3 count.
  induction count as [|n IH].
  - simpl. apply IsomorphismDefinitions.eq_refl.
  - simpl.
    apply (f_equal2 (Imported.Original_LF__DOT__Poly_LF_Poly_list_cons x2) IsomorphismDefinitions.eq_refl IH).
Qed.

Instance Original_LF__DOT__Poly_LF_Poly_repeat_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2),
  rel_iso hx x3 x4 ->
  forall (x5 : nat) (x6 : imported_nat),
  rel_iso nat_iso x5 x6 -> rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) (Original.LF_DOT_Poly.LF.Poly.repeat x1 x3 x5) (imported_Original_LF__DOT__Poly_LF_Poly_repeat x4 x6).
Proof.
  intros x1 x2 hx x3 x4 Hx34 x5 x6 Hx56.
  
  (* Hx34 : eq (hx x3) x4 *)
  (* Hx56 : eq (nat_iso x5) x6 *)
  (* Goal: eq (list_iso hx (repeat x1 x3 x5)) (repeat x2 x4 x6) *)
  
  (* First use the helper lemma *)
  pose proof (@repeat_iso_helper x1 x2 hx x3 x5) as H.
  (* H : eq (list_iso hx (repeat x3 x5)) (repeat x2 (hx x3) (nat_iso x5)) *)
  
  (* Use eq_sind to transport H along Hx34 and Hx56 *)
  refine (IsomorphismDefinitions.eq_sind x2 (hx x3) 
    (fun y _ => IsomorphismDefinitions.eq 
      (Original_LF__DOT__Poly_LF_Poly_list_iso hx (Original.LF_DOT_Poly.LF.Poly.repeat x1 x3 x5))
      (Imported.Original_LF__DOT__Poly_LF_Poly_repeat x2 y x6)) _ x4 Hx34).
  refine (IsomorphismDefinitions.eq_sind imported_nat (nat_iso x5) 
    (fun y _ => IsomorphismDefinitions.eq 
      (Original_LF__DOT__Poly_LF_Poly_list_iso hx (Original.LF_DOT_Poly.LF.Poly.repeat x1 x3 x5))
      (Imported.Original_LF__DOT__Poly_LF_Poly_repeat x2 (hx x3) y)) H x6 Hx56).
Defined.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.repeat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_repeat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.repeat Original_LF__DOT__Poly_LF_Poly_repeat_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.repeat Imported.Original_LF__DOT__Poly_LF_Poly_repeat Original_LF__DOT__Poly_LF_Poly_repeat_iso := {}.