From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* (* Typeclasses Opaque rel_iso. *) *) *) (* for speed *)


Definition imported_Original_LF__DOT__Induction_LF_Induction_bin : Type := Imported.Original_LF__DOT__Induction_LF_Induction_bin.

(* Define the forward and backward mappings *)
Fixpoint bin_to_imported (b : Original.LF_DOT_Induction.LF.Induction.bin) : imported_Original_LF__DOT__Induction_LF_Induction_bin :=
  match b with
  | Original.LF_DOT_Induction.LF.Induction.Z => Imported.Original_LF__DOT__Induction_LF_Induction_bin_Z
  | Original.LF_DOT_Induction.LF.Induction.B0 n => Imported.Original_LF__DOT__Induction_LF_Induction_bin_B0 (bin_to_imported n)
  | Original.LF_DOT_Induction.LF.Induction.B1 n => Imported.Original_LF__DOT__Induction_LF_Induction_bin_B1 (bin_to_imported n)
  end.

Fixpoint imported_to_bin (b : imported_Original_LF__DOT__Induction_LF_Induction_bin) : Original.LF_DOT_Induction.LF.Induction.bin :=
  match b with
  | Imported.Original_LF__DOT__Induction_LF_Induction_bin_Z => Original.LF_DOT_Induction.LF.Induction.Z
  | Imported.Original_LF__DOT__Induction_LF_Induction_bin_B0 n => Original.LF_DOT_Induction.LF.Induction.B0 (imported_to_bin n)
  | Imported.Original_LF__DOT__Induction_LF_Induction_bin_B1 n => Original.LF_DOT_Induction.LF.Induction.B1 (imported_to_bin n)
  end.

Lemma bin_roundtrip1 : forall b, imported_to_bin (bin_to_imported b) = b.
Proof.
  fix IH 1.
  intro b. destruct b; simpl.
  - reflexivity.
  - f_equal. apply IH.
  - f_equal. apply IH.
Qed.

Lemma bin_roundtrip2 : forall b, bin_to_imported (imported_to_bin b) = b.
Proof.
  fix IH 1.
  intro b. destruct b; simpl.
  - reflexivity.
  - f_equal. apply IH.
  - f_equal. apply IH.
Qed.

(* Use seq_of_eq to convert from regular = to IsomorphismDefinitions.eq *)
Instance Original_LF__DOT__Induction_LF_Induction_bin_iso : Iso Original.LF_DOT_Induction.LF.Induction.bin imported_Original_LF__DOT__Induction_LF_Induction_bin :=
  Build_Iso bin_to_imported imported_to_bin
    (fun b => seq_of_eq (bin_roundtrip2 b))
    (fun b => seq_of_eq (bin_roundtrip1 b)).

Instance: KnownConstant Original.LF_DOT_Induction.LF.Induction.bin := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Induction_LF_Induction_bin := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Induction.LF.Induction.bin Original_LF__DOT__Induction_LF_Induction_bin_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Induction.LF.Induction.bin Imported.Original_LF__DOT__Induction_LF_Induction_bin Original_LF__DOT__Induction_LF_Induction_bin_iso := {}.