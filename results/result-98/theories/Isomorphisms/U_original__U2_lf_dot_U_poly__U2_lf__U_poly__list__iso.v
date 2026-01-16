From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


Definition imported_Original_LF__DOT__Poly_LF_Poly_list : Type -> Type := Imported.Original_LF__DOT__Poly_LF_Poly_list.
Instance Original_LF__DOT__Poly_LF_Poly_list_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso (Original.LF_DOT_Poly.LF.Poly.list x1) (imported_Original_LF__DOT__Poly_LF_Poly_list x2).
Proof.
  intros x1 x2 Hx.
  unshelve eapply Build_Iso.
  - (* to: Original.list x1 -> Imported.list x2 *)
    exact (fix to_list (l : Original.LF_DOT_Poly.LF.Poly.list x1) : imported_Original_LF__DOT__Poly_LF_Poly_list x2 :=
      match l with
      | Original.LF_DOT_Poly.LF.Poly.nil => Imported.Original_LF__DOT__Poly_LF_Poly_list_nil x2
      | Original.LF_DOT_Poly.LF.Poly.cons h t => 
          Imported.Original_LF__DOT__Poly_LF_Poly_list_cons x2 (to Hx h) (to_list t)
      end).
  - (* from: Imported.list x2 -> Original.list x1 *)
    exact (fix from_list (l : imported_Original_LF__DOT__Poly_LF_Poly_list x2) : Original.LF_DOT_Poly.LF.Poly.list x1 :=
      match l with
      | Imported.Original_LF__DOT__Poly_LF_Poly_list_nil _ => Original.LF_DOT_Poly.LF.Poly.nil
      | Imported.Original_LF__DOT__Poly_LF_Poly_list_cons _ h t => 
          Original.LF_DOT_Poly.LF.Poly.cons (from Hx h) (from_list t)
      end).
  - (* to_from *)
    intro l.
    induction l as [|h t IH].
    + apply IsomorphismDefinitions.eq_refl.
    + simpl. 
      apply (IsoEq.f_equal2 (Imported.Original_LF__DOT__Poly_LF_Poly_list_cons x2) (to_from Hx h) IH).
  - (* from_to *)
    intro l.
    induction l as [|h t IH].
    + apply IsomorphismDefinitions.eq_refl.
    + simpl.
      apply (IsoEq.f_equal2 (@Original.LF_DOT_Poly.LF.Poly.cons x1) (from_to Hx h) IH).
Defined.
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.list := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_list := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.list Original_LF__DOT__Poly_LF_Poly_list_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.list Imported.Original_LF__DOT__Poly_LF_Poly_list Original_LF__DOT__Poly_LF_Poly_list_iso := {}.