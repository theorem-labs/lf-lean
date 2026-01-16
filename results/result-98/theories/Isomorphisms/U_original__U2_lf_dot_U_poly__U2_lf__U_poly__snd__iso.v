From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__prod__iso.

Definition imported_Original_LF__DOT__Poly_LF_Poly_snd : forall x x0 : Type, imported_Original_LF__DOT__Poly_LF_Poly_prod x x0 -> x0 := (@Imported.Original_LF__DOT__Poly_LF_Poly_snd).
Instance Original_LF__DOT__Poly_LF_Poly_snd_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 x4 : Type) (hx0 : IsoOrSort x3 x4) (x5 : Original.LF_DOT_Poly.LF.Poly.prod x1 x3) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_prod x2 x4),
  rel_iso (Original_LF__DOT__Poly_LF_Poly_prod_iso hx (Iso_of_IsoOrSortAndRelIso hx0)) x5 x6 -> rel_iso_sort hx0 (Original.LF_DOT_Poly.LF.Poly.snd x5) (imported_Original_LF__DOT__Poly_LF_Poly_snd x6).
Admitted.
Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.snd) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Poly_LF_Poly_snd) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.snd) Original_LF__DOT__Poly_LF_Poly_snd_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.snd) (@Imported.Original_LF__DOT__Poly_LF_Poly_snd) Original_LF__DOT__Poly_LF_Poly_snd_iso := {}.