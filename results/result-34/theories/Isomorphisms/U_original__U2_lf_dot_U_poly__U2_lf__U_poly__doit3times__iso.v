From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(*Typeclasses Opaque rel_iso.*) (* for speed *)


Definition imported_Original_LF__DOT__Poly_LF_Poly_doit3times : forall x : Type, (x -> x) -> x -> x := (@Imported.Original_LF__DOT__Poly_LF_Poly_doit3times).

(* doit3times f n = f (f (f n)) in both implementations *)
Instance Original_LF__DOT__Poly_LF_Poly_doit3times_iso : forall (x1 x2 : Type) (hx : IsoOrSortRelaxed x1 x2) (x3 : x1 -> x1) (x4 : x2 -> x2),
  (forall (x5 : x1) (x6 : x2), rel_iso_sort hx x5 x6 -> rel_iso_sort hx (x3 x5) (x4 x6)) ->
  forall (x5 : x1) (x6 : x2), rel_iso_sort hx x5 x6 -> rel_iso_sort hx (Original.LF_DOT_Poly.LF.Poly.doit3times x3 x5) (imported_Original_LF__DOT__Poly_LF_Poly_doit3times x4 x6).
Proof.
  intros x1 x2 hx f1 f2 Hf n1 n2 Hn.
  unfold Original.LF_DOT_Poly.LF.Poly.doit3times.
  unfold imported_Original_LF__DOT__Poly_LF_Poly_doit3times.
  unfold Imported.Original_LF__DOT__Poly_LF_Poly_doit3times.
  (* Both are f (f (f n)), so apply Hf three times *)
  apply Hf. apply Hf. apply Hf. exact Hn.
Defined.

Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.doit3times) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant (@Imported.Original_LF__DOT__Poly_LF_Poly_doit3times) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.doit3times) Original_LF__DOT__Poly_LF_Poly_doit3times_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.doit3times) (@Imported.Original_LF__DOT__Poly_LF_Poly_doit3times) Original_LF__DOT__Poly_LF_Poly_doit3times_iso := {}.