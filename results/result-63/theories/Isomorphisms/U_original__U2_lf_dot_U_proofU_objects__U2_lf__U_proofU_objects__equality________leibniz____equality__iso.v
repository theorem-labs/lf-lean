From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_proofU_objects__U2_lf__U_proofU_objects__eq__iso.

Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_equality____leibniz__equality : forall (x : Type) (x0 x1 : x), imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_eq x0 x1 -> forall x3 : x -> SProp, x3 x0 -> x3 x1 := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_equality____leibniz__equality.
Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_equality____leibniz__equality_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2) (hx0 : rel_iso hx x3 x4) (x5 : x1) (x6 : x2) (hx1 : rel_iso hx x5 x6) (x7 : Original.LF_DOT_ProofObjects.LF.ProofObjects.eq x3 x5)
    (x8 : imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_eq x4 x6),
  rel_iso (Original_LF__DOT__ProofObjects_LF_ProofObjects_eq_iso hx0 hx1) x7 x8 ->
  forall (x9 : x1 -> Prop) (x10 : x2 -> SProp) (hx3 : forall (x11 : x1) (x12 : x2), rel_iso hx x11 x12 -> Iso (x9 x11) (x10 x12)) (x11 : x9 x3) (x12 : x10 x4),
  rel_iso (hx3 x3 x4 hx0) x11 x12 ->
  rel_iso (hx3 x5 x6 hx1) (Original.LF_DOT_ProofObjects.LF.ProofObjects.equality__leibniz_equality x1 x3 x5 x7 x9 x11)
    (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_equality____leibniz__equality x8 x10 x12).
Admitted.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.equality__leibniz_equality := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_equality____leibniz__equality := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.equality__leibniz_equality Original_LF__DOT__ProofObjects_LF_ProofObjects_equality____leibniz__equality_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.equality__leibniz_equality Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_equality____leibniz__equality Original_LF__DOT__ProofObjects_LF_ProofObjects_equality____leibniz__equality_iso := {}.