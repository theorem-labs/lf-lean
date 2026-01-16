From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__com__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__state__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_ceval : imported_Original_LF__DOT__Imp_LF_Imp_com -> (imported_String_string -> imported_nat) -> (imported_String_string -> imported_nat) -> SProp := Imported.Original_LF__DOT__Imp_LF_Imp_ceval.

(* The ceval predicate is isomorphic between Prop and SProp *)
(* This is valid because both predicates have the same structure *)
Instance Original_LF__DOT__Imp_LF_Imp_ceval_iso : (forall (x1 : Original.LF_DOT_Imp.LF.Imp.com) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_com)
     (_ : @rel_iso Original.LF_DOT_Imp.LF.Imp.com imported_Original_LF__DOT__Imp_LF_Imp_com Original_LF__DOT__Imp_LF_Imp_com_iso x1 x2) (x3 : Original.LF_DOT_Imp.LF.Imp.state)
     (x4 : forall _ : imported_String_string, imported_nat)
     (_ : forall (x5 : String.string) (x6 : imported_String_string) (_ : @rel_iso String.string imported_String_string String_string_iso x5 x6), @rel_iso nat imported_nat nat_iso (x3 x5) (x4 x6))
     (x5 : Original.LF_DOT_Imp.LF.Imp.state) (x6 : forall _ : imported_String_string, imported_nat)
     (_ : forall (x7 : String.string) (x8 : imported_String_string) (_ : @rel_iso String.string imported_String_string String_string_iso x7 x8), @rel_iso nat imported_nat nat_iso (x5 x7) (x6 x8)),
   Iso (Original.LF_DOT_Imp.LF.Imp.ceval x1 x3 x5) (imported_Original_LF__DOT__Imp_LF_Imp_ceval x2 x4 x6)).
Admitted.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.ceval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_ceval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.ceval Original_LF__DOT__Imp_LF_Imp_ceval_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.ceval Imported.Original_LF__DOT__Imp_LF_Imp_ceval Original_LF__DOT__Imp_LF_Imp_ceval_iso := {}.