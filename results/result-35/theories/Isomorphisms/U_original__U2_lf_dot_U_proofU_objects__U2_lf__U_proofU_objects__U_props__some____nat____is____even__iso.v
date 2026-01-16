From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_proofU_objects__U2_lf__U_proofU_objects__U_props__ex__iso Isomorphisms.U_original__U2_lf_dot_U_proofU_objects__U2_lf__U_proofU_objects__ev__iso.

Monomorphic Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_some__nat__is__even : imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex (fun H : imported_nat => imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev H) := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_some__nat__is__even.
Monomorphic Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_some__nat__is__even_iso : rel_iso
    (relax_Iso_Ts_Ps
       (Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex_iso (fun n : nat => Original.LF_DOT_ProofObjects.LF.ProofObjects.ev n)
          (fun H : imported_nat => imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev H)
          (fun (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) => Original_LF__DOT__ProofObjects_LF_ProofObjects_ev_iso hx)))
    Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.some_nat_is_even imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_some__nat__is__even.
Admitted.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.some_nat_is_even := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_some__nat__is__even := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.some_nat_is_even Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_some__nat__is__even_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.some_nat_is_even Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_some__nat__is__even Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_some__nat__is__even_iso := {}.