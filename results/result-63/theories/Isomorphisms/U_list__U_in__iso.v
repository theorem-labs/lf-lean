From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.list__iso.

Definition imported_List_In : forall x : Type, x -> imported_list x -> SProp := Imported.List_In.

(* Helper to cast along SProp equality *)
Definition cast {A : Type} (P : A -> Type) {x y : A} (e : IsomorphismDefinitions.eq x y) (p : P x) : P y :=
  @IsomorphismDefinitions.eq_rect A x (fun z _ => P z) p y e.

Instance List_In_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2),
  rel_iso hx x3 x4 -> forall (x5 : list x1) (x6 : imported_list x2), rel_iso (list_iso hx) x5 x6 -> Iso (List.In x3 x5) (imported_List_In x4 x6).
Proof.
  intros x1 x2 hx x3 x4 Hx.
  unfold imported_List_In.
  (* First induct on the list, then cast at the end *)
  fix IH 1.
  intros l1 l2 Hl.
  destruct l1 as [|h1 t1].
  - (* nil case *)
    refine (cast (fun y => Iso Logic.False (@Imported.List_In x2 y l2)) Hx _).
    refine (cast (fun y => Iso Logic.False (@Imported.List_In x2 (hx x3) y)) Hl _).
    simpl.
    exact (@Build_Iso Logic.False (@Imported.List_In x2 (hx x3) (Imported.list_nil x2))
        (fun H : Logic.False => match H with end)
        (fun H : Imported.False => match H with end)
        (fun x : Imported.False => match x with end)
        (fun x : Logic.False => match x with end)).
  - (* cons case *)
    simpl.
    specialize (IH t1 ((list_iso hx) t1)).
    assert (Htrel : rel_iso (list_iso hx) t1 ((list_iso hx) t1)) by (constructor; apply IsomorphismDefinitions.eq_refl).
    specialize (IH Htrel).
    pose (IH' := cast (fun y => Iso (List.In x3 t1) (@Imported.List_In x2 y ((list_iso hx) t1))) (IsoEq.eq_sym Hx) IH).
    refine (cast (fun y => Iso (h1 = x3 \/ List.In x3 t1) (@Imported.List_In x2 x4 y)) Hl _).
    simpl.
    refine (cast (fun y => Iso (h1 = x3 \/ List.In x3 t1) (Lean.Or (Imported.Eq x2 (hx h1) y) (@Imported.List_In x2 y ((list_iso hx) t1)))) Hx _).
    (* Goal: Iso (h1 = x3 \/ List.In x3 t1) (Or (Eq x2 (hx h1) (hx x3)) (List_In (hx x3) ((list_iso hx) t1))) *)
    (* Key insight: we need to build the 'from' function without eliminating Or into Prop *)
    (* Use the inhabitant/SInhabited bridge *)
    (* from : Or ... -> (h1 = x3 \/ List.In x3 t1) *)
    (* We can't directly match on Or because it's in SProp *)
    (* But we can use the inhabited/inhabitant functions *)
    pose (eq_inj := fun (e : Imported.Eq x2 (hx h1) (hx x3)) =>
      let heq : hx h1 = hx x3 := 
        match e in Imported.Eq _ _ y return hx h1 = y with
        | Imported.Eq_refl _ _ => Logic.eq_refl
        end in
      match IsoEq.eq_of_seq (IsomorphismDefinitions.from_to hx h1) in (_ = a) return a = x3 with
      | Logic.eq_refl => 
        match IsoEq.eq_of_seq (IsomorphismDefinitions.from_to hx x3) in (_ = b) return IsomorphismDefinitions.from hx (hx h1) = b with
        | Logic.eq_refl => Logic.f_equal (IsomorphismDefinitions.from hx) heq
        end
      end).
    refine (@Build_Iso (h1 = x3 \/ List.In x3 t1) (Lean.Or (Imported.Eq x2 (hx h1) (hx x3)) (@Imported.List_In x2 (hx x3) ((list_iso hx) t1)))
        (fun H => match H with
                  | or_introl p => Lean.Or_inl _ _ (match p with Logic.eq_refl => Imported.Eq_refl _ _ end)
                  | or_intror q => Lean.Or_inr _ _ (IH' q)
                  end)
        (* from: Lean.Or (Eq ...) (List_In ...) -> h1 = x3 \/ List.In x3 t1 *)
        (* We use sinhabitant which is an allowed axiom *)
        (fun H => 
          sinhabitant (
            (* Build SInhabited (h1 = x3 \/ List.In x3 t1) from H : Lean.Or ... *)
            (* We can eliminate Lean.Or into SProp *)
            Imported.Or_indl _ _ (fun _ => SInhabited (h1 = x3 \/ List.In x3 t1))
              (fun e => sinhabits (or_introl (eq_inj e)))
              (fun i => sinhabits (or_intror (IsomorphismDefinitions.from IH' i)))
              H
          )
        )
        _ _).
    + (* to_from - need eq (to (from x)) x, where x : Lean.Or (SProp) *)
      intro x. 
      (* Both sides are in SProp, so they are definitionally equal *)
      exact (@IsomorphismDefinitions.eq_refl _ _).
    + (* from_to - need eq (from (to x)) x, where x : h1 = x3 \/ List.In x3 t1 (Prop) *)
      intro x. 
      (* Use proof irrelevance for Prop, then convert to SProp eq *)
      apply IsoEq.seq_of_eq.
      apply ProofIrrelevance.proof_irrelevance.
Defined.

Instance: KnownConstant List.In := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.List_In := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor List.In List_In_iso := {}.
Instance: IsoStatementProofBetween List.In Imported.List_In List_In_iso := {}.