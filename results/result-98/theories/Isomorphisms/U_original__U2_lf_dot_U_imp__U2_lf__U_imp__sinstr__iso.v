From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.nat__iso Isomorphisms.U_string__string__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_sinstr : Type := Imported.Original_LF__DOT__Imp_LF_Imp_sinstr.
Instance Original_LF__DOT__Imp_LF_Imp_sinstr_iso : Iso Original.LF_DOT_Imp.LF.Imp.sinstr imported_Original_LF__DOT__Imp_LF_Imp_sinstr.
Proof.
  exists (fun s : Original.LF_DOT_Imp.LF.Imp.sinstr =>
            match s with
            | Original.LF_DOT_Imp.LF.Imp.SPush n => Imported.Original_LF__DOT__Imp_LF_Imp_sinstr_SPush (to nat_iso n)
            | Original.LF_DOT_Imp.LF.Imp.SLoad x => Imported.Original_LF__DOT__Imp_LF_Imp_sinstr_SLoad (to String_string_iso x)
            | Original.LF_DOT_Imp.LF.Imp.SPlus => Imported.Original_LF__DOT__Imp_LF_Imp_sinstr_SPlus
            | Original.LF_DOT_Imp.LF.Imp.SMinus => Imported.Original_LF__DOT__Imp_LF_Imp_sinstr_SMinus
            | Original.LF_DOT_Imp.LF.Imp.SMult => Imported.Original_LF__DOT__Imp_LF_Imp_sinstr_SMult
            end)
         (fun s : imported_Original_LF__DOT__Imp_LF_Imp_sinstr =>
            match s with
            | Imported.Original_LF__DOT__Imp_LF_Imp_sinstr_SPush n => Original.LF_DOT_Imp.LF.Imp.SPush (from nat_iso n)
            | Imported.Original_LF__DOT__Imp_LF_Imp_sinstr_SLoad x => Original.LF_DOT_Imp.LF.Imp.SLoad (from String_string_iso x)
            | Imported.Original_LF__DOT__Imp_LF_Imp_sinstr_SPlus => Original.LF_DOT_Imp.LF.Imp.SPlus
            | Imported.Original_LF__DOT__Imp_LF_Imp_sinstr_SMinus => Original.LF_DOT_Imp.LF.Imp.SMinus
            | Imported.Original_LF__DOT__Imp_LF_Imp_sinstr_SMult => Original.LF_DOT_Imp.LF.Imp.SMult
            end).
  - intro s. destruct s.
    + simpl. apply (IsoEq.f_equal Imported.Original_LF__DOT__Imp_LF_Imp_sinstr_SPush). apply (to_from nat_iso).
    + simpl. apply (IsoEq.f_equal Imported.Original_LF__DOT__Imp_LF_Imp_sinstr_SLoad). apply (to_from String_string_iso).
    + apply IsomorphismDefinitions.eq_refl.
    + apply IsomorphismDefinitions.eq_refl.
    + apply IsomorphismDefinitions.eq_refl.
  - intro s. destruct s.
    + simpl. apply (IsoEq.f_equal Original.LF_DOT_Imp.LF.Imp.SPush). apply (from_to nat_iso).
    + simpl. apply (IsoEq.f_equal Original.LF_DOT_Imp.LF.Imp.SLoad). apply (from_to String_string_iso).
    + apply IsomorphismDefinitions.eq_refl.
    + apply IsomorphismDefinitions.eq_refl.
    + apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.sinstr := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_sinstr := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.sinstr Original_LF__DOT__Imp_LF_Imp_sinstr_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.sinstr Imported.Original_LF__DOT__Imp_LF_Imp_sinstr Original_LF__DOT__Imp_LF_Imp_sinstr_iso := {}.