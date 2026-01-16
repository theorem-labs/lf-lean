From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


(* Since Imported.v doesn't have Poly definitions, we axiomatize them *)
Axiom imported_Original_LF__DOT__Poly_LF_Poly_list : Type -> Type.
Axiom imported_Original_LF__DOT__Poly_LF_Poly_list_nil : forall {A : Type}, imported_Original_LF__DOT__Poly_LF_Poly_list A.
Axiom imported_Original_LF__DOT__Poly_LF_Poly_list_cons : forall {A : Type}, A -> imported_Original_LF__DOT__Poly_LF_Poly_list A -> imported_Original_LF__DOT__Poly_LF_Poly_list A.


(* Since we're axiomatizing the list type, we need to axiomatize the isomorphism too *)
Axiom Original_LF__DOT__Poly_LF_Poly_list_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso (Original.LF_DOT_Poly.LF.Poly.list x1) (imported_Original_LF__DOT__Poly_LF_Poly_list x2).
Instance: KnownConstant Original.LF_DOT_Poly.LF.Poly.list := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant imported_Original_LF__DOT__Poly_LF_Poly_list := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Poly.LF.Poly.list Original_LF__DOT__Poly_LF_Poly_list_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Poly.LF.Poly.list imported_Original_LF__DOT__Poly_LF_Poly_list Original_LF__DOT__Poly_LF_Poly_list_iso := {}.