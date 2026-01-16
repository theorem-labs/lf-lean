From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__examplemapSQUOTE__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Monomorphic Definition imported_Original_LF__DOT__Maps_LF_Maps_update__example2 : @imported_Corelib_Init_Logic_eq imported_bool
    (imported_Original_LF__DOT__Maps_LF_Maps_examplemap'
       (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string imported_String_EmptyString
          imported_String_String
          (String.String (Ascii.Ascii false true true false false true true false)
             (String.String (Ascii.Ascii true true true true false true true false) (String.String (Ascii.Ascii true true true true false true true false) String.EmptyString)))))
    imported_true := Imported.Original_LF__DOT__Maps_LF_Maps_update__example2.
Monomorphic Instance Original_LF__DOT__Maps_LF_Maps_update__example2_iso : rel_iso
    (relax_Iso_Ts_Ps
       (Corelib_Init_Logic_eq_iso
          (Original_LF__DOT__Maps_LF_Maps_examplemap'_iso
             (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                (String.String (Ascii.Ascii false true true false false true true false)
                   (String.String (Ascii.Ascii true true true true false true true false) (String.String (Ascii.Ascii true true true true false true true false) String.EmptyString)))))
          true_iso))
    Original.LF_DOT_Maps.LF.Maps.update_example2 imported_Original_LF__DOT__Maps_LF_Maps_update__example2.
Admitted.
Instance: KnownConstant Original.LF_DOT_Maps.LF.Maps.update_example2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Maps_LF_Maps_update__example2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Maps.LF.Maps.update_example2 Original_LF__DOT__Maps_LF_Maps_update__example2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Maps.LF.Maps.update_example2 Imported.Original_LF__DOT__Maps_LF_Maps_update__example2 Original_LF__DOT__Maps_LF_Maps_update__example2_iso := {}.