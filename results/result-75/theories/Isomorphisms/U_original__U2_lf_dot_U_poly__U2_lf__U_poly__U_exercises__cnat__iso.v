From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)

(* cnat is just a type alias for: forall X : Type, (X -> X) -> X -> X *)
(* The original and imported definitions are both the same type, so this is trivial *)

Monomorphic Definition imported_Original_LF__DOT__Poly_LF_Poly_Exercises_cnat : Type := Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_cnat.

(* Prove they are identical by showing that the original is definitionally equal to the imported *)
Monomorphic Lemma cnat_eq : Original.LF_DOT_Poly.LF.Poly.Exercises.cnat = imported_Original_LF__DOT__Poly_LF_Poly_Exercises_cnat.
Proof. reflexivity. Defined.

Monomorphic Instance Original_LF__DOT__Poly_LF_Poly_Exercises_cnat_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso ((x1 -> x1) -> x1 -> x1) ((x2 -> x2) -> x2 -> x2)
  := fun (x1 x2 : Type) (hx : Iso x1 x2) => IsoArrow (IsoArrow hx hx) (IsoArrow hx hx).

Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.Exercises.cnat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_cnat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.Exercises.cnat Original_LF__DOT__Poly_LF_Poly_Exercises_cnat_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.Exercises.cnat Imported.Original_LF__DOT__Poly_LF_Poly_Exercises_cnat Original_LF__DOT__Poly_LF_Poly_Exercises_cnat_iso := {}.