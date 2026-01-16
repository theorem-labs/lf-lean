From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_proofU_objects__U2_lf__U_proofU_objects__U_props__ex__iso Isomorphisms.U_original__U2_lf_dot_U_proofU_objects__U2_lf__U_proofU_objects__U_props__or__iso.

Monomorphic Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_dist__exists__or__term : forall (x : Type) (x0 x1 : x -> SProp),
  imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex (fun H : x => imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or (x0 H) (x1 H)) ->
  imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex (fun H : x => x0 H))
    (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex (fun H : x => x1 H)) := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_dist__exists__or__term.
Monomorphic Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_dist__exists__or__term_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1 -> Prop) (x4 : x2 -> SProp) (hx0 : forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> Iso (x3 x5) (x4 x6)) (x5 : x1 -> Prop) 
    (x6 : x2 -> SProp) (hx1 : forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> Iso (x5 x7) (x6 x8))
    (x7 : Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.ex (fun x : x1 => Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.or (x3 x) (x5 x)))
    (x8 : imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex (fun H : x2 => imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or (x4 H) (x6 H))),
  rel_iso
    (relax_Iso_Ts_Ps
       (Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex_iso (fun x : x1 => Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.or (x3 x) (x5 x))
          (fun H : x2 => imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or (x4 H) (x6 H))
          (fun (x9 : x1) (x10 : x2) (hx2 : rel_iso hx x9 x10) => Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or_iso (hx0 x9 x10 hx2) (hx1 x9 x10 hx2))))
    x7 x8 ->
  rel_iso
    (relax_Iso_Ts_Ps
       (Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_or_iso
          (Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex_iso (fun x : x1 => x3 x) (fun H : x2 => x4 H) (fun (x9 : x1) (x10 : x2) (hx3 : rel_iso hx x9 x10) => hx0 x9 x10 hx3))
          (Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex_iso (fun x : x1 => x5 x) (fun H : x2 => x6 H) (fun (x9 : x1) (x10 : x2) (hx3 : rel_iso hx x9 x10) => hx1 x9 x10 hx3))))
    (Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.dist_exists_or_term x1 x3 x5 x7) (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_dist__exists__or__term x4 x6 x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.dist_exists_or_term := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_dist__exists__or__term := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.dist_exists_or_term Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_dist__exists__or__term_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.dist_exists_or_term Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_dist__exists__or__term Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_dist__exists__or__term_iso := {}.