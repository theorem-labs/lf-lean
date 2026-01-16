From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__prod__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_fst : forall x x0 : Type, imported_Original_LF__DOT__Poly_LF_Poly_prod x x0 -> x := (@Imported.Original_LF__DOT__Poly_LF_Poly_fst).
Instance Original_LF__DOT__Poly_LF_Poly_fst_iso : forall (x1 x2 : Type) (hx : IsoOrSort x1 x2) (x3 x4 : Type) (hx0 : Iso x3 x4) (x5 : Original.LF_DOT_Poly.LF.Poly.prod x1 x3) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_prod x2 x4),
  @rel_iso (Original.LF_DOT_Poly.LF.Poly.prod x1 x3) (imported_Original_LF__DOT__Poly_LF_Poly_prod x2 x4) (@Original_LF__DOT__Poly_LF_Poly_prod_iso x1 x2 (@Iso_of_IsoOrSort x1 x2 hx) x3 x4 hx0) x5 x6 ->
  @rel_iso_sort Datatypes.false x1 x2 (@Relax'IsoOrSort Datatypes.false x1 x2 hx) (@Original.LF_DOT_Poly.LF.Poly.fst x1 x3 x5) (@imported_Original_LF__DOT__Poly_LF_Poly_fst x2 x4 x6).
Proof.
  intros x1 x2 hx x3 x4 hx0 x5 x6 [Hrel].
  destruct x5 as [a b].
  unfold Original_LF__DOT__Poly_LF_Poly_prod_iso in Hrel.
  simpl in Hrel.
  unfold imported_Original_LF__DOT__Poly_LF_Poly_fst.
  refine (eq_srect (A:=imported_Original_LF__DOT__Poly_LF_Poly_prod x2 x4) 
                   (x:=Imported.Original_LF__DOT__Poly_LF_Poly_prod_pair x2 x4 (Iso_of_IsoOrSort hx a) (hx0 b))
                   (fun p => rel_iso_sort hx a (Imported.Original_LF__DOT__Poly_LF_Poly_fst x2 x4 p)) _ Hrel).
  simpl.
  apply rel_iso_sort_of_rel_iso.
  constructor.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.fst) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Poly_LF_Poly_fst) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.fst) Original_LF__DOT__Poly_LF_Poly_fst_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.fst) (@Imported.Original_LF__DOT__Poly_LF_Poly_fst) Original_LF__DOT__Poly_LF_Poly_fst_iso := {}.