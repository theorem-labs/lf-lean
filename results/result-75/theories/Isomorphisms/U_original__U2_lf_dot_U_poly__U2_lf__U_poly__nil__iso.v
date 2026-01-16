From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso.

Monomorphic Definition imported_Original_LF__DOT__Poly_LF_Poly_nil : forall x : Type, imported_Original_LF__DOT__Poly_LF_Poly_list x := fun x => @imported_Original_LF__DOT__Poly_LF_Poly_list_nil x.
Monomorphic Instance Original_LF__DOT__Poly_LF_Poly_nil_iso : forall (x1 x2 : Type) (hx : Iso x1 x2), rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) Original.LF_DOT_Poly.LF.Poly.nil (imported_Original_LF__DOT__Poly_LF_Poly_nil x2).
Proof.
  (* Since nil is part of the axiomatized list structure, we admit this *)
  admit.
Admitted.
Instance: KnownConstant (@Original.LF_DOT_Poly.LF.Poly.nil) := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant imported_Original_LF__DOT__Poly_LF_Poly_nil := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor (@Original.LF_DOT_Poly.LF.Poly.nil) Original_LF__DOT__Poly_LF_Poly_nil_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Poly.LF.Poly.nil) imported_Original_LF__DOT__Poly_LF_Poly_nil Original_LF__DOT__Poly_LF_Poly_nil_iso := {}.