From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__total____map__iso Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_empty__st : imported_String_string -> imported_nat := Imported.Original_LF__DOT__Imp_LF_Imp_empty__st.
Instance Original_LF__DOT__Imp_LF_Imp_empty__st_iso : forall (x1 : String.string) (x2 : imported_String_string),
  rel_iso String_string_iso x1 x2 -> rel_iso nat_iso (Original.LF_DOT_Imp.LF.Imp.empty_st x1) (imported_Original_LF__DOT__Imp_LF_Imp_empty__st x2).
Proof.
  intros x1 x2 Hrel.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_empty__st.
  constructor.
  (* empty_st is t_empty 0 = fun _ => 0 *)
  (* Original.LF_DOT_Imp.LF.Imp.empty_st x1 = 0 *)
  (* Imported.Original_LF__DOT__Imp_LF_Imp_empty__st x2 = Imported.nat_O *)
  simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.empty_st := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_empty__st := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.empty_st Original_LF__DOT__Imp_LF_Imp_empty__st_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.empty_st Imported.Original_LF__DOT__Imp_LF_Imp_empty__st Original_LF__DOT__Imp_LF_Imp_empty__st_iso := {}.