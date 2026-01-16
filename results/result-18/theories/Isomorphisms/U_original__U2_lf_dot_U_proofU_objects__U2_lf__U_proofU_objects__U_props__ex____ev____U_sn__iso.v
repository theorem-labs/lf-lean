From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_proofU_objects__U2_lf__U_proofU_objects__U_props__ex__iso Isomorphisms.U_original__U2_lf_dot_U_proofU_objects__U2_lf__U_proofU_objects__ev__iso Isomorphisms.U_s__iso.

Monomorphic Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex__ev__Sn : imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex (fun H : imported_nat => imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev (imported_S H)) := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex__ev__Sn.
Monomorphic Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex__ev__Sn_iso : rel_iso
    (relax_Iso_Ts_Ps
       (Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex_iso (fun n : nat => Original.LF_DOT_ProofObjects.LF.ProofObjects.ev (S n))
          (fun H : imported_nat => imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev (imported_S H))
          (fun (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) => Original_LF__DOT__ProofObjects_LF_ProofObjects_ev_iso (S_iso hx))))
    Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.ex_ev_Sn imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex__ev__Sn.
Admitted.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.ex_ev_Sn := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex__ev__Sn := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.ex_ev_Sn Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex__ev__Sn_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.ex_ev_Sn Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex__ev__Sn Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex__ev__Sn_iso := {}.