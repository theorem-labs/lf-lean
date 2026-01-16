From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)


(* The imported cnat is definitionally equal to the original cnat *)
Definition imported_Original_LF__DOT__Poly_LF_Poly_Exercises_cnat : Type := forall x2 : Type, (x2 -> x2) -> x2 -> x2.

(* Verify that Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_cnat is definitionally equal to our definition *)
Lemma imported_cnat_eq : imported_Original_LF__DOT__Poly_LF_Poly_Exercises_cnat = Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_cnat.
Proof. reflexivity. Qed.

Instance Original_LF__DOT__Poly_LF_Poly_Exercises_cnat_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso ((x1 -> x1) -> x1 -> x1) ((x2 -> x2) -> x2 -> x2)
  := fun (x1 x2 : Type) (hx : Iso x1 x2) => IsoArrow (IsoArrow hx hx) (IsoArrow hx hx).

Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.Exercises.cnat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_cnat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.Exercises.cnat Original_LF__DOT__Poly_LF_Poly_Exercises_cnat_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.Exercises.cnat Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_cnat Original_LF__DOT__Poly_LF_Poly_Exercises_cnat_iso := {}.