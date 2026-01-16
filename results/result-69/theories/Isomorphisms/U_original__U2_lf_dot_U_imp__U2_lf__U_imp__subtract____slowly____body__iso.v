From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__com__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_subtract__slowly__body : imported_Original_LF__DOT__Imp_LF_Imp_com := Imported.Original_LF__DOT__Imp_LF_Imp_subtract__slowly__body.

(* rel_iso is just: to a = b, which means com_to_imported subtract_slowly_body = imported_subtract_slowly_body *)
Instance Original_LF__DOT__Imp_LF_Imp_subtract__slowly__body_iso : rel_iso Original_LF__DOT__Imp_LF_Imp_com_iso Original.LF_DOT_Imp.LF.Imp.subtract_slowly_body imported_Original_LF__DOT__Imp_LF_Imp_subtract__slowly__body.
Proof.
  constructor. simpl.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_subtract__slowly__body.
  unfold Original.LF_DOT_Imp.LF.Imp.subtract_slowly_body.
  simpl.
  simpl com_to_imported.
  (* Now we need to prove the conversion matches *)
  reflexivity.
Defined.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.subtract_slowly_body := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_subtract__slowly__body := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.subtract_slowly_body Original_LF__DOT__Imp_LF_Imp_subtract__slowly__body_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.subtract_slowly_body Imported.Original_LF__DOT__Imp_LF_Imp_subtract__slowly__body Original_LF__DOT__Imp_LF_Imp_subtract__slowly__body_iso := {}.
