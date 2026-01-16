From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__examplemapSQUOTE__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Definition imported_Original_LF__DOT__Maps_LF_Maps_update__example4 : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Maps_LF_Maps_examplemap'
       (imported_String_String (imported_Ascii_Ascii imported_false imported_true imported_false imported_false imported_false imported_true imported_true imported_false)
          (imported_String_String (imported_Ascii_Ascii imported_true imported_false imported_false imported_false imported_false imported_true imported_true imported_false)
             (imported_String_String (imported_Ascii_Ascii imported_false imported_true imported_false imported_false imported_true imported_true imported_true imported_false)
                imported_String_EmptyString))))
    imported_true := Imported.Original_LF__DOT__Maps_LF_Maps_update__example4.

Instance Original_LF__DOT__Maps_LF_Maps_update__example4_iso : rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Maps_LF_Maps_examplemap'_iso
          (String_String_iso (Ascii_Ascii_iso false_iso true_iso false_iso false_iso false_iso true_iso true_iso false_iso)
             (String_String_iso (Ascii_Ascii_iso true_iso false_iso false_iso false_iso false_iso true_iso true_iso false_iso)
                (String_String_iso (Ascii_Ascii_iso false_iso true_iso false_iso false_iso true_iso true_iso true_iso false_iso) String_EmptyString_iso))))
       true_iso)
    Original.LF_DOT_Maps.LF.Maps.update_example4 imported_Original_LF__DOT__Maps_LF_Maps_update__example4.
Admitted.
Instance: KnownConstant Original.LF_DOT_Maps.LF.Maps.update_example4 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Maps_LF_Maps_update__example4 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Maps.LF.Maps.update_example4 Original_LF__DOT__Maps_LF_Maps_update__example4_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Maps.LF.Maps.update_example4 Imported.Original_LF__DOT__Maps_LF_Maps_update__example4 Original_LF__DOT__Maps_LF_Maps_update__example4_iso := {}.