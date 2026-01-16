From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_proofU_objects__U2_lf__U_proofU_objects__U_props__ex__iso Isomorphisms.U_original__U2_lf_dot_U_proofU_objects__U2_lf__U_proofU_objects__ev__iso.

Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_some__nat__is__even : imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex (fun H : imported_nat => imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev H) := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_some__nat__is__even.
Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_some__nat__is__even_iso : rel_iso
    {|
      to :=
        Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex_iso (fun n : nat => Original.LF_DOT_ProofObjects.LF.ProofObjects.ev n)
          (fun H : imported_nat => imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev H)
          (fun (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) => Original_LF__DOT__ProofObjects_LF_ProofObjects_ev_iso hx);
      from :=
        from
          (Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex_iso (fun n : nat => Original.LF_DOT_ProofObjects.LF.ProofObjects.ev n)
             (fun H : imported_nat => imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev H)
             (fun (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) => Original_LF__DOT__ProofObjects_LF_ProofObjects_ev_iso hx));
      to_from :=
        fun x : imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex (fun H : imported_nat => imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev H) =>
        to_from
          (Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex_iso (fun n : nat => Original.LF_DOT_ProofObjects.LF.ProofObjects.ev n)
             (fun H : imported_nat => imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev H)
             (fun (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) => Original_LF__DOT__ProofObjects_LF_ProofObjects_ev_iso hx))
          x;
      from_to :=
        fun x : Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.ex (fun n : nat => Original.LF_DOT_ProofObjects.LF.ProofObjects.ev n) =>
        seq_p_of_t
          (from_to
             (Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_ex_iso (fun n : nat => Original.LF_DOT_ProofObjects.LF.ProofObjects.ev n)
                (fun H : imported_nat => imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_ev H)
                (fun (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) => Original_LF__DOT__ProofObjects_LF_ProofObjects_ev_iso hx))
             x)
    |} Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.some_nat_is_even imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_some__nat__is__even.
Admitted.
Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.some_nat_is_even := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_some__nat__is__even := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.some_nat_is_even Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_some__nat__is__even_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.some_nat_is_even Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_some__nat__is__even Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_some__nat__is__even_iso := {}.