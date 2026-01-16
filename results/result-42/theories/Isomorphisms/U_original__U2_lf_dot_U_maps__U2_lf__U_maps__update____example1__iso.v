From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__examplemapSQUOTE__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Definition imported_Original_LF__DOT__Maps_LF_Maps_update__example1 : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Maps_LF_Maps_examplemap'
       (imported_String_String (imported_Ascii_Ascii imported_false imported_true imported_false imported_false imported_false imported_true imported_true imported_false)
          (imported_String_String (imported_Ascii_Ascii imported_true imported_false imported_false imported_false imported_false imported_true imported_true imported_false)
             (imported_String_String (imported_Ascii_Ascii imported_false imported_true imported_false imported_true imported_true imported_true imported_true imported_false)
                imported_String_EmptyString))))
    imported_false := Imported.Original_LF__DOT__Maps_LF_Maps_update__example1.

(* update_example1 is an axiom (Admitted) in Original.v, and we also declared it as an axiom in Lean.
   Both axioms have corresponding types, so we can prove the isomorphism using proof irrelevance
   for the SProp equality type. *)

Instance Original_LF__DOT__Maps_LF_Maps_update__example1_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Maps_LF_Maps_examplemap'_iso
          (String_String_iso (Ascii_Ascii_iso false_iso true_iso false_iso false_iso false_iso true_iso true_iso false_iso)
             (String_String_iso (Ascii_Ascii_iso true_iso false_iso false_iso false_iso false_iso true_iso true_iso false_iso)
                (String_String_iso (Ascii_Ascii_iso false_iso true_iso false_iso true_iso true_iso true_iso true_iso false_iso) String_EmptyString_iso))))
       false_iso)
    Original.LF_DOT_Maps.LF.Maps.update_example1 imported_Original_LF__DOT__Maps_LF_Maps_update__example1.
Proof.
  (* The target type is in SProp - use proof irrelevance *)
  exact IsomorphismDefinitions.eq_refl.
Defined.

Instance: KnownConstant Original.LF_DOT_Maps.LF.Maps.update_example1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Maps_LF_Maps_update__example1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Maps.LF.Maps.update_example1 Original_LF__DOT__Maps_LF_Maps_update__example1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Maps.LF.Maps.update_example1 Imported.Original_LF__DOT__Maps_LF_Maps_update__example1 Original_LF__DOT__Maps_LF_Maps_update__example1_iso := {}.