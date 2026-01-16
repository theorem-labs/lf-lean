From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_proofU_objects__U2_lf__U_proofU_objects__U_props__ex__iso.

Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex__match : forall (x : Type) (x0 x1 : x -> SProp),
  (forall x2 : x, x0 x2 -> x1 x2) ->
  imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex (fun x2 : x => x0 x2) -> imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex (fun x2 : x => x1 x2) := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex__match.
Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex__match_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1 -> Prop) (x4 : x2 -> SProp) (hx0 : forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> Iso (x3 x5) (x4 x6)) (x5 : x1 -> Prop) 
    (x6 : x2 -> SProp) (hx1 : forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> Iso (x5 x7) (x6 x8)) (x7 : forall x : x1, x3 x -> x5 x) (x8 : forall x : x2, x4 x -> x6 x),
  (forall (x9 : x1) (x10 : x2) (hx2 : rel_iso hx x9 x10) (x11 : x3 x9) (x12 : x4 x10), rel_iso (hx0 x9 x10 hx2) x11 x12 -> rel_iso (hx1 x9 x10 hx2) (x7 x9 x11) (x8 x10 x12)) ->
  forall (x9 : Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.ex (fun x : x1 => x3 x)) (x10 : imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex (fun x : x2 => x4 x)),
  rel_iso (Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex_iso (fun x : x1 => x3 x) (fun x : x2 => x4 x) (fun (x11 : x1) (x12 : x2) (hx3 : rel_iso hx x11 x12) => hx0 x11 x12 hx3)) x9 x10 ->
  rel_iso (Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex_iso (fun x : x1 => x5 x) (fun x : x2 => x6 x) (fun (x11 : x1) (x12 : x2) (hx4 : rel_iso hx x11 x12) => hx1 x11 x12 hx4))
    (Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.ex_match x1 x3 x5 x7 x9) (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex__match x4 x6 x8 x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.ex_match := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex__match := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.ex_match Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex__match_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.ex_match Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex__match Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex__match_iso := {}.