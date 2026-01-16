From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__option__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__prod__iso Isomorphisms.U_string__string__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Tactics_LF_Tactics_manual__grade__for__split__combine : imported_Original_LF__DOT__Poly_LF_Poly_option (imported_Original_LF__DOT__Poly_LF_Poly_prod imported_nat imported_String_string) := Imported.Original_LF__DOT__Tactics_LF_Tactics_manual__grade__for__split__combine.
Instance Original_LF__DOT__Tactics_LF_Tactics_manual__grade__for__split__combine_iso : rel_iso (Original_LF__DOT__Poly_LF_Poly_option_iso (Original_LF__DOT__Poly_LF_Poly_prod_iso nat_iso String_string_iso)) Original.LF_DOT_Tactics.LF.Tactics.manual_grade_for_split_combine
    imported_Original_LF__DOT__Tactics_LF_Tactics_manual__grade__for__split__combine.
Proof.
  (* Both are None, so this is straightforward *)
  apply Build_rel_iso. simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Tactics.LF.Tactics.manual_grade_for_split_combine := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Tactics_LF_Tactics_manual__grade__for__split__combine := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Tactics.LF.Tactics.manual_grade_for_split_combine Original_LF__DOT__Tactics_LF_Tactics_manual__grade__for__split__combine_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Tactics.LF.Tactics.manual_grade_for_split_combine Imported.Original_LF__DOT__Tactics_LF_Tactics_manual__grade__for__split__combine Original_LF__DOT__Tactics_LF_Tactics_manual__grade__for__split__combine_iso := {}.